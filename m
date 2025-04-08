Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A5F21A931;
	Tue,  8 Apr 2025 21:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744146212; cv=none; b=JbM4ZjIVJ64d9Mny9eBYFE3PYWOQ5W2FxhcoD1iiMPXDk82flk/scOa9NRzP19sijb0GxXdyF+bKPxYqIvFqlXcpNtBPAmK145WyM+oCgxozfAjQjGbYGC3JmjL5iEZ4oxvlxkbmB07fZzc5tLGdpX79Ah+U64651Uea3D/hDiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744146212; c=relaxed/simple;
	bh=Wq3W0M2VlHnlbSxMjcii3adXzOLAf0O2t7RB/QODDxE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iBzTZltWBdYnoODJ6DAtN3Zr7yuelxIpZ96Zs9kb6+EncX26ZrthqwFf5fwGjSBOGLVEQjDFbWnYOgJyHJQiYt8uRmzN73w8x/TkMC1I2cXakX1ddL2rJnFjOAapiARTeMw+B51OPRgUWk2GtQ+23sD/xP5s74y4GkddLQfTWso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Jx/Y8b7V; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Jx/Y8b7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744146206; x=1744405406;
	bh=Wq3W0M2VlHnlbSxMjcii3adXzOLAf0O2t7RB/QODDxE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Jx/Y8b7V2ifyIm2eDWpQKqvGeoJj9oy4v2TcbFPId0qAxXQYUnNW591TEXEsHrcaE
	 8JiH00HKM7z7ZQaJzh8u+OHh9haayC7jvRC4L6hUQuLxoaTSSETk7hEGMcPp1Mhjyr
	 AW/x7qQWa13kt7/4Of2C/o6ba41iqdXf7WUJp0SVbZWw4pT4/fCBmiWSSADErpOpvN
	 ms8nhItIM50EOArZB/J2wdQ9XHn/xQEluXImssSWx+18DtJd3SMTwlZw8r4Y0TmDg+
	 xxZNNRBEQtZ2MzdW7uMzGq6QPpJBZDWDEbLhjlx/bIbdugB8rv3EeLqOQ+Gp7QwHhZ
	 47OfZAkoICscQ==
Date: Tue, 08 Apr 2025 21:03:21 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Denis Mukhin <dmukhin@ford.com>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] x86/early_printk: add MMIO-based UARTs
Message-ID: <RJ2PbXLplu84G37UUGMyfrvfTrrh5CY5_M6ArUI_eJIl_59Ty7Mqbp4GxJXRd-pjdBuRpqlDy7hak2tcCebae3_lpTqcsrPm-Qpjq4G4wTY=@proton.me>
In-Reply-To: <Z_TeiDVh50u7OhIw@smile.fi.intel.com>
References: <20250324-earlyprintk-v3-1-aee7421dc469@ford.com> <Z_P_nWrl4JQJVy2c@black.fi.intel.com> <vCbvBjUt9kPZhYP0tXAoVKrIn5hk5ON-HEqi2OjnCECThGJ73vh7S4qAKspAlxtgBAHFv1Sc_k6Hmdeq_nYXReITCt2FNRy1wWZR-udke9c=@proton.me> <Z_TeiDVh50u7OhIw@smile.fi.intel.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3a73dae1dd9e52f60a2fd7d2691e708379e9dfb3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, April 8th, 2025 at 1:30 AM, Andy Shevchenko <andriy.shevchenko@=
intel.com> wrote:

>=20
>=20
> On Mon, Apr 07, 2025 at 11:04:42PM +0000, Denis Mukhin wrote:
>=20
> > On Monday, April 7th, 2025 at 9:38 AM, Andy Shevchenko andriy.shevchenk=
o@intel.com wrote:
> >=20
> > > On Mon, Mar 24, 2025 at 05:55:40PM -0700, Denis Mukhin wrote:
>=20
> > > > During the bring-up of an x86 board, the kernel was crashing before
> > > > reaching the platform's console driver because of a bug in the firm=
ware,
> > > > leaving no trace of the boot progress.
> > > >=20
> > > > It was discovered that the only available method to debug the kerne=
l
> > > > boot process was via the platform's MMIO-based UART, as the board l=
acked
> > > > an I/O port-based UART, PCI UART, or functional video output.
> > > >=20
> > > > Then it turned out that earlyprintk=3D does not have a knob to conf=
igure
> > > > the MMIO-mapped UART.
> > > >=20
> > > > Extend the early printk facility to support platform MMIO-based UAR=
Ts
> > > > on x86 systems, enabling debugging during the system bring-up phase=
.
> > > >=20
> > > > The command line syntax to enable platform MMIO-based UART is:
> > > > earlyprintk=3Dmmio,membase[,{nocfg|baudrate}][,keep]
> > > >=20
> > > > Note, the change does not integrate MMIO-based UART support to:
> > > > arch/x86/boot/early_serial_console.c
> > > >=20
> > > > Also, update kernel parameters documentation with the new syntax an=
d
> > > > add missing 'nocfg' setting to PCI serial cards description.
> > >=20
> > > Just for your information: Have you seen this rather old series of mi=
ne?
> > >=20
> > > https://bitbucket.org/andy-shev/linux/commits/branch/topic%2Fx86%2Fbo=
ot-earlyprintk
> >=20
> > This is a nice cleanup!
> > Thanks for sharing.
> >=20
> > Sorry, I haven't seen the series above, I had to write a patch (which w=
as months ago).
> > It's just I could not post it on the mailing list until recently.
>=20
>=20
> No problem. Can you look at
> https://lore.kernel.org/r/20250407172214.792745-1-andriy.shevchenko@linux=
.intel.com
> ? I forgot to Cc you and that is an important fix.

Done, thanks!

>=20
> --
> With Best Regards,
> Andy Shevchenko
