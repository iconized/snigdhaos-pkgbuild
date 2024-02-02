
# SNIGHDA OS PKGBUILD DOCUMENTATION

Here you will find the necessary documentation to build snigdhaos-pkgbuilds. Follow the guidline to build package.




## Tracking
![GitHub issues](https://img.shields.io/github/issues/snigdhalinux/snigdhaos-pkgbuild)
![GitHub closed issues](https://img.shields.io/github/issues-closed-raw/snigdhalinux/snigdhaos-pkgbuild)
![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/snigdhalinux/snigdhaos-pkgbuild)
![GitHub pull requests](https://img.shields.io/github/issues-pr-raw/snigdhalinux/snigdhaos-pkgbuild)

## Authors

- [@eshanized](https://www.github.com/eshanized) -> Lead Maintainer
- [@iconized](https://www.github.com/iconized) -> Co Maintainer



## PKGBUILD Template For Snigdha OS
Case 1:👉 To make **`PKGBUILD`** for **Snigdha OS** you must follow the template bellow.

```PKGBUILD
# Maintainer: 
# Contributor: (Optional)

pkgname=
pkgbase=(Optional)
org=snigdhalinux
pkgver=
pkgrel=
arch=('')
branch=''
url=""
license=('')
depends=()
makedepends=('')
source=("")
provides=('') #If Any
conflicts=('') #If Any
sha256sums=('')

pkgver() {

	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
package() {
    
}
```
**Note 1:** If you are building this package for first time, initiate `pkgver=1`. You must use the `pkgver()` function. Some packages may not contain or not applicable `cd "$srcdir/$pkgname"` in that case you can comment out the line. e.g: `# cd "$srcdir/$pkgname"` or remove the line.

**Note 2:** If any of the fields above not necessary or not applicable, you can remove the field. 

**Note 3:** If your package is fully operational, then you can directly upload the package on our github. If your package is less then **100 MB** then upload it to **`snigdhaos-core`** else upload on **`spectrum`**.

**Note 4:** Try to use `makepkg -f -scr --noconfirm` command to make the package. You will get a clean build. Be careful about `depends` and `makedepends`
## FAQ

#### Is it require to sign the package?

**Answer:** No, but it is recommended to sign the package. You can use `makepkg -f -scr --noconfirm --sign` to sign the package at the time of building. If you are stucked on **starting package()** the use only `makepkg -f -scr --noconfirm` and after building the package, manually sign the package by executing `gpg --detach-sign your_pkgname.pkg.tar.zst`.

*Note: If you often build packages then it is better to create an alias in your **.bashrc/config.fish/.zshrc** file. e.g: `alias mpsr=makepkg -f -scr --noconfirm` or `alias sn=gpg --detach-sign` to sign the package*.

Read: ![How To Create GPG Key](https://github.com/snigdhalinux/snigdhaos-pkgbuild/wiki#how-to-create-gpg-key)


