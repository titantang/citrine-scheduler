<%@ page language="java" isErrorPage="true" %>
<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<title>Doh!</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<link rel="stylesheet" href="css/generic.css" type="text/css" />
</head>
<body>
<h2>DOH!</h2>
<p>
An Error has occurred in this application:<br/><br/>
<b><i>${exception}</i></b>.
</p><p> 
Click <a href="index.html">here</a> to go back to the home page and try 
continue what you were doing. If this problem persists please contact your system administrator.  
</p>

<c:choose>
  <c:when test='${not empty exception}'>
  <hr/>
  <p class="code">
  ${exception.message}
  <c:forEach var="stackTraceElem" items="${exception.stackTrace}">
    <c:out value="${stackTraceElem}"/><br/>
  </c:forEach>
  </p>
  <hr/>
  </c:when>
  <c:otherwise>You can also check your log files for further information.</c:otherwise>
</c:choose>


</body>
</html>