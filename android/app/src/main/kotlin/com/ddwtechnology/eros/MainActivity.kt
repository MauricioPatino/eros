package com.ddwtechnology.eros

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.google.firebase.analytics.FirebaseAnalytics

class MainActivity: FlutterActivity() {
    private lateinit var analysis: FirebaseAnalytics

//    analytics = FireBaseAnalytics.getInstance(this)
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
