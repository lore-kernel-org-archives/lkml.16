Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDEC24BCFD;
	Mon, 10 Feb 2025 20:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739218918; cv=none; b=VyP9Gc4xDqiHrzr3/jPwLw1oEKJD7Afd9ik+Yc9qV6OKoNNUYxDFD+lNMTYaoW3X6lP4eL6PdElOHlmn4+2q6mJ7mUYt1UooG3MffSA/AZxLsbAZtNaar4u3rdANT+oOWhQcorLPmv5TJfRbnaAfe0r6OZrfmFk7l23iqxQ67pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739218918; c=relaxed/simple;
	bh=lz/51CgZ1d+ILEEYeJZZz1FEq8ZInoxxrovk7VZ4MYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwN23drovUljyiN7q5VwsstB/X/0Pcmkq+lTnNzdQHrycQXvS3D2WxMEXGvKUwXEygL2/6VTYj3KVQRrp7rvLd+zkfW2c2U1iFf3f3V61+a5UEXm+OMW9YwXvfaqF9VQZCBN2nTAMvwECjmdW8Yz1krWg0fH+954xDWixvP0PRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZgeWiWx; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZgeWiWx"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de3c29e9b3so6808776a12.3;
        Mon, 10 Feb 2025 12:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739218915; x=1739823715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4sLNT213axJxn+dDv5vnFAweh0CD8D88x6yQTKzvk0=;
        b=RZgeWiWxeMXewRhQr717MfSvznboh9EqB1jKjQDlI4dHx1MGY13TwC6gQ4opM3xZSC
         EDrX1T0WnWLwP5KNzJmIXES0G8FYvQj8z26l9BRIsseSnGS8fao+OlnNEblT7lHeHtER
         2MgtYx2oEeaPrhddNsCRwOOyAQnEqbuEmrjU0uUl+ZmiHqzy5wy6DyuFp1M6Yo9erTVg
         6SO3wOcvcuEzM3H8TpiU86wfDDTUYkuR+pHIdTn1Wm9Va3vpnSUoRZpQfJcWTbroU9i4
         Z98LUQ+VOndfRmwfNfOrEo/Mjv2BNO0exT7YMUCnazZxF8bWKaYGK2nVYIKbtbc2E09J
         /9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739218915; x=1739823715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4sLNT213axJxn+dDv5vnFAweh0CD8D88x6yQTKzvk0=;
        b=vnMM5lqMYF9OujQva0w6H9H8VkyEQIcZIRJY1O6T4G1aESTD1Yz+55yGbgpaKji21T
         ekH3An2XFDAf5vRBqMZoSTCuL35Ijv5POAWWUA+ryA09IwGMss+2Qs9w9LoX3e9GGVnf
         TRvO+BZJ5mDaB6x43LRQvvG4FE2c94lE5oZgWKntQZYn4ITL6MGU0FMX6NsaM5YWocvZ
         K0zTEBxaWVb2LoOC96PB8CrXBctPn2PMebocrH2Ml2rIXXvBTaz3WWX7GHR755bhQnP2
         5tLRaHSrlo9mT4Alb+bC6Qg7uADFXFPN0H5H7wmmcxa39RcPrbChO1vrUlBRHF1DWsN0
         r7Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWxhnU7e6ouRWx0UzUKHuEFafYEKaeZQXGruISHjTKDlwz4AlUPqLA7fbIaXQhW4Krwp0E3UzL5c0g=@vger.kernel.org, AJvYcCXlkH0FAIydloyAzW3nFiN9Cco6dNa4bYQNFxcxSnVw69gRqdGPwtu9J85Uv+VJM2SkZ2m3QU3NyO2cWAab@vger.kernel.org
X-Gm-Message-State: AOJu0YxghE6OAahvy06yaUy5pgDO6giSHjelpLgj8OAAlN8zNuYTlHPp
	+uL7u/mwKiZ9fAMZV9S+J/0Oll+ET8rVCB1X8A9FQ664dDqvCpm2f2BUZJzAdxpfhHe9jVd3KOW
	FGPg54ajsmXDq6xdSnpvVIx2/SXc=
X-Gm-Gg: ASbGnctY+PjzZfwZFlzRRDTMzyLCDZCHNwiRgE70kMNSvGPqW5p8MsqeMZgfUH4mHCe
	AXQGA2aVhQKlRQhg8GgG+yQ996JtlTpRg+PVt1y25V17l2EizC43vhKjzZZ86zUUhqwJE517Z
X-Google-Smtp-Source: AGHT+IEl6YEdiMsV1siZuJFhvx+GV4aMBPQlTUgyzGO6T4MZCuQCTLQqmVBt/VwazPwINTGGAJT/LjEuNEnQVRVAyjo=
X-Received: by 2002:a05:6402:1ccd:b0:5dc:cf9b:b034 with SMTP id
 4fb4d7f45d1cf-5de45027e45mr18280024a12.14.1739218914664; Mon, 10 Feb 2025
 12:21:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209183142.97671-1-simons.philippe@gmail.com> <20250210140536.08c33a56@donnerap.manchester.arm.com>
