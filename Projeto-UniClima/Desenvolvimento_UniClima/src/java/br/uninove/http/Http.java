package br.uninove.http;

import br.uninove.clima.Clima;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class Http {

    public static Clima getClima(String cidade) {
        try {

            //monta a url com seus respectivos parâmetros
            String charset = StandardCharsets.UTF_8.name();
            String apiurl = "http://api.openweathermap.org/data/2.5/weather?";
            String appid = ""; //SUA chave de API
            String units = "materic";
            String lang = "pt_br";

            String query = String.format("q=%s&appid=%s&units=%s&lang=%s",
                    URLEncoder.encode(cidade, charset),
                    appid,
                    units,
                    lang);

            //monta a url como objeto:
            URL url = new URL(apiurl + query);
            
            //abre a conexão:
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept-Charset", charset);

            //Cria uma instância de clima...:
            Clima clima;

            if (conn.getResponseCode() == 200) {
                //Vamos inicar o processo de obtenção do JSON...
                try ( InputStream resposta = conn.getInputStream()) {
                    int i = 0;
                }
            }
            
            return null;

        } catch (Exception ex) {
            return null;
        }
    }
}
