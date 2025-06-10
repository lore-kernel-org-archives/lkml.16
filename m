Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B92110
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749526744; cv=none; b=gprpeEwKpNfZK8KqwxgbDj7Cqv6tAtmacJ/8/dq1cEdymQX7tRXGruQuiNvbMd/CSDW3UwsoSId8Kay2RLnPJkdFGLpvNiNfu2UdAd0njVA7bMdSMP7bPejA6b89I5FpilQk1iCeioR4r7JfY2fuxbbK3l3jQCnAtl1qS8AqOPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749526744; c=relaxed/simple;
	bh=QBsN9aRzLar18xcpY479uw6b/K1jpWLDYWaJZiGj01M=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=LXO6w+mAo7EDvPYx3hsQAE2f+ei/o1FUdSCGWL5Yydh6vpg8ZlrVX9o4vOlPrV7x+VCiSxwuqFbM6ocSJY+S/I/6gxDQpI9U7hhbr4NC8DkLZy4f66ndHoowYbnUt3EiVHgYhEWBzQWn4aV3g+SJpiedM9498AM1iZpMp8j4Yac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Y36GP6s1; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Y36GP6s1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749526725; x=1749785925;
	bh=QBsN9aRzLar18xcpY479uw6b/K1jpWLDYWaJZiGj01M=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Y36GP6s13mDZhGByYKCjAbojJI2QZ1Xn7gKh6CS9px+KAVL3kP4t9QP8yUZsDxxgM
	 Q26kBPtAmsxsV4eSSBcSfjLH5aIg9rUGVX5lagz9DEk1gOd6J8YWQfDQmRDgYWoGL2
	 g76gGqiAzd8BQ714we+kMUCKgoX9yhhrgy2pWYoj16dRQYKhaqTOcHzI+6uNCSSt8p
	 OQ0NI2BXWgY/deZLIEXqvATZdwOCrCiOjshZjGL5hhMGl71SiRcovs2WjxAwrKSuqO
	 8Ss4xeWL2xTsR6Rut8XcXobHOMWLq4FfWohReEqjJsrPj7WhGmQCs7EzAgqySSb1kM
	 Kn1aSHjuJ4rZg==
Date: Tue, 10 Jun 2025 03:38:39 +0000
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: TheComputerGuy <rosscomputerguy@proton.me>
Subject: PROBLEM: VMU driver fails to compile in 6.12.32
Message-ID: <zuZBGnW2fdIaA_VWDHq0rHzzxfyAt-imVmN8LoVry5hU1U_Yr41geYn7f2Edk8jB6cAUDsUknMjbnXUFPdcykyG_QVezsIriBeN5NO5drlo=@proton.me>
Feedback-ID: 45257341:user:proton
X-Pm-Message-ID: 2cb4bc5d92bcb8e570f2f25077abde776ba36ab7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When compiling kernel 6.12.32 with GCC 14 and utilizing the "dreamcast_defc=
onfig", I noticed the "drivers/mtd/maps/vmu-flash.c" file fails to compile.=
 The error is:
