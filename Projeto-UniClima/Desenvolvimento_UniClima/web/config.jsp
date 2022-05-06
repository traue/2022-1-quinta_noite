<%@page import="br.uninove.util.Units"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String selectImperial = "";
    String selectMetric = "";

    if (session.getAttribute("units") != null) {
        if ((Units) session.getAttribute("units") == Units.metric) {
            selectMetric = "selected";
        } else {
            selectImperial = "selected";
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UniClima - Configurações</title>
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
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="./">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="config.jsp">Configurações</a>
                        </li>
                    </ul>
                </div>
        </nav>

        <div class="container">
            <div class="row">
                <div class="clima-card">
                    <div class="card">
                        <div class="card-body meucard text-center">
                            <form method="post" action="ConfigController">
                                <label>Unidade desejada: </label>
                                <div class="form-gourp">
                                    <select name="unidades">
                                        <option value="metric" <%=selectMetric%>>Métricas (padrão)</option>
                                        <option value="imperial"<%=selectImperial%>>Imperial</option>
                                    </select>
                                </div>
                                <button class="mt-3 btn btn-info" type="submit">Salvar Configurações</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
