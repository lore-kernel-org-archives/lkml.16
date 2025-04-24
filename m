Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D96203710
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490676; cv=none; b=AD5o5ckib73jjLTB5O3hSWC+HorSfe5Ly+dWE80+Q29InkgvoYshMERoHJQiqlhwpx1lB0KL1nzN0QBu1w4Yow63Z/5ULHfF6ASCXxgW51tVewK8bgCQuxlyJxWFESvtXoJlR48hiATS9Eyfw+Cz9fPffAdSce6awjyqFRg70hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490676; c=relaxed/simple;
	bh=veuDQajYZQmtwy5soBS8bgeTiDpHDVxRfRcmVV3dkkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnlBvRnjIP4zz8A51pFjOS1+JEijuWgUlYcc6xV20xUIUQql55JWsycKcTfjsmRljuqfwcQG0x1jO7GQrto4jN9HSQ8ppMZpInPHSC6JTk03gRPDfmqoKQXj7pH5mvTNMWJcbfl2LuCaot4OzDQ4eLLDFq4vRiCfFGoqQE7XWQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KIDrYHXo; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KIDrYHXo"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ff4faf858cso7133627b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745490674; x=1746095474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veuDQajYZQmtwy5soBS8bgeTiDpHDVxRfRcmVV3dkkA=;
        b=KIDrYHXoflincouO6Ie5zfhCB/C/R6tb8+kaypogXRHd4vGrIP+SK/5GSmA38CpYdB
         iSe6VycjkUw/IAfM06GmCwxLKyIVJyDHVdCmKMb6MV5sJHPZ5GkSikQ9QTFIqsGA/bX7
         7PqACZcSu59lWn+WSUlEImpUSMVjOrH3LOME7YbV5+x4i4J5l3cAYVZ1lSgl60xixg0w
         YYKV/LD04e6y6ZRHwWj5Jgx7AQkevxDhqXyuCxkc0kUlQpqf985zKd46dI4DwlYWbhaX
         3ZaFQKGyyft23LyNrq92GiDB8gQSsgG6A9bht+VAygM4H/a4VxPTsUvj3GMgmcUbrUjJ
         U4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490674; x=1746095474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veuDQajYZQmtwy5soBS8bgeTiDpHDVxRfRcmVV3dkkA=;
        b=Nh6BDmVkHAHVejjS0AC8skVewI3UfzbFphnwKqr8KPYJ7hMggg/zyVYidhOj69R10+
         ifMUxUXQF56PuVClnEnvQ81WsvnuLx5gbMtXueH6bg4z9vQ04NZSWg6GR5WzaR2QgufJ
         MIY7NT9FFBLMHIXitn83kzNBhFpgkTU719wZKyyajQKt/ku9yz8wYaK+ayQMsG7OnlOd
         jsGrboKopHt3LaiuOh+pkE2WlRgY8Ck6PtJSQdk7pbvH1eF3rUjCagxKY/hzLha0j98l
         Ay0wxMxPJgkwVv6TWa7WR9WFaeCPmupU/cnEpDCk+QAxc1phEXJZ/Ce9Ri5O1e5UH3br
         knDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+DWQdTzEXqa2SEhGNvl80rJnTxbTKNsHvAIR+qUoITFZrh2V3jjhUbtOCyGp4euVl3Ql+m3UqETIDHuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbTnBaY2ttpMIpRlvrI2p1Y3t01khQKHoDdZn92Gjve1eKUhdI
	Tosdl93hh0kuPt3fhY5NGvZc6ZekEwhu0SkO79mz7xVNAV4bKYn6yo/KX3OV8zxCDku2yFjxAcr
	F3jBoN+ic1jIsnPXOUxPoi21TeLOuKsnoOg23og==
X-Gm-Gg: ASbGncumZjEqfjPykYwX5YImMlN4bcCXRfTIIOwH/mtFQd6yQqwCeOrspsNE1DRbf7a
	UoWQ3KXPk6tAjmH2mKe3cud7civaaokBcxhY1eGdt5iMhDl1fHME+bkvbay3LDQS3IaU480ygEw
	V/68RXfycjRLMQOaNoc9Xe8w==
