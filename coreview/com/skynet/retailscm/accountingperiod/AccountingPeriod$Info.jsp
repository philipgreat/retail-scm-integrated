
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>


<c:if test="${not empty accountingPeriod}">
<div class="col-xs-12 col-md-4 section">
	<b title="A AccountingPeriod">${userContext.localeMap['accounting_period']} </b><a href="#"><i class="fa fa-refresh" aria-hidden="true"></i></a>
	<hr/>
	<ul>
	
	
	<li><span>ID</span><a class="link-action-removed" href="./accountingPeriodManager/loadAccountingPeriodDetail/${accountingPeriod.id}/"> ${accountingPeriod.id}</a></li>
<li><span>${userContext.localeMap['accounting_period.name']}</span> ${accountingPeriod.name}</li>
<li><span>${userContext.localeMap['accounting_period.start_date']}</span> <fmt:formatDate pattern="yyyy-MM-dd" value="${accountingPeriod.startDate}" /></li>
<li><span>${userContext.localeMap['accounting_period.end_date']}</span> <fmt:formatDate pattern="yyyy-MM-dd" value="${accountingPeriod.endDate}" /></li>

	
	</ul>
	
	
	
</div>

</c:if>




