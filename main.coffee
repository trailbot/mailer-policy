Email = require('email').Email

class Mailer
  constructor : (params) ->
    @file = params.path
    @from = params.from
    @to = params.to
    console.log "Started Mailer!"

  receiver : (changes) =>
    msg = new Email
      from: @from
      to: @to
      subject: "File #{@file} has been modified"
      body: "File #{@file} has been modified.\nThe changes are:\n\n" + @format changes
    msg.send (err) ->
      console.log 'ERROR:', err if err

  format : (changes) ->
    string = ""
    aOffset = 0
    rOffset = 0
    for change in changes
      line = ""
      if change.type is 'ellipsis'
        line += "[#{change.size} omitted lines]\n"
      else if change.type is 'fill'
        for subLine, i in change.lines
          line += "#{change.start + i - rOffset}\t#{change.start + i - rOffset}\t= #{subLine}\n"
      else if change.type is 'add'
        for subLine, i in change.lines
          line += "\t#{change.start + i - rOffset}\t> #{subLine}\n"
        aOffset += change.lines.length
      else if change.type is 'rem'
        for subLine, i in change.lines
          line += "#{change.start + i - aOffset}\t\t< #{subLine}\n"
        rOffset += change.lines.length
      string += line
    string + "[EOF]\n"

module.exports = Mailer
