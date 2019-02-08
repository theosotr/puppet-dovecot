# First line of spec/spec_helper.rb
require 'puppetlabs_spec_helper/module_spec_helper'
require 'coveralls'

RSpec.configure do |c|
  c.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end

Coveralls.wear! do
  add_filter '/sepc/fixtures/modules/stdlib/'
end


