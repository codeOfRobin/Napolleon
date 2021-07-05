defmodule Napolleon.HTTPRequestMaker do
  def make_request_closure(from: input) do
    %{url: url, method: method} = input

    case method do
      "get" -> fn -> Napolleon.HTTPClient.get(url: url) end
    end
  end
end
