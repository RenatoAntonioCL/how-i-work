# Architecture Patterns

When and how to apply Hexagonal Architecture, DDD, and SOLID in my projects.

These three patterns work together. Hexagonal defines the shape, DDD defines the language, SOLID defines the discipline. Every project that has business logic uses all three.

---

## When to apply

- **Always**: any project with business logic beyond simple CRUD.
- **Not needed**: static sites, pure scripts, one-off tools, documentation repos.

---

## Hexagonal Architecture (Ports & Adapters)

The domain core has zero dependencies on infrastructure. External systems connect through ports (interfaces) and adapters (implementations).

**Ports** are interfaces defined by the domain: "I need to store a user", "I need to send a notification." The domain declares what it needs, never how.

**Adapters** are implementations that satisfy ports: a Postgres repository, an SMTP email sender, a REST API client. Adapters are replaceable without touching the domain.

### Layers

| Layer | Contains | Depends on |
|-------|----------|------------|
| Domain | Entities, value objects, domain services, port interfaces | Nothing |
| Application | Use cases, orchestration | Domain |
| Infrastructure | Adapters, frameworks, DB clients, API clients | Domain + Application |

---

## Domain-Driven Design (DDD)

Code reflects the business domain, not the database schema.

- **Entity**: has identity, lifecycle, and behavior. Example: `Order`, `User`.
- **Value Object**: immutable, defined by its attributes. Example: `Money`, `Address`, `Email`.
- **Aggregate**: consistency boundary around a root entity. External code only references the root.
- **Repository**: port interface for persisting and retrieving aggregates.
- **Domain Service**: logic that does not belong to a single entity.
- **Domain Event**: something that happened in the domain. Example: `OrderPlaced`, `UserRegistered`.

---

## SOLID

- **S** — Single Responsibility: one reason to change per class.
- **O** — Open/Closed: extend behavior without modifying existing code.
- **L** — Liskov Substitution: subtypes must be substitutable for their base types.
- **I** — Interface Segregation: small, specific interfaces over large general ones.
- **D** — Dependency Inversion: depend on abstractions, not concretions. This is what makes Hexagonal work.

---

## Folder structure

### Python / FastAPI

```
src/
  domain/
    entities/
      user.py
      order.py
    value_objects/
      money.py
      email.py
    events/
      order_placed.py
    ports/
      user_repository.py      # Abstract base class
      notification_service.py  # Abstract base class
    services/
      pricing_service.py
  application/
    use_cases/
      create_order.py
      register_user.py
  infrastructure/
    adapters/
      postgres_user_repository.py
      smtp_notification_service.py
    api/
      routes/
        orders.py
        users.py
      dependencies.py          # FastAPI dependency injection
    config.py
```

**Example — Port (domain):**

```python
from abc import ABC, abstractmethod
from domain.entities.user import User

class UserRepository(ABC):
    @abstractmethod
    def save(self, user: User) -> None: ...

    @abstractmethod
    def find_by_id(self, user_id: str) -> User | None: ...
```

**Example — Adapter (infrastructure):**

```python
from domain.ports.user_repository import UserRepository
from domain.entities.user import User

class PostgresUserRepository(UserRepository):
    def __init__(self, session):
        self._session = session

    def save(self, user: User) -> None:
        self._session.add(user)
        self._session.commit()

    def find_by_id(self, user_id: str) -> User | None:
        return self._session.query(User).filter_by(id=user_id).first()
```

**Example — Use case (application):**

```python
from domain.ports.user_repository import UserRepository
from domain.entities.user import User

class RegisterUser:
    def __init__(self, user_repo: UserRepository):
        self._user_repo = user_repo

    def execute(self, name: str, email: str) -> User:
        user = User.create(name=name, email=email)
        self._user_repo.save(user)
        return user
```

### TypeScript / Next.js

```
src/
  domain/
    entities/
      user.ts
      order.ts
    value-objects/
      money.ts
      email.ts
    events/
      order-placed.ts
    ports/
      user-repository.ts      # Interface
      notification-service.ts  # Interface
    services/
      pricing-service.ts
  application/
    use-cases/
      create-order.ts
      register-user.ts
  infrastructure/
    adapters/
      prisma-user-repository.ts
      resend-notification-service.ts
    config.ts
  app/                         # Next.js App Router
    api/
      users/
        route.ts               # Wires use case to HTTP
      orders/
        route.ts
```

**Example — Port (domain):**

```typescript
import { User } from "../entities/user";

export interface UserRepository {
  save(user: User): Promise<void>;
  findById(userId: string): Promise<User | null>;
}
```

**Example — Adapter (infrastructure):**

```typescript
import { UserRepository } from "../../domain/ports/user-repository";
import { User } from "../../domain/entities/user";
import { prisma } from "../config";

export class PrismaUserRepository implements UserRepository {
  async save(user: User): Promise<void> {
    await prisma.user.upsert({
      where: { id: user.id },
      create: { id: user.id, name: user.name, email: user.email.value },
      update: { name: user.name, email: user.email.value },
    });
  }

  async findById(userId: string): Promise<User | null> {
    const row = await prisma.user.findUnique({ where: { id: userId } });
    return row ? User.fromPersistence(row) : null;
  }
}
```

**Example — Use case (application):**

```typescript
import { UserRepository } from "../../domain/ports/user-repository";
import { User } from "../../domain/entities/user";

export class RegisterUser {
  constructor(private readonly userRepo: UserRepository) {}

  async execute(name: string, email: string): Promise<User> {
    const user = User.create(name, email);
    await this.userRepo.save(user);
    return user;
  }
}
```

---

## Dependency injection

- **Python/FastAPI**: use FastAPI's `Depends()` to inject adapters into route handlers.
- **TypeScript/Next.js**: instantiate adapters in the API route and pass them to use cases. No DI container needed for most projects.

The rule: domain and application layers never import from infrastructure. The dependency arrow always points inward.
