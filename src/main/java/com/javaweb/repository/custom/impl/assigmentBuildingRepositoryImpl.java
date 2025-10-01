package com.javaweb.repository.custom.impl;

import com.javaweb.repository.assigmentBuildingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class assigmentBuildingRepositoryImpl implements assigmentBuildingRepository {
    @Override
    public void deleteByBuildingIdIn(List<Long> buildingId) {

    }
}
