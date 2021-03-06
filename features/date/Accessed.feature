Feature: date
  As a CSL cite processor hacker
  I want the test date_Accessed to pass

  @citation @date
  Scenario: Accessed
    Given the following style:
    """
    <style 
          xmlns="http://purl.org/net/xbiblio/csl"
          class="note"
          version="1.0">
      <info>
        <id />
        <title />
        <updated>2009-08-10T04:49:00+09:00</updated>
      </info>
      <citation>
        <layout>
          <date variable="accessed" date-parts="year-month-day" form="text"/>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"accessed":{"date-parts":[],"raw":"22 jan 1976"},"id":"ITEM-1","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    January 22, 1976
    """
