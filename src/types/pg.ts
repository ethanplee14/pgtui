export type Statement =
  | AlterTableStmt
  | CreateTriggerStmt
  | CreateSequenceStmt
  | ViewStmt
  | AlterOwnerStmt
  | VariableSetStmt
  | CreateStmt
  | CreateFunctionStmt
  | CreateSchemaStmt
  | GrantStmt
  | CreatePolicyStmt

export type ValueObject = {
  String: { str: string }
}

export type RoleSpec = {
  roletype: "ROLESPEC_CSTRING"
  rolename: string
}

export type Relation = {
  schemaname: string
  relname: string
}

export type Command = AlterTableCmd

export type AlterTableCmd = {
  AlterTableCmd: {
    subtype: "AT_EnableRowSecurity"
    behavior: "DROP_RESTRICT"
  }
}

export type AlterTableStmt = {
  AlterTableStmt: {
    relation: Relation
    cmds: Array<Command>
    relkind: "OBJECT_TABLE"
  }
}

export type CreateStmt = { CreateStmt: {} }
export type GrantStmt = {
  GrantStmt: {
    is_grant: boolean
    targtype: "ACL_TARGET_OBJECT"
    objtype: "OBJECT_SCHEMA"
    objects: Array<ValueObject>
    grantees: Array<RoleSpec>
  }
}
export type CreateSchemaStmt = { CreateSchemaStmt: { schemaname: string } }
export type CreateFunctionStmt = {
  CreateFunctionStmt: {
    funcname: Array<ValueObject>
    returnType: { names: Array<ValueObject> }
    options: Array<{
      DefElem: {
        defname: "language" | "as"
        arg: ValueObject
      }
    }>
  }
}
export type VariableSetStmt = { VariableSetStmt: {} }
export type AlterOwnerStmt = {
  AlterOwnerStmt: {
    object: ValueObject
    newowner: RoleSpec
  }
}
export type ViewStmt = {
  ViewStmt: {
    view: Relation
    query: Statement
  }
}
export type CreateTriggerStmt = { CreateTriggerStmt: {} }
export type CreateSequenceStmt = { CreateSequenceStmt: {} }

export type Expression = {}

export type CreatePolicyStmt = {
  policy_name: string
  table: Relation
  cmd_name: string
  permissive: boolean
  roles: Array<{
    RoleSpec: {
      roletype: "ROLESPEC_CSTRING"
      rolename: string
    }
  }>
  qual: Expression
}