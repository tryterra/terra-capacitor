export interface TerraPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
