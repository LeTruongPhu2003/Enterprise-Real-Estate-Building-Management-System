package com.javaweb.service;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface BuildingService {
    List<BuildingSearchResponse> findAllBuilding();
    BuildingDTO findById(Long Id);
    List<BuildingSearchResponse> searchBuilding(BuildingSearchRequest buildingSearchRequest);
    void addOrUpdateBuilding(BuildingDTO buildingDTO);
    void deleteListBuilding(List<Long> ids);
    ResponseDTO staffAssignment(Long buildingId);
}
