package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum Type {
    TANG_TRET("Tầng trệt"),
    NGUYEN_CAN("Nguyên căn"),
    NOI_THAT("Nội thất"),

    ;

    private final String buildingTypeName;

    Type(String buildingTypeName) {
        this.buildingTypeName = buildingTypeName;
    }
    public String getBuildingTypeName() {
        return buildingTypeName;
    }

    public static Map<String, String> getBuildingTypeNameMap() {
        Map<String, String> buildingTypeNameMap = new TreeMap<>();
        for(Type item : Type.values()) {
            buildingTypeNameMap.put( item.toString(), item.buildingTypeName);
        }
        return buildingTypeNameMap;
    }
}
