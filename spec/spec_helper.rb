require 'coveralls'

Coveralls.wear! do
  track_files '**/*.pp'
  add_filter '/spec/fixtures'
end

require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|
  c.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end



