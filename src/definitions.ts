

export interface WifiConnectPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;

  connect(options: {
      ssid: string;
      passphrase: string;
      saveNetwork: boolean;
      isWep: boolean;
  }): Promise<ConnectionState>
}

export enum ConnectionStateValue {
  Success = 0,
  Denied = -1,
  NoConnection = -2,
  UnknownSSID = -3,
  CannotConnect = -4
}

export interface ConnectionState {
  value: ConnectionStateValue
}