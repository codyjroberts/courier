defmodule Courier.Adapters.Logger do
  require Logger

  @behaviour Courier.Adapter

  @moduledoc """
  Logger adapter

  Will write deliver all messages to the `Logger`. All attachment encoded data will 
  rener as `[File content]`

  Options:
  - `level` the `Logger` level to send the message to (defaults to `:info`)
  """

  @doc false
  def init(_), do: nil

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
