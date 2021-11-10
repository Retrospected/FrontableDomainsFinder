# FrontableDomainsFinder

Quick and dirty script to find frontable domains for your favorite CDN provider using DNS lookups, based on an input list of domains.

```
Usage: ./dflookup.sh <input file of domains> <part of the CNAME to look for> <outputfile>

List of CNAMES for popular CDN providers:
- Fastly: fastly.net
- Azure: azureedge.net, msecnd.net and/or v0cdn.net
```
