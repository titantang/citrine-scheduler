<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>Task Edit</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
  </head>
  <body>
    <div class="container">
    <form:form commandName="taskDTO" method="POST" action="task_edit.do" cssClass="form-horizontal">
      <form:hidden path="selectedGroupName"/>
      <form:hidden path="task.id"/>
      <form:hidden path="task.version"/>
      <div class="control-group">
        <label class="control-label">* Name:</label>
        <div class="controls">
          <form:input cssClass="input-xlarge" path="task.name" size="30"/><span class="help-inline"><form:errors path="task.name" /></span>
        </div>
      </div>
      <div class="control-group">
        <label>Description:</label>
        <div class="controls">
          <form:textarea cssClass="input-xlarge" path="task.description" rows="5" cols="80"/>
        </div>
      </div>
      <div class="control-group">
        <label>Timer Schedule<span class="reference"><a href="http://www.opensymphony.com/quartz/wikidocs/CronTriggers Tutorial.html" target="_blank">[?]</a></span>:</label>
        <div class="controls">
          <form:input cssClass="input-xlarge" path="task.timerSchedule"/><span class="help-inline"><form:errors path="task.timerSchedule" /></span>
        </div>
      </div>
      <div class="control-group">
        <label>Command:</label>
        <div class="controls">
          <form:input cssClass="input-xlarge" path="task.command" size="80"/>
        </div>
      </div>
      <div class="control-group">
        <label>Bean name:</label>
        <div class="controls">
          <form:select cssClass="input-xlarge" path="task.beanName">
            <form:options items="${jobBeans}"/>
          </form:select>
        </div>
      </div>
      <div class="control-group">
        <label>Priority:</label>
        <div class="controls">
          <form:input cssClass="input-xlarge" path="task.priority"/><span class="help-inline"><form:errors path="task.priority" /></span>
        </div>
      </div>
      <div class="control-group">
        <label>* Group Name:</label>
        <div class="controls">
          <form:input cssClass="input-xlarge" path="task.groupName"/><span class="help-inline"><form:errors path="task.groupName" /></span>
        </div>
      </div>
      <div class="control-group">
        <label>Enabled:</label>
        <div class="controls">
          <form:checkbox path="task.enabled"/><span class="help-inline"><form:checkbox path="task.stopOnError"/></span>
        </div>
      </div>
      <div class="control-group">
        <label>Stop On Error:</label>
        <div class="controls">
          <form:checkbox path="task.stopOnError"/>
        </div>
      </div>
      <div class="control-group">
        <label>Error If Running:</label>
        <div class="controls">
          <form:checkbox path="task.errorIfRunning"/>
        </div>
      </div>
      <div class="control-group">
        <label>Notification Recipients:</label>
        <div class="controls">
          <form:input cssClass="input-xlarge" path="task.notification.recipients" size="80"/><br/> 
            (comma-separated list of e-mail addresses)
        </div>
      </div>
      <div class="control-group">
        <label>Notify on success:</label>
        <div class="controls">
          <form:checkbox path="task.notification.notifyOnSuccess"/>
        </div>
      </div>
      <div class="control-group">
        <label>Notify on failure:</label>
        <div class="controls">
          <form:checkbox path="task.notification.notifyOnFailure"/>
        </div>
      </div>
      <div class="form-actions">
        <c:if test="${not empty taskDTO.task.id && taskDTO.task.id != 0}">
          <a class="btn" href="task_children.do?taskId=${taskDTO.task.id}&selectedGroupName=${selectedGroupName}">Manage child tasks</a>
        </c:if>
        <input class="btn btn-primary" type="submit" value="Save" name="update"/>
         <c:if test="${not empty taskDTO.task.id && taskDTO.task.id != 0}">
           <input class="btn btn-danger" type="submit" value="Delete" name="delete" onClick="return confirm('Are you sure you want to delete this task?')"/>
         </c:if>
         <input class="btn" type="submit" value="Cancel" name="cancel"/>
      </div>
    </form:form>
    </div>
  </body>
</html>