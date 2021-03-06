Feature: collapse
  As a CSL cite processor hacker
  I want the test collapse_NumericDuplicate to pass

  @citation @collapse @citations
  Scenario: Numeric Duplicate
    Given the following style:
    """
    <style 
          xmlns="http://purl.org/net/xbiblio/csl"
          class="numeric"
          version="1.0">
      <info>
        <id />
        <title />
        <updated>2009-08-10T04:49:00+09:00</updated>
      </info>
      <citation collapse="citation-number">
        <sort>
          <key variable="citation-number"/>
        </sort>
        <layout prefix="(" suffix=")" delimiter=",">
          <text variable="citation-number"/>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","title":"Book One","type":"book"},{"id":"ITEM-2","title":"Book Two","type":"book"},{"id":"ITEM-3","title":"Book Three","type":"book"},{"id":"ITEM-4","title":"Book Four","type":"book"}]
    """
    And I have a citations input
    When I cite all items
    Then the result should be:
    """
    >>[0] (1,2,2–4)
    """
