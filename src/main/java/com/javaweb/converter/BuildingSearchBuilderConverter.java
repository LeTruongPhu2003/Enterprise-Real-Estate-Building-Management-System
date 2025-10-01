package com.javaweb.converter;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public class BuildingSearchBuilderConverter {
    public BuildingSearchBuilder toBuildingSearchBuilderList(Map<String, Object> params, List<String> typeCode){
        BuildingSearchBuilder buildingSearchBuilder = new BuildingSearchBuilder.Builder()
                .setName(MapUtils.getObject(params.get("name"), String.class))
                .setWard(MapUtils.getObject(params.get("ward"), String.class))
                .setNumberOfBasement(MapUtils.getObject(params.get("numberOfBasement"),Long.class))
                .setStreet(MapUtils.getObject(params.get("street"), String.class))
                .setDistrict(MapUtils.getObject(params.get("districtId"), String.class))
                .setLevel(MapUtils.getObject(params.get("level"), Long.class))
                .setDirection(MapUtils.getObject(params.get("direction"), String.class))
                .setAreaFrom(MapUtils.getObject(params.get("areaFrom"), Long.class))
                .setAreaTo(MapUtils.getObject(params.get("areaTo"), Long.class))
                .setRentPriceFrom(MapUtils.getObject(params.get("rentPriceFrom"), Long.class))
                .setRentPriceTo(MapUtils.getObject(params.get("renPriceTo"), Long.class))
                .setManagerName(MapUtils.getObject(params.get("managerName"), String.class))
                .setManagerPhone(MapUtils.getObject(params.get("managerPhoneNumber"), String.class))
                .setTypeCode(typeCode)
                .build(); // kết thúc builder
        return buildingSearchBuilder;
    }

}
