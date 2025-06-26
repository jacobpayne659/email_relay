# EmailRelay

A simple Rails application that allows users to create email groups, send emails to those group addresses, and view those emails in the browser. Built using ActionMailbox, ActionMailer, and Rails 8.

---

## 🚀 Features

- Create email groups (e.g., `bookclub@email.com`)
- Add users to groups
- Send emails to the group email address
- View received emails on the group’s page
- Soft delete support for emails

---

## 🔧 Setup Instructions

### 1. Clone the repo

```
git clone https://github.com/jacobpayne659/email_relay.git
cd email_relay
```
### 2. Install dependencies
```
bundle install
```
### 3. Set up the database
```
bin/rails db:setup
```
### 4. Start the Rails server
```
bin/rails server
```

## Using the app

### 1. Create an email group

- With the server running, visit: http://localhost:3000
- Create a new Email Group (e.g., designers@email.com)
- Optionally, add users to the group

### 2. Send an email to the group

- visit http://localhost:3000/rails/conductor/action_mailbox/inbound_emails/new to send an email to the group
- ActionMailbox will say "delivered" but the app will only send the emails to existing email groups

### 3. View the email

- Visit the Email Group’s show page to see all emails delivered to that group.

## ✅ Running Tests

Run `rspec` to run the whole test suite

`rspec spec/models/email_spec.rb` to run an individual spec

## 🧑‍💻 Author
Jacob Payne
[GitHub](https://github.com/jacobpayne659)
