Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F63327701
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032115; cv=none; b=AfE3R0ap2M1uWPti468QEaR+0vi9aZetmPsNkuPW82qp7BzUJEhGmkhiZFIqWT2UvmqK6QxTEV3pNVD0GPhZ4tnX9d6zfQaVsGK+lphUHfZm5iJU1iPZy5AR4vOq1gLY3B1qQ13ZMZPo4hw1L0T4VeiE77BSxwiXhjtuQfspHgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032115; c=relaxed/simple;
	bh=tEm0yoPL7HsFyKoB6Jrai42U3hj3XKias8jVPJ1EmCk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tRbt9CYfc/qGenyK7p7/eosY1Dh4JSPvMMKvaCLBDfaU/tvsdbaBGCMODzgrCxVNQRKSmVzFP+dX8NQs9Kn0V87h1W0qC28bXrsUIebXgCFyZItMcYDBza0ldFb+v0dMBe+UC/oIDzU7oo3C1w1JWRirrUyAXqVHX+3btBIUGbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=a52iuZhe; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="a52iuZhe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=fJOGxITqQFCDxTSOtWfmRrQRp3EbeOYAMMzg7l9NGuU=; b=a52iuZheeGkohGMz
	UvhNZAI7Mn8b1sszpZvwect7dyU8YNmTUzOqQtQkC0HhrykNLDcm5vHlv+csyQMhwEAtw1oe1gnkS
	dzaAtEwKMt4YFUalXoMfqS1hoy80kcd2ovcUTgij9nDFSoXnDb4G2GS7PEXt4CiNvma/P23a7iLSO
	wbyDd32oveN0tmEYdGwTEQu81Lod48+EdMJsGaj2RhPqAvKIa9/FEKEVxoL6ChFtmmF98rnIl3WuJ
	RzOfB36TvShvFyR8/wqslXnyFliNn9AJAfqL9f5b8u0bUG5xsU4ZaKCBUzuV7cOYFnI8ap0WCIOOu
	4tTU3/bwaksuCrm3kQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1u1mQ4-009V33-1k
	for linux-kernel@vger.kernel.org;
	Mon, 07 Apr 2025 13:21:44 +0000
Date: Mon, 7 Apr 2025 13:21:44 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: linux-kernel@vger.kernel.org
Subject: gcc ICE while building landlock
Message-ID: <Z_PRaKx7q70MKgCA@gallifrey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 13:16:59 up 334 days, 31 min,  1 user,  load average: 0.02, 0.02,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi,
  On 6.15-rc1 (with a few more code deletion patches on top),
I'm seeing an ICE while building landlock with an allyesconfig
on Fedora 42 x86-64 gcc:

make -j 32 KCFLAGS=3D"-Wno-error=3Dunterminated-string-initialization -Wno-=
error=3Dsequence-point -Wno-error=3Dunterminated-string-initialization"

