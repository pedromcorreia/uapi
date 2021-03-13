defmodule UapiWeb.Router do
  use UapiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug UapiWeb.Auth.Pipeline
    plug Uapi.CurrentUser
  end

  scope "/api", UapiWeb do
    pipe_through :api
    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end

  scope "/api", UapiWeb do
    pipe_through [:api, :auth]
    get "/my_user", UserController, :show

    resources "/daily_nutritions", DailyNutritionController, except: [:new, :edit]

    resources "/stores", StoreController, except: [:new, :edit] do
      resources "/foods", FoodController, except: [:new, :edit]
    end

    resources "/order", OrdesController, except: [:new, :edit] do
      resources "/order_item", OrdeItensController, except: [:new, :edit]
    end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: UapiWeb.Telemetry
    end
  end
end
