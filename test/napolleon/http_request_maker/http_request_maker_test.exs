defmodule Napolleon.HTTPRequestMakerTest do
  import Mox
  use ExUnit.Case

  setup do
    Application.put_env(:napolleon, :http_client, Napolleon.MockHTTPoison)
  end

  test "Simple GET request" do
    Napolleon.MockHTTPoison
    |> expect(:get, fn _url ->
      {:ok,
       %{
         status_code: 200
       }}
    end)

    payload_input = %{
      :method => "get",
      :url => "example.com"
    }

    {:ok, response} = Napolleon.HTTPRequestMaker.make_request_closure(from: payload_input).()

    assert response.status_code == 200
  end
end
