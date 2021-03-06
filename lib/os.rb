module OS

  def self.platform_name
    os = ""

    case RUBY_PLATFORM
      when '/cygwin|mswin|mingw|bccwin|wince|emx/'
        os = "Windows"
      when '/darwin/'
        os = "Mac OS"
      else
        os = "Linux"
    end

    os
  end

  def self.interpret(command)
    responses = []

    if command.match(/^(?:show\s+)?(?:me\s+)?(?:my\s+)?OS(?:\s+name)?$/i)
      os = platform_name

      responses << {
        :command => "echo '#{os}'",
        :explanation => "Show what OS is used."
      }
    end

    responses
  end
end

$executors << OS
