package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.custom.BuildingRepositoryCustom;

import com.javaweb.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.*;

public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    @Transactional
    public List<BuildingEntity> searchBuildings(BuildingEntity buildingEntity) {

        StringBuilder sql = new StringBuilder("select b.* from building b ");
        List<String> conditions = new ArrayList<>();
        Map<String,Object> params = new HashMap<>();
        if (StringUtils.check(buildingEntity.getName())) {
            conditions.add(" b.name LIKE :name ");
            params.put("name", "%" + buildingEntity.getName() + "%");
        }
        // Sử dụng BuildingSearchBuilder để build query
//        BuildingSearchBuilder builder = new BuildingSearchBuilder.Builder()
//                .setName(buildingSearchRequest.getName())
//                .setDistrict(buildingSearchRequest.getDistrict())
//                .setWard(buildingSearchRequest.getWard())
//                .setStreet(buildingSearchRequest.getStreet())
//                .setNumberOfBasement(buildingSearchRequest.getNumberOfBasement())
//                .setFloorArea(buildingSearchRequest.getFloorArea())
//                .setAreaFrom(buildingSearchRequest.getAreaFrom())
//                .setAreaTo(buildingSearchRequest.getAreaTo())
//                .setRentPriceFrom(buildingSearchRequest.getRentPriceFrom())
//                .setRentPriceTo(buildingSearchRequest.getRentPriceTo())
//                .setManagerName(buildingSearchRequest.getManagerName())
//                .setManagerPhone(buildingSearchRequest.getManagerPhone())
//                .setLevel(buildingSearchRequest.getLevel())
//                .setDirection(buildingSearchRequest.getDirection())
//                .build();

        if (!conditions.isEmpty()) {
            sql.append(" WHERE ").append(String.join(" AND ", conditions)).append(" GROUP BY b.id ");
        }
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);

        for (Map.Entry<String, Object> entry : params.entrySet()) {
            query.setParameter(entry.getKey(), entry.getValue());
        }
        // Set parameters
//        if (builder.getParameters() != null) {
//            builder.getParameters().forEach(query::setParameter);
//        }
        return query.getResultList();
    }



}
