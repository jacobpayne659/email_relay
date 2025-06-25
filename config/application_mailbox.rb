class ApplicationMailbox < ActionMailbox::Base
  routing /\A.+@email\.com\z/i => :email_group
end
