<%--
  Created by IntelliJ IDEA.
  User: letruongphu
  Date: 18/08/2025
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Danh sách toà nhà</title>
</head>
<body>
<div class="main-content" >
    <script type="text/javascript">
        try { ace.settings.check('main-container', 'fixed') } catch (e) { }
    </script>


    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="/admin/home">Trang chủ</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->

                <div class="nav-search" id="nav-search">
                    <form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="nav-search-input"
                                       id="nav-search-input" autocomplete="off" />
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
                    </form>
                </div><!-- /.nav-search -->
            </div>


            <!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
            <div class="page-content">
                <div class="ace-settings-container" id="ace-settings-container">

                    <div class="ace-settings-box clearfix" id="ace-settings-box">
                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <div class="pull-left">
                                    <select id="skin-colorpicker" class="hide">
                                        <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                        <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                        <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                        <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                    </select>
                                </div>
                                <span>&nbsp; Choose Skin</span>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
                                <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                                <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                                <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                                <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                                <label class="lbl" for="ace-settings-add-container">
                                    Inside
                                    <b>.container</b>
                                </label>
                            </div>
                        </div><!-- /.pull-left -->

                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" />
                                <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" />
                                <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" />
                                <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                            </div>
                        </div><!-- /.pull-left -->
                    </div><!-- /.ace-settings-box -->
                </div><!-- /.ace-settings-container -->

                <div class="page-header">
                    <h1>
                        Danh sách toà nhà
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->
            </div><!-- /.page-content -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box ui-sortable-handle">
                        <div class="widget-header">
                            <h5 class="widget-title">Tìm kiếm</h5>

                            <div class="widget-toolbar">

                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>
                        <div class="widget-body" style="font-family: 'Times New Roman', Times, serif;">
                            <div class="widget-main">
                                <form:form id="listForm" action="/admin/building-list" method="get" modelAttribute="buildingSearchRequest">
                                    <div class="search-box">
                                        <div class="row">
                                            <div class="col-xs-6">
                                                <label class="name">Tên toà nhà</label>
