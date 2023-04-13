import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(WifiConnectPlugin)
public class WifiConnectPlugin: CAPPlugin {
    private let implementation = WifiConnect()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func connect(_ call: CAPPluginCall) {
        let ssid = call.getString("ssid");
        let passphrase = call.getString("passphrase");
        let saveNetwork = call.getBool("saveNetwork") ?? false;
        let isWep = call.getBool("isWep") ?? false;
        if(ssid != nil && passphrase != nil) {
            implementation.connect(ssid: ssid!, passphrase: passphrase!, saveNetwork: saveNetwork, isWep: isWep, resolve: call.resolve, reject: call.reject);
        } else {
            call.reject("SSID and password are mandatory")
        }
    }

    @objc func getCurrentSSID(_ call: CAPPluginCall) {
        guard let ssid = implementation.getCurrentSSID() else {
            call.resolve()
            return
        }
        
        call.resolve([
            "name": ssid
        ])
    }
}
