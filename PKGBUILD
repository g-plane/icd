# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=icd
pkgver=0.1.0
pkgrel=1
pkgdesc='Powerful `cd` command with fuzzy-search tool.'

arch=('any')
url="https://github.com/g-plane/$pkgname"
source=("https://github.com/g-plane/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('fd9a5fdf17d2b65058e44166bb2e125158e9f549')
license=('MIT')
depends=('zsh')

package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/zsh/scripts/$pkgname/
    cp $pkgname.plguin.zsh $pkgdir/usr/share/zsh/scripts/$pkgname/

    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    cp ./LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