<%--                                                <input type="text" id="buildingName" class="form-control"--%>
<%--                                                       placeholder="Nhập tên toà nhà" name="name" value="${buildingDTO.name}">--%>
                                                <form:input path="name" class="form-control"></form:input>
                                            </div>
                                            <div class="col-xs-6">
                                                <label class="name">Diện tích sàn</label>
                                                <input type="number" id="floorArea" class="form-control"
                                                       placeholder="Nhập diện tích sàn" name="floorArea" value="${buildingSearchRequest.floorArea}">
                                            </div>
                                        </div>

                                        <div class="row" style="margin-top: 10px;">
                                            <div class="col-xs-2">
                                                <label class="name">Quận</label>
                                                <form:select class="form-control" placeholder="Nhập quận" path ="district">
                                                    <form:option value="">---Chọn quận---</form:option>
                                                    <form:options items="${districts}"></form:options>

                                                </form:select>
                                            </div>
                                            <div class="col-xs-5">
                                                <label>Phường</label>
                                                <input type="text" class="form-control" placeholder="Phường" name="ward" value="${buildingSearchRequest.ward}">
                                            </div>
                                            <div class="col-xs-5">
                                                <label>Đường</label>
                                                <input type="text" class="form-control" placeholder="Đường" name="street" value="${buildingSearchRequest.street}">
                                            </div>
                                        </div>

                                        <div class="row" style="margin-top: 10px;">
                                            <div class="col-xs-4">
                                                <label>Số tầng hầm</label>
                                                <input type="number" class="form-control"
                                                       placeholder="Nhập số tầng hầm" name="numberOfBasement" value="">

                                            </div>
                                            <div class="col-xs-4">
                                                <label>Hướng</label>
                                                <input type="text" class="form-control" placeholder="Hướng" name="direction" value="">
                                            </div>
                                            <div class="col-xs-4">
                                                <label>Hạng</label>
                                                <input type="number" class="form-control" placeholder="Hạng" name="level" value="">
                                            </div>
                                        </div>

                                        <div class="row" style="margin-top: 10px;">
                                            <div class="col-xs-3">
                                                <label>Diện tích từ</label>
                                                <input type="number" class="form-control"
                                                       placeholder="Diện tích từ" name="areaFrom" value="">

                                            </div>
                                            <div class="col-xs-3">
                                                <label>Diện tích đến</label>
                                                <input type="number" class="form-control" placeholder="Diện tích đến" name="areaTo" value="">
                                            </div>
                                            <div class="col-xs-3">
                                                <label>Giá thuê từ</label>
                                                <input type="number" class="form-control" placeholder="Giá thuê từ" name="rentPriceFrom" value="">
                                            </div>

                                            <div class="col-xs-3">
                                                <label>Giá thuê đến</label>
                                                <input type="number" class="form-control" placeholder="Giá thuê đến" name="rentPriceTo" value="">
                                            </div>
                                        </div>

                                        <div class="row" style="margin-top: 10px;">
                                            <div class="col-xs-5">
                                                <label>Tên Quản lí</label>
                                                <input type="text" class="form-control" placeholder="Tên Quản lí" name="managerName" value="">
                                            </div>
                                            <div class="col-xs-5">
                                                <label>Điện thoại quản lí</label>
                                                <input type="text" class="form-control" placeholder="Số điện thoại quản lí" name="managerPhoneNumber" value="">
                                            </div>
                                            <div class="col-xs-2">
                                                <label>Nhân viên</label>
                                                <form:select class="form-control" placeholder="Nhập địa chỉ" path="staffId">
                                                    <form:option value="">---Chọn Nhân viên---</form:option>
                                                    <form:options items="${staffList}"/>

                                                </form:select>
                                            </div>
                                        </div>

                                        <div class="row" style="margin-top: 10px;">
                                            <div class="col-xs-6">
                                                    <form:checkboxes path="typeCode" items="${buildingType}"/>

                                            </div>
                                        </div>

                                        <div class="row" style="margin-top: 10px;">
                                            <div class="col-xs-6">

                                                <button type="button" class="btn btn-danger" id="btnSearchBuilding">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                         fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                        <path
                                                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0">
                                                        </path>
                                                    </svg>
                                                    Tìm kiếm
                                                </button>

                                            </div>
                                        </div>

                                    </div>
                                </form:form>

                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <!-- bảng building -->
            <div class="col-xs-12">

                <div class="clearfix">
                    <div class="pull-right tableTools-container">
                        <div class="btn-group btn-overlap">
                            <a href="/admin/building-edit">
                            <button type="button" class="btn btn-success" title="Thêm toà nhà">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-house-add" viewBox="0 0 16 16">
                                    <path
                                            d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h4a.5.5 0 1 0 0-1h-4a.5.5 0 0 1-.5-.5V7.207l5-5 6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z">
                                    </path>
                                    <path
                                            d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0m-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 1 0 1 0v-1h1a.5.5 0 1 0 0-1h-1v-1a.5.5 0 0 0-.5-.5">
                                    </path>
                                </svg>
                            </button>
                            </a>
                            <a href="#">
                            <button type="button" class="btn btn-outline-danger" title="xoá toà nhà" id="btnDeleteBuildings">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-house-dash" viewBox="0 0 16 16">
                                    <path
                                            d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 1 1 0-1">
                                    </path>
                                    <path
                                            d="M7.293 1.5a1 1 0 0 1 1.414 0L11 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l2.354 2.353a.5.5 0 0 1-.708.708L8 2.207l-5 5V13.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 2 13.5V8.207l-.646.647a.5.5 0 1 1-.708-.708z">
                                    </path>
                                </svg>

                            </button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="table-header">
                    Tất cả toà nhà
                </div>

                <!-- div.table-responsive -->

                <!-- div.dataTables_borderWrap -->
                <div id="buildingList-table">
                    <div id="dynamic-table_wrapper_1" class="dataTables_wrapper form-inline no-footer">
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="dataTables_length" id="dynamic-table_length"><label>Display <select
                                        name="dynamic-table_length" aria-controls="dynamic-table"
                                        class="form-control input-sm">
                                    <option value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select> records</label></div>
                            </div>
                        </div>
                        <table id="dynamic-table"
                               class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable"
                               role="grid" aria-describedby="dynamic-table_info">
                            <thead>
                            <tr role="row">
                                <th class="center sorting_disabled" rowspan="1" colspan="1" aria-label=" ">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>Tên toà nhà</th>
                                <th>Địa chỉ</th>
                                <th>Số tầng hầm</th>
                                <th>Tên quản lí</th>
                                <th>Số điện thoại quản lí</th>
                                <th>Diện tích sàn</th>
                                <th>Diện tích trống</th>
                                <th>Diện tích thuê</th>
                                <th>Phí môi giới</th>
                                <th>Thao tác</th>

                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="item" items="${buildings}">
                            <tr role="row" class="even">
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" value="${item.id}">
                                        <span class="lbl"></span>
                                    </label>
                                </td>

                                <td>${item.name}</td>
                                <td>${item.address}</td>
                                <td>${item.numberOfBasement}</td>
                                <td>${item.managerName}</td>
                                <td>${item.managerPhoneNumber}</td>
                                <td>${item.floorArea}</td>
                                <td>${item.emptyArea}</td>
                                <td>${item.rentArea}</td>
                                <td>${item.brokerageFee}</td>

                                <td>
                                    <div class="hidden-sm hidden-xs action-buttons">
                                        <button title="Giao toà nhà" ONCLICK="assingmentbuilding(${item.id})">
                                            <a class="blue" href="#">
                                                <i class="ace-icon glyphicon glyphicon-list"></i>
                                            </a>
                                        </button>

                                        <button>
                                            <a title="sửa toà nhà" class="green" href="/admin/building-edit-${item.id}">
                                                <i class="ace-icon fa fa-pencil bigger-130"></i>
                                            </a>
                                        </button>

                                        <button>
                                            <a title="Xoá toà nhà" class="red" href="#" onclick="deleteBuilding(${item.id})">
                                                <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                            </a>
                                        </button>
                                    </div>

                                    <div class="hidden-md hidden-lg">
                                        <div class="inline pos-rel">
                                            <button class="btn btn-minier btn-yellow dropdown-toggle"
                                                    data-toggle="dropdown" data-position="auto">
                                                <i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
                                            </button>

                                            <ul
                                                    class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                <li>
                                                    <a href="#" class="tooltip-info" data-rel="tooltip" title=""
                                                       data-original-title="View">
																<span class="blue">
																	<i class="ace-icon glyphicon glyphicon-list"></i>
																</span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#" class="tooltip-success" data-rel="tooltip"
                                                       title="" data-original-title="Edit">
																<span class="green">
																	<i
                                                                            class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																</span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#" class="tooltip-error" data-rel="tooltip"
                                                       title="" data-original-title="Delete">
																<span class="red">
																	<i class="ace-icon fa fa-trash-o bigger-120"></i>
																</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="dataTables_info" id="dynamic-table_info" role="status"
                                     aria-live="polite">Showing 1 to 10 of 23 entries</div>
                            </div>
                            <div class="col-xs-6">
                                <div class="dataTables_paginate paging_simple_numbers" id="dynamic-table_paginate">
                                    <ul class="pagination">
                                        <li class="paginate_button previous disabled" aria-controls="dynamic-table"
                                            tabindex="0" id="dynamic-table_previous"><a href="#">Previous</a></li>
                                        <li class="paginate_button active" aria-controls="dynamic-table"
                                            tabindex="0"><a href="#">1</a></li>
                                        <li class="paginate_button " aria-controls="dynamic-table" tabindex="0"><a
                                                href="#">2</a></li>
                                        <li class="paginate_button " aria-controls="dynamic-table" tabindex="0"><a
                                                href="#">3</a></li>
                                        <li class="paginate_button next" aria-controls="dynamic-table" tabindex="0"
                                            id="dynamic-table_next"><a href="#">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- hết bảng building -->
        </div>

    </div><!-- /.main-content -->

    <div class="modal fade" id="assingmentbuildingModal" role="dialog"
         style="font-family: 'Times New Roman', Times, serif;">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Danh sách nhân viên</h4>
                </div>
                <div class="modal-body">


                    <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">

                        <table id="staff-list"
                               class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable"
                               role="grid" aria-describedby="dynamic-table_info">
                            <thead>
                            <tr role="row">
                                <th>Chọn</th>
                                <th>Tên nhân viên</th>

                            </tr>
                            </thead>

                            <tbody>
