Feature: Failing

  Scenario: Failing
    Given the 'failing' feature
    And a 'json' formatter
    When executing the parallel-cucumber-js bin
    Then the exit code should be '1'
    And stdout should contain JSON matching:
    """
      [
        {
          "id": "failing",
          "name": "Failing",
          "tags": [],
          "line": 1,
          "keyword": "Feature",
          "uri": "{uri}/features/failing.feature",
          "elements": [
            {
              "name": "Failing",
              "id": "failing;failing",
              "line": 3,
              "keyword": "Scenario",
              "tags": [],
              "type": "scenario",
              "steps": [
                {
                  "arguments": [],
                  "name": "a passing pre-condition",
                  "line": 4,
                  "keyword": "Given ",
                  "result": {
                    "duration": "{duration}",
                    "status": "passed"
                  },
                  "match": {
                    "location": "{location}"
                  }
                },
                {
                  "arguments": [],
                  "name": "a failing action is executed",
                  "line": 5,
                  "keyword": "When ",
                  "result": {
                    "error_message": "Failed",
                    "duration": "{duration}",
                    "status": "failed"
                  },
                  "match": {
                    "location": "{location}"
                  }
                },
                {
                  "arguments": [],
                  "name": "a post-condition passes",
                  "line": 6,
                  "keyword": "Then ",
                  "result": {
                    "status": "skipped"
                  },
                  "match": {
                    "location": "{location}"
                  }
                }
              ]
            }
          ],
          "profile": "default",
          "retry": 0
        }
      ]
      """
    And stderr should be empty

