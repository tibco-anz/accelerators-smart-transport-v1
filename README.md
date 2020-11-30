
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
**Flogo Extension**
Flogo function tfNSW_protobuf2JSON was built using GO language as an extension to process the required message transformation and conversion and other supporting features including:
    - Base64Encoding and decoding
    - Convert protobuf message to JSON
    - Tranforming and generating the output data 
    - Providing Testmode processing and default batch size for tuning the size of the output for optimal message publishing to TCM

Function Format:
  tfNSW_protobuf2JSON (protobuf message (string), batch size (int), Test Mode (bool))
  *Note: Test Mode (true) limits the maximum size of the entity which is ideal for testing a smaller subset of entity (i.e. bus) during development and testing phase.*

  For example, 
      tfNSW_protobuf2JSON (protobuf_message, 25, false)
  Which will process the first 25 entities of the message passed to the function.

**Integration Flow**
The integration flow contains three key activities as depicted in the diagram:
    1. getBusFeedMessage
      - RESTful API call to the Transport for New South Wales's bus position data service.
      - Returning base64 encoded message containing header and an array of active buses and their real time geo-position details in protobuf format.
    2. ParseJSONActivity
      - Applying the tfNSW_protobuf2JSON function to the protobuf message received from getBusFeedMessage step to generate a JSON object which contains an array of entities.
    3. publisheFTL
      - Creating an **iterator** by applying the JSON object from the ParseJSONActivity step.
      - For each instance of the **iterator**, publish the message to the eFTL
  
  
![Integration Flow](./images/FlogoFlow.png)


**DataStream Connection**

**Spotfire Analytics**


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
