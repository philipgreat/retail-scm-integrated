<%@ page import='java.util.*,com.skynet.bettbioad.*'%>
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>

<c:set var="contactHistoryList" value="${result.contactHistoryList}"/>

<c:if test="${ empty contactHistoryList}" >
	<div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		 ${userContext.localeMap['@not_found']}${userContext.localeMap['contact_history']}! 
		 <a href="./${ownerBeanName}Manager/addContactHistory/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 </div>
	</div>

</c:if>




	

 <c:if test="${not empty result.contactHistoryList}" >
    
    
<%

 	SmartList list=(SmartList)pageContext.getAttribute("contactHistoryList"); 
 	int totalCount = list.getTotalCount();
 	List pages = list.getPages();
 	pageContext.setAttribute("pages",pages); 
 	pageContext.setAttribute("totalCount",totalCount); 
 	//the reason using scriptlet here is the el express is currently not able resolv common property from a subclass of list
%>
    
 	   
    <div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		<i class='fa fa-list-ol'></i> ${userContext.localeMap['contact_history']}(${totalCount})
		<a href="./${ownerBeanName}Manager/addContactHistory/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
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
		<a href='#${ownerBeanName}Manager/load${ownerClassName}/${result.id}/contactHistoryList;contactHistoryListCurrentPage=${page.pageNumber}/' 
			class='page-link page-action '>${page.title}</a>
	</li>
</c:forEach>
 </ul>
</nav>


   


	<table class="table table-striped" pageToken='contactHistoryListCurrentPage=${currentPageNumber}'>
		<thead><tr>
		<c:if test="${param.referName ne 'id'}">
	<th>${userContext.localeMap['contact_history.id']}</th>
</c:if>
<c:if test="${param.referName ne 'name'}">
	<th>${userContext.localeMap['contact_history.name']}</th>
</c:if>
<c:if test="${param.referName ne 'contactDate'}">
	<th>${userContext.localeMap['contact_history.contact_date']}</th>
</c:if>
<c:if test="${param.referName ne 'contactMethod'}">
	<th>${userContext.localeMap['contact_history.contact_method']}</th>
</c:if>
<c:if test="${param.referName ne 'contact'}">
	<th>${userContext.localeMap['contact_history.contact']}</th>
</c:if>
<c:if test="${param.referName ne 'description'}">
	<th>${userContext.localeMap['contact_history.description']}</th>
</c:if>
<th>${userContext.localeMap['@action']}</th>
		</tr></thead>
		<tbody>
			
			<c:forEach var="item" items="${result.contactHistoryList}">
				<tr currentVersion='${item.version}' id="contactHistory-${item.id}" ><td><a class="link-action-removed" href="./contactHistoryManager/loadContactHistoryDetail/${item.id}/"> ${item.id}</a></td>
<c:if test="${param.referName ne 'name'}">	<td contenteditable='true' class='edit-value'  propertyToChange='name' storedCellValue='${item.name}' prefix='${ownerBeanName}Manager/updateContactHistory/${result.id}/${item.id}/'>${item.name}</td>
</c:if><c:if test="${param.referName ne 'contactDate'}">	<td contenteditable='true' class='edit-value'  propertyToChange='contactDate' storedCellValue='<fmt:formatDate pattern="yyyy-MM-dd" value="${item.contactDate}" />' prefix='${ownerBeanName}Manager/updateContactHistory/${result.id}/${item.id}/'><fmt:formatDate pattern="yyyy-MM-dd" value="${item.contactDate}" /></td>
</c:if><c:if test="${param.referName ne 'contactMethod'}">	<td contenteditable='true' class='edit-value'  propertyToChange='contactMethod' storedCellValue='${item.contactMethod}' prefix='${ownerBeanName}Manager/updateContactHistory/${result.id}/${item.id}/'>${item.contactMethod}</td>
</c:if><c:if test="${param.referName ne 'contact'}">	<td ><a href='./contactManager/loadContactDetail/${item.contact.id}/'>${item.contact.id}</a></td>
</c:if><c:if test="${param.referName ne 'description'}">	<td contenteditable='true' class='edit-value'  propertyToChange='description' storedCellValue='${item.description}' prefix='${ownerBeanName}Manager/updateContactHistory/${result.id}/${item.id}/'>${item.description}</td>
</c:if>
				<td>

				<a href='#${ownerBeanName}Manager/removeContactHistory/${result.id}/${item.id}/' class='delete-action btn btn-danger btn-xs'><i class="fa fa-trash-o fa-lg"></i> ${userContext.localeMap['@delete']}</a>
				<a href='#${ownerBeanName}Manager/copyContactHistoryFrom/${result.id}/${item.id}/' class='copy-action btn btn-success btn-xs'><i class="fa fa-files-o fa-lg"></i> ${userContext.localeMap['@copy']} </a>

				</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>	
	

</div></c:if>


