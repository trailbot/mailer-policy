# Email notifications Smart Policy for [Trailbot](https://trailbot.io)
This [Trailbot Smart Policy][1] sends email notifications every time your files or logs are modified.

__DISCLAIMER__

This policy uses [Sendmail][2] for email routing. Please make sure it is installed and properly configured in your server.

Sendmail is quite verbose and writes a lot of lines into system logs. In order to avoid loops, please __never__ use this policy with `/var/log/syslog` or `/var/log/mail`.

[1]: https://github.com/trailbot/client/wiki/Smart-Policies
[2]: https://en.wikipedia.org/wiki/Sendmail

## Parameters
This policy accepts the following parameters:

| Name   | Description                                                     | Default value | Required |
|--------|-----------------------------------------------------------------|---------------|------------|
| __sender__ | This email address will appear as sender. | _null_        | :white_check_mark:|
| __recipient__ | Recipient address. You can also send the email to multiple comma-separated recipients. | _null_        | :white_check_mark:|

