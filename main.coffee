Email = require('email').Email

class Mailer
  constructor : (params) ->
    @file = params.filename
    @from = params.from
    @to = params.to
    console.log "Started Mailer!"

  receiver : (changes) =>
    console.log 'Processing changes', changes
    msg = new Email
      from: @from
      to: @to
      subject: """File "#{@file}" has been modified"""
      body: """File "#{@file}" has been modified.
The changes are:
#{JSON.stringify changes}
"""
    msg.send (err) ->
      console.log 'ERROR:', err if err
    console.log 'Finished!'


module.exports = Mailer
