<%@ page import='java.util.*,com.skynet.retailscm.*'%>
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>

<c:set var="transportTaskTrackList" value="${result.transportTaskTrackList}"/>

<c:if test="${ empty transportTaskTrackList}" >
	<div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		 ${userContext.localeMap['@not_found']}${userContext.localeMap['transport_task_track']}! 
		 <a href="./${ownerBeanName}Manager/addTransportTaskTrack/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 
		 
		 
		 </div>
	</div>

</c:if>




	

 <c:if test="${not empty result.transportTaskTrackList}" >
    
    
<%

 	SmartList list=(SmartList)pageContext.getAttribute("transportTaskTrackList"); 
 	int totalCount = list.getTotalCount();
 	List pages = list.getPages();
 	pageContext.setAttribute("pages",pages); 
 	pageContext.setAttribute("totalCount",totalCount); 
 	//the reason using scriptlet here is the el express is currently not able resolv common property from a subclass of list
%>
    
 	   
    <div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		<i class='fa fa-table'></i> ${userContext.localeMap['transport_task_track']}(${totalCount})
		<a href="./${ownerBeanName}Manager/addTransportTaskTrack/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 
		 		 	<div class="btn-group" role="group" aria-label="Button group with nested dropdown">		
	<c:forEach var="action" items="${result.actionList}">
		<c:if test="${'transportTaskTrackList' eq action.actionGroup}">
		<a class="btn btn-${action.actionLevel} btn-sm" href="${action.managerBeanName}/${action.actionPath}">${userContext.localeMap[action.localeKey]}</a>
		</c:if>
	</c:forEach>
	</div><!--end of div class="btn-group" -->
	
		 
		 
		 
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
		<a href='#${ownerBeanName}Manager/load${ownerClassName}/${result.id}/transportTaskTrackList;transportTaskTrackListCurrentPage=${page.pageNumber}/' 
			class='page-link page-action '>${page.title}</a>
	</li>
</c:forEach>
 </ul>
</nav>


   


	<table class="table table-striped" pageToken='transportTaskTrackListCurrentPage=${currentPageNumber}'>
		<thead><tr>
		<c:if test="${param.referName ne 'id'}">
	<th>${userContext.localeMap['transport_task_track.id']}</th>
</c:if>
<c:if test="${param.referName ne 'trackTime'}">
	<th>${userContext.localeMap['transport_task_track.track_time']}</th>
</c:if>
<c:if test="${param.referName ne 'latitude'}">
	<th>${userContext.localeMap['transport_task_track.latitude']}</th>
</c:if>
<c:if test="${param.referName ne 'longitude'}">
	<th>${userContext.localeMap['transport_task_track.longitude']}</th>
</c:if>
<c:if test="${param.referName ne 'movement'}">
	<th>${userContext.localeMap['transport_task_track.movement']}</th>
</c:if>
<th>${userContext.localeMap['@action']}</th>
		</tr></thead>
		<tbody>
			
			<c:forEach var="item" items="${result.transportTaskTrackList}">
				<tr currentVersion='${item.version}' id="transportTaskTrack-${item.id}" ><td><a class="link-action-removed" href="./transportTaskTrackManager/loadTransportTaskTrackDetail/${item.id}/"> ${item.id}</a></td>
<c:if test="${param.referName ne 'trackTime'}">	<td contenteditable='true' class='edit-value'  propertyToChange='trackTime' storedCellValue='${item.trackTime}' prefix='${ownerBeanName}Manager/updateTransportTaskTrack/${result.id}/${item.id}/'><fmt:formatDate pattern="yyyy-MM-dd" value="${item.trackTime}" /></td>
</c:if><c:if test="${param.referName ne 'latitude'}">	<td contenteditable='true' class='edit-value'  propertyToChange='latitude' storedCellValue='${item.latitude}' prefix='${ownerBeanName}Manager/updateTransportTaskTrack/${result.id}/${item.id}/'>${item.latitude}</td>
</c:if><c:if test="${param.referName ne 'longitude'}">	<td contenteditable='true' class='edit-value'  propertyToChange='longitude' storedCellValue='${item.longitude}' prefix='${ownerBeanName}Manager/updateTransportTaskTrack/${result.id}/${item.id}/'>${item.longitude}</td>
</c:if><c:if test="${param.referName ne 'movement'}">	<td ><a href='./transportTaskManager/loadTransportTaskDetail/${item.movement.id}/'>${item.movement.id}</a></td>
</c:if>
				<td>

				<a href='#${ownerBeanName}Manager/removeTransportTaskTrack/${result.id}/${item.id}/' class='delete-action btn btn-danger btn-xs'><i class="fa fa-trash-o fa-lg"></i> ${userContext.localeMap['@delete']}</a>
				<a href='#${ownerBeanName}Manager/copyTransportTaskTrackFrom/${result.id}/${item.id}/' class='copy-action btn btn-success btn-xs'><i class="fa fa-files-o fa-lg"></i> ${userContext.localeMap['@copy']} </a>

				</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>	
	

</div></c:if>


