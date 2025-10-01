package com.javaweb.converter;

import com.javaweb.model.request.BuildingSearchRequest;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class MapConverter {
    private final ModelMapper modelMapper;

    public MapConverter(ModelMapper modelMapper) {
        this.modelMapper = modelMapper;
    }

    public Map<String, Object> convertToMap(BuildingSearchRequest request) {
        Map<String, Object> result = new HashMap<>();
        Map<String, Object> temp = modelMapper.map(request, Map.class);
        for (Map.Entry<String, Object> entry : temp.entrySet()) {
            Object value = entry.getValue();
            if (value != null && !(value instanceof String && ((String) value).isEmpty())) {
                result.put(entry.getKey(), value);
            }
        }
        return result;
    }
}
