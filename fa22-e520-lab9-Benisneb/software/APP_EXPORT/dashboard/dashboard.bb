#
# This file is the dashboard recipe.
#

SUMMARY = "Simple dashboard application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://dashboard \
	   file://bootstrap.min.css \
	   file://bootstrap.min.js \
	   file://index.html \
	  "

S = "${WORKDIR}"

WEB_ROOT="/var/www/html/"

do_install() {
	     install -d ${D}/${WEB_ROOT}
	     install -m 0755 ${S}/dashboard ${D}/${WEB_ROOT}
  	     install -m 0755 ${S}/index.html ${D}/${WEB_ROOT}
             install -m 0755 ${S}/bootstrap.min.css ${D}/${WEB_ROOT}
             install -m 0755 ${S}/bootstrap.min.js ${D}/${WEB_ROOT}
}
