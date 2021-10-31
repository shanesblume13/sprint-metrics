**To Do:**
- Drill down from IT to Team metrics
- Add history screen
- Add navigation
- Allow drilldown into teams and devs
- Add timelines and projections
- Add settings for goals and teams
- Add scorecard


**Widgets**
For IT, Team, and Developer:
    Current Velocity
        Current Velocity Pie Chart
            Entity Sum and Entity Goal in middle
            Sections by Entity Child and remaining (goal - total)
        Current Velocity Card List    
            List of Entity Children
                Icon / Initials w/ color
                Name
                Current / Goal
                Progress bar w/ Color
                % to Goal
    Current Fail Rate
        Current Fail Rate Pie Chart
            Entity Sum and Entity Goal in middle
            Sections by Entity Child and remaining (goal - total)
        Current Fail Rate Card List
    Velocity Trend
        Velocity Trend Snapshot Card
        Velocity Trend Line Chart
    Fail Rate Trend
        Fail Rate Trend Snapshot Card
        Fail Rate Trend Line Chart
    Scorecard

MODELS
Developer
    User Id
    User Name
    Display Name
    Team
Team
    Name
    Icon
    Color
Quarter
    Start Date
    End Date
    Display Name    
Goal
    Start Date
    Metric
    Value
    Team
MeasureType
    Id
    Description
Metric
    Id
    Name
    MeasureType
Issue
    Key
    Project
    Status
    Story Points
    Rejections
    Developer
    Link



