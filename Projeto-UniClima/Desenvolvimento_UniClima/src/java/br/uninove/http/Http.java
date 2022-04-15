package br.uninove.http;

import br.uninove.clima.Clima;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class Http {

    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) (cp));
        }
        return sb.toString();
    }

    public static Clima getClima(String cidade) {
        try {

            //monta a url com seus respectivos parâmetros
            String charset = StandardCharsets.UTF_8.name();
            String apiurl = "http://api.openweathermap.org/data/2.5/weather?";
            String appid = ""; //SUA chave de API
            String units = "metric";
            String lang = "pt_br";

            String query = String.format("q=%s&appid=%s&units=%s&lang=%s",
                    URLEncoder.encode(cidade, charset),
                    appid,
                    units,
                    lang);

            //monta a url como objeto:
            URL url = new URL(apiurl + query);

            //abre a conexão:
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept-Charset", charset);

            //Cria uma instância de clima...:
            Clima clima;

            if (conn.getResponseCode() == 200) {
                //Vamos inicar o processo de obtenção do JSON...
                try ( InputStream resposta = conn.getInputStream()) {
                    BufferedReader buffer
                            = new BufferedReader(new InputStreamReader(resposta, charset));
                    //finalmente temos o json na mão...:
                    String json = readAll(buffer);

                    //precisamos o serializar para objetos do "Clima"
                    Gson gson = new Gson();
                    clima = gson.fromJson(json, Clima.class);
                    return clima;
                }
            }

            return null;

        } catch (Exception ex) {
            return null;
        }
    }
}
