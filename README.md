## Pure ruby deb reader

Not the fastest one, for sure

```ruby
require "deb"

# the ;0 avoids the file payload to garbage your term
a = Deb.new("your.deb");0

# see control_files
a.control_files
=> ["md5sums", "control", "postrm", "postinst"]

# extract data
>> x.archive.dump("data.tar.xz")
=> 2885028

# see control data
>> x.control
=> {"Package"=>"eog", "Version"=>"3.12.0-1", "Architecture"=>"i386", "Maintainer"=>"Debian GNOME Maintainers <pkg-gnome-maintainers@lists.alioth.debian.org>", "Installed-Size"=>"9547", "Depends"=>"libatk1.0-0 (>= 1.32.0-2~), libc6 (>= 2.11), libcairo-gobject2 (>= 1.10.0), libcairo2 (>= 1.10.0), libexempi3 (>= 2.2.0), libexif12, libgdk-pixbuf2.0-0 (>= 2.22.0), libgirepository-1.0-1 (>= 0.9.3), libglib2.0-0 (>= 2.38.0), libgnome-desktop-3-7 (>= 3.2.0), libgtk-3-0 (>= 3.10.6), libjpeg8 (>= 8c), liblcms2-2 (>= 2.2+git20110628), libpango-1.0-0 (>= 1.14.0), libpangocairo-1.0-0 (>= 1.14.0), libpeas-1.0-0 (>= 1.0.0), librsvg2-2 (>= 2.36.2), libx11-6, libxml2 (>= 2.7.4), zlib1g (>= 1:1.1.4), dconf-gsettings-backend | gsettings-backend, gir1.2-gtk-3.0, gnome-icon-theme (>= 2.19.1), shared-mime-info (>= 0.20), gsettings-desktop-schemas (>= 2.91.92), gir1.2-peas-1.0", "Recommends"=>"librsvg2-common, yelp", "Conflicts"=>"gir1.2-eog-3.0", "Breaks"=>"eog-plugins (<< 2.91)", "Replaces"=>"gir1.2-eog-3.0", "Section"=>"gnome", "Priority"=>"optional", "Homepage"=>"http://projects.gnome.org/eog", "Description"=>"Eye of GNOME graphics viewer programeog or the Eye of GNOME is a simple graphics viewer for the GNOMEdesktop which uses the gdk-pixbuf library.  It can deal with largeimages, and zoom and scroll with constant memory usage.  Its goals aresimplicity and standards compliance."}
```

You can also get the file as a string with ```Ar#get_payload```, for usage with ```StringIO``` for example

## License

The MIT License (MIT)

Copyright (c) 2014 Nicolas Szalay <nico@rottenbytes.info>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
