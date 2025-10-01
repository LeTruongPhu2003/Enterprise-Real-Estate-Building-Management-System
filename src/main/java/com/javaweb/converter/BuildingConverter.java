package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentareaEntity;
import com.javaweb.enums.District;
import com.javaweb.enums.Type;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.RentAreaRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


@Component
public class BuildingConverter {

    @Autowired
    RentAreaConverter rentAreaConverter;
    @Autowired
    RentAreaRepository rentAreaRepository;

    private final ModelMapper modelMapper;

    public BuildingConverter(ModelMapper modelMapper) {
        this.modelMapper = modelMapper;
    }


    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity entity) {
        BuildingSearchResponse response = modelMapper.map(entity, BuildingSearchResponse.class);
        response.setAddress(buildAddress(entity));
        List<RentareaEntity> rentareaEntity = rentAreaRepository.findAllByBuildingEntity_Id(entity.getId());
        String rentAreaString = rentareaEntity.stream()
                .map(r -> String.valueOf(r.getValue())) // Lấy value của từng rentarea
                .collect(Collectors.joining(","));
        response.setRentArea(rentAreaString);
        return response;
    }

    private String buildAddress(BuildingEntity entity) {
        StringBuilder address = new StringBuilder();
        if (entity.getStreet() != null) address.append(entity.getStreet());
        if (entity.getWard() != null) address.append(", ").append(entity.getWard());
        if (entity.getDistrict() != null){
            try {
                District district = District.valueOf(entity.getDistrict());
                address.append(", ").append(district.getDistrictName());

            }catch (Exception e) {
                address.append(", ").append(entity.getDistrict());
            }
        }
        return address.toString();
    }

    public BuildingDTO toBuildingDTO(BuildingEntity entity) {
        BuildingDTO dto = modelMapper.map(entity, BuildingDTO.class);
        dto.setTypeCode(Arrays.stream(entity.getType().split(",")).map(Type::valueOf).collect(Collectors.toList()));
        String rentAreas = entity.getRentareaEntities().stream()
                .map(r -> String.valueOf(r.getValue()))
                .collect(Collectors.joining(","));
        dto.setRentArea(rentAreas);
        return dto;
    }

    public BuildingEntity toEntity(BuildingDTO dto) {
        BuildingEntity entity = modelMapper.map(dto, BuildingEntity.class);
        entity.setRentareaEntities(rentAreaConverter.toRentAreaList(entity, dto));
        entity.setType(dto.getTypeCode()
                .stream()
                .map(Enum::name)
                .collect(Collectors.joining(",")));
        return entity;
    }

    public BuildingEntity buildingEntity(BuildingSearchRequest buildingSearchRequest) {
        BuildingEntity entity = new BuildingEntity();

        // Ánh xạ các trường cơ bản
        if (buildingSearchRequest.getName() != null) {
            entity.setName(buildingSearchRequest.getName());
        }
        if (buildingSearchRequest.getStreet() != null) {
            entity.setStreet(buildingSearchRequest.getStreet());
        }
        if (buildingSearchRequest.getWard() != null) {
            entity.setWard(buildingSearchRequest.getWard());
        }
        if (buildingSearchRequest.getFloorArea() != null) {
            entity.setFloorArea(buildingSearchRequest.getFloorArea());
        }
        if (buildingSearchRequest.getNumberOfBasement() != null) {
            entity.setNumberOfBasement(buildingSearchRequest.getNumberOfBasement());
        }
        if (buildingSearchRequest.getDirection() != null) {
            entity.setDirection(buildingSearchRequest.getDirection());
        }
        if (buildingSearchRequest.getLevel() != null) {
            entity.setLevel(buildingSearchRequest.getLevel());
        }
        if (buildingSearchRequest.getManagerName() != null) {
            entity.setManagerName(buildingSearchRequest.getManagerName());
        }
        if (buildingSearchRequest.getManagerPhone() != null) { // Hoặc managerPhoneNumber nếu có
            entity.setManagerPhone(buildingSearchRequest.getManagerPhone());
        }

        if (buildingSearchRequest.getDistrict() != null) {
            for (District district : District.values()) {
                if (district.getDistrictName().equalsIgnoreCase(buildingSearchRequest.getDistrict())) {
                    entity.setDistrict(district.toString());
                    break;
                }
            }

            if (entity.getDistrict() == null) {
                entity.setDistrict(buildingSearchRequest.getDistrict());
            }
        }

        if (buildingSearchRequest.getTypeCode() != null && !buildingSearchRequest.getTypeCode().isEmpty()) {
            if (!buildingSearchRequest.getTypeCode().contains("on")) {
                entity.setType(String.join(",", buildingSearchRequest.getTypeCode()));
            }
        }

        return entity;
    }
}
