gentoo-overlay
==============

To add this to layman, create the following file:

/etc/layman/overlays/sparky-bluefang.xml

```xml
<?xml version="1.0" ?>                                                                                                     
<repositories version="1.0">
	<repo quality="experimental" status="unofficial">
		<name>sparky-bluefang</name>
		<description>ebuild odds and ends</description>
		<homepage>https://github.com/SparkyBluefang/gentoo-overlay</homepage>
		<owner>
			<name>SparkyBluefang</name>
		</owner>
		<source type="git">https://github.com/SparkyBluefang/gentoo-overlay.git</source>
	</repo>
</repositories>
```

Then run

    $ layman -a sparky-bluefang
