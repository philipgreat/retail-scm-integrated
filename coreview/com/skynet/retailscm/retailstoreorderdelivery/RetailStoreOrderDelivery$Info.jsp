
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>


<c:if test="${not empty retailStoreOrderDelivery}">
<div class="col-xs-12 col-md-4 section">
	<b title="A RetailStoreOrderDelivery">${userContext.localeMap['retail_store_order_delivery']} </b><a href="#"><i class="fa fa-refresh" aria-hidden="true"></i></a>
	<hr/>
	<ul>
	
	
	<li><span>ID</span><a class="link-action-removed" href="./retailStoreOrderDeliveryManager/loadRetailStoreOrderDeliveryDetail/${retailStoreOrderDelivery.id}/"> ${retailStoreOrderDelivery.id}</a></li>
<li><span>${userContext.localeMap['retail_store_order_delivery.who']}</span> ${retailStoreOrderDelivery.who}</li>
<li><span>${userContext.localeMap['retail_store_order_delivery.delivery_time']}</span> <fmt:formatDate pattern="yyyy-MM-dd" value="${retailStoreOrderDelivery.deliveryTime}" /></li>

	
	</ul>
	
	
	
</div>

</c:if>




