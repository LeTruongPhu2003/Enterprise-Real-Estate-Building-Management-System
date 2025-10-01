package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentareaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RentAreaConverter {

    public RentareaEntity toRentArea(Long val, BuildingEntity buildingEntity) {
     RentareaEntity rentareaEntity = new RentareaEntity();
     rentareaEntity.setValue(val);
     rentareaEntity.setBuildingEntity(buildingEntity);
     return rentareaEntity;
    }

    public List<RentareaEntity> toRentAreaList(BuildingEntity buildingEntity, BuildingDTO buildingDTO) {
        List<RentareaEntity> rentareaEntityList = new ArrayList<>();
        String[] rentarea  = buildingDTO.getRentArea().split(",");
        for(String r:rentarea){
            rentareaEntityList.add(toRentArea(Long.parseLong(r),buildingEntity));
        }
        return rentareaEntityList;
    }
}
