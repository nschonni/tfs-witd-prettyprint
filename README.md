# tfs-witd-prettyprint
XSL to pretty print work item templates (WITD) XML files in Team Foundation Server (TFS)

## Getting Started

- Copy the Wit.xsl into the folder with the WIT xml files.
- Edit the WIT xml file to add the `xml-stylesheet declaration at the top like

```xml
<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet href="Wit.xsl" type="text/xsl" ?>
<witd:WITD application="Work item type editor" version="1.0" xmlns:witd="http://schemas.microsoft.com/VisualStudio/2008/workitemtracking/typedef">
```

- Open the XML file with a browser to see the rendered result
