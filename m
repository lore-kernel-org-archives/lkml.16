Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A6A2749EB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653123; cv=none; b=C3D7VedH3dPRSfXQdga4pmRi1FH0JP9C1jg2D8ktVTiWKrwiAdmIxMlpVkGd1FYd8HVh3FYCzXN2CcOocMe4DUFrcRvlue7sfuIRWcUOBCwK9yEA5ruGpPQPFNhozLs/i6dNFcW6tUMW9ZpXRyoR3ni+4M5o+19F9Y2ih9ZTUrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653123; c=relaxed/simple;
	bh=As/kTGBPQ5eBvTGcLqqJV9KysCV4aWSd2Ql4HxJei6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwtZJy4CZDUhMCAejZurMwrxask043cCRgRYkDr8AY/oFJCfFveEFzRYLn+y9nX2Ob+kstrnQphYmrOFVoW2TNGeQ8vV4tR5/ho7eWCL6JhK809C1kPdyoC9YxpIyMYuUmaFGGm47IQ2MB4dJSXv+R+7sSQ+jnVV0XytP8qcJzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f282UcCc; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f282UcCc"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso45393741fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747653120; x=1748257920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=As/kTGBPQ5eBvTGcLqqJV9KysCV4aWSd2Ql4HxJei6w=;
        b=f282UcCcHjC9uOfhD12xk6ZzWnUkuIhKe3mMosQuJovyeQnPs7ohXkFW3Ke9NXtpyQ
         NzEykwop6f0M4Lc2RIwiQktrNKmk0evv1qx1Cz0D3nCmL4TbfzGt7YlaJtvB7tKoKXV0
         YOMf8XSWcwW4vsz1vBxWHtd8p2dhpBPUGCQnfr1Z5JNreqEHhZvBg3lOFoTqaXNlXxY/
         ShRhvm2wU3+tEYuMJ0vS1AFlaH1iLB6dyih1hDc9/S3PAGQgci79XYwR7SE6oEkd+5JU
         YqcWBfQUZg6nZXh7p+9IazXpDNFq0afqQ6/UjwMgB8sZXcyJ23U9T0N85CKmtGpK7SiC
         dkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747653120; x=1748257920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=As/kTGBPQ5eBvTGcLqqJV9KysCV4aWSd2Ql4HxJei6w=;
        b=oLx8gsfIiasenY6OSVI3qHmkt+6zfelRcAC3D6O7lKyc5DZLtlcELc6yH2kSeEA4Wy
         W9Ib4vsbbhuTxCYqkoBYeE0AtrlJckLcV7HHe92+7bukYUqPVPlWTy2Sb4EOSNkcmfdJ
         2ffb8HMQRVImw7OX6bbzxFNNtvpBB0ki9abMqQyMJ5mniKDJr2T5eoYWeAPCqYZGmjs2
         nHNcILle43hyO7AImUjklDpvFFIBc84IuZj+HlJdSBMeOPybKClQghESC1bHBCb6ShTe
         lWfLmM5F43bMu6KB1F844LISQY0yOZWBTPBUiO/8lmupXgsVvhbK2gjTRszA+mzzIgNS
         YdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBTm6dQY7lMt9yMPJslSbD7R+m9zX9MQHO70N8skgfqoeo9xBR/wM4Ijw74DSUDlPdBViyQ7UWjmNEJQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLaz1ex6s+DtmMyy6ZFjKZBfoQJJdMDgBd9aEDsD375RBDk4hg
	kUt1rBgF77PoLluH2OCArZQ63B6VACc3k+5wTaMJfMYFv0Kbv0sm/30nZYdIBxR5ZKrjP8nU6C0
	ejVJDNkslpbs1m0kvKWulDLs+04Ru8MlOVg1yQF5nqjpw50Vsnnu2
X-Gm-Gg: ASbGncvCtPNcOBdIlxHQRKBVzJ1O8ZwQlefAMLq3U5FgJdSG7mWueodiTbHjY7fS/u5
	d6W3y9nTdcSOjiWPfxyzyKCYNMXXO3z5GTCGI/DeAVT14LmBeKEurvl+9UJJ1/HYvJw10xDpx7o
	qDFM21xs5rcILA8Nkt/HSy8yXpJBCeU8BPPZNfeg6Y2knmITxlc4XLxXvsVAt1xeM=
X-Google-Smtp-Source: AGHT+IElbpXRVMcZRygThyBdzbZe6aWKZ0v5i2qkL24Us+95XFwU0tUYON/GzrFuoeqg5lUBQdujjRItOXVlv408oJs=
X-Received: by 2002:a05:651c:324d:b0:30d:dad4:e06f with SMTP id
 38308e7fff4ca-328096986aamr39036301fa.2.1747653119958; Mon, 19 May 2025
 04:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-gpio-v1-0-639377c98288@nxp.com> <174732137152.17517.12381683522631139304.b4-ty@linaro.org>
 <PAXPR04MB845950186761960AAE5A472A889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB845950186761960AAE5A472A889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 May 2025 13:11:48 +0200
X-Gm-Features: AX0GCFsnF7MKGdDOuJxUvTHGfe0KA4VzWjS5k-RXwh_BI-pWzfyBxVgg8qQ4FXI
Message-ID: <CAMRc=McXAKw8rZzKtfz6ekUcTHLP_ik7MN2FyWYoZUyx=bSdsw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
To: Peng Fan <peng.fan@nxp.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, Keerthy <j-keerthy@ti.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 5:56=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Bartosz,
>
> > Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> >
> > On Fri, 09 May 2025 12:45:31 +0800, Peng Fan (OSS) wrote:
> > > This might be a bit late to post this patchset, since it is almost
> > > rc6, but no rush here. Not expect this patchset be in 6.16.
> > >
> > > This is an effort to make irq_chip immutable to elimnate the kernel
> > > warning "not an immutable chip, please consider fixing!"
> > >
> > > The major changes
> > > - add "gpiochip_disable_irq(gc, hwirq)" to end of mask hook
> > > - add "gpiochip_enable_irq(gc, hwirq)" to start of unmask hook
> > > - add IMMUTABLE flag
> > > - add GPIOCHIP_IRQ_RESOURCE_HELPERS
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [4/9] gpio: mpc8xxx: Make irq_chip immutable
> > [9/9] gpio: pxa: Make irq_chip immutable
> >
>
> For the two patches, there are build failure
> with powerpc-ppc64e_defconfig and
> arm-am200epdkit_defconfig
>
> GPIOLIB_IRQCHIP is not selected. I am not sure
> how to address the build. You may need to drop
> the two patches.

No worries, I just sent out relevant fixes.

Bartosz