<%--                            <tr role="row" class="even">--%>
<%--                                <td class="center">--%>
<%--                                    <label class="pos-rel">--%>
<%--                                        <input type="checkbox" id="checkbox_1" class="ace" value="1">--%>
<%--                                        <span class="lbl"></span>--%>
<%--                                    </label>--%>
<%--                                </td>--%>

<%--                                <td>Anh Nam-Chị Linh</td>--%>
<%--                            </tr>--%>
                            </tbody>

                        </table>
                        <input type="hidden" id="buildingId" name="buildingId">
                    </div>


                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnassingmentbuilding">Giao toà nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>


    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<script>
    function assingmentbuilding(buildingId) {
        $('#assingmentbuildingModal').modal();
        loadstaff(buildingId)
        $('#buildingId').val(buildingId);
    }

    function loadstaff(id){
        $.ajax({
            type: "GET",
            url: "/api/building/" + id +'/staffs',
            // data: JSON.stringify(data),
            // contentType: "application/json",
            dataType: "JSON",
            success: function(response){
                var row = '';
                $.each(response.data, function (idex, item){
                    row += '<tr role="row">';
                    row += '  <td class="center">';
                    row += '    <label class="pos-rel">';
                    row += '      <input type="checkbox" id="checkbox_' + item.staffId + '" class="ace" value="' + item.staffId + '" '+ item.checked +'>';
                    row += '      <span class="lbl"></span>';
                    row += '    </label>';
                    row += '  </td>';
                    row += '  <td>' + (item.fullName || '') + '</td>';
                    row += '</tr>';
                })
                $('#staff-list tbody').html(row);
                console.info("success");
            },
            error: function(respond){
                console.log("fall");
                console.log(respond);
            }
        })
    }

    $('#btnassingmentbuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staff-list').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
            assingment(data)
        confirm("Giao tòa nhà thành công");
        console.log("ok");
        location.reload();

    })

    function assingment(data){
        $.ajax({
            type: "POST",
            url: "/api/building/" + 'assingmentbuilding',
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(respond){
                console.info("success");
            },
            error: function(respond){
                console.log("giao khong thanh cong");
                <%--window.location.href = "<c:url value="admin/building-list?message=errol"/>"--%>
                console.log(respond);
            }
        })
    }

    $('#btnSearchBuilding').click(function (e){
        e.preventDefault();
        $('#listForm').submit();
    })

    function deleteBuilding(id){
        var buildingId= [id];
        deleteBuildings(buildingId);
    }
    $('#btnDeleteBuildings').click(function (e){
        e.preventDefault();
        var buildingIds = $('#dynamic-table').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
    })

    function deleteBuildings(ids) {
        $.ajax({
            type: "DELETE",
            url: "/api/building"+"/"+ ids.join(","),
            success: function() {
                console.log("Xóa thành công");
            },
            error: function(err) {
                console.log("Xóa thất bại", err);
            }
        });
    }
</script>
</body>
</html>
