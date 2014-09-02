# Ruby Client for the Transifex API

## Introduction

transifex-ruby is a Ruby client library for mechanically accessing Transifex via its API. It is intended to be simple and only provide a primitive interface to the API.

## Status

transifex-ruby is currently under development and should not be used for mission critical purposes at this stage.

## Installation

This gem is only available on GitHub at this time. Add the following line to your Gemfile if you wish to use it.

     gem 'transifex-ruby', git: 'git@github.com:tmaesaka/transifex-ruby.git'

## Quick Examples

### It all begins by requiring

```ruby
require 'transifex'
```

### Providing Credentials

For obvious reasons you must authenticate the user in order to use the API. There are two ways to setup the library with your Transifex credentials.

#### Method 1: Global Scope

```ruby
Transifex.configure do |config|
  config.username = 'banana'
  config.password = 'smoothy'
end
```

#### Method 2: Credentials per Transifex::Client object

This is the preferred way if your application is intended for multiple Transifex users. Object level credentials have greater precedence than the globally scoped ones shown in method 1.

```ruby
Transifex::Client.new(username: 'banana', password: 'smoothy')
```

### Retrieving a list of Projects that the user has access to

```ruby
transifex = Transifex::Client.new
transifex.projects # => Array of Transifex::Project objects
transifex.projects.each do |project|
  project.name
  project.slug
  project.description
end
```

### Retrieving a particular Project by its identifier (slug)

```ruby
slug = 'transifex'
transifex = Transifex::Client.new
transifex.project(slug) # => Transifex::Project object
```

### Retrieving the Resource(s) of a particular Project

```ruby
slug = 'transifex'
transifex = Transifex::Client.new
project = transifex.project(slug) # => Transifex::Project object
project.resources # => Array of Transifex::Resource objects
project.resources.each do |resource|
  resource.name
  resource.slug
  ...
end

```

### Retrieving a particular Resource of a Project by its identifier (slug)

```ruby
project_slug = 'ima_project'
resource_slug = 'ima_resource'
transifex = Transifex::Client.new
project = transifex.project(project_slug) # => Transifex::Project object
resource = project.resource(resource_slug) # => Transifex::Resource object
resource.translation(:en) # => English Translation (if exists)
resource.translation(:ja) # => Japanese Translation (if exists)
...
```

### Retrieving the Language(s) of a particular Project

```ruby
slug = 'transifex'
transifex = Transifex::Client.new
project = transifex.project(slug) # => Transifex::Project object
project.languages # => Array of Transifex::Language objects
project.languages.each do |language|
  language.language_code
  language.reviewers
  ...
end

```

## Caching

transifex-ruby won't do any read-through caching so your application is responsible for caching the results in order to avoid throwing wasteful HTTP requests. Response caching at the library level may be supported in the future but we're not too concerned about this right now.

## Thread Safety

The first version of transifex-ruby is naive in a way that Transifex::Resource and Transifex::Project objects will reuse the connection of the Transifex::Client object that had instantiated them. We will change this design if there's enough demand.

## Reaching Out

Please feel free to ping [@tmaesaka](http://twitter.com/tmaesaka) if you'd like to hit the author up or send me a message here on GitHub.
