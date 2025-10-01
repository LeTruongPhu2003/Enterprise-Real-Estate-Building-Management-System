package com.javaweb.repository;

import com.javaweb.entity.RentareaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RentAreaRepository extends JpaRepository<RentareaEntity, Long> {
    List<RentareaEntity> findAllByBuildingEntity_Id(Long buildingEntityId);
}
