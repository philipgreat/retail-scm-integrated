
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>


<c:if test="${not empty retailStoreOrderShippingGroup}">

<div class="col-xs-12 col-md-3 action-section" >
	<b title="A RetailStoreOrderShippingGroup" style="color: green">${userContext.localeMap['retail_store_order_shipping_group']}</b>
	<hr/>
	<ul>
	
	
	<li><span>${userContext.localeMap['retail_store_order_shipping_group.id']}</span> ${retailStoreOrderShippingGroup.id}</li>
<li><span>${userContext.localeMap['retail_store_order_shipping_group.name']}</span> ${retailStoreOrderShippingGroup.name}</li>
<li><span>${userContext.localeMap['retail_store_order_shipping_group.amount']}</span> <fmt:formatNumber type="currency"  value="${retailStoreOrderShippingGroup.amount}" /></li>

	
	</ul>
</div>



</c:if>


