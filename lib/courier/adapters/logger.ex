defmodule Courier.Adapters.Logger do
  require Logger

  @moduledoc """
  Logger adapter
  """

  @doc """
  Delivers the mssage to the Logger

  Based upon the `level` set in the application configuration. Otherwise
  defaults to `:info`. Uses `Courier.Renderers.Logger` to render the message.
  """
  def deliver(%Mail.Message{} = message, config) do
    rendered_message = Mail.render(message, Courier.Renderers.Logger)
    Logger.log(config[:level] || :info, rendered_message)
  end
end