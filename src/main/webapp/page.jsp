<%@ page import="java.util.List" %>
<%@ page import="Point.PointInArea" %>
<%--
  Created by IntelliJ IDEA.
  User: Андрей
  Date: 19.09.2023
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Проверка попадания точки в область</title>
    <link rel="stylesheet" href="hat.css" type="text/css">
    <link rel="stylesheet" href="form.css" type="text/css">
    <link rel="stylesheet" href="table.css" type="text/css">
    <link rel="stylesheet" href="page_styles.css" type="text/css">
</head>
<%!
    public List<PointInArea> getPoints(HttpSession session) {
        List<PointInArea> o = (List<PointInArea>)session.getAttribute("points");
        return o;
    }
%>
<body>
    <header>
        <h1>Лабораторная работа по веб-программированию №2</h1>
        <p>Выполнил: Козодой Андрей P3216</p>
        <p>Вариант: 2621</p>
    </header>
    <canvas id="canvas" width="300" height="300"></canvas>
    <form id="form">
        <label for="x_buttons">Введите координату X<%if(request.getParameter("x")!=null){%><%="="+request.getParameter("x")%><%}%>:</label>
        <div id="x_buttons">
            <%for(int i = -4;i<=4;i++){%>
                <input type="button" value="<%=i%>"/>
            <%}%>
        </div>
        <input type="hidden" name="x" id="x" onkeyup='saveValue(this);'>
        <label for="y">Введите координату Y [-3 ... 5]:</label>
        <input type="text" id="y" name="y" onkeyup='saveValue(this);'>
        <label for="r">Введите координату R [1 ... 4]:</label>
        <input type="text" id="r" name="r" onkeyup='saveValue(this);'>
        <input type="button" id="check" value="Проверить" disabled/>
    </form>
    <table id="table">
        <thead>
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Попадание</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<PointInArea> o = getPoints(session);
            if(o != null){
                for(PointInArea i: o) {%>
                <tr>
                    <td><%=i.getX()%></td>
                    <td><%=i.getY()%></td>
                    <td><%=i.getR()%></td>
                    <td><%=i.isInArea()%></td>
                </tr>
                <%}
            } else {
            }
            %>
        </tbody>
    </table>
    <p id="errorMessage"></p>
    <script>
        <% if(session.getAttribute("exceptionMessage") != null){%>
            document.getElementById("errorMessage").innerHTML='<%=(String)session.getAttribute("exceptionMessage")%>';
        <%  session.removeAttribute("exceptionMessage");
        }%>
    </script>
    <script type="text/javascript" src="Validation.js"></script>
    <script type="text/javascript" src="data.js"></script>
    <script type="text/javascript" src="draw.js"></script>
    <script type="text/javascript" src="InteractiveElement.js"></script>
    <script>{
        let x = document.getElementById("form").elements.x;
        let y = document.getElementById("y");
        let r = document.getElementById("r");
        <%if (request.getParameter("x")!=null){%>
            x.value = <%=request.getParameter("x")%>;
            selectedX = <%=request.getParameter("x")%>;
        <%}
        if (request.getParameter("y")!=null){%>
            y.value = <%=request.getParameter("y")%>;
        <%}if (request.getParameter("r")!=null){%>
            r.value = <%=request.getParameter("r")%>;
        <%}%>
    }
    </script>
    <script>
        drawAxes();
        let context = document.getElementById("canvas").getContext('2d');
        let points = [];
        <%
        if(o != null)
            for(PointInArea p: o) { %>
                points.push([<%=p.getX()%>,<%=p.getY()%>] );
        <%
            }
        %>
        <%
        Float r = (Float) session.getAttribute("curR");
        if(r != null){
        %>
            drawPoints(points, <%=r.toString()%>)
        <%}%>
    </script>
</body>
</html>