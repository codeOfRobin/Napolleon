defmodule Napolleon.HTTPBase do
  @callback get(url: String.t()) ::
              {:error, HTTPoison.Error.t()}
              | {:ok,
                 %{
                   :__struct__ => HTTPoison.AsyncResponse | HTTPoison.Response,
                   optional(:body) => any,
                   optional(:headers) => list,
                   optional(:id) => reference,
                   optional(:request) => HTTPoison.Request.t(),
                   optional(:request_url) => any,
                   optional(:status_code) => integer
                 }}
end

defmodule Napolleon.HTTPClient do
  @behaviour Napolleon.HTTPBase

  @impl Napolleon.HTTPBase
  def get(url: url) do
    Application.get_env(:napolleon, :http_client, HTTPoison).get(url)
  end
end
