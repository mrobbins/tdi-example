Feature: web page serves page

An Ubuntu Server will be provisioned and will serve a basic web page to show the power of cucumber, Leibnitz,kitchen and Chef.

Background:
  Given I have provisioned the following infrastructure:
  | Server Name     | Operating System    | Version   | Chef Version   | Run List                       |
  |  chefanatic     | ubuntu              | 12.04     | 12.6.0         | chefanatic::default            |
  And I have ran Chef

Scenario:
  Given a URL "http://chefanatic.com"
  When you browse to the URL
  Then  you should see "Chefanatic"
