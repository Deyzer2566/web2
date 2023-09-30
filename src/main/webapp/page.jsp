<%@ page import="java.util.List" %>
<%@ page import="Point.PointInArea" %>
<%--
  Created by IntelliJ IDEA.
  User: Андрей
  Date: 19.09.2023
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
        <label for="x">Введите координату X<%if(request.getParameter("x")!=null){%><%="="+request.getParameter("x")%><%}%>:</label>
        <div id="x">
            <%for(int i = -4;i<=4;i++){%>
                <input type="button" value="<%=i%>"/>
            <%}%>
        </div>
        <input type="hidden" name="x">
        <label for="y">Введите координату Y [-3 ... 5]:</label>
        <input type="text" id="y" name="y">
        <label for="r">Введите координату R [1 ... 4]:</label>
        <input type="text" id="r" name="r">
        <input type="button" id="check" value="Проверить" />
    </form>
    <table>
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
    <script>
        <% if(session.getAttribute("exceptionMessage") != null){%>
            alert('<%=(String)session.getAttribute("exceptionMessage")%>');
        <%  session.removeAttribute("exceptionMessage");
        }%>
    </script>
    <script type="text/javascript" src="Validation.js"></script>
    <script type="text/javascript" src="data.js"></script>
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
        let context = document.getElementById("canvas").getContext('2d');
        context.clearRect(0,0,300,300);
        context.fillStyle='rgb(51,153,255)';
        context.strokeStyle = 'rgba(0,0,0,0)';
        context.moveTo(50,150);
        context.lineTo(150,150);
        context.lineTo(150,200);
        context.fill();

        context.fillRect(150,150,-50,-100);

        context.beginPath();
        context.moveTo(150,150);
        context.fillStyle='rgb(51,153,255)';
        context.arc(150,150,100,3*Math.PI/2,2*Math.PI);
        context.lineTo(150,150);
        context.fill();

        context.beginPath();

        context.strokeStyle = 'rgba(0,0,0,1)';
        context.fillStyle='rgb(0,0,0)';

        context.moveTo(150,0);
        context.lineTo(145,10);
        context.moveTo(150,0);
        context.lineTo(155,10);

        context.font = "15px sans-serif";
        context.fillText('y',160,10);

        context.moveTo(150,0);
        context.lineTo(150,300);//ось y

        context.moveTo(300,150);
        context.lineTo(290,145);
        context.moveTo(300,150);
        context.lineTo(290,155);

        context.fillText('x',290,140);

        context.moveTo(0,150);
        context.lineTo(300,150);//ось x
        context.closePath();
        context.stroke();

        context.fillText("R/2",155,100);
        context.fillText("R/2",190,145);
        context.fillText("R/2",155,200);
        context.fillText("R/2",90,145);
        context.fillText("R",240,145);

        <% if(o != null){
            for(PointInArea p: o){
                String color;
                if(p.isInArea())
                    color="green";
                else color="red";
                float x = p.getX()/p.getR()*100+150;
                float y = 150 - p.getY()/p.getR()*100;
                %>
                context.beginPath();
                context.moveTo(<%=x%>,<%=y%>);
                context.arc(<%=x%>,<%=y%>,3,0,Math.PI*2);
                context.fillStyle="<%=color%>";
                context.fill();
        <%  }
        }%>
    </script>
</body>
</html>