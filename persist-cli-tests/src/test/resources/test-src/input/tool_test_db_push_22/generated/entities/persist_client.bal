// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

import ballerina/persist;
import ballerina/jballerina.java;
import ballerinax/mysql;

const BUILDING = "buildings";
const WORKSPACE = "workspaces";
const DEPARTMENT = "departments";
const EMPLOYEE = "employees";
const ORDER_ITEM = "orderitems";

public client class Client {
    *persist:AbstractPersistClient;

    private final mysql:Client dbClient;

    private final map<persist:SQLClient> persistClients;

    private final record {|persist:Metadata...;|} metadata = {
        "buildings": {
            entityName: "Building",
            tableName: `Building`,
            fieldMetadata: {
                buildingCode: {columnName: "buildingCode"},
                city: {columnName: "city"},
                state: {columnName: "state"},
                country: {columnName: "country"},
                postalCode: {columnName: "postalCode"},
                "workspaces[].workspaceId": {relation: {entityName: "workspaces", refField: "workspaceId"}},
                "workspaces[].workspaceType": {relation: {entityName: "workspaces", refField: "workspaceType"}},
                "workspaces[].buildingBuildingCode": {relation: {entityName: "location", refField: "buildingBuildingCode"}},
                "workspaces[].employeeEmpNo": {relation: {entityName: "employee", refField: "employeeEmpNo"}}
            },
            keyFields: ["buildingCode"],
            joinMetadata: {workspaces: {entity: Workspace, fieldName: "workspaces", refTable: "Workspace", refColumns: ["buildingBuildingCode"], joinColumns: ["buildingCode"], 'type: persist:MANY_TO_ONE}}
        },
        "workspaces": {
            entityName: "Workspace",
            tableName: `Workspace`,
            fieldMetadata: {
                workspaceId: {columnName: "workspaceId"},
                workspaceType: {columnName: "workspaceType"},
                buildingBuildingCode: {columnName: "buildingBuildingCode"},
                employeeEmpNo: {columnName: "employeeEmpNo"},
                "location.buildingCode": {relation: {entityName: "location", refField: "buildingCode"}},
                "location.city": {relation: {entityName: "location", refField: "city"}},
                "location.state": {relation: {entityName: "location", refField: "state"}},
                "location.country": {relation: {entityName: "location", refField: "country"}},
                "location.postalCode": {relation: {entityName: "location", refField: "postalCode"}},
                "employee.empNo": {relation: {entityName: "employee", refField: "empNo"}},
                "employee.firstName": {relation: {entityName: "employee", refField: "firstName"}},
                "employee.lastName": {relation: {entityName: "employee", refField: "lastName"}},
                "employee.birthDate": {relation: {entityName: "employee", refField: "birthDate"}},
                "employee.gender": {relation: {entityName: "employee", refField: "gender"}},
                "employee.hireDate": {relation: {entityName: "employee", refField: "hireDate"}},
                "employee.departmentDeptNo": {relation: {entityName: "department", refField: "departmentDeptNo"}},
                "employee.orderitemOrderId": {relation: {entityName: "orderItem", refField: "orderitemOrderId"}}                "employee.orderitemItemId": {relation: {entityName: "orderItem", refField: "orderitemItemId"}}
            },
            keyFields: ["workspaceId"],
            joinMetadata: {
                location: {entity: Building, fieldName: "location", refTable: "Building", refColumns: ["buildingCode"], joinColumns: ["buildingBuildingCode"], 'type: persist:ONE_TO_MANY},
                employee: {entity: Employee, fieldName: "employee", refTable: "Employee", refColumns: ["buildingCode", "empNo"], joinColumns: ["buildingBuildingCode", "employeeEmpNo"], 'type: persist:ONE_TO_ONE}
            }
        },
        "departments": {
            entityName: "Department",
            tableName: `Department`,
            fieldMetadata: {
                deptNo: {columnName: "deptNo"},
                deptName: {columnName: "deptName"},
                "employees[].empNo": {relation: {entityName: "employees", refField: "empNo"}},
                "employees[].firstName": {relation: {entityName: "employees", refField: "firstName"}},
                "employees[].lastName": {relation: {entityName: "employees", refField: "lastName"}},
                "employees[].birthDate": {relation: {entityName: "employees", refField: "birthDate"}},
                "employees[].gender": {relation: {entityName: "employees", refField: "gender"}},
                "employees[].hireDate": {relation: {entityName: "employees", refField: "hireDate"}},
                "employees[].departmentDeptNo": {relation: {entityName: "department", refField: "departmentDeptNo"}},
                "employees[].orderitemOrderId": {relation: {entityName: "orderItem", refField: "orderitemOrderId"}}                "employees[].orderitemItemId": {relation: {entityName: "orderItem", refField: "orderitemItemId"}}
            },
            keyFields: ["deptNo"],
            joinMetadata: {employees: {entity: Employee, fieldName: "employees", refTable: "Employee", refColumns: ["departmentDeptNo"], joinColumns: ["deptNo"], 'type: persist:MANY_TO_ONE}}
        },
        "employees": {
            entityName: "Employee",
            tableName: `Employee`,
            fieldMetadata: {
                empNo: {columnName: "empNo"},
                firstName: {columnName: "firstName"},
                lastName: {columnName: "lastName"},
                birthDate: {columnName: "birthDate"},
                gender: {columnName: "gender"},
                hireDate: {columnName: "hireDate"},
                departmentDeptNo: {columnName: "departmentDeptNo"},
                orderitemOrderId: {columnName: "orderitemOrderId"},
                orderitemItemId: {columnName: "orderitemItemId"},
                "department.deptNo": {relation: {entityName: "department", refField: "deptNo"}},
                "department.deptName": {relation: {entityName: "department", refField: "deptName"}},
                "workspace.workspaceId": {relation: {entityName: "workspace", refField: "workspaceId"}},
                "workspace.workspaceType": {relation: {entityName: "workspace", refField: "workspaceType"}},
                "workspace.buildingBuildingCode": {relation: {entityName: "location", refField: "buildingBuildingCode"}},
                "workspace.employeeEmpNo": {relation: {entityName: "employee", refField: "employeeEmpNo"}},
                "orderItem.orderId": {relation: {entityName: "orderItem", refField: "orderId"}},
                "orderItem.itemId": {relation: {entityName: "orderItem", refField: "itemId"}},
                "orderItem.quantity": {relation: {entityName: "orderItem", refField: "quantity"}},
                "orderItem.notes": {relation: {entityName: "orderItem", refField: "notes"}}
            },
            keyFields: ["empNo"],
            joinMetadata: {
                department: {entity: Department, fieldName: "department", refTable: "Department", refColumns: ["deptNo"], joinColumns: ["departmentDeptNo"], 'type: persist:ONE_TO_MANY},
                workspace: {entity: Workspace, fieldName: "workspace", refTable: "Workspace", refColumns: ["deptNo", "employeeEmpNo"], joinColumns: ["departmentDeptNo", "empNo"], 'type: persist:ONE_TO_ONE},
                orderItem: {entity: OrderItem, fieldName: "orderItem", refTable: "OrderItem", refColumns: ["deptNo", "employeeEmpNo", "orderId", "itemId"], joinColumns: ["departmentDeptNo", "empNo", "orderitemOrderId", "orderitemItemId"], 'type: persist:ONE_TO_ONE}
            }
        },
        "orderitems": {
            entityName: "OrderItem",
            tableName: `OrderItem`,
            fieldMetadata: {
                orderId: {columnName: "orderId"},
                itemId: {columnName: "itemId"},
                quantity: {columnName: "quantity"},
                notes: {columnName: "notes"},
                "employee.empNo": {relation: {entityName: "employee", refField: "empNo"}},
                "employee.firstName": {relation: {entityName: "employee", refField: "firstName"}},
                "employee.lastName": {relation: {entityName: "employee", refField: "lastName"}},
                "employee.birthDate": {relation: {entityName: "employee", refField: "birthDate"}},
                "employee.gender": {relation: {entityName: "employee", refField: "gender"}},
                "employee.hireDate": {relation: {entityName: "employee", refField: "hireDate"}},
                "employee.departmentDeptNo": {relation: {entityName: "department", refField: "departmentDeptNo"}},
                "employee.orderitemOrderId": {relation: {entityName: "orderItem", refField: "orderitemOrderId"}}                "employee.orderitemItemId": {relation: {entityName: "orderItem", refField: "orderitemItemId"}}
            },
            keyFields: ["orderId", "itemId"],
            joinMetadata: {employee: {entity: Employee, fieldName: "employee", refTable: "Employee", refColumns: ["orderitemOrderId", "orderitemItemId"], joinColumns: ["orderId", "itemId"], 'type: persist:ONE_TO_ONE}}
        }
    };

    public function init() returns persist:Error? {
        mysql:Client|error dbClient = new (host = host, user = user, password = password, database = database, port = port);
        if dbClient is error {
            return <persist:Error>error(dbClient.message());
        }
        self.dbClient = dbClient;
        self.persistClients = {
            buildings: check new (self.dbClient, self.metadata.get(BUILDING)),
            workspaces: check new (self.dbClient, self.metadata.get(WORKSPACE)),
            departments: check new (self.dbClient, self.metadata.get(DEPARTMENT)),
            employees: check new (self.dbClient, self.metadata.get(EMPLOYEE)),
            orderitems: check new (self.dbClient, self.metadata.get(ORDER_ITEM))
        };
    }

    isolated resource function get buildings(BuildingTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.QueryProcessor",
        name: "query"
    } external;

    isolated resource function get buildings/[string buildingCode](BuildingTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.QueryProcessor",
        name: "queryOne"
    } external;

    isolated resource function post buildings(BuildingInsert[] data) returns string[]|persist:Error {
        _ = check self.persistClients.get(BUILDING).runBatchInsertQuery(data);
        return from BuildingInsert inserted in data
            select inserted.buildingCode;
    }

    isolated resource function put buildings/[string buildingCode](BuildingUpdate value) returns Building|persist:Error {
        _ = check self.persistClients.get(BUILDING).runUpdateQuery(buildingCode, value);
        return self->/buildings/[buildingCode].get();
    }

    isolated resource function delete buildings/[string buildingCode]() returns Building|persist:Error {
        Building result = check self->/buildings/[buildingCode].get();
        _ = check self.persistClients.get(BUILDING).runDeleteQuery(buildingCode);
        return result;
    }

    isolated resource function get workspaces(WorkspaceTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.QueryProcessor",
        name: "query"
    } external;

    isolated resource function get workspaces/[string workspaceId](WorkspaceTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.QueryProcessor",
        name: "queryOne"
    } external;

    isolated resource function post workspaces(WorkspaceInsert[] data) returns string[]|persist:Error {
        _ = check self.persistClients.get(WORKSPACE).runBatchInsertQuery(data);
        return from WorkspaceInsert inserted in data
            select inserted.workspaceId;
    }

    isolated resource function put workspaces/[string workspaceId](WorkspaceUpdate value) returns Workspace|persist:Error {
        _ = check self.persistClients.get(WORKSPACE).runUpdateQuery(workspaceId, value);
        return self->/workspaces/[workspaceId].get();
    }

    isolated resource function delete workspaces/[string workspaceId]() returns Workspace|persist:Error {
        Workspace result = check self->/workspaces/[workspaceId].get();
        _ = check self.persistClients.get(WORKSPACE).runDeleteQuery(workspaceId);
        return result;
    }

    isolated resource function get departments(DepartmentTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.QueryProcessor",
        name: "query"
    } external;

    isolated resource function get departments/[string deptNo](DepartmentTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.QueryProcessor",
        name: "queryOne"
    } external;

    isolated resource function post departments(DepartmentInsert[] data) returns string[]|persist:Error {
        _ = check self.persistClients.get(DEPARTMENT).runBatchInsertQuery(data);
        return from DepartmentInsert inserted in data
            select inserted.deptNo;
    }

    isolated resource function put departments/[string deptNo](DepartmentUpdate value) returns Department|persist:Error {
        _ = check self.persistClients.get(DEPARTMENT).runUpdateQuery(deptNo, value);
        return self->/departments/[deptNo].get();
    }

    isolated resource function delete departments/[string deptNo]() returns Department|persist:Error {
        Department result = check self->/departments/[deptNo].get();
        _ = check self.persistClients.get(DEPARTMENT).runDeleteQuery(deptNo);
        return result;
    }

    isolated resource function get employees(EmployeeTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.QueryProcessor",
        name: "query"
    } external;

    isolated resource function get employees/[string empNo](EmployeeTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.QueryProcessor",
        name: "queryOne"
    } external;

    isolated resource function post employees(EmployeeInsert[] data) returns string[]|persist:Error {
        _ = check self.persistClients.get(EMPLOYEE).runBatchInsertQuery(data);
        return from EmployeeInsert inserted in data
            select inserted.empNo;
    }

    isolated resource function put employees/[string empNo](EmployeeUpdate value) returns Employee|persist:Error {
        _ = check self.persistClients.get(EMPLOYEE).runUpdateQuery(empNo, value);
        return self->/employees/[empNo].get();
    }

    isolated resource function delete employees/[string empNo]() returns Employee|persist:Error {
        Employee result = check self->/employees/[empNo].get();
        _ = check self.persistClients.get(EMPLOYEE).runDeleteQuery(empNo);
        return result;
    }

    isolated resource function get orderitems(OrderItemTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.QueryProcessor",
        name: "query"
    } external;

    isolated resource function get orderitems/[string itemId, string orderId] (OrderItemTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.QueryProcessor",
        name: "queryOne"
    } external;

    isolated resource function post orderitems(OrderItemInsert[] data) returns [string, string][]|persist:Error {
        _ = check self.persistClients.get(ORDER_ITEM).runBatchInsertQuery(data);
        return from OrderItemInsert inserted in data
            select [inserted.orderId, inserted.itemId];
    }

    isolated resource function put orderitems/[string itemId]/[string orderId](OrderItemUpdate value) returns OrderItem|persist:Error {
        _ = check self.persistClients.get(ORDER_ITEM).runUpdateQuery({"itemId": itemId, "orderId": orderId}, value);
        return self->/orderitems/[itemId]/[orderId].get();
    }

    isolated resource function delete orderitems/[string itemId]/[string orderId]() returns OrderItem|persist:Error {
        OrderItem result = check self->/orderitems/[itemId]/[orderId].get();
        _ = check self.persistClients.get(ORDER_ITEM).runDeleteQuery({"itemId": itemId, "orderId": orderId});
        return result;
    }

    public function close() returns persist:Error? {
        error? result = self.dbClient.close();
        if result is error {
            return <persist:Error>error(result.message());
        }
        return result;
    }
}

