<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>Log File</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <script src="javascript/generic.js" language="JavaScript"></script>
    <link rel="stylesheet" href="css/generic.css" type="text/css"/>
    <meta http-equiv="refresh" content="30" />
  </head>
  <body>
    <h2>Log File</h2>
    <pre>
${contents}  
    </pre>
    <c:choose>
      <c:when test='${taskId != null}'> 
        <a href="task_runs.do?taskId=${taskId}&selectedGroupName=${selectedGroupName}">&lt; Back</a>
      </c:when>
    <c:otherwise> <a href="logs.do">&lt; Back</a> </c:otherwise>
    </c:choose>
     
    </body>
</html>