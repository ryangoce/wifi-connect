package com.ryangoce.wifi;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "WifiConnect")
public class WifiConnectPlugin extends Plugin {

    private WifiConnect implementation = new WifiConnect();

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    @PluginMethod
    public void connect(PluginCall call) {
        // TODO: use android framework to connect
        String ssid = call.getString("ssid");
        String passphrase = call.getString("passphrase");

        JSObject ret = new JSObject();
        ret.put("ssid", implementation.echo(ssid));
        ret.put("passphrase", implementation.echo(passphrase));
        call.resolve(ret);
    }
}
