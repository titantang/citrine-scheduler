<%@ include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>TaskEdit - Manage Children</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <link rel="stylesheet" href="css/generic.css" type="text/css"/>
  </head>
  <body>
    <form:form commandName="taskChildDTO" method="POST" action="task_children.do">
      <form:errors path="*"/>
      <form:hidden path="task.id"/>
      <form:hidden path="selectedGroupName"/>
      <table>
        <tr>
          <td align="right" valign="top">Children:</td>
          <td>
            <form:checkboxes path="childTaskIds" items="${childTasks}" itemValue="id" itemLabel="name" delimiter="<br/>"/>
          </td>
        </tr>
        <tr>
          <td align="right" valign="top">Available:</td>
          <td>
            <form:checkboxes path="candidateChildTaskIds" items="${candidateChildTasks}" itemValue="id" itemLabel="name" delimiter="<br/>"/>
          </td>
        </tr>
        <tr>
          <td/>
          <td align="right">
            <input type="submit" value="Update" name="update"/>
            <input type="submit" value="Cancel" name="cancel"/>
          </td>
        </tr>
      </table>
    </form:form>
  </body>
</html>