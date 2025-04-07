Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3019E20966B;
	Mon,  7 Apr 2025 23:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744067098; cv=none; b=BQLYOYGaALGb0sN5wV2eIYri6BCkb3haTa/brwGtg4MHSNCaGgUDS+n354NF8TWTlyKae8fORpugHgw+S0PVo9T7Z1o4quZElOZHIrDB1xdjxU4shAfmAtPz5aYSlo3rzlO3skynZxWbELDIFzKNHnFlL3VQiZeHELS2qwOVUrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744067098; c=relaxed/simple;
	bh=0zaMJuW2E2sX2GTgnWPvgAAilohNggh6HJKl9fIlzHE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MLOC5nUUWhi6/R3nXgDHtdR1uB95NGFUW0CeUDhMkOYsCKvmUwEFnxQSAyB+t98/Ug0GkmRj/V7nwq2cUk+iMxIfplyekXYG+9KZklLOiCyvgfx5rUk8bjcmPolc67jc72B4napkHKBf4ogZorrs8RpsFP6CP3LnNBsltKQTsq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=lLkhpptg; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="lLkhpptg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744067088; x=1744326288;
	bh=0zaMJuW2E2sX2GTgnWPvgAAilohNggh6HJKl9fIlzHE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=lLkhpptgkYKd2q6rpOEbE5VGo/V+n50UjQgv72FwAgmU5nDsHcmcHpv1KzL1+7jQI
	 buGrXQqOY6FuPFTPqSOpBl4qqsinu/lWOV3JMTvRc+4oItCZWl+SOmGue8gPjrzxu/
	 xyRjLRw505GapDMbWj//8IXtGda5gMdwgATO7WMf+Dtnu23zNGIwKKIjTHQ+nfB6ZV
	 OjkyiArjc6H8UYtByPa3cnVFPv4Ry+L1xy+pdAJxt6nfFdilvepuzKwb7kPBR8EYsV
	 vYG+qO22LmFvlqvlQcoe390M4W2ijbSzvuz7HeOTI3tZLPqkiY2C37WXE8/BGrMSIc
	 yWJLC8GEkIsDQ==
Date: Mon, 07 Apr 2025 23:04:42 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Denis Mukhin <dmukhin@ford.com>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] x86/early_printk: add MMIO-based UARTs
Message-ID: <vCbvBjUt9kPZhYP0tXAoVKrIn5hk5ON-HEqi2OjnCECThGJ73vh7S4qAKspAlxtgBAHFv1Sc_k6Hmdeq_nYXReITCt2FNRy1wWZR-udke9c=@proton.me>
In-Reply-To: <Z_P_nWrl4JQJVy2c@black.fi.intel.com>
References: <20250324-earlyprintk-v3-1-aee7421dc469@ford.com> <Z_P_nWrl4JQJVy2c@black.fi.intel.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 364800189e164472cd92cc200173e0051292a8cd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

On Monday, April 7th, 2025 at 9:38 AM, Andy Shevchenko <andriy.shevchenko@i=
ntel.com> wrote:

>=20
>=20
> On Mon, Mar 24, 2025 at 05:55:40PM -0700, Denis Mukhin wrote:
>=20
> > During the bring-up of an x86 board, the kernel was crashing before
> > reaching the platform's console driver because of a bug in the firmware=
,
> > leaving no trace of the boot progress.
> >=20
> > It was discovered that the only available method to debug the kernel
> > boot process was via the platform's MMIO-based UART, as the board lacke=
d
> > an I/O port-based UART, PCI UART, or functional video output.
> >=20
> > Then it turned out that earlyprintk=3D does not have a knob to configur=
e
> > the MMIO-mapped UART.
> >=20
> > Extend the early printk facility to support platform MMIO-based UARTs
> > on x86 systems, enabling debugging during the system bring-up phase.
> >=20
> > The command line syntax to enable platform MMIO-based UART is:
> > earlyprintk=3Dmmio,membase[,{nocfg|baudrate}][,keep]
> >=20
> > Note, the change does not integrate MMIO-based UART support to:
> > arch/x86/boot/early_serial_console.c
> >=20
> > Also, update kernel parameters documentation with the new syntax and
> > add missing 'nocfg' setting to PCI serial cards description.
>=20
>=20
> Just for your information: Have you seen this rather old series of mine?
>=20
> https://bitbucket.org/andy-shev/linux/commits/branch/topic%2Fx86%2Fboot-e=
arlyprintk

This is a nice cleanup!
Thanks for sharing.

Sorry, I haven't seen the series above, I had to write a patch (which was m=
onths ago).
It's just I could not post it on the mailing list until recently.

>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

Thanks,
Denis
