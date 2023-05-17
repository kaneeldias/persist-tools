// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

import ballerina/persist;
import ballerina/jballerina.java;

const EMPLOYEE = "employees";
const WORKSPACE = "workspaces";
const BUILDING = "buildings";
const DEPARTMENT = "departments";
final isolated table<Employee> key(empNo) employeesTable = table [];
final isolated table<Workspace> key(workspaceId) workspacesTable = table [];
final isolated table<Building> key(buildingCode) buildingsTable = table [];
final isolated table<Department> key(deptNo) departmentsTable = table [];

public isolated client class Client {
    *persist:AbstractPersistClient;

    private final map<persist:InMemoryClient> persistClients = {};

    public function init() returns persist:Error? {
        final map<persist:TableMetadata> metadata = {
            [EMPLOYEE] : {
                keyFields: ["empNo"],
                query: queryEmployees,
                queryOne: queryOneEmployees
            },
            [WORKSPACE] : {
                keyFields: ["workspaceId"],
                query: queryWorkspaces,
                queryOne: queryOneWorkspaces
            },
            [BUILDING] : {
                keyFields: ["buildingCode"],
                query: queryBuildings,
                queryOne: queryOneBuildings,
                associationsMethods: {"workspaces": queryBuildingsWorkspaces}
            },
            [DEPARTMENT] : {
                keyFields: ["deptNo"],
                query: queryDepartments,
                queryOne: queryOneDepartments,
                associationsMethods: {"employees": queryDepartmentsEmployees}
            }
        };
        self.persistClients[EMPLOYEE] = check new (metadata.get(EMPLOYEE));
        self.persistClients[WORKSPACE] = check new (metadata.get(WORKSPACE));
        self.persistClients[BUILDING] = check new (metadata.get(BUILDING));
        self.persistClients[DEPARTMENT] = check new (metadata.get(DEPARTMENT));
    }

    isolated resource function get employees(EmployeeTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.datastore.InMemoryProcessor",
        name: "query"
    } external;

    isolated resource function get employees/[string empNo](EmployeeTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.datastore.InMemoryProcessor",
        name: "queryOne"
    } external;

    isolated resource function post employees(EmployeeInsert[] data) returns string[]|persist:Error {
        string[] keys = [];
        foreach EmployeeInsert value in data {
            lock {
                if employeesTable.hasKey(value.empNo) {
                    return <persist:AlreadyExistsError>error("Duplicate key: " + value.empNo.toString());
                }
                employeesTable.put(value.clone());
            }
            keys.push(value.empNo);
        }
        return keys;
    }

    isolated resource function put employees/[string empNo](EmployeeUpdate value) returns Employee|persist:Error {
        lock {
            if !employeesTable.hasKey(empNo) {
                return <persist:NotFoundError>error("Not found: " + empNo.toString());
            }
            Employee employee = employeesTable.get(empNo);
            foreach var [k, v] in value.clone().entries() {
                employee[k] = v;
            }
            employeesTable.put(employee);
            return employee.clone();
        }
    }

    isolated resource function delete employees/[string empNo]() returns Employee|persist:Error {
        lock {
            if !employeesTable.hasKey(empNo) {
                return <persist:NotFoundError>error("Not found: " + empNo.toString());
            }
            return employeesTable.remove(empNo).clone();
        }
    }

    isolated resource function get workspaces(WorkspaceTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.datastore.InMemoryProcessor",
        name: "query"
    } external;

    isolated resource function get workspaces/[string workspaceId](WorkspaceTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.datastore.InMemoryProcessor",
        name: "queryOne"
    } external;

    isolated resource function post workspaces(WorkspaceInsert[] data) returns string[]|persist:Error {
        string[] keys = [];
        foreach WorkspaceInsert value in data {
            lock {
                if workspacesTable.hasKey(value.workspaceId) {
                    return <persist:AlreadyExistsError>error("Duplicate key: " + value.workspaceId.toString());
                }
                workspacesTable.put(value.clone());
            }
            keys.push(value.workspaceId);
        }
        return keys;
    }

    isolated resource function put workspaces/[string workspaceId](WorkspaceUpdate value) returns Workspace|persist:Error {
        lock {
            if !workspacesTable.hasKey(workspaceId) {
                return <persist:NotFoundError>error("Not found: " + workspaceId.toString());
            }
            Workspace workspace = workspacesTable.get(workspaceId);
            foreach var [k, v] in value.clone().entries() {
                workspace[k] = v;
            }
            workspacesTable.put(workspace);
            return workspace.clone();
        }
    }

    isolated resource function delete workspaces/[string workspaceId]() returns Workspace|persist:Error {
        lock {
            if !workspacesTable.hasKey(workspaceId) {
                return <persist:NotFoundError>error("Not found: " + workspaceId.toString());
            }
            return workspacesTable.remove(workspaceId).clone();
        }
    }

    isolated resource function get buildings(BuildingTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.datastore.InMemoryProcessor",
        name: "query"
    } external;

    isolated resource function get buildings/[string buildingCode](BuildingTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.datastore.InMemoryProcessor",
        name: "queryOne"
    } external;

    isolated resource function post buildings(BuildingInsert[] data) returns string[]|persist:Error {
        string[] keys = [];
        foreach BuildingInsert value in data {
            lock {
                if buildingsTable.hasKey(value.buildingCode) {
                    return <persist:AlreadyExistsError>error("Duplicate key: " + value.buildingCode.toString());
                }
                buildingsTable.put(value.clone());
            }
            keys.push(value.buildingCode);
        }
        return keys;
    }

    isolated resource function put buildings/[string buildingCode](BuildingUpdate value) returns Building|persist:Error {
        lock {
            if !buildingsTable.hasKey(buildingCode) {
                return <persist:NotFoundError>error("Not found: " + buildingCode.toString());
            }
            Building building = buildingsTable.get(buildingCode);
            foreach var [k, v] in value.clone().entries() {
                building[k] = v;
            }
            buildingsTable.put(building);
            return building.clone();
        }
    }

    isolated resource function delete buildings/[string buildingCode]() returns Building|persist:Error {
        lock {
            if !buildingsTable.hasKey(buildingCode) {
                return <persist:NotFoundError>error("Not found: " + buildingCode.toString());
            }
            return buildingsTable.remove(buildingCode).clone();
        }
    }

    isolated resource function get departments(DepartmentTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.datastore.InMemoryProcessor",
        name: "query"
    } external;

    isolated resource function get departments/[string deptNo](DepartmentTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.datastore.InMemoryProcessor",
        name: "queryOne"
    } external;

    isolated resource function post departments(DepartmentInsert[] data) returns string[]|persist:Error {
        string[] keys = [];
        foreach DepartmentInsert value in data {
            lock {
                if departmentsTable.hasKey(value.deptNo) {
                    return <persist:AlreadyExistsError>error("Duplicate key: " + value.deptNo.toString());
                }
                departmentsTable.put(value.clone());
            }
            keys.push(value.deptNo);
        }
        return keys;
    }

    isolated resource function put departments/[string deptNo](DepartmentUpdate value) returns Department|persist:Error {
        lock {
            if !departmentsTable.hasKey(deptNo) {
                return <persist:NotFoundError>error("Not found: " + deptNo.toString());
            }
            Department department = departmentsTable.get(deptNo);
            foreach var [k, v] in value.clone().entries() {
                department[k] = v;
            }
            departmentsTable.put(department);
            return department.clone();
        }
    }

    isolated resource function delete departments/[string deptNo]() returns Department|persist:Error {
        lock {
            if !departmentsTable.hasKey(deptNo) {
                return <persist:NotFoundError>error("Not found: " + deptNo.toString());
            }
            return departmentsTable.remove(deptNo).clone();
        }
    }

    public function close() returns persist:Error? {
        return ();
    }
}

