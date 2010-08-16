# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/wordpress/wordpress-2.9.2-r1.ebuild,v 1.1 2010/07/03 14:33:51 mabi Exp $

EAPI="2"

#inherit wacfg

DESCRIPTION="Wordpress php and mysql based CMS system."
HOMEPAGE="http://wordpress.org/"
SRC_URI="http://wordpress.org/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

DEPEND=""
RDEPEND="|| ( dev-lang/php[mysql] dev-lang/php[mysqli] )
		 || ( <dev-lang/php-5.3[pcre] >=dev-lang/php-5.3 )"

#S="${WORKDIR}"/${PN}
#need_httpd_cgi
#need_php_httpd

src_unpack() { :; }
src_install() {
	insinto /var/lib/webapps/${PN}/sources
	doins "${DISTDIR}"/${P}.tar.gz
	insinto /var/lib/webapps/${PN}
	insopts -m0755
	doins "${FILESDIR}"/${P}.wa
}
