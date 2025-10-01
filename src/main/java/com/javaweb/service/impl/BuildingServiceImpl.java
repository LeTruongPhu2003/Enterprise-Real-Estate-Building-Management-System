package com.javaweb.service.impl;
import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.service.BuildingService;
import com.javaweb.specification.BuildingSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;


import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<BuildingSearchResponse> findAllBuilding() {
        // Sử dụng custom repository để tìm kiếm dynamic
        List<BuildingEntity> buildingEntities = buildingRepository.findAll();
        // Convert sang response
        return buildingEntities.stream()
                .map(buildingConverter::toBuildingSearchResponse)
                .collect(Collectors.toList());
    }

    @Override
    public BuildingDTO findById(Long Id) {
        BuildingEntity buildingEntity = buildingRepository.findById(Id).orElse(null);
        BuildingDTO buildingDTO = buildingConverter.toBuildingDTO(buildingEntity);
        return buildingDTO;
    }

    @Override
    public List<BuildingSearchResponse> searchBuilding(BuildingSearchRequest buildingSearchRequest) {
        List<BuildingSearchResponse> buildingSearchResponses = new ArrayList<>();
        BuildingEntity buildingEntity = buildingConverter.buildingEntity(buildingSearchRequest);
        List<BuildingEntity> buildingEntities = buildingRepository.searchBuildings(buildingEntity);
        for(BuildingEntity item : buildingEntities) {
            BuildingSearchResponse buildingSearchResponse = buildingConverter.toBuildingSearchResponse(item);
            buildingSearchResponses.add(buildingSearchResponse);
        }

        return buildingSearchResponses;
    }

    @Override
    public void addOrUpdateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.toEntity(buildingDTO);
            buildingRepository.save(buildingEntity);
    }

    @Override
    @Transactional
    public void deleteListBuilding(List<Long> ids) {
//        List<BuildingEntity> buildingEntities = buildingRepository.findAllById(ids);
        buildingRepository.deleteBuildingByIdIn(ids);
//        for (BuildingEntity entity : buildingEntities) {
//            entity.getUserEntities().clear();
//            entity.getRentareaEntities().clear();
//            buildingRepository.delete(entity);// Xóa liên kết trong bảng trung gian
//        }
    }

    @Override
    public ResponseDTO staffAssignment(Long buildingId) {
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssList = buildingEntity.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity item : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(item.getFullName());
            staffResponseDTO.setStaffId(item.getId());
            if (staffAssList.contains(item)) {
                staffResponseDTO.setChecked("checked");
            }
            else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }
}

