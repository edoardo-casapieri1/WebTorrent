package com.example.ErlTorrent;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.*;

public class HttpConnection {

    public HttpConnection() throws IOException {}

    public JSONObject make_GET_request(String filename, String tracker_addr_port, String token) throws IOException, ParseException {
        URL url_GET_users = new URL("http://" + tracker_addr_port + "/1/users?filename=" + filename);
        HttpURLConnection conn_GET = (HttpURLConnection) url_GET_users.openConnection();
        String bearer = "Bearer " + token;
        conn_GET.setRequestProperty("Authorization", bearer);
        BufferedReader read = new BufferedReader(new InputStreamReader(conn_GET.getInputStream()));
        int code = conn_GET.getResponseCode();
        //System.out.println(code);
        String line = read.readLine();
        String html = "";
        while(line!=null) {
            html += line;
            line = read.readLine();
        }
        //System.out.println(html);
        JSONParser parser = new JSONParser();
        JSONObject json = (JSONObject) parser.parse(html);
        return json;
    }

    public void make_POST_request(PeerAdmin admin, String tracker_addr_port, String token) throws IOException {
        URL url_POST_users = new URL("http://" + tracker_addr_port + "/1/users");
        HttpURLConnection connection = (HttpURLConnection) url_POST_users.openConnection();
        String bearer = "Bearer " + token;
        connection.setRequestProperty("Authorization", bearer);
        String message;
        JSONObject json = new JSONObject();
        json.put("pid", admin.myConfig.peerId.toString());
        json.put("address", admin.myConfig.peerAddress.toString());
        json.put("port", Integer.toString(admin.myConfig.peerPort));
        json.put("filename", admin.commonConfig.FileName.toString());
        /*
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("id", 0);
        jsonObj.put("name", "testName");
        json.put("test2", jsonObj);
        */
        message = json.toString();
        System.out.println(message);
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setDoOutput(true);   //abilita la scrittura
        connection.setRequestMethod("POST");
        OutputStreamWriter wr = new OutputStreamWriter(connection.getOutputStream());
        wr.write(message);//scrittura del content
        wr.flush();
        int code = connection.getResponseCode();
        System.out.println(code);
        BufferedReader read = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String line = read.readLine();
        String html = "";
        while(line!=null) {
            html += line;
            line = read.readLine();
        }
        System.out.println(html);

    }

    /*public static void main(String[] args) throws IOException, ParseException {
        HttpConnection conn = new HttpConnection();
        conn.make_POST_request();
    }
    */
}