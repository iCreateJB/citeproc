Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_Abnt to pass

  @citation @bugreports
  Scenario: Abnt
    Given the following style:
    """
    <style xmlns="http://purl.org/net/xbiblio/csl" version="1.0" class="in-text">
      <info>
        <title>Associação Brasileira de Normas Técnicas (ABNT)</title>
        <id>http://www.zotero.org/styles/abnt</id>
        <link href="http://www.zotero.org/styles/abnt" rel="self"/>
        <author>
          <name>Iuri Gavronski</name>
          <email>iuri at ufrgs dot br</email>
        </author>
        <contributor>
            <name>Eduardo Bettoni</name>
            <email>webtur @ ufpr dot br</email>
        </contributor>
        <contributor>
            <name>José Antonio Meira da Rocha</name>
            <email>joseantoniorocha@gmail.com</email>
            <uri>http://meiradarocha.jor.br</uri>
        </contributor>
        <contributor>
            <name>Mario José</name>
            <email>mariognu-biounesp@yahoo.com.br</email>
        </contributor>
        <category citation-format="author-date"/>
        <category field="generic-base"/>
        <updated>2011-04-03T00:00:00+00:00</updated>
        <summary>The Brazilian standard style</summary>
        <rights>This work is licensed under a Creative Commons Attribution-Share Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/</rights>
      </info>
    
      <citation>
        <layout>
          <group>
    	    <names variable="author">
    		  <name form="short">
    		    <name-part name="given"/>
    		  </name>
    	    </names>
          </group>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John"}],"id":"ITEM-1","issued":{"date-parts":[["1965","6","1"]]},"title":"His Anonymous Life","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Doe
    """
