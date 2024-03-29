<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>TaskRuns</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <script src="javascript/generic.js" language="JavaScript"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <meta http-equiv="refresh" content="10" />
  </head>
  <body>
    <h2>TaskRuns for ${taskName}</h2>
    <table class="table table-striped">
      <tr>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Status</th>
        <th>SysOut</th>
        <th>SysErr</th>
        <th>Stack</th>
        <th>Log</th>
        <th>Actions</th>
      </tr>
      <c:forEach var="taskRun" items="${taskRuns}">
        <tr class="${taskRun.status}">
          <td>${taskRun.startDate}</td>
          <td>${taskRun.endDate}</td>
          <td>${taskRun.status}</td>
          <td>
            <c:if test="${not empty taskRun.sysOut}"> <a
                href="javascript:showPopup('display.do?action=displaySysOut&taskRunId=${taskRun.id}','sysout',800,600)">
              SysOut</a>
            </c:if>
          </td>
          <td>
            <c:if test="${not empty taskRun.sysErr}"> <a
                href="javascript:showPopup('display.do?action=displaySysErr&taskRunId=${taskRun.id}','syserr',800,600)">
              SysErr</a>
            </c:if>
          </td>
          <td>
            <c:if test="${not empty taskRun.stackTrace}"> <a
                href="javascript:showPopup('display.do?action=displayStack&taskRunId=${taskRun.id}','stack',800,600)">
              StackTrace</a>
            </c:if>
          </td>
          <td>
            <c:if test="${'raw' eq taskRunLogs[taskRun.id]}"> <a href="logs/${taskRun.id}.log">Log</a>
            </c:if>
            <c:if test="${'display' eq taskRunLogs[taskRun.id]}"> <a
                href="logs.do?action=display&taskId=${taskId}&logFile=${taskRun.id}.log&selectedGroupName=${selectedGroupName}">Log</a>
            </c:if>
          </td>
          <td>
             <c:choose>
              <c:when test='${"RUNNING" == taskRun.status}'> <a
                  href="task_runs.do?action=stop&taskId=${taskRun.taskId}&taskRunId=${taskRun.id}&page=${page}&selectedGroupName=${selectedGroupName}">Stop</a></a>
              </c:when>
              <c:otherwise>
                <a class="btn btn-danger" href="task_runs.do?action=delete&taskId=${taskRun.taskId}&taskRunId=${taskRun.id}&page=${page}&selectedGroupName=${selectedGroupName}">Delete</a> 
              </c:otherwise>
            </c:choose>
          </td>
        </tr>
      </c:forEach>
    </table>
    <c:choose>
      <c:when test="${page!=0}"> 
        <a href="task_runs.do?action=list&taskId=${taskId}&page=${page-1}&selectedGroupName=${selectedGroupName}">Previous</a>
      </c:when>
      <c:otherwise>Previous</c:otherwise>
    </c:choose> |
    <c:choose>
      <c:when test="${true eq morepages}"> 
        <a href="task_runs.do?action=list&taskId=${taskId}&page=${page+1}&selectedGroupName=${selectedGroupName}">Next</a>
      </c:when>
      <c:otherwise>Next</c:otherwise>
    </c:choose>
    <br/>
    <br/>
    <a href="tasks.do?selectedGroupName=${selectedGroupName}">&lt; Tasks</a> </body>
</html>