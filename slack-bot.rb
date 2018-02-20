require 'slack-notifier'

slack_whk = "https://hooks.slack.com/services/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"
notifier = Slack::Notifier.new slack_whk
notifier.ping "Obrigada!!! Farei bom uso :D"