Feature: name
  As a CSL cite processor hacker
  I want the test name_TwoRolesSameRenderingSeparateRoleLabels to pass

  @citation @name
  Scenario: Two Roles Same Rendering Separate Role Labels
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
      <locale xml:lang="en">
        <terms>
          <term form="short" name="editortranslator"></term>
        </terms>
      </locale>
      <citation 
             et-al-min="3"
             et-al-use-first="1">
        <layout delimiter="; ">
          <names delimiter=", " variable="editor translator">
            <name delimiter=", " />
            <label form="short" prefix=" (" suffix=".)" />
          </names>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"editor":[{"family":"Asthma","given":"Albert"},{"family":"Bronchitis","given":"Bosworth"},{"family":"Cold","given":"Crispin"}],"id":"editor-translator-2","issued":{"date-parts":[["1990"]]},"title":"Book One","translator":[{"family":"Asthma","given":"Albert"},{"family":"Bronchitis","given":"Bosworth"},{"family":"Cold","given":"Constantine"}],"type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Albert Asthma et al. (eds.), Albert Asthma et al. (trans.)
    """
