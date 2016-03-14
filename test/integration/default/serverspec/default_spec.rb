require 'spec_helper'

describe 'jruby_base::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'does something' do
    skip 'Replace this with meaningful tests'
    puts "============================="
  end

  it "is listening on port 8080" do
    expect(port(8080)).to be_listening
  end

  it "has a running service of tomcat-daemon" do
    expect(service("tomcat")).to be_running
  end
end
