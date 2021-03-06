defmodule Hermes.Message do
  defstruct from: "", to: [], subject: "", body: "", sent_on: Chronos.now

  def format(message) do
    %{ message | body: """
    To: #{message.to}
    From: #{message.from}
    MIME-Version: 1.0
    Content-type: "text/html"
    Content-Transfer-Encoding: base64
    Subject: #{message.subject}
    Date: #{message.sent_on |> Chronos.Formatter.strftime("%b %0d, %Y %H:%M:%S")}

    #{message.body}
    """ }
  end
end
