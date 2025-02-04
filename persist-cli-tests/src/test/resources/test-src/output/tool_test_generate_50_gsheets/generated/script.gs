// AUTO-GENERATED FILE.

// This file is an auto-generated file by Ballerina persistence layer for model.
// Please verify the generated scripts and execute them against the target DB server.

function createSheets() {
	var activeSpreadsheet = SpreadsheetApp.getActiveSpreadsheet();
	var yourNewSheet = activeSpreadsheet.getSheetByName("Employee");
	if (yourNewSheet != null) {
		activeSpreadsheet.deleteSheet(yourNewSheet);
	}
	yourNewSheet = activeSpreadsheet.insertSheet();
	yourNewSheet.setName("Employee");
	yourNewSheet.appendRow(["empNo", "firstName", "lastName", "birthDate", "gender", "hireDate", "departmentDeptNo"]);


	yourNewSheet = activeSpreadsheet.getSheetByName("Workspace");
	if (yourNewSheet != null) {
		activeSpreadsheet.deleteSheet(yourNewSheet);
	}
	yourNewSheet = activeSpreadsheet.insertSheet();
	yourNewSheet.setName("Workspace");
	yourNewSheet.appendRow(["workspaceId", "workspaceType", "locationBuildingCode", "workspaceEmpNo"]);


	yourNewSheet = activeSpreadsheet.getSheetByName("Building");
	if (yourNewSheet != null) {
		activeSpreadsheet.deleteSheet(yourNewSheet);
	}
	yourNewSheet = activeSpreadsheet.insertSheet();
	yourNewSheet.setName("Building");
	yourNewSheet.appendRow(["buildingCode", "city", "state", "country", "postalCode"]);


	yourNewSheet = activeSpreadsheet.getSheetByName("Department");
	if (yourNewSheet != null) {
		activeSpreadsheet.deleteSheet(yourNewSheet);
	}
	yourNewSheet = activeSpreadsheet.insertSheet();
	yourNewSheet.setName("Department");
	yourNewSheet.appendRow(["deptNo", "deptName"]);


	yourNewSheet = activeSpreadsheet.getSheetByName("Sheet1");
	if (yourNewSheet != null) {
		activeSpreadsheet.deleteSheet(yourNewSheet);
	}
}
