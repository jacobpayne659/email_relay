require "action_mailbox/engine"
class ApplicationMailbox < ActionMailbox::Base
  routing /.*/ => :email_group
end
