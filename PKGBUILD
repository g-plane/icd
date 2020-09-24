pkgname=icd
pkgver=0.1.0
pkgrel=1
pkgdesc='Powerful `cd` command with fuzzy-search tool.'

arch=('any')
url="https://github.com/g-plane/$pkgname"
source=("https://github.com/g-plane/$pkgname/archive/v$pkgver.tar.gz")
license=('MIT')
depends=('zsh')

package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/zsh/scripts/$pkgname/
    cp $pkgname.plguin.zsh $pkgdir/usr/share/zsh/scripts/$pkgname/

    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    cp ./LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
