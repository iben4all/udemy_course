package com.example.servertest;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import com.parse.Parse;
import android.app.Application;
import android.service.autofill.SaveCallback;
import android.util.Log;

import java.text.ParseException;


public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        // Add your initialization code here
        Parse.initialize(new Parse.Configuration.Builder(getApplicationContext())
                .applicationId("3ffe4745175102aa63c9dd1196e6c4969b473157")
                .clientKey("1b222f139865e1e0a33d1ac8e2daf007ad8055b1")
                .server("http://18.191.9.5:80/parse/")
                .build()
        );






    }
}