isolated function queryEmployees(string[] fields) returns stream<record {}, persist:Error?> {
    table<Employee> key(empNo) employeesClonedTable;
    lock {
        employeesClonedTable = employeesTable.clone();
    }
    table<Department> key(deptNo) departmentsClonedTable;
    lock {
        departmentsClonedTable = departmentsTable.clone();
    }
    return from record {} 'object in employeesClonedTable
        outer join var department in departmentsClonedTable on ['object.departmentDeptNo] equals [department?.deptNo]
        select persist:filterRecord({
            ...'object,
            "department": department
        }, fields);
}

isolated function queryOneEmployees(anydata key) returns record {}|persist:NotFoundError {
    table<Employee> key(empNo) employeesClonedTable;
    lock {
        employeesClonedTable = employeesTable.clone();
    }
    table<Department> key(deptNo) departmentsClonedTable;
    lock {
        departmentsClonedTable = departmentsTable.clone();
    }
    from record {} 'object in employeesClonedTable
    where persist:getKey('object, ["empNo"]) == key
    outer join var department in departmentsClonedTable on ['object.departmentDeptNo] equals [department?.deptNo]
    do {
        return {
            ...'object,
            "department": department
        };
    };
    return <persist:NotFoundError>error("Invalid key: " + key.toString());
}

isolated function queryWorkspaces(string[] fields) returns stream<record {}, persist:Error?> {
    table<Workspace> key(workspaceId) workspacesClonedTable;
    lock {
        workspacesClonedTable = workspacesTable.clone();
    }
    table<Building> key(buildingCode) buildingsClonedTable;
    lock {
        buildingsClonedTable = buildingsTable.clone();
    }
    table<Employee> key(empNo) employeesClonedTable;
    lock {
        employeesClonedTable = employeesTable.clone();
    }
    return from record {} 'object in workspacesClonedTable
        outer join var location in buildingsClonedTable on ['object.locationBuildingCode] equals [location?.buildingCode]
        outer join var employee in employeesClonedTable on ['object.workspaceEmpNo] equals [employee?.empNo]
        select persist:filterRecord({
            ...'object,
            "location": location,
            "employee": employee
        }, fields);
}

isolated function queryOneWorkspaces(anydata key) returns record {}|persist:NotFoundError {
    table<Workspace> key(workspaceId) workspacesClonedTable;
    lock {
        workspacesClonedTable = workspacesTable.clone();
    }
    table<Building> key(buildingCode) buildingsClonedTable;
    lock {
        buildingsClonedTable = buildingsTable.clone();
    }
    table<Employee> key(empNo) employeesClonedTable;
    lock {
        employeesClonedTable = employeesTable.clone();
    }
    from record {} 'object in workspacesClonedTable
    where persist:getKey('object, ["workspaceId"]) == key
    outer join var location in buildingsClonedTable on ['object.locationBuildingCode] equals [location?.buildingCode]
    outer join var employee in employeesClonedTable on ['object.workspaceEmpNo] equals [employee?.empNo]
    do {
        return {
            ...'object,
            "location": location,
            "employee": employee
        };
    };
    return <persist:NotFoundError>error("Invalid key: " + key.toString());
}

isolated function queryBuildings(string[] fields) returns stream<record {}, persist:Error?> {
    table<Building> key(buildingCode) buildingsClonedTable;
    lock {
        buildingsClonedTable = buildingsTable.clone();
    }
    return from record {} 'object in buildingsClonedTable
        select persist:filterRecord({
            ...'object
        }, fields);
}

isolated function queryOneBuildings(anydata key) returns record {}|persist:NotFoundError {
    table<Building> key(buildingCode) buildingsClonedTable;
    lock {
        buildingsClonedTable = buildingsTable.clone();
    }
    from record {} 'object in buildingsClonedTable
    where persist:getKey('object, ["buildingCode"]) == key
    do {
        return {
            ...'object
        };
    };
    return <persist:NotFoundError>error("Invalid key: " + key.toString());
}

isolated function queryDepartments(string[] fields) returns stream<record {}, persist:Error?> {
    table<Department> key(deptNo) departmentsClonedTable;
    lock {
        departmentsClonedTable = departmentsTable.clone();
    }
    return from record {} 'object in departmentsClonedTable
        select persist:filterRecord({
            ...'object
        }, fields);
}

isolated function queryOneDepartments(anydata key) returns record {}|persist:NotFoundError {
    table<Department> key(deptNo) departmentsClonedTable;
    lock {
        departmentsClonedTable = departmentsTable.clone();
    }
    from record {} 'object in departmentsClonedTable
    where persist:getKey('object, ["deptNo"]) == key
    do {
        return {
            ...'object
        };
    };
    return <persist:NotFoundError>error("Invalid key: " + key.toString());
}

isolated function queryBuildingsWorkspaces(record {} value, string[] fields) returns record {}[] {
    table<Workspace> key(workspaceId) workspacesClonedTable;
    lock {
        workspacesClonedTable = workspacesTable.clone();
    }
    return from record {} 'object in workspacesClonedTable
        where 'object.locationBuildingCode == value["buildingCode"]
        select persist:filterRecord({
            ...'object
        }, fields);
}

isolated function queryDepartmentsEmployees(record {} value, string[] fields) returns record {}[] {
    table<Employee> key(empNo) employeesClonedTable;
    lock {
        employeesClonedTable = employeesTable.clone();
    }
    return from record {} 'object in employeesClonedTable
        where 'object.departmentDeptNo == value["deptNo"]
        select persist:filterRecord({
            ...'object
        }, fields);
}

