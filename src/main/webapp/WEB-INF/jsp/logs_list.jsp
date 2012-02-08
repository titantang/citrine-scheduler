<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <title>Logs</title>
    <script src="javascript/generic.js" language="JavaScript"></script>
    <link rel="stylesheet" href="css/generic.css" type="text/css"/>
    <meta http-equiv="refresh" content="30">
  </head>
  <body>
    <h2>Logs</h2>
    <ul>
    <c:forEach var="logFile" items="${logFiles}">
    <li><a href="logs.do?action=display&logFile=${logFile}">${logFile}</a></li>  
    </c:forEach>
    </ul>
    <a href="index.html">&lt; Back</a> 
    </body>
</html>