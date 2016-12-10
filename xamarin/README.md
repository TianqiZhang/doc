# Xamarin Doc Tools

## DFF (Docs From Folder)
This tool allows documentation generation from assemblies located in a specific folder. Because `mdoc` on Windows doesn't support a `*.dll` flag (both a PowerShell and Batch limitation), you can just use the script.

> Make sure to [install Mono](http://www.mono-project.com/download/) beforehand and add the path to the `bin` folder to the PATH.

Trigger script as:

```
.\dff.ps1 -location PATH_OF_DLLS -scanSubFolders:$BOOL_VALUE -output PATH_TO_DUMP_XML_IN
```

`location` - this should be the folder where the DLLs are located.

`scanSubFolders` - boolean value that indicates whether the script should recursively scan the folder.

`output` - location where the XML files will be placed once DLLs are reflected.
