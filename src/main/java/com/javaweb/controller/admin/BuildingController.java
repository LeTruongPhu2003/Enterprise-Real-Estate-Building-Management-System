package com.javaweb.controller.admin;



import com.javaweb.converter.MapConverter;
import com.javaweb.enums.District;
import com.javaweb.enums.Type;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private BuildingService buildingService;

    @Autowired
    private MapConverter mapConverter;
    @Autowired
    private UserService userService;

    @GetMapping(value = "/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest httpServletRequest){

        ModelAndView modelAndView = new ModelAndView("admin/building/list");
        modelAndView.addObject("buildingSearchRequest", buildingSearchRequest);

        List<BuildingSearchResponse> buildingSearchResponsesList = new ArrayList<>();
        if(buildingSearchRequest!=null){
            buildingSearchResponsesList = buildingService.searchBuilding(buildingSearchRequest);
        }
        else{
            buildingSearchResponsesList = buildingService.findAllBuilding();
        }
        modelAndView.addObject("buildings", buildingSearchResponsesList);

        modelAndView.addObject("staffList", userService.getStaff());
        modelAndView.addObject("districts", District.getDistrictMap());
        modelAndView.addObject("buildingType", Type.getBuildingTypeNameMap());
        return modelAndView;
    }

    @GetMapping(value = "/admin/building-edit")
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit")BuildingDTO buildingDTO, HttpServletRequest httpServletRequest){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", District.getDistrictMap());
        mav.addObject("buildingType", Type.getBuildingTypeNameMap());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit-{id}")
    public ModelAndView buildingEdit(@PathVariable("id") Long Id, HttpServletRequest httpServletRequest){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO = buildingService.findById(Id);
        mav.addObject("buildingEdit",buildingDTO);
        mav.addObject("districts", District.getDistrictMap());
        mav.addObject("buildingType", Type.getBuildingTypeNameMap());
        return mav;
    }


}
