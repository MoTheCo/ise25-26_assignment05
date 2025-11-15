Feature: Points of Sale Management
  This feature allows users to create and modify points of sale (POS).

  Scenario: Insert and retrieve two POS
    Given an empty POS list
    When I insert POS with the following elements
      | name                   | description                      | type            | campus    | street          | houseNumber  | postalCode | city       |
      | Schmelzpunkt           | Great waffles                    | CAFE            | ALTSTADT  | Hauptstraße     | 90           | 69117      | Heidelberg |
      | Bäcker Görtz           | Walking distance to lecture hall | BAKERY          | INF       | Berliner Str.   | 43           | 69120      | Heidelberg |
      | New Vending Machine    | Use only in case of emergencies  | VENDING_MACHINE | BERGHEIM  | Teststraße      | 99a          | 12345      | Other City |
    Then the POS list should contain the same elements in the same order

Scenario: Update one of three existing POS
  Given an empty POS list
  When I insert POS with the following elements
    | name         | description       | type  | campus      | street              | houseNumber | postalCode | city       |
    | Schmelzpunkt | Café Schmelzpunkt | CAFE  | NEUENHEIMER | Im Neuenheimer Feld | 348         | 69120      | Heidelberg |
    | Mensa INF    | Mensa INF 304     | MENSA | NEUENHEIMER | Im Neuenheimer Feld | 304         | 69120      | Heidelberg |
    | Café Botanik | Botanischer Garten| CAFE  | NEUENHEIMER | Im Neuenheimer Feld | 360         | 69120      | Heidelberg |
  And I update the description of POS "Schmelzpunkt" to "Updated Café Schmelzpunkt"
  Then the POS "Schmelzpunkt" should have description "Updated Café Schmelzpunkt"
