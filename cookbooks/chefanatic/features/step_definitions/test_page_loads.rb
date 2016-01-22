require 'leibniz'
require 'faraday'

Given(/^I have provisioned the following infrastructure:$/) do |table|
  @infrastructure = Leibniz.build(table)
end

Given(/^I have ran Chef$/) do
  @infrastructure.destroy
  @infrastructure.converge
end

Given(/^a URL "([^"]*)"$/) do |url|
  @host_header = url.split('/').last
end

When(/^you browse to the URL$/) do
   connection = Faraday.new(url: "http://#{@infrastructure['chefanatic'].ip}", headers: { 'Host' => @host_header}) do |faraday|
   faraday.adapter Faraday.default_adapter
  end
  @page = connection.get('/').body
end

Then(/^you should see "([^"]*)"$/) do |arg1|
  expect(@page).to match /#{arg1}/
  @infrastructure.destroy
end
