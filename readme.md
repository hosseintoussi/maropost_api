[![Gem Version](https://badge.fury.io/rb/maropost_api.svg)](https://badge.fury.io/rb/maropost_api)

# MaropostApi

A simple ruby wrapper for Maropost (http://maropost.com/) API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'maropost_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install maropost_api

## Usage

And here are the methods available:

``` ruby
# Initialize a Client object with:
client = MaropostApi::Client.new(auth_token: '<TOKEN>', account_number: '<ID>')

# And use the client to perform available functionalities.

# To find a contact by email:
client.contacts.find_by_email(email: 'test@example.com')

# To add a contact to a list
client.contacts.add_to_list(list_ids: '<id>', params: {email: 'test@example.com'})

# To create a contact without any lists
client.contacts.create(params: {email: 'test@example.com'})

# To upsert a contact without any lists
client.contacts.upsert(params: {email: 'test@example.com'})

# To update a contact
client.contacts.update(contact_id: '<id>', params: {email: 'test@example.com', first_name: 'test-updated'})

# To unsubscribe a contact from all lists
client.contacts.unsubscribe_all_lists(email: 'test@example.com')

# To start a workflow for a contact
client.workflows.start(workflow_id: '<workflow_id>', contact_id: '<contact_id>')

# To stop a workflow for a contact
client.workflows.stop(workflow_id: '<workflow_id>', contact_id: '<contact_id>')

# To reset a workflow for a contact
client.workflows.reset(workflow_id: '<workflow_id>', contact_id: '<contact_id>')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hosseintoussi/maropost_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
