# ttstore assignment
## Requirement 
Please refer to the document [Generic Backend Assignment](./docs/Generic%20Backend%20assignment.pdf)
### Answer to the section 1
Please refer to [tecnotree_backend_general_questions.docx](./docs/tecnotree_backend_general_questions.docx)

### Section 2

Using Gin Web Framework and MySQL to implement the assignment.
#### Running locally
My Local setup
* Go (version 1.17)
* Mysql 8.0
* Git

Config MySQL (modify ./conf/config.yaml)
* mysql connection parameters
* create schema and user (./conf/create_schema.sql)
* tables with testing data (./conf/sql_dump_v1.2.sql)
* tables structure only (./conf/sql_dump_structure_only.sql)

Logging config parameters. Please modify the config.yaml file in conf folder.

To install all dependencies library
```bash
go mod download
```
