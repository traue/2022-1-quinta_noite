<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="br.uninove.http.Http"%>
<%@page import="br.uninove.clima.Clima"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    String formato = "metric";

    if (request.getParameter("formato") != null) {
        formato = request.getParameter("formato");
    }
    
    Clima clima = null;
    String cidade = "";
    if (request.getParameter("cidade") != null) {
        cidade = request.getParameter("cidade");
        clima = Http.getClima(cidade, formato);
    }

    //SOBRE O UTC...
//    long unixSeconds = clima.getSys().getSunrise();
//// convert seconds to milliseconds
//    Date date = new java.util.Date(unixSeconds * 1000L);
//// the format of your date
//    SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss z");
//// give a timezone reference for formatting (see comment at the bottom)
//    //sdf.setTimeZone(java.util.TimeZone.getTimeZone("GMT-4"));
//    String formattedDate = sdf.format(date);
//    out.println(formattedDate);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UniClima</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <style>
            .clima-card {
                padding-top: 40px;
                width: 350px;
                margin: 0 auto;
            }

            .meucard {
                background-color: rgb(190, 201, 247);
            }

        </style>
    </head>
    <body>
        <!--menu (navbar): -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href=".">UniClima</a>
                <form class="d-flex" method="post">
                    <input class="form-control me-2" name="cidade" value="<%=cidade%>" type="search" placeholder="Nome da cidade" aria-label="Search">
                    <button class="btn btn-outline-info" type="submit">Buscar</button>
                </form>
            </div>
        </nav>

        <!--card do clima-->
        <% if (clima != null) {%>
        <div class="container">
            <div class="row">
                <div class="clima-card">
                    <div class="card">
                        <div class="card-body meucard">
                            <div class="text-center">
                                <img src="https://openweathermap.org/img/wn/<%=clima.getWeather().get(0).getIcon()%>@2x.png"> 
                                <h2><%= String.format("%.1f", clima.getMain().getTemp())%>ºC</h2>
                                <div class="text-capitalize"><h3><%= clima.getWeather().get(0).getDescription()%></h3></div>
                                <h5>Cidade: <%= clima.getName() + ", " + clima.getSys().getCountry()%></h5>
                            </div>
                            <hr>
                            <div class="accordion text-center" id="accordionExample">
                                <button class="btn btn-dark" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    Mostrar detalhes
                                </button>
                            </div>
                            <div id="collapseOne" class="collapse pt-4" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <p><strong>Sensação térmica: </strong><%= clima.getMain().getFeelsLike()%> ºC</p>
                                <p><strong>Mínima: </strong><%= clima.getMain().getTempMin()%> ºC</p>
                                <p><strong>Máxima </strong><%= clima.getMain().getTempMax()%> ºC</p>
                                <p><strong>Umidade relativa do ar: </strong><%= clima.getMain().getHumidity()%>%</p>
                                <p><strong>Pressão atmosférica: </strong><%= clima.getMain().getPressure()%>hPa</p>
                                <p><strong>Visibilidade: </strong><%= clima.getVisibility()%>Km</p>
                                <p><strong>Direção do vento: </strong><%= clima.getWind().getDeg()%>º</p>
                                <p><strong>Velocidade do vento: </strong><%= clima.getWind().getSpeed()%>m/s</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% }%>

    </body>
</html>