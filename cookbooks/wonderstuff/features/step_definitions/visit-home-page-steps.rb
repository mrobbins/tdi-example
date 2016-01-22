require 'leibniz'
require 'faraday'

Given(/^I have provisioned the following infrastructure:$/) do |table|
  @infrastructure = Leibniz.build(table)
end

Given(/^I have run Chef$/) do 
  @infrastructure.destroy
  @infrastructure.converge
end

Given(/^a URL  "(.*?)"$/) do |url|
  @host_header = url.split('/').last
end

When(/^a web user browses to the URL$/) do 
  connection = Faraday.new(url: "http://#{@infrastructure['wonderstuff'].ip}", headers: { 'Host' => @host_header}) do |faraday|
   faraday.adapter Faraday.default_adapter
  end
  @page = connection.get('/').body
end

Then(/^the user should see "(.*?)"$/) do |arg1|
  expect(@page).to match /#{arg1}/
end
