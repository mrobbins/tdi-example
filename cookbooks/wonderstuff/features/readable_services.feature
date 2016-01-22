Feature: Potential Customer can read about services

in order to generate more leads for my business
As a business owner
I want web users to be able to read about my services.

Background:
  Given I have provisioned the following infrastructure:
  | Server Name | Operating System | Version | Chef Version | Run List              |
  | wonderstuff | ubuntu           | 12.04   | 12.6.0       | wonderstuff::default  |
  And I have run Chef

Scenario: user visits home page
  Given a URL  "http://wonderstuff.net"
  When a web user browses to the URL
  Then the user should see "Wonderstuff Design"
