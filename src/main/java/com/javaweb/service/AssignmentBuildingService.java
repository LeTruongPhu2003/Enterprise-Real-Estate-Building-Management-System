package com.javaweb.service;

import java.util.List;

public interface AssignmentBuildingService  {
    void updateAssignment(Long buildingId, List<Long> staffIds);
}