X-Google-Smtp-Source: AGHT+IFaCgdi/D8Mz2g+4kwknyPmgE+BAWyWeosYJdPhAXZY/ccwJe6YGp50DFdsLuHQOqspxP6UrWYnj+YkNWqFGqY=
X-Received: by 2002:a05:690c:dd1:b0:6fb:46dc:d9c4 with SMTP id
 00721157ae682-7083ec4d087mr32192027b3.12.1745490673788; Thu, 24 Apr 2025
 03:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424062017.652969-1-uwu@icenowy.me> <20250424062017.652969-2-uwu@icenowy.me>
 <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com> <7e62e720ccc51fb5c7d023adae3eab35aecf0bba.camel@icenowy.me>
In-Reply-To: <7e62e720ccc51fb5c7d023adae3eab35aecf0bba.camel@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 12:30:58 +0200
X-Gm-Features: ATxdqUHtrYzEaLg25kuj53TyY1Q41AznmucaPtZY25yhlzNHITgdvG43lqbYwqY
Message-ID: <CACRpkdY0DXxDixZVhnRuKvSVbKQ6pSfLMiT2hf9818sbNG-4hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 11:38=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wro=
te:
> =E5=9C=A8 2025-04-24=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 10:51 +0200=EF=
=BC=8CLinus Walleij=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Apr 24, 2025 at 8:20=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> =
wrote:
> >
> > > The JH7110 SoC could support internal GPI signals to be routed to
> > > not
> > > external GPIO but internal low/high levels.
> > >
> > > Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two
> > > virtual
> > > "pads" to represent internal GPI sources with fixed low/high
> > > levels.
> > >
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> >
> > As per my other reply in the previous post, I think this should be
> > handled internal in the kernel instead using a tighter integration
> > between
> > the GPIO and pin control parts of the driver and utilizing the
> > gpio-specific struct pinmux_ops callbacks.
>
> Well I cannot understand this -- these signals are not GPIOs, totally
> not related to the GPIO subsystem (because they're only pinmux, not
> related to GPIOs). This is described in my previous mail.

OK sorry if I'm a bit dumb at times :(

I guess I was falling into the common confusion of "something named
general purpose" such as your GPI and GPO registers, is also
related to GPIO which it is not, at least not always.

> The pin mux of JH7110 strictly route its inputs to its outputs. For
> signals from other SoC blocks (to external pins), the registers define
> how OUT/OEn of IO buffers *are driven by* the signals; however for
> signals to other SoC blocks (from external pins), the registers define
> how IN of IO buffers *drive* the signals. (This follows the generic
> signal-driving rule that one signal can drive multiple signals but
> cannot be multi-driven).
>
> In addition the situation I am trying to handle here is an addition to
> the latter part of the previous paragraph -- in addition to 64 inputs
> corresponding to 64 GPIOs, two extra inputs, one always 0 and another
> always 1 are available to the pin controller for driving other SoC
> blocks' input (as output of pin controller).

OK ... maybe I get it now.

> > This solution looks like software configuration disguised as hardware
> > configuration.
>
> Well this solution handles these internal wires in the same way as
> signals from external GPIOs, excepting specifying special GPIO numbers.
> If you are against the principle, maybe the current already-included
> GPIOMUX system of the StarFive pinctrl is to be blamed instead of my
> small extension to it.
>
> I must admit that the current GPIOMUX system isn't a faithful
> representation of the hardware because it's a pad-centric setup instead
> of a register-field-centric one, which isn't very natural for input
> signals. However configurating the mux in such a way is against people
> reading, and we're not able to break the system because it's already
> there.
>
> Well in the situation that one GPIO used as input drives multiple
> internal signals the pinmux looks a little confusing too, e.g. the I2S
> clock situation I mentioned in my reply in the previous revision of the
> patchset.

I guess what rubs me the wrong way is why the external users
(devices, device drivers or even pin hogs) cannot trigger the chain of
events leading to this configuration, instead of different "magic"
configurations that are just set up in the pin controller itself.

But if you are positively convinced that there is no other way,
I guess I have to live with it.

Yours,
Linus Walleij
