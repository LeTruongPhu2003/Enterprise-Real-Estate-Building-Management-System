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
    <title>Thên Toà Nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
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
                    Tuỳ chỉnh toà nhà
                </h1>
            </div><!-- /.page-header -->

            <div class="row" style="font-family: Georgia, 'Times New Roman', Times, serif;">
                <form:form id="form-edit" class="form-elements" role="form" modelAttribute="buildingEdit" method="get">
                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3 ">Tên toà nhà</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" id="name" path="name" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3 ">Quận</label>
                            <div class="col-xs-5"> <!-- đổi từ col-xs-3 thành col-xs-9 -->
                                <form:select class="form-control" placeholder="Nhập quận" path ="district" value="">
                                    <form:option value="">---Chọn quận---</form:option>
                                    <form:options items="${districts}"></form:options>
                                </form:select>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Phường</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="ward" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Đường</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="street" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Kết cấu</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="structure" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Số tầng hầm</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="numberOfBasement" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Diện tích sàn</label>
                            <div class="col-xs-9">
                                <form:input path="floorArea" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Hướng</label>
                            <div class="col-xs-9">
                                <form:input path="direction" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Hạng</label>
                            <div class="col-xs-9">
                                <form:input path="level" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Diện tích thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentArea" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Giá thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentPrice" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>


                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Mô tả giá</label>
                            <div class="col-xs-9">
                                <form:input path="rentPriceDescription" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>


                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Phí dịch vụ</label>
                            <div class="col-xs-9">
                                <form:input path="serviceFee" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>


                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Phí ô tô</label>
                            <div class="col-xs-9">
                                <form:input path="carFee" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>


                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Phí mô tô</label>
                            <div class="col-xs-9">
                                <form:input path="motoFee" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Phí ngoài giờ</label>
                            <div class="col-xs-9">
                                <form:input path="overtimeFee" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Tiền điện</label>
                            <div class="col-xs-9">
                                <form:input path="electricityFee" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Đặt cọc</label>
                            <div class="col-xs-9">
                                <form:input path="deposit" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Thanh toán</label>
                            <div class="col-xs-9">
                                <form:input path="payment" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">
                        <div class="form-group">
                            <label class="col-xs-3">Thời hạn thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentTime" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Thời gian trang trí</label>
                            <div class="col-xs-9">
                                <form:input path="decorationTime" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Tên quản lí</label>
                            <div class="col-xs-9">
                                <form:input path="managerName" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Số điện thoại quản lí</label>
                            <div class="col-xs-9">
                                <form:input path="managerPhone" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Phí môi giới</label>
                            <div class="col-xs-9">
                                <form:input path="brokerageFee" class="form-control" placeholder="Nhập phí môi giới" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Loại toà nhà</label>
                            <div class="col-xs-9">
                                <div class="col-xs-6">
                                    <form:checkboxes path="typeCode" items="${buildingType}"/>
                                </div>

                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-3">Ghi chú</label>
                            <div class="col-xs-9">
                                <form:input path="note" class="form-control" value=""/>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12">
                        <div class="form-group">
                            <label class="col-xs-3 "></label>
                            <div class="col-xs-9">
                                <c:if test="${not empty buildingEdit.id}">
                                    <button type="button" class="btn-primary" id="btnAddOrUpdateBuilding">Sửa toà nhà</button>
                                    <button type="button" class="btn-danger" id="btnCancel">Huỷ thao tác</button>
                                </c:if>

                                <c:if test="${ empty buildingEdit.id}">
                                    <button type="button" class="btn-primary" id="btnAddOrUpdateBuilding">Thêm toà nhà</button>
                                    <button type="button" class="btn-danger" id="btnCancel">Huỷ thao tác</button>
                                </c:if>

                            </div>
                        </div>
                    </div>
                    <form:hidden path="id" id="buildingID"></form:hidden>
                </form:form>
            </div>

        </div><!-- /.page-content -->


    </div>

</div>
<script>
    $('#btnAddOrUpdateBuilding').click(function(){
        var data = {};
        var typeCode = [];
        var formData = $('#form-edit').serializeArray();
        $.each(formData, function(i, v){
            if(v.name != 'typeCode'){
                data["" +v.name+ ""]=v.value;
            }
            else{
                typeCode.push(v.value);
            }

        });
        data['typeCode']= typeCode;
        if (data.typeCode!=null && data.typeCode.length>0){
            addOrUpdateBuilding(data);
            confirm("Thêm thành công");
            location.reload();
        }
        else {
            window.location.href = '<c:url value="/admin/building-edit?typeCode=require"/>';
        }

    });
    function addOrUpdateBuilding(data){
        $.ajax({
            type: "POST",
            url: "/api/building",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(respond){
                console.log("success");
            },
            error: function(respond){
                console.log("fall");
                console.log(respond);
            }
        })
    }

    $('#btnCancel').click(function () {
        window.location.href="/admin/building-list"
    });
</script>
</body>
</html>
