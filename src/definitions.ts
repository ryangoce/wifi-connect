export interface WifiConnectPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
