<%@page import="br.uninove.http.Http"%>
<%@page import="br.uninove.clima.Clima"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    Clima clima = null;
    String cidade = "";
    if(request.getParameter("cidade") != null) {
        cidade = request.getParameter("cidade");
        clima = Http.getClima(cidade);
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UniClima</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            .clima-card {
                padding-top: 100px;
                width: 350px;
                margin: 0 auto;
            }
        </style>
    </head>
    <body>
        <!--menu (navbar): -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href=".">UniClima</a>
                <form class="d-flex" method="post">
                    <input class="form-control me-2" name="cidade" type="search" placeholder="Nome da cidade" aria-label="Search">
                    <button class="btn btn-outline-info" type="submit">Buscar</button>
                </form>
            </div>
        </nav>
        
        <!--card do clima-->
        <% if(clima != null) { %>
        <div class="container">
            <div class="row">
                <div class="clima-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">
                                <img src="https://openweathermap.org/img/wn/<%=clima.getWeather().get(0).getIcon()%>@2x.png"> 
                                <h2><%= clima.getMain().getTemp() %>ºC</h2>
                                <!--  paramos aqui-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
         
    </body>
</html>