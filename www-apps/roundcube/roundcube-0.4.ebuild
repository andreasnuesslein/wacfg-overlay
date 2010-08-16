# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/mail-client/roundcube/roundcube-0.3.1.ebuild,v 1.11 2010/08/12 08:09:16 a3li Exp $

EAPI="2"

MY_PN="${PN}mail"
MY_P="${MY_PN}-${PV}"

#inherit webapp depend.php depend.apache

DESCRIPTION="A browser-based multilingual IMAP client with an application-like user interface"
HOMEPAGE="http://roundcube.net"
SRC_URI="mirror://sourceforge/${MY_PN}/${MY_P}.tar.gz"

# roundcube is GPL-licensed, the rest of the licenses here are
# for bundled PEAR components, googiespell and utf8.class.php
LICENSE="GPL-2 BSD PHP-2.02 PHP-3 MIT public-domain"
SLOT="0"
KEYWORDS="amd64 arm ppc ppc64 ~sparc x86"
IUSE="ldap mysql postgres ssl spell"

DEPEND=""
RDEPEND="dev-lang/php[crypt,iconv,ldap?,pcre,postgres?,session,sockets,spl,ssl?,unicode]
	!postgres? ( !mysql? ( dev-lang/php[sqlite] ) )
	spell? ( dev-lang/php[curl,spell] )
"

#need_httpd_cgi
#need_php_httpd

src_unpack() { :; }

src_install() {
	insinto /var/lib/webapps/${PN}/sources
	doins "${DISTDIR}"/${MY_P}.tar.gz
	insinto /var/lib/webapps/${PN}
	insopts -m0755
	doins "${FILESDIR}"/${P}.py
}

