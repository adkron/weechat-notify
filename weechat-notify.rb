class Notify
  include Weechat

  def notify_msg( data, buffer, date, tags, visible, highlight, prefix, message )
    if highlight.to_i != 0
      TerminalNotifier.execute(verbose = false, message: message, title: "WeeChat")
    end
    return WEECHAT_RC_OK
  end
end

def weechat_init
  require "terminal-notifier"

  Weechat::register *["weechat-notify", "Amos King", "0.1", "MIT", "Notify OSX Message Center", "", ""]
  Weechat.hook_print( '', '', '', 1, 'notify_msg', '' )
  TerminalNotifier.execute(verbose = false, message: "Loaded Weechat Notify")
  return Weechat::WEECHAT_RC_OK
end

def notify_msg(*args)
  Notify.new.notify_msg *args
end