In file included from ../drivers/mtd/maps/vmu-flash.c:12:../include/linux/m=
aple.h:80:23: error: field 'dev' has incomplete type
=C2=A0 =C2=A080 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device dev;
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~
../include/linux/maple.h:85:30: error: field 'drv' has incomplete type
=C2=A0 =C2=A085 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_driver drv;
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~
In file included from ../include/linux/init.h:5,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../drive=
rs/mtd/maps/vmu-flash.c:8:
../drivers/mtd/maps/vmu-flash.c: In function 'probe_maple_vmu':
./../include/linux/compiler_types.h:477:27: error: expression in static ass=
ertion is not an integer
=C2=A0 477 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(=
a), typeof(b))
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_=
assert'
=C2=A0 =C2=A078 | #define __static_assert(expr, msg, ...) _Static_assert(ex=
pr, msg)
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_a=
ssert'
=C2=A0 =C2=A020 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 static_assert(__same_type(*(p=
tr), ((type *)0)->member) || =C2=A0 =C2=A0 =C2=A0 \
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_=
type'
=C2=A0 =C2=A020 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 static_assert(__same_type(*(p=
tr), ((type *)0)->member) || =C2=A0 =C2=A0 =C2=A0 \
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~
../include/linux/maple.h:99:25: note: in expansion of macro 'container_of'
=C2=A0 =C2=A099 | #define to_maple_dev(n) container_of(n, struct maple_devi=
ce, dev)
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~
../drivers/mtd/maps/vmu-flash.c:775:37: note: in expansion of macro 'to_map=
le_dev'
=C2=A0 775 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct maple_device *mdev =3D to_m=
aple_dev(dev);
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^~~~~~~~~~~~
./../include/linux/compiler_types.h:477:27: error: expression in static ass=
ertion is not an integer
=C2=A0 477 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(=
a), typeof(b))
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_=
assert'
=C2=A0 =C2=A078 | #define __static_assert(expr, msg, ...) _Static_assert(ex=
pr, msg)=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_a=
ssert'
=C2=A0 =C2=A020 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 static_assert(__same_type(*(p=
tr), ((type *)0)->member) || =C2=A0 =C2=A0 =C2=A0 \
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_=
type'
=C2=A0 =C2=A020 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 static_assert(__same_type(*(p=
tr), ((type *)0)->member) || =C2=A0 =C2=A0 =C2=A0 \
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~
../include/linux/container_of.h:34:56: note: in expansion of macro 'contain=
er_of'
=C2=A0 =C2=A034 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const typeof(*(ptr)) *: ((const type *)container_of(ptr, type, member))=
,\
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^~~~~~~~~~~~
../include/linux/maple.h:100:28: note: in expansion of macro 'container_of_=
const'
=C2=A0 100 | #define to_maple_driver(n) container_of_const(n, struct maple_=
driver, drv)
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~
../drivers/mtd/maps/vmu-flash.c:776:37: note: in expansion of macro 'to_map=
le_driver'
=C2=A0 776 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct maple_driver *mdrv =3D to_m=
aple_driver(dev->driver);
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^~~~~~~~~~~~~~~
../drivers/mtd/maps/vmu-flash.c: In function 'remove_maple_vmu':
./../include/linux/compiler_types.h:477:27: error: expression in static ass=
ertion is not an integer
=C2=A0 477 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(=
a), typeof(b))
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_=
assert'
=C2=A0 =C2=A078 | #define __static_assert(expr, msg, ...) _Static_assert(ex=
pr, msg)
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_a=
ssert'
=C2=A0 =C2=A020 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 static_assert(__same_type(*(p=
tr), ((type *)0)->member) || =C2=A0 =C2=A0 =C2=A0 \
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_=
type'
=C2=A0 =C2=A020 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 static_assert(__same_type(*(p=
tr), ((type *)0)->member) || =C2=A0 =C2=A0 =C2=A0 \
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~
../include/linux/maple.h:99:25: note: in expansion of macro 'container_of'
=C2=A0 =C2=A099 | #define to_maple_dev(n) container_of(n, struct maple_devi=
ce, dev)
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~
../drivers/mtd/maps/vmu-flash.c:787:37: note: in expansion of macro 'to_map=
le_dev'
=C2=A0 787 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct maple_device *mdev =3D to_m=
aple_dev(dev);
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^~~~~~~~~~~~
make[5]: *** [../scripts/Makefile.build:229: drivers/mtd/maps/vmu-flash.o] =
Error 1
make[4]: *** [../scripts/Makefile.build:478: drivers/mtd/maps] Error 2
make[3]: *** [../scripts/Makefile.build:478: drivers/mtd] Error 2
make[3]: *** Waiting for unfinished jobs....
../drivers/atm/eni.c:161:13: error: conflicting types for 'dump_mem'; have =
'void(struct eni_dev *)'=C2=A0 161 | static void dump_mem(struct eni_dev *e=
ni_dev)
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~
In file included from ../include/linux/kdebug.h:5,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../arch/=
sh/include/asm/hw_breakpoint.h:9,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../arch/=
sh/include/asm/processor_32.h:16,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../arch/=
sh/include/asm/processor.h:173,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../arch/=
sh/include/asm/thread_info.h:25,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../inclu=
de/linux/thread_info.h:60,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../inclu=
de/asm-generic/preempt.h:5,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ./arch/s=
h/include/generated/asm/preempt.h:1,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../inclu=
de/linux/preempt.h:79,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../inclu=
de/linux/spinlock.h:56,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../inclu=
de/linux/mmzone.h:8,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../inclu=
de/linux/gfp.h:7,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../inclu=
de/linux/umh.h:4,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../inclu=
de/linux/kmod.h:9,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../inclu=
de/linux/module.h:17,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../drive=
rs/atm/eni.c:7:
../arch/sh/include/asm/kdebug.h:16:13: note: previous declaration of 'dump_=
mem' with type 'void(const char *, const char *, long unsigned int, =C2=
=A0long unsigned int)'
=C2=A0 =C2=A016 | extern void dump_mem(const char *str, const char *loglvl,
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~
make[4]: *** [../scripts/Makefile.build:229: drivers/atm/eni.o] Error 1
make[3]: *** [../scripts/Makefile.build:478: drivers/atm] Error 2
make[2]: *** [../scripts/Makefile.build:478: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
tar: Substituting -9223372036854775807 for unknown date format '1980\345\27=
1\264 =C2=A01\346\234\210 =C2=A01\346\227\245 \347\201\253\346\233\234\346\=
227\245 00:00:00 UTC'
=C2=A0 CC [M] =C2=A0kernel/kheaders.o
make[1]: *** [/home/ross/nixpkgs/linux-6.12.32/Makefile:1945: .] Error 2
make: *** [../Makefile:224: __sub-make] Error 2
