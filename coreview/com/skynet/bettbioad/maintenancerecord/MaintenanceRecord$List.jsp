<%@ page import='java.util.*,com.skynet.bettbioad.*'%>
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>

<c:set var="maintenanceRecordList" value="${result.maintenanceRecordList}"/>

<c:if test="${ empty maintenanceRecordList}" >
	<div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		 ${userContext.localeMap['@not_found']}${userContext.localeMap['maintenance_record']}! 
		 <a href="./${ownerBeanName}Manager/addMaintenanceRecord/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 </div>
	</div>

</c:if>




	

 <c:if test="${not empty result.maintenanceRecordList}" >
    
    
<%

 	SmartList list=(SmartList)pageContext.getAttribute("maintenanceRecordList"); 
 	int totalCount = list.getTotalCount();
 	List pages = list.getPages();
 	pageContext.setAttribute("pages",pages); 
 	pageContext.setAttribute("totalCount",totalCount); 
 	//the reason using scriptlet here is the el express is currently not able resolv common property from a subclass of list
%>
    
 	   
    <div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		<i class='fa fa-list-ol'></i> ${userContext.localeMap['maintenance_record']}(${totalCount})
		<a href="./${ownerBeanName}Manager/addMaintenanceRecord/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 </div>
 </div>
    
    
<div class="table-responsive">


<c:set var="currentPageNumber" value="1"/>	



<nav aria-label="Page navigation example">
  <ul class="pagination">
<c:forEach var="page" items="${pages}"> 
<c:set var="classType" value=""/>
<c:if test='${page.selected}' >
<c:set var="classType" value="active"/>
<c:set var="currentPageNumber" value="${page.pageNumber}"/>
</c:if>


	<li class="page-item ${classType}">
		<a href='#${ownerBeanName}Manager/load${ownerClassName}/${result.id}/maintenanceRecordList;maintenanceRecordListCurrentPage=${page.pageNumber}/' 
			class='page-link page-action '>${page.title}</a>
	</li>
</c:forEach>
 </ul>
</nav>


   


	<table class="table table-striped" pageToken='maintenanceRecordListCurrentPage=${currentPageNumber}'>
		<thead><tr>
		<c:if test="${param.referName ne 'id'}">
	<th>${userContext.localeMap['maintenance_record.id']}</th>
</c:if>
<c:if test="${param.referName ne 'recordType'}">
	<th>${userContext.localeMap['maintenance_record.record_type']}</th>
</c:if>
<c:if test="${param.referName ne 'refrigerator'}">
	<th>${userContext.localeMap['maintenance_record.refrigerator']}</th>
</c:if>
<c:if test="${param.referName ne 'countTime'}">
	<th>${userContext.localeMap['maintenance_record.count_time']}</th>
</c:if>
<c:if test="${param.referName ne 'summary'}">
	<th>${userContext.localeMap['maintenance_record.summary']}</th>
</c:if>
<th>${userContext.localeMap['@action']}</th>
		</tr></thead>
		<tbody>
			
			<c:forEach var="item" items="${result.maintenanceRecordList}">
				<tr currentVersion='${item.version}' id="maintenanceRecord-${item.id}" ><td><a class="link-action-removed" href="./maintenanceRecordManager/loadMaintenanceRecordDetail/${item.id}/"> ${item.id}</a></td>
<c:if test="${param.referName ne 'recordType'}">	<td contenteditable='true' class='edit-value'  propertyToChange='recordType' storedCellValue='${item.recordType}' prefix='${ownerBeanName}Manager/updateMaintenanceRecord/${result.id}/${item.id}/'>${item.recordType}</td>
</c:if><c:if test="${param.referName ne 'refrigerator'}">	<td ><a href='./refrigeratorManager/loadRefrigeratorDetail/${item.refrigerator.id}/'>${item.refrigerator.id}</a></td>
</c:if><c:if test="${param.referName ne 'countTime'}">	<td contenteditable='true' class='edit-value'  propertyToChange='countTime' storedCellValue='<fmt:formatDate pattern="yyyy-MM-dd" value="${item.countTime}" />' prefix='${ownerBeanName}Manager/updateMaintenanceRecord/${result.id}/${item.id}/'><fmt:formatDate pattern="yyyy-MM-dd" value="${item.countTime}" /></td>
</c:if><c:if test="${param.referName ne 'summary'}">	<td contenteditable='true' class='edit-value'  propertyToChange='summary' storedCellValue='${item.summary}' prefix='${ownerBeanName}Manager/updateMaintenanceRecord/${result.id}/${item.id}/'>${item.summary}</td>
</c:if>
				<td>

				<a href='#${ownerBeanName}Manager/removeMaintenanceRecord/${result.id}/${item.id}/' class='delete-action btn btn-danger btn-xs'><i class="fa fa-trash-o fa-lg"></i> ${userContext.localeMap['@delete']}</a>
				<a href='#${ownerBeanName}Manager/copyMaintenanceRecordFrom/${result.id}/${item.id}/' class='copy-action btn btn-success btn-xs'><i class="fa fa-files-o fa-lg"></i> ${userContext.localeMap['@copy']} </a>

				</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>	
	

</div></c:if>


