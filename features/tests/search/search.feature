Feature: Search Feature

  @smoke @regression
  Scenario: Search successfully
    Given visit url
    When search "kloia" on search page
    Then verify search result contains searched keyword on search result page