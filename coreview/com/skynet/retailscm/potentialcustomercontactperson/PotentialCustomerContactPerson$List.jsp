<%@ page import='java.util.*,com.skynet.retailscm.*'%>
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>

<c:set var="potentialCustomerContactPersonList" value="${result.potentialCustomerContactPersonList}"/>

<c:if test="${ empty potentialCustomerContactPersonList}" >
	<div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		 ${userContext.localeMap['@not_found']}${userContext.localeMap['potential_customer_contact_person']}! 
		 <a href="./${ownerBeanName}Manager/addPotentialCustomerContactPerson/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 
		 
		 
		 </div>
	</div>

</c:if>




	

 <c:if test="${not empty result.potentialCustomerContactPersonList}" >
    
    
<%

 	SmartList list=(SmartList)pageContext.getAttribute("potentialCustomerContactPersonList"); 
 	int totalCount = list.getTotalCount();
 	List pages = list.getPages();
 	pageContext.setAttribute("pages",pages); 
 	pageContext.setAttribute("totalCount",totalCount); 
 	//the reason using scriptlet here is the el express is currently not able resolv common property from a subclass of list
%>
    
 	   
    <div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		<i class='fa fa-table'></i> ${userContext.localeMap['potential_customer_contact_person']}(${totalCount})
		<a href="./${ownerBeanName}Manager/addPotentialCustomerContactPerson/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 
		 		 	<div class="btn-group" role="group" aria-label="Button group with nested dropdown">		
	<c:forEach var="action" items="${result.actionList}">
		<c:if test="${'potentialCustomerContactPersonList' eq action.actionGroup}">
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
		<a href='#${ownerBeanName}Manager/load${ownerClassName}/${result.id}/potentialCustomerContactPersonList;potentialCustomerContactPersonListCurrentPage=${page.pageNumber}/' 
			class='page-link page-action '>${page.title}</a>
	</li>
</c:forEach>
 </ul>
</nav>


   


	<table class="table table-striped" pageToken='potentialCustomerContactPersonListCurrentPage=${currentPageNumber}'>
		<thead><tr>
		<c:if test="${param.referName ne 'id'}">
	<th>${userContext.localeMap['potential_customer_contact_person.id']}</th>
</c:if>
<c:if test="${param.referName ne 'name'}">
	<th>${userContext.localeMap['potential_customer_contact_person.name']}</th>
</c:if>
<c:if test="${param.referName ne 'mobile'}">
	<th>${userContext.localeMap['potential_customer_contact_person.mobile']}</th>
</c:if>
<c:if test="${param.referName ne 'potentialCustomer'}">
	<th>${userContext.localeMap['potential_customer_contact_person.potential_customer']}</th>
</c:if>
<c:if test="${param.referName ne 'description'}">
	<th>${userContext.localeMap['potential_customer_contact_person.description']}</th>
</c:if>
<th>${userContext.localeMap['@action']}</th>
		</tr></thead>
		<tbody>
			
			<c:forEach var="item" items="${result.potentialCustomerContactPersonList}">
				<tr currentVersion='${item.version}' id="potentialCustomerContactPerson-${item.id}" ><td><a class="link-action-removed" href="./potentialCustomerContactPersonManager/loadPotentialCustomerContactPersonDetail/${item.id}/"> ${item.id}</a></td>
<c:if test="${param.referName ne 'name'}">	<td contenteditable='true' class='edit-value'  propertyToChange='name' storedCellValue='${item.name}' prefix='${ownerBeanName}Manager/updatePotentialCustomerContactPerson/${result.id}/${item.id}/'>${item.name}</td>
</c:if><c:if test="${param.referName ne 'mobile'}">	<td contenteditable='true' class='edit-value'  propertyToChange='mobile' storedCellValue='${item.maskedMobile}' prefix='${ownerBeanName}Manager/updatePotentialCustomerContactPerson/${result.id}/${item.id}/'>${item.maskedMobile}</td>
</c:if><c:if test="${param.referName ne 'potentialCustomer'}">	<td ><a href='./potentialCustomerManager/loadPotentialCustomerDetail/${item.potentialCustomer.id}/'>${item.potentialCustomer.id}</a></td>
</c:if><c:if test="${param.referName ne 'description'}">	<td contenteditable='true' class='edit-value'  propertyToChange='description' storedCellValue='${item.description}' prefix='${ownerBeanName}Manager/updatePotentialCustomerContactPerson/${result.id}/${item.id}/'>${item.description}</td>
</c:if>
				<td>

				<a href='#${ownerBeanName}Manager/removePotentialCustomerContactPerson/${result.id}/${item.id}/' class='delete-action btn btn-danger btn-xs'><i class="fa fa-trash-o fa-lg"></i> ${userContext.localeMap['@delete']}</a>
				<a href='#${ownerBeanName}Manager/copyPotentialCustomerContactPersonFrom/${result.id}/${item.id}/' class='copy-action btn btn-success btn-xs'><i class="fa fa-files-o fa-lg"></i> ${userContext.localeMap['@copy']} </a>

				</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>	
	

</div></c:if>


