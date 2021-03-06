
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>


<c:if test="${not empty accountingDocumentCreation}">

<div class="col-xs-12 col-md-3 action-section" >
	<b title="A AccountingDocumentCreation" style="color: green">${userContext.localeMap['accounting_document_creation']}</b>
	<hr/>
	<ul>
	
	
	<li><span>${userContext.localeMap['accounting_document_creation.id']}</span> ${accountingDocumentCreation.id}</li>
<li><span>${userContext.localeMap['accounting_document_creation.who']}</span> ${accountingDocumentCreation.who}</li>
<li><span>${userContext.localeMap['accounting_document_creation.comments']}</span> ${accountingDocumentCreation.comments}</li>
<li><span>${userContext.localeMap['accounting_document_creation.make_date']}</span> <fmt:formatDate pattern="yyyy-MM-dd" value="${accountingDocumentCreation.makeDate}" /></li>

	
	</ul>
</div>



</c:if>


