<%@ page import='java.util.*,com.terapico.bbt.*'%>
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>

<c:set var="taskWatchList" value="${result.taskWatchList}"/>

<c:if test="${ empty taskWatchList}" >
	<div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		 ${userContext.localeMap['@not_found']}${userContext.localeMap['task_watch']}! 
		 <a href="./${ownerBeanName}Manager/addTaskWatch/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 
		 
		 
		 </div>
	</div>

</c:if>




	

 <c:if test="${not empty result.taskWatchList}" >
    
    
<%

 	SmartList list=(SmartList)pageContext.getAttribute("taskWatchList"); 
 	int totalCount = list.getTotalCount();
 	List pages = list.getPages();
 	pageContext.setAttribute("pages",pages); 
 	pageContext.setAttribute("totalCount",totalCount); 
 	//the reason using scriptlet here is the el express is currently not able resolv common property from a subclass of list
%>
    
 	   
    <div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		<i class='fa fa-table'></i> ${userContext.localeMap['task_watch']}(${totalCount})
		<a href="./${ownerBeanName}Manager/addTaskWatch/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 
		 		 	<div class="btn-group" role="group" aria-label="Button group with nested dropdown">		
	<c:forEach var="action" items="${result.actionList}">
		<c:if test="${'taskWatchList' eq action.actionGroup}">
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
		<a href='#${ownerBeanName}Manager/load${ownerClassName}/${result.id}/taskWatchList;taskWatchListCurrentPage=${page.pageNumber}/' 
			class='page-link page-action '>${page.title}</a>
	</li>
</c:forEach>
 </ul>
</nav>


   


	<table class="table table-striped" pageToken='taskWatchListCurrentPage=${currentPageNumber}'>
		<thead><tr>
		<c:if test="${param.referName ne 'id'}">
	<th>${userContext.localeMap['task_watch.id']}</th>
</c:if>
<c:if test="${param.referName ne 'watchDate'}">
	<th>${userContext.localeMap['task_watch.watch_date']}</th>
</c:if>
<c:if test="${param.referName ne 'watcher'}">
	<th>${userContext.localeMap['task_watch.watcher']}</th>
</c:if>
<c:if test="${param.referName ne 'task'}">
	<th>${userContext.localeMap['task_watch.task']}</th>
</c:if>
<th>${userContext.localeMap['@action']}</th>
		</tr></thead>
		<tbody>
			
			<c:forEach var="item" items="${result.taskWatchList}">
				<tr currentVersion='${item.version}' id="taskWatch-${item.id}" ><td><a class="link-action-removed" href="./taskWatchManager/loadTaskWatchDetail/${item.id}/"> ${item.id}</a></td>
<c:if test="${param.referName ne 'watchDate'}">	<td contenteditable='true' class='edit-value'  propertyToChange='watchDate' storedCellValue='${item.watchDate}' prefix='${ownerBeanName}Manager/updateTaskWatch/${result.id}/${item.id}/'><fmt:formatDate pattern="yyyy-MM-dd" value="${item.watchDate}" /></td>
</c:if><c:if test="${param.referName ne 'watcher'}">	<td ><a href='./communityUserManager/loadCommunityUserDetail/${item.watcher.id}/'>${item.watcher.id}</a></td>
</c:if><c:if test="${param.referName ne 'task'}">	<td ><a href='./taskManager/loadTaskDetail/${item.task.id}/'>${item.task.id}</a></td>
</c:if>
				<td>

				<a href='#${ownerBeanName}Manager/removeTaskWatch/${result.id}/${item.id}/' class='delete-action btn btn-danger btn-xs'><i class="fa fa-trash-o fa-lg"></i> ${userContext.localeMap['@delete']}</a>
				<a href='#${ownerBeanName}Manager/copyTaskWatchFrom/${result.id}/${item.id}/' class='copy-action btn btn-success btn-xs'><i class="fa fa-files-o fa-lg"></i> ${userContext.localeMap['@copy']} </a>

				</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>	
	

</div></c:if>


