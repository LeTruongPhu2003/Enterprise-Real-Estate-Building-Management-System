package com.javaweb.specification;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import java.util.ArrayList;
import java.util.List;

public class BuildingSpecification {


        public static Specification<BuildingEntity> withSearchCriteria(BuildingSearchRequest request) {
            return (root, query, cb) -> {
                List<Predicate> predicates = new ArrayList<>();

                // Tìm kiếm theo name
                if (StringUtils.hasText(request.getName())) {
                    predicates.add(cb.like(root.get("name"), "%" + request.getName() + "%"));
                }

                // Tìm kiếm theo district
                if (StringUtils.hasText(request.getDistrict())) {
                    predicates.add(cb.equal(root.get("district"), request.getDistrict()));
                }

                // Tìm kiếm theo ward
                if (StringUtils.hasText(request.getWard())) {
                    predicates.add(cb.equal(root.get("ward"), request.getWard()));
                }

                // Tìm kiếm theo street
                if (StringUtils.hasText(request.getStreet())) {
                    predicates.add(cb.equal(root.get("street"), request.getStreet()));
                }

                // Tìm kiếm theo số tầng hầm
                if (request.getNumberOfBasement() != null) {
                    predicates.add(cb.equal(root.get("numberOfBasement"), request.getNumberOfBasement()));
                }

                // Tìm kiếm theo diện tích sàn
                if (request.getFloorArea() != null) {
                    predicates.add(cb.equal(root.get("floorArea"), request.getFloorArea()));
                }

                // Tìm kiếm theo phạm vi diện tích
                if (request.getAreaFrom() != null || request.getAreaTo() != null) {
                    Path<Long> floorAreaPath = root.get("floorArea");
                    if (request.getAreaFrom() != null && request.getAreaTo() != null) {
                        predicates.add(cb.between(floorAreaPath, request.getAreaFrom(), request.getAreaTo()));
                    } else if (request.getAreaFrom() != null) {
                        predicates.add(cb.ge(floorAreaPath, request.getAreaFrom()));
                    } else {
                        predicates.add(cb.le(floorAreaPath, request.getAreaTo()));
                    }
                }

                // Tìm kiếm theo giá thuê
                if (request.getRentPriceFrom() != null || request.getRentPriceTo() != null) {
                    Path<Long> rentPricePath = root.get("rentPrice");
                    if (request.getRentPriceFrom() != null && request.getRentPriceTo() != null) {
                        predicates.add(cb.between(rentPricePath, request.getRentPriceFrom(), request.getRentPriceTo()));
                    } else if (request.getRentPriceFrom() != null) {
                        predicates.add(cb.ge(rentPricePath, request.getRentPriceFrom()));
                    } else {
                        predicates.add(cb.le(rentPricePath, request.getRentPriceTo()));
                    }
                }

                // Tìm kiếm theo manager
                if (StringUtils.hasText(request.getManagerName())) {
                    predicates.add(cb.like(root.get("managerName"), "%" + request.getManagerName() + "%"));
                }

                if (StringUtils.hasText(request.getManagerPhone())) {
                    predicates.add(cb.like(root.get("managerPhone"), "%" + request.getManagerPhone() + "%"));
                }

                return cb.and(predicates.toArray(new Predicate[0]));
            };
        }

}
