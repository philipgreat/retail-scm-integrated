
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>


<c:if test="${not empty goodsSupplier}">
<div class="col-xs-12 col-md-4 section">
	<b title="A GoodsSupplier">${userContext.localeMap['goods_supplier']} </b><a href="#"><i class="fa fa-refresh" aria-hidden="true"></i></a>
	<hr/>
	<ul>
	
	
	<li><span>ID</span><a class="link-action-removed" href="./goodsSupplierManager/loadGoodsSupplierDetail/${goodsSupplier.id}/"> ${goodsSupplier.id}</a></li>
<li><span>${userContext.localeMap['goods_supplier.name']}</span> ${goodsSupplier.name}</li>
<li><span>${userContext.localeMap['goods_supplier.supply_product']}</span> ${goodsSupplier.supplyProduct}</li>
<li><span>${userContext.localeMap['goods_supplier.contact_number']}</span> ${goodsSupplier.maskedContactNumber}</li>
<li><span>${userContext.localeMap['goods_supplier.description']}</span> ${goodsSupplier.description}</li>

	
	</ul>
	
	
	
</div>

</c:if>




