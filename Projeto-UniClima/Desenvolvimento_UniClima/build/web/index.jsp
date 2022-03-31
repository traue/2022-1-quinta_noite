<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UniClima</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
<!--        explicar linha por linha...-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">UniClima</a>
                <form class="d-flex" method="post">
                    <input class="form-control me-2" name="cidade" type="search" placeholder="Nome da cidade" aria-label="Search">
                    <button class="btn btn-outline-info" type="submit">Buscar</button>
                </form>
            </div>
        </nav>
    </body>
</html>