// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is a auto-generated client by Ballerina persist library.
// It should not be modified by hand.
import ballerina/persist;
import ballerina/time;

@persist:Entity {
    key: ["needId"],
    tableName: "MedicalNeeds1"
}
public type MedicalNeed1 record {|
    @persist:AutoIncrement
    readonly int needId = -1;
    time:Civil period;
    string urgency;
    int quantity;
|};

@persist:Entity {
    key: ["itemId"],
    tableName: "MedicalItems"
}
public type MedicalItem record {|
    readonly int itemId;
    string 'type;
    string unit;
|};

@persist:Entity {
    key: ["needId"],
    tableName: "MedicalNeeds"
}
public type MedicalNeed record {|
    @persist:AutoIncrement
    readonly int needId = -1;

    int itemId;
    time:Civil period;
    int quantity;
|};

