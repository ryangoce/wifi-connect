import Foundation
import NetworkExtension
import SystemConfiguration.CaptiveNetwork

public typealias PluginResultData = [String: Any]

@objc public class WifiConnect: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
        
    private func _getSSID() -> String? {
        var ssid: String?
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                    break
                }
            }
        }
        return ssid;
    }

    @objc public func getCurrentSSID() -> String? {
        return self._getSSID()
    }
    
    @objc public func connect(ssid: String, passphrase: String, saveNetwork: Bool, isWep: Bool, resolve: @escaping (PluginResultData) -> Void, reject: @escaping (_ message: String, _ code: String? , _ error: Error? , _ data: PluginResultData? ) -> Void) -> Void {
            
         let config = NEHotspotConfiguration(ssid: ssid, passphrase: passphrase, isWEP: false)
        config.joinOnce = saveNetwork
        
        NEHotspotConfigurationManager.shared.apply(config) { [weak self] (error) in
            if let error = error as NSError? {
                switch(error.code) {
                case NEHotspotConfigurationError.alreadyAssociated.rawValue:
                    resolve(["value": 0]); // success
                    break
                case NEHotspotConfigurationError.userDenied.rawValue:
                    resolve(["value": -1]); // button deny
                    break
                default:
                    resolve(["value": -2]); // no connection
                    break
                }
                return
            }
            
            guard let this = self else {
                resolve(["value": -3]);
                return
            }
            
            if let currentSsid = this._getSSID(), currentSsid.hasPrefix(config.ssid){
                resolve(["value": 0]);
                return;
            }
            resolve(["value": -4]);
        }
    }
}