*** WARNING *** there are active plugins, do not report this as a bug unles=
s you can reproduce it without enabling any plugins.
Event                            | Plugins
PLUGIN_FINISH_TYPE               | randomize_layout_plugin
PLUGIN_FINISH_DECL               | randomize_layout_plugin
PLUGIN_ATTRIBUTES                | latent_entropy_plugin randomize_layout_p=
lugin
PLUGIN_START_UNIT                | latent_entropy_plugin stackleak_plugin
PLUGIN_ALL_IPA_PASSES_START      | randomize_layout_plugin
security/landlock/fs.c: In function =E2=80=98hook_file_ioctl_common=E2=80=
=99:
security/landlock/fs.c:1745:61: internal compiler error: in count_type_elem=
ents, at expr.cc:7095
 1745 |                         .u.op =3D &(struct lsm_ioctlop_audit) {
      |                                                             ^
Please submit a full bug report, with preprocessed source.
See <http://bugzilla.redhat.com/bugzilla> for instructions.
Preprocessed source stored into /tmp/ccz1wjwI.out file, please attach this =
to your bugreport.
make[4]: *** [scripts/Makefile.build:203: security/landlock/fs.o] Error 1
make[3]: *** [scripts/Makefile.build:461: security/landlock] Error 2
make[2]: *** [scripts/Makefile.build:461: security] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/discs/fast/kernel/Makefile:2006: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

=46rom the top of the dumped .out file - happy to share the lot
and config if someone thinks it might help; not tried
anything else yet.

Dave

// Target: x86_64-redhat-linux
// Configured with: ../configure --enable-bootstrap --enable-languages=3Dc,=
c++,fortran,objc,obj-c++,ada,go,d,m2,cobol,lto --prefix=3D/usr --mandir=3D/=
usr/share/man --infodir=3D/usr/share/info --with-bugurl=3Dhttp://bugzilla.r=
edhat.com/bugzilla --enable-shared --enable-threads=3Dposix --enable-checki=
ng=3Drelease --enable-multilib --with-system-zlib --enable-__cxa_atexit --d=
isable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-buil=
d-id --with-gcc-major-version-only --enable-libstdcxx-backtrace --with-libs=
tdcxx-zoneinfo=3D/usr/share/zoneinfo --with-linker-hash-style=3Dgnu --enabl=
e-plugin --enable-initfini-array --with-isl=3D/builddir/build/BUILD/gcc-15.=
0.1-build/gcc-15.0.1-20250329/obj-x86_64-redhat-linux/isl-install --enable-=
offload-targets=3Dnvptx-none,amdgcn-amdhsa --enable-offload-defaulted --wit=
hout-cuda-driver --enable-gnu-indirect-function --enable-cet --with-tune=3D=
generic --with-arch_32=3Di686 --build=3Dx86_64-redhat-linux --with-build-co=
nfig=3Dbootstrap-lto --enable-link-serialization=3D1
// Thread model: posix
// Supported LTO compression algorithms: zlib zstd
// gcc version 15.0.1 20250329 (Red Hat 15.0.1-0) (GCC)
//
// *** WARNING *** there are active plugins, do not report this as a bug un=
less you can reproduce it without enabling any plugins.
// Event                            | Plugins
// PLUGIN_FINISH_TYPE               | randomize_layout_plugin
// PLUGIN_FINISH_DECL               | randomize_layout_plugin
// PLUGIN_ATTRIBUTES                | latent_entropy_plugin randomize_layou=
t_plugin
// PLUGIN_START_UNIT                | latent_entropy_plugin stackleak_plugin
// PLUGIN_ALL_IPA_PASSES_START      | randomize_layout_plugin
// security/landlock/fs.c: In function =E2=80=98hook_file_ioctl_common=E2=
=80=99:
// security/landlock/fs.c:1745:61: internal compiler error: in count_type_e=
lements, at expr.cc:7095
//  1745 |                         .u.op =3D &(struct lsm_ioctlop_audit) {
//       |                                                             ^
// Please submit a full bug report, with preprocessed source.
// See <http://bugzilla.redhat.com/bugzilla> for instructions.

// /usr/libexec/gcc/x86_64-redhat-linux/15/cc1 -quiet -nostdinc -I ./arch/x=
86/include -I ./arch/x86/include/generated -I ./include -I ./include -I ./a=
rch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I ./include/uapi=
 -I ./include/generated/uapi -iplugindir=3D/usr/lib/gcc/x86_64-redhat-linux=
/15/plugin -D __KERNEL__ -D CC_USING_FENTRY -D RANDSTRUCT -D LATENT_ENTROPY=
_PLUGIN -D STACKLEAK_PLUGIN -D KBUILD_MODFILE=3D"security/landlock/landlock=
" -D KBUILD_BASENAME=3D"fs" -D KBUILD_MODNAME=3D"landlock" -D __KBUILD_MODN=
AME=3Dkmod_landlock -include ./include/linux/compiler-version.h -include ./=
include/linux/kconfig.h -include ./include/linux/compiler_types.h -MMD secu=
rity/landlock/.fs.o.d security/landlock/fs.c -iplugindir=3D/usr/lib/gcc/x86=
_64-redhat-linux/15/plugin -quiet -dumpdir security/landlock/ -dumpbase fs.=
c -dumpbase-ext .c -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -mn=
o-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3D3 -mskip-rax-setup =
-march=3Dx86-64 -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel -mstack-pr=
otector-guard-reg=3Dgs -mstack-protector-guard-symbol=3D__ref_stack_chk_gua=
rd -mindirect-branch=3Dthunk-extern -mindirect-branch-register -mindirect-b=
ranch-cs-prefix -mfunction-return=3Dthunk-extern -mharden-sls=3Dall -mrecor=
d-mcount -mfentry -O2 -Werror -Wall -Wundef -Werror=3Dimplicit-function-dec=
laration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prot=
otypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-=
of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger=
-than=3D2048 -Wno-main -Wdangling-pointer=3D0 -Wvla -Wno-pointer-sign -Wcas=
t-function-type -Wstringop-overflow=3D0 -Warray-bounds=3D0 -Walloc-size-lar=
ger-than=3D18446744073709551615EiB -Wimplicit-fallthrough=3D5 -Werror=3Ddat=
e-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wenu=
m-conversion -Wextra -Wunused -Wno-unused-but-set-variable -Wunused-const-v=
ariable=3D0 -Wno-packed-not-aligned -Wformat-overflow=3D0 -Wformat-truncati=
on=3D0 -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initi=
alizers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized=
 -Wno-sign-compare -Wno-unused-parameter -Wno-error=3Dunterminated-string-i=
nitialization -Wno-error=3Dsequence-point -Wno-error=3Dunterminated-string-=
initialization -std=3Dgnu11 -p -fshort-wchar -funsigned-char -fno-common -f=
no-PIE -fno-strict-aliasing -fcf-protection=3Dbranch -falign-jumps=3D1 -fal=
ign-loops=3D1 -fno-asynchronous-unwind-tables -fno-jump-tables -fpatchable-=
function-entry=3D64,64 -fno-delete-null-pointer-checks -fno-allow-store-dat=
a-races -fno-reorder-blocks -fno-ipa-cp-clone -fno-partial-inlining -fstack=
-protector-strong -ftrivial-auto-var-init=3Dpattern -fzero-init-padding-bit=
s=3Dall -fno-stack-clash-protection -fzero-call-used-regs=3Dused-gpr -fno-i=
nline-functions-called-once -fmin-function-alignment=3D64 -fstrict-flex-arr=
ays=3D3 -fno-strict-overflow -fstack-check=3Dno -fconserve-stack -fplugin=
=3D./scripts/gcc-plugins/randomize_layout_plugin.so -fplugin=3D./scripts/gc=
c-plugins/latent_entropy_plugin.so -fplugin=3D./scripts/gcc-plugins/stackle=
ak_plugin.so -fplugin-arg-stackleak_plugin-track-min-size=3D100 -fplugin-ar=
g-stackleak_plugin-arch=3Dx86 -fsanitize=3Dkernel-address -fasan-shadow-off=
set=3D0xdffffc0000000000 -fsanitize=3Dbounds-strict -fsanitize=3Dshift -fsa=
nitize=3Dinteger-divide-by-zero -fsanitize=3Dbool -fsanitize=3Denum -fsanit=
ize-coverage=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp --param=3Dasan-inst=
rumentation-with-call-threshold=3D10000 --param=3Dasan-stack=3D1 --param=3D=
asan-instrument-allocas=3D1 --param=3Dasan-globals=3D1 --param=3Dasan-kerne=
l-mem-intrinsic-prefix=3D1 -o - -frandom-seed=3D0 -fdump-noaddr

// Target: x86_64-redhat-linux
// Configured with: ../configure --enable-bootstrap --enable-languages=3Dc,=
c++,fortran,objc,obj-c++,ada,go,d,m2,cobol,lto --prefix=3D/usr --mandir=3D/=
usr/share/man --infodir=3D/usr/share/info --with-bugurl=3Dhttp://bugzilla.r=
edhat.com/bugzilla --enable-shared --enable-threads=3Dposix --enable-checki=
ng=3Drelease --enable-multilib --with-system-zlib --enable-__cxa_atexit --d=
isable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-buil=
d-id --with-gcc-major-version-only --enable-libstdcxx-backtrace --with-libs=
tdcxx-zoneinfo=3D/usr/share/zoneinfo --with-linker-hash-style=3Dgnu --enabl=
e-plugin --enable-initfini-array --with-isl=3D/builddir/build/BUILD/gcc-15.=
0.1-build/gcc-15.0.1-20250329/obj-x86_64-redhat-linux/isl-install --enable-=
offload-targets=3Dnvptx-none,amdgcn-amdhsa --enable-offload-defaulted --wit=
hout-cuda-driver --enable-gnu-indirect-function --enable-cet --with-tune=3D=
generic --with-arch_32=3Di686 --build=3Dx86_64-redhat-linux --with-build-co=
nfig=3Dbootstrap-lto --enable-link-serialization=3D1
// Thread model: posix
// Supported LTO compression algorithms: zlib zstd
// gcc version 15.0.1 20250329 (Red Hat 15.0.1-0) (GCC)
//
// *** WARNING *** there are active plugins, do not report this as a bug un=
less you can reproduce it without enabling any plugins.
// Event                            | Plugins
// PLUGIN_FINISH_TYPE               | randomize_layout_plugin
// PLUGIN_FINISH_DECL               | randomize_layout_plugin
// PLUGIN_ATTRIBUTES                | latent_entropy_plugin randomize_layou=
t_plugin
// PLUGIN_START_UNIT                | latent_entropy_plugin stackleak_plugin
// PLUGIN_ALL_IPA_PASSES_START      | randomize_layout_plugin
// security/landlock/fs.c: In function =E2=80=98hook_file_ioctl_common=E2=
=80=99:
// security/landlock/fs.c:1745:61: internal compiler error: in count_type_e=
lements, at expr.cc:7095
//  1745 |                         .u.op =3D &(struct lsm_ioctlop_audit) {
//       |                                                             ^
// Please submit a full bug report, with preprocessed source.
// See <http://bugzilla.redhat.com/bugzilla> for instructions.

// /usr/libexec/gcc/x86_64-redhat-linux/15/cc1 -quiet -nostdinc -I ./arch/x=
86/include -I ./arch/x86/include/generated -I ./include -I ./include -I ./a=
rch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I ./include/uapi=
 -I ./include/generated/uapi -iplugindir=3D/usr/lib/gcc/x86_64-redhat-linux=
/15/plugin -D __KERNEL__ -D CC_USING_FENTRY -D RANDSTRUCT -D LATENT_ENTROPY=
_PLUGIN -D STACKLEAK_PLUGIN -D KBUILD_MODFILE=3D"security/landlock/landlock=
" -D KBUILD_BASENAME=3D"fs" -D KBUILD_MODNAME=3D"landlock" -D __KBUILD_MODN=
AME=3Dkmod_landlock -include ./include/linux/compiler-version.h -include ./=
include/linux/kconfig.h -include ./include/linux/compiler_types.h -MMD secu=
rity/landlock/.fs.o.d security/landlock/fs.c -iplugindir=3D/usr/lib/gcc/x86=
_64-redhat-linux/15/plugin -quiet -dumpdir security/landlock/ -dumpbase fs.=
c -dumpbase-ext .c -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -mn=
o-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3D3 -mskip-rax-setup =
-march=3Dx86-64 -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel -mstack-pr=
otector-guard-reg=3Dgs -mstack-protector-guard-symbol=3D__ref_stack_chk_gua=
rd -mindirect-branch=3Dthunk-extern -mindirect-branch-register -mindirect-b=
ranch-cs-prefix -mfunction-return=3Dthunk-extern -mharden-sls=3Dall -mrecor=
d-mcount -mfentry -O2 -Werror -Wall -Wundef -Werror=3Dimplicit-function-dec=
laration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prot=
otypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-=
of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger=
-than=3D2048 -Wno-main -Wdangling-pointer=3D0 -Wvla -Wno-pointer-sign -Wcas=
t-function-type -Wstringop-overflow=3D0 -Warray-bounds=3D0 -Walloc-size-lar=
ger-than=3D18446744073709551615EiB -Wimplicit-fallthrough=3D5 -Werror=3Ddat=
e-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wenu=
m-conversion -Wextra -Wunused -Wno-unused-but-set-variable -Wunused-const-v=
ariable=3D0 -Wno-packed-not-aligned -Wformat-overflow=3D0 -Wformat-truncati=
on=3D0 -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initi=
alizers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized=
 -Wno-sign-compare -Wno-unused-parameter -Wno-error=3Dunterminated-string-i=
nitialization -Wno-error=3Dsequence-point -Wno-error=3Dunterminated-string-=
initialization -std=3Dgnu11 -p -fshort-wchar -funsigned-char -fno-common -f=
no-PIE -fno-strict-aliasing -fcf-protection=3Dbranch -falign-jumps=3D1 -fal=
ign-loops=3D1 -fno-asynchronous-unwind-tables -fno-jump-tables -fpatchable-=
function-entry=3D64,64 -fno-delete-null-pointer-checks -fno-allow-store-dat=
a-races -fno-reorder-blocks -fno-ipa-cp-clone -fno-partial-inlining -fstack=
-protector-strong -ftrivial-auto-var-init=3Dpattern -fzero-init-padding-bit=
s=3Dall -fno-stack-clash-protection -fzero-call-used-regs=3Dused-gpr -fno-i=
nline-functions-called-once -fmin-function-alignment=3D64 -fstrict-flex-arr=
ays=3D3 -fno-strict-overflow -fstack-check=3Dno -fconserve-stack -fplugin=
=3D./scripts/gcc-plugins/randomize_layout_plugin.so -fplugin=3D./scripts/gc=
c-plugins/latent_entropy_plugin.so -fplugin=3D./scripts/gcc-plugins/stackle=
ak_plugin.so -fplugin-arg-stackleak_plugin-track-min-size=3D100 -fplugin-ar=
g-stackleak_plugin-arch=3Dx86 -fsanitize=3Dkernel-address -fasan-shadow-off=
set=3D0xdffffc0000000000 -fsanitize=3Dbounds-strict -fsanitize=3Dshift -fsa=
nitize=3Dinteger-divide-by-zero -fsanitize=3Dbool -fsanitize=3Denum -fsanit=
ize-coverage=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp --param=3Dasan-inst=
rumentation-with-call-threshold=3D10000 --param=3Dasan-stack=3D1 --param=3D=
asan-instrument-allocas=3D1 --param=3Dasan-globals=3D1 --param=3Dasan-kerne=
l-mem-intrinsic-prefix=3D1 -o - -frandom-seed=3D0 -fdump-noaddr
// Target: x86_64-redhat-linux
// Configured with: ../configure --enable-bootstrap --enable-languages=3Dc,=
c++,fortran,objc,obj-c++,ada,go,d,m2,cobol,lto --prefix=3D/usr --mandir=3D/=
usr/share/man --infodir=3D/usr/share/info --with-bugurl=3Dhttp://bugzilla.r=
edhat.com/bugzilla --enable-shared --enable-threads=3Dposix --enable-checki=
ng=3Drelease --enable-multilib --with-system-zlib --enable-__cxa_atexit --d=
isable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-buil=
d-id --with-gcc-major-version-only --enable-libstdcxx-backtrace --with-libs=
tdcxx-zoneinfo=3D/usr/share/zoneinfo --with-linker-hash-style=3Dgnu --enabl=
e-plugin --enable-initfini-array --with-isl=3D/builddir/build/BUILD/gcc-15.=
0.1-build/gcc-15.0.1-20250329/obj-x86_64-redhat-linux/isl-install --enable-=
offload-targets=3Dnvptx-none,amdgcn-amdhsa --enable-offload-defaulted --wit=
hout-cuda-driver --enable-gnu-indirect-function --enable-cet --with-tune=3D=
generic --with-arch_32=3Di686 --build=3Dx86_64-redhat-linux --with-build-co=
nfig=3Dbootstrap-lto --enable-link-serialization=3D1
// Thread model: posix
// Supported LTO compression algorithms: zlib zstd
// gcc version 15.0.1 20250329 (Red Hat 15.0.1-0) (GCC)
//
// *** WARNING *** there are active plugins, do not report this as a bug un=
less you can reproduce it without enabling any plugins.
// Event                            | Plugins
// PLUGIN_FINISH_TYPE               | randomize_layout_plugin
// PLUGIN_FINISH_DECL               | randomize_layout_plugin
// PLUGIN_ATTRIBUTES                | latent_entropy_plugin randomize_layou=
t_plugin
// PLUGIN_START_UNIT                | latent_entropy_plugin stackleak_plugin
// PLUGIN_ALL_IPA_PASSES_START      | randomize_layout_plugin
// security/landlock/fs.c: In function =E2=80=98hook_file_ioctl_common=E2=
=80=99:
// security/landlock/fs.c:1745:61: internal compiler error: in count_type_e=
lements, at expr.cc:7095
//  1745 |                         .u.op =3D &(struct lsm_ioctlop_audit) {
//       |                                                             ^
// Please submit a full bug report, with preprocessed source.
// See <http://bugzilla.redhat.com/bugzilla> for instructions.

// /usr/libexec/gcc/x86_64-redhat-linux/15/cc1 -quiet -nostdinc -I ./arch/x=
86/include -I ./arch/x86/include/generated -I ./include -I ./include -I ./a=
rch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I ./include/uapi=
 -I ./include/generated/uapi -iplugindir=3D/usr/lib/gcc/x86_64-redhat-linux=
/15/plugin -D __KERNEL__ -D CC_USING_FENTRY -D RANDSTRUCT -D LATENT_ENTROPY=
_PLUGIN -D STACKLEAK_PLUGIN -D KBUILD_MODFILE=3D"security/landlock/landlock=
" -D KBUILD_BASENAME=3D"fs" -D KBUILD_MODNAME=3D"landlock" -D __KBUILD_MODN=
AME=3Dkmod_landlock -include ./include/linux/compiler-version.h -include ./=
include/linux/kconfig.h -include ./include/linux/compiler_types.h -MMD secu=
rity/landlock/.fs.o.d security/landlock/fs.c -iplugindir=3D/usr/lib/gcc/x86=
_64-redhat-linux/15/plugin -quiet -dumpdir security/landlock/ -dumpbase fs.=
c -dumpbase-ext .c -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -mn=
o-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3D3 -mskip-rax-setup =
-march=3Dx86-64 -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel -mstack-pr=
otector-guard-reg=3Dgs -mstack-protector-guard-symbol=3D__ref_stack_chk_gua=
rd -mindirect-branch=3Dthunk-extern -mindirect-branch-register -mindirect-b=
ranch-cs-prefix -mfunction-return=3Dthunk-extern -mharden-sls=3Dall -mrecor=
d-mcount -mfentry -O2 -Werror -Wall -Wundef -Werror=3Dimplicit-function-dec=
laration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prot=
otypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-=
of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger=
-than=3D2048 -Wno-main -Wdangling-pointer=3D0 -Wvla -Wno-pointer-sign -Wcas=
t-function-type -Wstringop-overflow=3D0 -Warray-bounds=3D0 -Walloc-size-lar=
ger-than=3D18446744073709551615EiB -Wimplicit-fallthrough=3D5 -Werror=3Ddat=
e-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wenu=
m-conversion -Wextra -Wunused -Wno-unused-but-set-variable -Wunused-const-v=
ariable=3D0 -Wno-packed-not-aligned -Wformat-overflow=3D0 -Wformat-truncati=
on=3D0 -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initi=
alizers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized=
 -Wno-sign-compare -Wno-unused-parameter -Wno-error=3Dunterminated-string-i=
nitialization -Wno-error=3Dsequence-point -Wno-error=3Dunterminated-string-=
initialization -std=3Dgnu11 -p -fshort-wchar -funsigned-char -fno-common -f=
no-PIE -fno-strict-aliasing -fcf-protection=3Dbranch -falign-jumps=3D1 -fal=
ign-loops=3D1 -fno-asynchronous-unwind-tables -fno-jump-tables -fpatchable-=
function-entry=3D64,64 -fno-delete-null-pointer-checks -fno-allow-store-dat=
a-races -fno-reorder-blocks -fno-ipa-cp-clone -fno-partial-inlining -fstack=
-protector-strong -ftrivial-auto-var-init=3Dpattern -fzero-init-padding-bit=
s=3Dall -fno-stack-clash-protection -fzero-call-used-regs=3Dused-gpr -fno-i=
nline-functions-called-once -fmin-function-alignment=3D64 -fstrict-flex-arr=
ays=3D3 -fno-strict-overflow -fstack-check=3Dno -fconserve-stack -fplugin=
=3D./scripts/gcc-plugins/randomize_layout_plugin.so -fplugin=3D./scripts/gc=
c-plugins/latent_entropy_plugin.so -fplugin=3D./scripts/gcc-plugins/stackle=
ak_plugin.so -fplugin-arg-stackleak_plugin-track-min-size=3D100 -fplugin-ar=
g-stackleak_plugin-arch=3Dx86 -fsanitize=3Dkernel-address -fasan-shadow-off=
set=3D0xdffffc0000000000 -fsanitize=3Dbounds-strict -fsanitize=3Dshift -fsa=
nitize=3Dinteger-divide-by-zero -fsanitize=3Dbool -fsanitize=3Denum -fsanit=
ize-coverage=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp --param=3Dasan-inst=
rumentation-with-call-threshold=3D10000 --param=3Dasan-stack=3D1 --param=3D=
asan-instrument-allocas=3D1 --param=3Dasan-globals=3D1 --param=3Dasan-kerne=
l-mem-intrinsic-prefix=3D1 -o - -frandom-seed=3D0 -fdump-noaddr
// Target: x86_64-redhat-linux
// Configured with: ../configure --enable-bootstrap --enable-languages=3Dc,=
c++,fortran,objc,obj-c++,ada,go,d,m2,cobol,lto --prefix=3D/usr --mandir=3D/=
usr/share/man --infodir=3D/usr/share/info --with-bugurl=3Dhttp://bugzilla.r=
edhat.com/bugzilla --enable-shared --enable-threads=3Dposix --enable-checki=
ng=3Drelease --enable-multilib --with-system-zlib --enable-__cxa_atexit --d=
isable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-buil=
d-id --with-gcc-major-version-only --enable-libstdcxx-backtrace --with-libs=
tdcxx-zoneinfo=3D/usr/share/zoneinfo --with-linker-hash-style=3Dgnu --enabl=
e-plugin --enable-initfini-array --with-isl=3D/builddir/build/BUILD/gcc-15.=
0.1-build/gcc-15.0.1-20250329/obj-x86_64-redhat-linux/isl-install --enable-=
offload-targets=3Dnvptx-none,amdgcn-amdhsa --enable-offload-defaulted --wit=
hout-cuda-driver --enable-gnu-indirect-function --enable-cet --with-tune=3D=
generic --with-arch_32=3Di686 --build=3Dx86_64-redhat-linux --with-build-co=
nfig=3Dbootstrap-lto --enable-link-serialization=3D1
// Thread model: posix
// Supported LTO compression algorithms: zlib zstd
// gcc version 15.0.1 20250329 (Red Hat 15.0.1-0) (GCC)
//
// *** WARNING *** there are active plugins, do not report this as a bug un=
less you can reproduce it without enabling any plugins.
// Event                            | Plugins
// PLUGIN_FINISH_TYPE               | randomize_layout_plugin
// PLUGIN_FINISH_DECL               | randomize_layout_plugin
// PLUGIN_ATTRIBUTES                | latent_entropy_plugin randomize_layou=
t_plugin
// PLUGIN_START_UNIT                | latent_entropy_plugin stackleak_plugin
// PLUGIN_ALL_IPA_PASSES_START      | randomize_layout_plugin
// security/landlock/fs.c: In function =E2=80=98hook_file_ioctl_common=E2=
=80=99:
// security/landlock/fs.c:1745:61: internal compiler error: in count_type_e=
lements, at expr.cc:7095
//  1745 |                         .u.op =3D &(struct lsm_ioctlop_audit) {
//       |                                                             ^
// Please submit a full bug report, with preprocessed source.
// See <http://bugzilla.redhat.com/bugzilla> for instructions.

// /usr/libexec/gcc/x86_64-redhat-linux/15/cc1 -quiet -nostdinc -I ./arch/x=
86/include -I ./arch/x86/include/generated -I ./include -I ./include -I ./a=
rch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I ./include/uapi=
 -I ./include/generated/uapi -iplugindir=3D/usr/lib/gcc/x86_64-redhat-linux=
/15/plugin -D __KERNEL__ -D CC_USING_FENTRY -D RANDSTRUCT -D LATENT_ENTROPY=
_PLUGIN -D STACKLEAK_PLUGIN -D KBUILD_MODFILE=3D"security/landlock/landlock=
" -D KBUILD_BASENAME=3D"fs" -D KBUILD_MODNAME=3D"landlock" -D __KBUILD_MODN=
AME=3Dkmod_landlock -include ./include/linux/compiler-version.h -include ./=
include/linux/kconfig.h -include ./include/linux/compiler_types.h -MMD secu=
rity/landlock/.fs.o.d security/landlock/fs.c -iplugindir=3D/usr/lib/gcc/x86=
_64-redhat-linux/15/plugin -quiet -dumpdir security/landlock/ -dumpbase fs.=
c -dumpbase-ext .c -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -mn=
o-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3D3 -mskip-rax-setup =
-march=3Dx86-64 -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel -mstack-pr=
otector-guard-reg=3Dgs -mstack-protector-guard-symbol=3D__ref_stack_chk_gua=
rd -mindirect-branch=3Dthunk-extern -mindirect-branch-register -mindirect-b=
ranch-cs-prefix -mfunction-return=3Dthunk-extern -mharden-sls=3Dall -mrecor=
d-mcount -mfentry -O2 -Werror -Wall -Wundef -Werror=3Dimplicit-function-dec=
laration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prot=
otypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-=
of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger=
-than=3D2048 -Wno-main -Wdangling-pointer=3D0 -Wvla -Wno-pointer-sign -Wcas=
t-function-type -Wstringop-overflow=3D0 -Warray-bounds=3D0 -Walloc-size-lar=
ger-than=3D18446744073709551615EiB -Wimplicit-fallthrough=3D5 -Werror=3Ddat=
e-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wenu=
m-conversion -Wextra -Wunused -Wno-unused-but-set-variable -Wunused-const-v=
ariable=3D0 -Wno-packed-not-aligned -Wformat-overflow=3D0 -Wformat-truncati=
on=3D0 -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initi=
alizers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized=
 -Wno-sign-compare -Wno-unused-parameter -Wno-error=3Dunterminated-string-i=
nitialization -Wno-error=3Dsequence-point -Wno-error=3Dunterminated-string-=
initialization -std=3Dgnu11 -p -fshort-wchar -funsigned-char -fno-common -f=
no-PIE -fno-strict-aliasing -fcf-protection=3Dbranch -falign-jumps=3D1 -fal=
ign-loops=3D1 -fno-asynchronous-unwind-tables -fno-jump-tables -fpatchable-=
function-entry=3D64,64 -fno-delete-null-pointer-checks -fno-allow-store-dat=
a-races -fno-reorder-blocks -fno-ipa-cp-clone -fno-partial-inlining -fstack=
-protector-strong -ftrivial-auto-var-init=3Dpattern -fzero-init-padding-bit=
s=3Dall -fno-stack-clash-protection -fzero-call-used-regs=3Dused-gpr -fno-i=
nline-functions-called-once -fmin-function-alignment=3D64 -fstrict-flex-arr=
ays=3D3 -fno-strict-overflow -fstack-check=3Dno -fconserve-stack -fplugin=
=3D./scripts/gcc-plugins/randomize_layout_plugin.so -fplugin=3D./scripts/gc=
c-plugins/latent_entropy_plugin.so -fplugin=3D./scripts/gcc-plugins/stackle=
ak_plugin.so -fplugin-arg-stackleak_plugin-track-min-size=3D100 -fplugin-ar=
g-stackleak_plugin-arch=3Dx86 -fsanitize=3Dkernel-address -fasan-shadow-off=
set=3D0xdffffc0000000000 -fsanitize=3Dbounds-strict -fsanitize=3Dshift -fsa=
nitize=3Dinteger-divide-by-zero -fsanitize=3Dbool -fsanitize=3Denum -fsanit=
ize-coverage=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp --param=3Dasan-inst=
rumentation-with-call-threshold=3D10000 --param=3Dasan-stack=3D1 --param=3D=
asan-instrument-allocas=3D1 --param=3Dasan-globals=3D1 --param=3Dasan-kerne=
l-mem-intrinsic-prefix=3D1 -o - -frandom-seed=3D0 -fdump-noaddr
// Target: x86_64-redhat-linux
// Configured with: ../configure --enable-bootstrap --enable-languages=3Dc,=
c++,fortran,objc,obj-c++,ada,go,d,m2,cobol,lto --prefix=3D/usr --mandir=3D/=
usr/share/man --infodir=3D/usr/share/info --with-bugurl=3Dhttp://bugzilla.r=
edhat.com/bugzilla --enable-shared --enable-threads=3Dposix --enable-checki=
ng=3Drelease --enable-multilib --with-system-zlib --enable-__cxa_atexit --d=
isable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-buil=
d-id --with-gcc-major-version-only --enable-libstdcxx-backtrace --with-libs=
tdcxx-zoneinfo=3D/usr/share/zoneinfo --with-linker-hash-style=3Dgnu --enabl=
e-plugin --enable-initfini-array --with-isl=3D/builddir/build/BUILD/gcc-15.=
0.1-build/gcc-15.0.1-20250329/obj-x86_64-redhat-linux/isl-install --enable-=
offload-targets=3Dnvptx-none,amdgcn-amdhsa --enable-offload-defaulted --wit=
hout-cuda-driver --enable-gnu-indirect-function --enable-cet --with-tune=3D=
generic --with-arch_32=3Di686 --build=3Dx86_64-redhat-linux --with-build-co=
nfig=3Dbootstrap-lto --enable-link-serialization=3D1
// Thread model: posix
// Supported LTO compression algorithms: zlib zstd
// gcc version 15.0.1 20250329 (Red Hat 15.0.1-0) (GCC)
//
// *** WARNING *** there are active plugins, do not report this as a bug un=
less you can reproduce it without enabling any plugins.
// Event                            | Plugins
// PLUGIN_FINISH_TYPE               | randomize_layout_plugin
// PLUGIN_FINISH_DECL               | randomize_layout_plugin
// PLUGIN_ATTRIBUTES                | latent_entropy_plugin randomize_layou=
t_plugin
// PLUGIN_START_UNIT                | latent_entropy_plugin stackleak_plugin
// PLUGIN_ALL_IPA_PASSES_START      | randomize_layout_plugin
// security/landlock/fs.c: In function =E2=80=98hook_file_ioctl_common=E2=
=80=99:
// security/landlock/fs.c:1745:61: internal compiler error: in count_type_e=
lements, at expr.cc:7095
//  1745 |                         .u.op =3D &(struct lsm_ioctlop_audit) {
//       |                                                             ^
// Please submit a full bug report, with preprocessed source.
// See <http://bugzilla.redhat.com/bugzilla> for instructions.

// /usr/libexec/gcc/x86_64-redhat-linux/15/cc1 -quiet -nostdinc -I ./arch/x=
86/include -I ./arch/x86/include/generated -I ./include -I ./include -I ./a=
rch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I ./include/uapi=
 -I ./include/generated/uapi -iplugindir=3D/usr/lib/gcc/x86_64-redhat-linux=
/15/plugin -D __KERNEL__ -D CC_USING_FENTRY -D RANDSTRUCT -D LATENT_ENTROPY=
_PLUGIN -D STACKLEAK_PLUGIN -D KBUILD_MODFILE=3D"security/landlock/landlock=
" -D KBUILD_BASENAME=3D"fs" -D KBUILD_MODNAME=3D"landlock" -D __KBUILD_MODN=
AME=3Dkmod_landlock -include ./include/linux/compiler-version.h -include ./=
include/linux/kconfig.h -include ./include/linux/compiler_types.h -MMD secu=
rity/landlock/.fs.o.d security/landlock/fs.c -iplugindir=3D/usr/lib/gcc/x86=
_64-redhat-linux/15/plugin -quiet -dumpdir security/landlock/ -dumpbase fs.=
c -dumpbase-ext .c -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -mn=
o-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3D3 -mskip-rax-setup =
-march=3Dx86-64 -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel -mstack-pr=
otector-guard-reg=3Dgs -mstack-protector-guard-symbol=3D__ref_stack_chk_gua=
rd -mindirect-branch=3Dthunk-extern -mindirect-branch-register -mindirect-b=
ranch-cs-prefix -mfunction-return=3Dthunk-extern -mharden-sls=3Dall -mrecor=
d-mcount -mfentry -O2 -Werror -Wall -Wundef -Werror=3Dimplicit-function-dec=
laration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prot=
otypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-=
of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger=
-than=3D2048 -Wno-main -Wdangling-pointer=3D0 -Wvla -Wno-pointer-sign -Wcas=
t-function-type -Wstringop-overflow=3D0 -Warray-bounds=3D0 -Walloc-size-lar=
ger-than=3D18446744073709551615EiB -Wimplicit-fallthrough=3D5 -Werror=3Ddat=
e-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wenu=
m-conversion -Wextra -Wunused -Wno-unused-but-set-variable -Wunused-const-v=
ariable=3D0 -Wno-packed-not-aligned -Wformat-overflow=3D0 -Wformat-truncati=
on=3D0 -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initi=
alizers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized=
 -Wno-sign-compare -Wno-unused-parameter -Wno-error=3Dunterminated-string-i=
nitialization -Wno-error=3Dsequence-point -Wno-error=3Dunterminated-string-=
initialization -std=3Dgnu11 -p -fshort-wchar -funsigned-char -fno-common -f=
no-PIE -fno-strict-aliasing -fcf-protection=3Dbranch -falign-jumps=3D1 -fal=
ign-loops=3D1 -fno-asynchronous-unwind-tables -fno-jump-tables -fpatchable-=
function-entry=3D64,64 -fno-delete-null-pointer-checks -fno-allow-store-dat=
a-races -fno-reorder-blocks -fno-ipa-cp-clone -fno-partial-inlining -fstack=
-protector-strong -ftrivial-auto-var-init=3Dpattern -fzero-init-padding-bit=
s=3Dall -fno-stack-clash-protection -fzero-call-used-regs=3Dused-gpr -fno-i=
nline-functions-called-once -fmin-function-alignment=3D64 -fstrict-flex-arr=
ays=3D3 -fno-strict-overflow -fstack-check=3Dno -fconserve-stack -fplugin=
=3D./scripts/gcc-plugins/randomize_layout_plugin.so -fplugin=3D./scripts/gc=
c-plugins/latent_entropy_plugin.so -fplugin=3D./scripts/gcc-plugins/stackle=
ak_plugin.so -fplugin-arg-stackleak_plugin-track-min-size=3D100 -fplugin-ar=
g-stackleak_plugin-arch=3Dx86 -fsanitize=3Dkernel-address -fasan-shadow-off=
set=3D0xdffffc0000000000 -fsanitize=3Dbounds-strict -fsanitize=3Dshift -fsa=
nitize=3Dinteger-divide-by-zero -fsanitize=3Dbool -fsanitize=3Denum -fsanit=
ize-coverage=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp --param=3Dasan-inst=
rumentation-with-call-threshold=3D10000 --param=3Dasan-stack=3D1 --param=3D=
asan-instrument-allocas=3D1 --param=3Dasan-globals=3D1 --param=3Dasan-kerne=
l-mem-intrinsic-prefix=3D1 -o - -frandom-seed=3D0 -fdump-noaddr

=2E...

Dave
--=20
 -----Open up your eyes, open up your mind, open up your code -------  =20
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \=20
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
