<%--
  Created by IntelliJ IDEA.
  User: mili1
  Date: 12/09/2021
  Time: 16:13
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
    <g:if test="${getLogin.size() == 0}">
        <div class="text-center" style="padding-top: 100px; padding-left: 20px;">
            Oup's, il semblerait qu'il n'y est rien d'intéressant ici .. on fait marche arrière ?
        </div>
    </g:if>
    <g:else>
        ok
    </g:else>
</body>
</html>