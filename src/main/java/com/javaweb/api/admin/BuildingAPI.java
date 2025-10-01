package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;


@RestController
@RequestMapping(value = "/api/building")


public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private AssignmentBuildingService assignmentBuildingService;

    @PostMapping()
    public void btnAddOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        buildingService.addOrUpdateBuilding(buildingDTO);
    }

    @DeleteMapping("/{ids:.*}")
    public void btnDeleteBuilding(@PathVariable List<Long> ids) {
        buildingService.deleteListBuilding(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaff(@PathVariable("id") Long id){
        ResponseDTO result = buildingService.staffAssignment(id);
        return result;
    }

    @PostMapping("/assingmentbuilding")
    public void assingmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        assignmentBuildingService.updateAssignment(assignmentBuildingDTO.getBuildingId(), assignmentBuildingDTO.getStaffs());
        System.out.println("ok");
    }
}
