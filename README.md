
TIBCO ANZ Solution Enginnering

Date: December 2020

[![N|Solid](https://docs.tibco.com/pub/businessevents-standard/5.4.0/doc/html/static/logo.png)](https://tibco.com)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://github.com/tibco-anz/gtfsSydBusAccelerator)

# Real-Time Sydney Bus Accelerator
Transport for NSW (tfnsw) is the government owned institution responsible for the public transport network in New South Wales including buses, trains, light rails, metro, ferries and so on. This accelerator demonstrates end-to-end real-time data integration. streaming and visual analytics features using TIBCO's Connect and Predict capabilities using ther real time GTFS feeds published from tfnsw’s data services.

Initial Scope:
Using TIBCO Develop (Flogo) to extract, transform real time GTFS feeds from Transport for NSW's API data services and publish the streaming data in json format to TIBCO Cloud Messaging eFTL service (TCM).
TIBCO Cloud Data Streaming service subscribed to the TCM eFTL service provide live streaming data to TIBCO Spotfire to generate visual analytics.

# TIBCO Products
The following products were used to build this Accelerator: 
  - TIBCO Cloud Integration (TCI)
  - TIBCO Cloud Messaging eFTL (TCM)
  - TIBCO Cloud DataStream
  - TIBCO Spotfire
  - 
In addition, custom extension function using GO language was built to provide the following message and data transformation features:
  - ....

# Solution and Design Details
1. Flogo Extension

2. Integration Flow
The integration flow contains three key activities as depicted in the diagram:
  1. getBusFeedMessage
      - Call Transport for New South Wales's bus position data service.
      - Return message containing header and an array of active buses and their real time position details in protobuf format with 64 encoding
  2. 
  3. 
  
![Integration Flow](./images/FlogoFlow.png)


3. DataStream Connection
4. Spotfire Analytics


### Installation
Install Flogo extention.
```sh
$ ...
```

### Todos
 - Convert externsion from function to Flogo activities
 - Support different types of tfNSW message services

License
----

MIT
