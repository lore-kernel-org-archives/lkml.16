Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B72AE86
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744145178; cv=none; b=JmaHm7Texe8V+vdqjrwEPqakqFwixWYchlC3x868BRq2B6mJgqnClRl9AovgxW40t99NSLXaMopuD6Ty7LNbLe4JFGIwwqhHAXpi3y6wKJy8feNDapnmg8MGS2jUKXIEiVep8CDLoVG/lAvFdNZ9FAy3FEIb4O1II4tRyEAyj9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744145178; c=relaxed/simple;
	bh=93eT2rpamlxVc6aFa/l0LJNv4i5WbwKqNk2fS+xc8CA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cLlV83o5ANNxfdTgrhuEOK5IzyRCCLN0vIDRr+STehxs77bHLdM3Qstz+2abtyOgUnWsTnnjzaq5A8WHZD/tddqNz4RQu7H5DCoCbCfyxm6EqmTv+FwijUlCtKk9dGQibX75AvvAMomGsYHUcWwil0ouELtcErmIb0U/1/mlLdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=I9cDpkoL; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="I9cDpkoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744145170; x=1744404370;
	bh=YYLiZ0LCn/fJYeBcV4Bc2RbLDA4OTOnCGSvl/4wo+9M=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=I9cDpkoLAszJNlLR0vodgu/FnX+lm+1HD0KgITHUevObv1p1/UIDHDe2L7YsEAAtR
	 XKSmcGkUI5btNWBZn1LdAWzdzsay3ERVFSIXsxWxomonds/9+QdXKuEBXoZ+dNiXcN
	 EqyNxNz9gGR/lKx1I+EXeSh3sjCTb1mEIDP5G5E7bi77wkhdhxMR83RCeqJJw8jet4
	 WzBtAkzjcDWjwC88UlWWierMgKyEsal/jMKcVGJzLqkR/ktaxrM8p9rzkWLTLf/mlf
	 IG5rQL+MxGvRU+6ZuXC4nrQnVpNO+kULIbi1itf/fz9xUKi53m5/VPVQCBATDDWtpw
	 5rcSfz3X9qrSg==
Date: Tue, 08 Apr 2025 20:46:05 +0000
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
From: dmkhn@proton.me
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v1 1/1] x86/early_printk: Use 'mmio32' for consistency
Message-ID: <Z/WLCdZlg4sebQ6i@kraken>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 43a1fb498a3fc80da4fbec0bfdaa7fba09367345
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 08:22:14PM +0300, Andy Shevchenko wrote:
> First of all, using 'mmio' prevents proper implementation of 8-bit access=
ors.
> Second, it's simply inconsistent with uart8250 set of options. Rename it =
to
> 'mmio32'. While at it, remove rather misleading comment in the documentat=
ion.
> >From now on mmio32 is self-explanatory and pciserial supports not only 3=
2-bit
> MMIO accessors.
>=20
> Fixes: 3181424aeac2 ("x86/early_printk: Add support for MMIO-based UARTs"=
)
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 +----
>  arch/x86/kernel/early_printk.c                  | 6 +++---
>  2 files changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 76e538c77e31..d9fd26b95b34 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1407,18 +1407,15 @@
>  =09=09=09earlyprintk=3Dserial[,0x...[,baudrate]]
>  =09=09=09earlyprintk=3DttySn[,baudrate]
>  =09=09=09earlyprintk=3Ddbgp[debugController#]
> +=09=09=09earlyprintk=3Dmmio32,membase[,{nocfg|baudrate}]
>  =09=09=09earlyprintk=3Dpciserial[,force],bus:device.function[,{nocfg|bau=
drate}]
>  =09=09=09earlyprintk=3Dxdbc[xhciController#]
>  =09=09=09earlyprintk=3Dbios
> -=09=09=09earlyprintk=3Dmmio,membase[,{nocfg|baudrate}]
> =20
>  =09=09=09earlyprintk is useful when the kernel crashes before
>  =09=09=09the normal console is initialized. It is not enabled by
>  =09=09=09default because it has some cosmetic problems.
> =20
> -=09=09=09Only 32-bit memory addresses are supported for "mmio"
> -=09=09=09and "pciserial" devices.
> -
>  =09=09=09Use "nocfg" to skip UART configuration, assume
>  =09=09=09BIOS/firmware has configured UART correctly.
> =20
> diff --git a/arch/x86/kernel/early_printk.c b/arch/x86/kernel/early_print=
k.c
> index b70e6e99fb17..dc053641698c 100644
> --- a/arch/x86/kernel/early_printk.c
> +++ b/arch/x86/kernel/early_printk.c
> @@ -424,10 +424,10 @@ static int __init setup_early_printk(char *buf)
>  =09keep =3D (strstr(buf, "keep") !=3D NULL);
> =20
>  =09while (*buf !=3D '\0') {
> -=09=09if (!strncmp(buf, "mmio", 4)) {
> -=09=09=09early_mmio_serial_init(buf + 4);
> +=09=09if (!strncmp(buf, "mmio32", 6)) {
> +=09=09=09buf +=3D 6;
> +=09=09=09early_mmio_serial_init(buf);
>  =09=09=09early_console_register(&early_serial_console, keep);
> -=09=09=09buf +=3D 4;
>  =09=09}
>  =09=09if (!strncmp(buf, "serial", 6)) {
>  =09=09=09buf +=3D 6;
> --=20
> 2.47.2
>=20

