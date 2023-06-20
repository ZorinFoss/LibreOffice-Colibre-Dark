#!/bin/bash
#
# Legal Stuff:
#
# This file is free software; you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free Software
# Foundation; version 3.
#
# This file is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
# details.
#
# You should have received a copy of the GNU Lesser General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/lgpl-3.0.txt>


for dir in \
  /usr/share/libreoffice/share/config \
  /usr/lib/libreoffice/share/config \
  /usr/lib64/libreoffice/share/config \
  /usr/local/lib/libreoffice/share/config \
  /opt/libreoffice*/share/config; do
  [ -d "$dir" ] || continue
  sudo rm -f -v "$dir/images_colibre_dark_svg.zip"
done

echo -e "\n=> 📥 Installing Libreoffice Colibre Dark\n"

sudo mkdir -p -v "/usr/share/libreoffice/share/config"
sudo cp -v "images_colibre_dark_svg.zip" "/usr/share/libreoffice/share/config/images_colibre_dark_svg.zip"

for dir in \
    /usr/lib64/libreoffice/share/config \
    /usr/lib/libreoffice/share/config \
    /usr/local/lib/libreoffice/share/config \
    /opt/libreoffice*/share/config; do
        [ -d "$dir" ] || continue
        sudo ln -sf -v "/usr/share/libreoffice/share/config/images_colibre_dark_svg.zip" "$dir"
done

echo -e "\n=> 🎉 Finish (don't forget to restart Libreoffice)!\n"
