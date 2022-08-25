package com.laoxu.game.common;/* GOOG支付接入示例代码 - JAVA版本 */
/* 更多信息请前往官网：https://www.gogozhifu.com */

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;
import org.springframework.http.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.net.ssl.SSLContext;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;

public class HttpUtils {
    private static class ResultData {
        int status;
        String result;

        public ResultData() {
            this.status = 400;
        }
    }

    public static String post(String uri, MultiValueMap params) {
        RestTemplate restTemplate = new RestTemplate();

        params.add("user", "你好");
        HttpHeaders headers = new HttpHeaders();
        // 以表单的方式提交
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        //将请求头部和参数合成一个请求
        HttpEntity requestBody = new HttpEntity(params, headers);

        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.POST, requestBody, String.class);

        return response.getBody();
    }


    /*public static int post(String url, String json, String APP_ID, String APP_SECRET) {
        ResultData rd = postIml(url, json, APP_ID,  APP_SECRET);
        return rd.status;
    }

    public static String goPost(String url, String json, String APP_ID, String APP_SECRET) {
        ResultData rd = postIml(url, json, APP_ID, APP_SECRET);
        return rd.result;
    }*/

    /*public static ResultData postIml(String url, String json, String APP_ID, String APP_SECRET) {
        ResultData rd = new ResultData();

        SSLContext sslContext = null;
        try {
            sslContext = SSLContexts.custom()
                    .loadTrustMaterial((chain, authType) -> true)
                    .build();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (KeyManagementException e) {
            e.printStackTrace();
        } catch (KeyStoreException e) {
            e.printStackTrace();
        }
        SSLConnectionSocketFactory sslSF = new SSLConnectionSocketFactory(
                sslContext,
                NoopHostnameVerifier.INSTANCE);
        PlainConnectionSocketFactory plainConnectionSocketFactory = new PlainConnectionSocketFactory();
        Registry<ConnectionSocketFactory> registry = RegistryBuilder.<ConnectionSocketFactory>create()
                .register("https", sslSF)
                .register("http", plainConnectionSocketFactory)
                .build();
        PoolingHttpClientConnectionManager connectionManager = new PoolingHttpClientConnectionManager(registry);
        CloseableHttpClient httpClient = HttpClients.custom()
                .setConnectionManager(connectionManager)
                .build();

        HttpPost post = new HttpPost();
        try {
            post.setHeader("Content-Type", "application/json;charset=UTF-8");
            post.setHeader("App-Id", APP_ID);
            post.setHeader("App-Sign", MD5Util.md5(APP_ID+APP_SECRET));
            post.setURI(new URI(url));

            if (null != json) {
                StringEntity requestEntity = new StringEntity(json,"utf-8");
                requestEntity.setContentEncoding("UTF-8");
                post.setEntity(requestEntity);
            }

            HttpResponse resp = httpClient.execute(post);

            int status = resp.getStatusLine().getStatusCode();
            rd.status = status;
            HttpEntity httpEntity = resp.getEntity();
            rd.result = EntityUtils.toString(httpEntity);

            httpClient.close();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return rd;
    }*/
}
