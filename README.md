
# Snigdha OS PKGBUILD

This Repository holds all the package build scripts and resources which are used in **Snigdha OS**. You can build the packages.
**⚠️ Caution:** Before building packages, make sure you have **snigdhaos-core** mirror installed on your **ArchLinux** machines.


## Requirements:
- Any **Arch** Based Linux Distribution e.g. Arch Linux, Garuda Linux, Manjaro etc.
- **snigdhaos-core** repository & **spectrum** repository.
- **GPG Key**
- Knowledge About **PKGBUILD**.
## Mirror Installation:
- Get Details about installing **snigdhaos-core** mirror. URL: https://github.com/snigdhalinux/docs/blob/master/snigdhaos-core-installation.md

- Get Details about installing **spectrum** mirror. URL: https://github.com/snigdhalinux/snigdhaos-core/
## Authors

- [@eshanized](https://www.github.com/eshanized)
- [@iconized](https://github.com/iconized)


## Contributing

Contributions are always welcome to Snigdha OS!

Before contributing:
- If you are developing any **Package** for Snigdha OS, then you need to name it as **snigdhaos-[your_package_name_here]**
- If you are developing packages for any specific version of Snigdha OS **[e.g. snigdhaos-blackarch]**, then you may need to specify the build name **[e.g. snigdhaos-blackarch-your_package_name_here]** 
- If you are the maintainer, then set **`# Maintainer: Your Name <yourmail@snigdhaos.org>`**
- If you are contributing to packagebuild then set **`# Contributor: Your Name <yourmail@example.com>`**. *Note: One package may have multiple maintainers and contributors.*
- **PKGBUILD** may not contain maintainer's original source. If the source code are hosted on **GitHub, Gitlab, Gitea, GOGs, Bitbucket** then create a fork on your github profile. And set the source to **`source="git+https://github.com/package_source.git"`** 



## PKGBUILD TEMPLATE
This is a simple **PKGBUILD** template for Snigdha OS. You must maintain this!
```PKGBUILD

# Maintainer : Your Name `<yourmail@snigdhaos.org>`

pkgname=your_packages_name
org=snigdhalinux
branch=
pkgver=
pkgrel=
arch=
url="https://snigdhaos.org"
license=
makedepends=
source=
provides=()
conflicts=()

pkgver() {

	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

your_pkgbuild_function(){

}
```
- ⚠️Caution: Do not keep **pkgver__ blank. It will show error in building. If you are building the package for the first time, it is better to set **pkgver=1**. it will automatically create the pkgver number.
- ⚠️ The package may not have "$srcdir/$pkgname", in that case comment out or delete **cd "$srcdir/$pkgname"** e.g: 
```PKGBUILD
pkgver() {

	# cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
```
or do this,
delete **cd "$srcdir/$pkgname"** e.g: 
```PKGBUILD
pkgver() {

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
```


## Building & Signing Package:

To build and signing packages first you are required to create **GPG Key**. Below you can find it.

#### STEP 1: Creating GPG Key 
```bash
gpg --full-generate-key
```
Output:
```bash
gpg (GnuPG) 2.2.27; Copyright (C) 2021 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

gpg: directory '/home/ehsan/.gnupg' created
gpg: keybox '/home/eshan/.gnupg/pubring.kbx' created
Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
  (14) Existing key from card
Your selection? 
```
📌 Input **1** and press enter.
Output:
```bash
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (3072)
Requested keysize is 3072 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 5y
Key expires at Fri 20 Feb 2026 02:46:59 PM CST
Is this correct? (y/N) y
```
```bash
GnuPG needs to construct a user ID to identify your key.

Real name: Eshan Roy
Email address: eshan@snigdhaos.org
Comment:
```
📌 Input Your **Real Name** and **Email Address**

Output:
```bash
You selected this USER-ID:
    "Eshan Roy <eshan@snigdhaos.org>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
```
📌 Check The details and input **O** to continue.

Output: 
```bash
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: /home/eshan/.gnupg/trustdb.gpg: trustdb created
gpg: key 9F2C5C96FE18E143 marked as ultimately trusted
gpg: directory '/home/eshan/.gnupg/openpgp-revocs.d' created
gpg: revocation certificate stored as '/home/eshan/.gnupg/openpgp-revocs.d/BC45A6C3A12E6EF80FAAA5369F2C5C96FE18E143.rev'
public and secret key created and signed.

pub   rsa3072 2024-01-24 [SC]
      BC45A6C3A12E6EF80FAAA5369F2C5C96FE18E143
uid           [ultimate] Eshan Roy <eshan@snigdhaos.org>
sub   rsa3072 2024-01-24 [E]

```
Congratulation! You generated Your **GPG Key** successfully!

#### STEP 2: Check Your Key:
```bash
gpg --list-key
```
Output:
```bash
[keyboxd]
---------
pub   rsa3072 2024-01-24 [SC]
      BC45A6C3A12E6EF80FAAA5369F2C5C96FE18E143
uid           [ultimate] Eshan Roy <eshan@snigdhaos.org>
sub   rsa3072 2024-01-24 [E]

```
![image](https://github.com/snigdhalinux/snigdhaos-pkgbuild/assets/148610067/da2a7e3a-c6d4-413d-acb9-32ebf35f0322)

🔰 Here, you need to pay attention to two key points.

In the output of this command, `BC45A6C3A12E6EF80FAAA5369F2C5C96FE18E143` is your key id, and `eshan@snigdhaos.org` is your email.

`BC45A6C3A12E6EF80FAAA5369F2C5C96FE18E143` is the full key id which contains **40 characters**, but sometimes we can use the **last 16 characters** to represent this key, i.e. `9F2C5C96FE18E143`, this is the “short key”.

We will use them later.

So we successfully created a gpg key. Next, let’s share it with others.

Generally, there are two methods to share your keys. One of them is to send your key to a key server, then people can download it from the Internet.

#### STEP 2: Sharing your key publically:
🔰 Let’s try to send your key to a key server first. It’s pretty easy, simplely execute this command:
```bash
gpg --send-keys BC45A6C3A12E6EF80FAAA5369F2C5C96FE18E143
```
If this command is executed successfully, other people can receive your key by running this command:
```bash
gpg --recv-keys BC45A6C3A12E6EF80FAAA5369F2C5C96FE18E143
```
or use short key,
```bash
gpg --recv-keys 9F2C5C96FE18E143
```
Another method is to generate a key file and share it with others, then people can directly import your gpg key from this file.

To generate the key file, execute the following command:
```bash
gpg --output eshan.gpg --armor --export BC45A6C3A12E6EF80FAAA5369F2C5C96FE18E143
```
🔰 This will create a file with name **eshan.gpg** on your home directory.

To import this key, execute the following command:
```bash
gpg --import /home/eshan.gpg
```
#### STEP 4: Configure makepkg:
If you want to build packages signed with this key, you’ll also need to configure makepkg.
To config, execute the following command:
```bash
sudo nano /etc/makepkg.conf
```
Output:
![image](https://github.com/snigdhalinux/snigdhaos-pkgbuild/assets/148610067/7469dc46-4441-4c80-8dec-6c9ed68700a4)

Uncomment **`#PACKAGER=""` e.g: `PACKAGER=""`** and the **`#GPGKEY=""` e.g: `GPGKEY=""`** and in the `PACKAGER` field insert `your name` and `email address`. e.g. `Eshan Roy <eshan@snigdhaos.org>` and GPG Key you just generated. e.g: `GPGKEY="BC45A6C3A12E6EF80FAAA5369F2C5C96FE18E143"`

Press `Ctrl+x` to exit and `y` to save the file.

Video Tutorial: 
## FAQ

#### Can I upload my own package on snigdhaos-core?

Answer : Yes! But You canot upload other os specified package like: os-system-config etc. 

#### Can I add my keyring to **snigdhaos-keyring?**

Answer : Yes! You have to build more than 5 packages for **snidghaos-archiso** specified.

