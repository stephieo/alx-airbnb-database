# Normalization Analysis

## First Normal Form (1NF)

### Criteria:

- All attributes must contain atomic values (no repeating groups or arrays).

- Each table must have a primary key to ensure unique rows.

#### Analysis:

All attributes are atomic (e.g., phone_number is a single value, not a list) and all entities have a Primary key(e.g user_id) therefore the data model satisfies 1NF.

## Second Normal Form (2NF)

### Criteria:

- The table must be in 1NF.
- All non-key attributes must be fully functionally dependent on the entire primary key (no partial dependencies).

#### Analysis:

Partial dependencies apply to tables with composite primary keys. All Entities use single-column primary keys and satisfy 1NF, therefore inherently satisfy 2NF

## Third Normal Form (3NF)

### Criteria:

- The table must be in 2NF.
- All non-key attributes must be non-transitively dependent on the primary key (no transitive dependencies).

#### Analysis:

All non-key attributes of entities directly depend on their respective primary keys through the use of foreign keys (e.g., owner_id, user_id) to prevent transitive dependencies .

Conclusion: The Data model is in 3NF.
