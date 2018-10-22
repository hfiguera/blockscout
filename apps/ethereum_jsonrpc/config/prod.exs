use Mix.Config

config :logger, :ethereum_jsonrpc,
  level: :info,
  path: Path.absname("logs/prod/ethereum_jsonrpc.log"),
  rotate: %{max_bytes: 2_000_000_000, keep: 3}
