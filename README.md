# dashing-pivotal-wip
A Dashing widget that displays WIP in pivotal with meters 

You must add a file called config/pivotal.yml with something like this:
```
---
pivotal_api_token: XXXXXXXXXXXXXXXXXX
pivotal_project:
  - item:
      id: 1128428
      started_max: 9
      finished_max: 5
  - item:
      id: 1128429
      started_max: 9
      finished_max: 5
```
