Collecting event instrumentation:

- Snowplow: unreadable code, difficult to deploy, inflexible client API
- Segment: not open source, have to rely on a vendor, poor scaling (deduping ties up warehouse for tens of minutes)

Can more modern tools give us something:

- Extendable (plug-ins for additional data manipulation, like geo-parsing)
- Scalable (high throughput with little database impact)
- Readable (literate-programming style)
-

The only bet I'm still happy with is Redshift, for better or worse.  Looker is growing on me, but vendors always worry me.

requisites:
- install phoenix (http://www.phoenixframework.org/docs/installation)
- install rabbitmq (https://www.rabbitmq.com/install-homebrew.html)

I'm imagining an architecture:

[ clients produce many many events]

[ ] [ ] [ ] [ ] [ ][ ]
 |   |   |   |   |  |
  [   receiver     ]
         |
      producer
        | | |
      consumers
    /   | |  \
  [doc] [doc] [doc]
   |     |
   |
   s3