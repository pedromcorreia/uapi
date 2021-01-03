defmodule UapiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :uapi,
    module: UapiWeb.Auth.Guardian,
    error_handler: UapiWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