In-Reply-To: <20250210140536.08c33a56@donnerap.manchester.arm.com>
From: Philippe Simons <simons.philippe@gmail.com>
Date: Mon, 10 Feb 2025 21:21:43 +0100
X-Gm-Features: AWEUYZnldiVDFzt0NbkyDKPipNGBHw1BkJcirqj-jzPHbdnyqlosJKOqWcw-jHs
Message-ID: <CADomA4-BuTtGva+MhcfZzeidsHr9pe6sibFYz97b-5of+0ucRw@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: h616: Reparent GPU clock during frequency changes
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 3:05=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Sun,  9 Feb 2025 19:31:42 +0100
> Philippe Simons <simons.philippe@gmail.com> wrote:
>
> Hi Philippe,
>
> thanks for bringing this patch together!
>
> You should mention here *why* you want this patch, the motivation seems t=
o
> be missing, but would be crucial - and preventing a sure crash should mak=
e
> this a no-brainer.
>
> Maybe start with: The H616 manual does not state that the GPU PLL support=
s
> dynamic frequency configuration, so we must take extra care when changing
> the frequency. Currently any attempt to do device DVFS on the GPU lead ..=
.
>
> Then mention that the manual describes the algorithm for changing the PLL
> frequency, which the CPU PLL notifier code already support, so we reuse
> that.
>
> > Re-parent the GPU clock during frequency changes of the PLL.
> > Also it asks to disable and then re-enable the PLL lock bit,
> > after the factor changes have been applied.
> >
> > Add clock notifiers for the PLL and the GPU mux clock, using the existi=
ng
> > notifier callbacks, and tell them to use mux 1 (the GPU_CLK1 source),
> > and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
> > correct algorithms.
> >
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 33 +++++++++++++++++++++++++-
> >  1 file changed, 32 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi=
-ng/ccu-sun50i-h616.c
> > index 190816c35..e88eefa24 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > @@ -328,10 +328,12 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0"=
, gpu0_parents, 0x670,
> >                                      24, 1,   /* mux */
> >                                      BIT(31), /* gate */
> >                                      CLK_SET_RATE_PARENT);
> > +
> > +#define SUN50I_H616_GPU_CLK1_REG        0x674
> >  static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674=
,
> >                                       0, 2,   /* M */
> >                                       BIT(31),/* gate */
> > -                                     0);
> > +                                     CLK_IS_CRITICAL);
>
> The addition of CLK_IS_CRITICAL deserves a comment, something about that
> this clock is needed as a temporary fallback clock for the PLL frequency
> changes or so.
>
> >  static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
> >                     0x67c, BIT(0), 0);
> > @@ -1120,6 +1122,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb =
=3D {
> >       .lock           =3D BIT(28),
> >  };
> >
> > +static struct ccu_mux_nb sun50i_h616_gpu_nb =3D {
> > +     .common         =3D &gpu0_clk.common,
> > +     .cm             =3D &gpu0_clk.mux,
> > +     .delay_us       =3D 1, /* manual doesn't really say */
> > +     .bypass_index   =3D 1, /* GPU_CLK1 */
> > +};
> > +
> > +static struct ccu_pll_nb sun50i_h616_pll_gpu_nb =3D {
> > +     .common         =3D &pll_gpu_clk.common,
> > +     .enable         =3D BIT(29),      /* LOCK_ENABLE */
> > +     .lock           =3D BIT(28),
> > +};
> > +
> >  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
> >  {
> >       void __iomem *reg;
> > @@ -1170,6 +1185,15 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >       val |=3D BIT(0);
> >       writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
> >
> > +     /*
> > +      * Set the input-divider for the gpu1 clock to 3.
> > +      * Also enable gpu1 clock.
> > +      */
> > +     val =3D readl(reg + SUN50I_H616_GPU_CLK1_REG);
> > +     val |=3D BIT(31);
>
> Do we need this if the clock is marked as critical now?
I'll test that.
>
> > +     val |=3D BIT(1);
>
> You probably want to clear the lowest 2 bits first, then set bit 1,
> otherwise you end up with either 2 or 3, depending on what bit 0 was
> before.
Good catch, I'll address that in V2.
>
> Cheers,
> Andre
>
> > +     writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
> > +
> >       /*
> >        * First clock parent (osc32K) is unusable for CEC. But since the=
re
> >        * is no good way to force parent switch (both run with same freq=
uency),
> > @@ -1190,6 +1214,13 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >       /* Re-lock the CPU PLL after any rate changes */
> >       ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> >
> > +     /* Reparent GPU during GPU PLL rate changes */
> > +     ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
> > +                               &sun50i_h616_gpu_nb);
> > +
> > +     /* Re-lock the GPU PLL after any rate changes */
> > +     ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
> > +
> >       return 0;
> >  }
> >
>
Thanks for the review,
Philippe
