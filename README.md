# README

## Getting Started

1. Ensure you have ruby installed. This app was built on 1.27 but 1.26 should be fine.

2. Install Rails 6:
```
gem install rails
```

3. Bring the database up to speed by running:
```
rails db:migrate
```

4. Start the webserver:
```
rails s
```

**Note: it may ask you to run `yarn install --check-files`. This is normal.**

## Creating the first admin
The app isn't very useful without an intial admin account. You can create one using the following command:

```
rails visitday:invite_admin[myemail@server.com]
```

Note that the brackets are part of the command.

This will print out the invite email to the command line which includes the verification link. Navigating to that link will prompt for a new password and you'll be all set