Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E7823AE64
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029509; cv=none; b=M4tljcOPnzl8T9iTwOKDqAP09kE2mOE/tmUHxXttwySZPRNiBM6JJ7ZFYvX31tmsCQSmaC4I4jYX5G6lVoUhIaHvaG6g02v0gS+2LEvUxZYQEbk1Z718syYXRLdsaz5Lx9PF19oYY3JD4KYatRS3e7QbY3HcvV6E95NcZCiC+1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029509; c=relaxed/simple;
	bh=pAtGxBTML0R69VpqhiO34biELTHBQcCt68gQZIWR51M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqbHouvnDy/nu0hWMV9XO4Ap6g2j67+gCMLeDYT8fEQ90xztp5WCYvwnRVv26TUpddy6bmdCrCndabeutP5140Xp5mYgfRUFq5t82OXfdYEu6hbTCY7Im+W+mxoFHe9gW513RvhiUUPE5i02047ypbEvI/ZpGL8ZDgc579Anw+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qCAqJriv; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qCAqJriv"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549946c5346so5107387e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744029506; x=1744634306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy4szLRSe8vbxOkm8ppBiJGXBESdF1XCg0JLSJwZApU=;
        b=qCAqJrivBwmRByzmk5eHPdoPWtZ70Uo12USYPwnd8t32Z/OUwvnyIAoInFdhCyhuto
         7ZlRkPL3lEFe0RukJwm806+Wt1W0xnLSdsHYUUVYi+IOgeQzZK7wjExRpODYCuCm72iO
         poXbNxAt7UVDsMC9UAffgmdv8x25m73vn0nw6IR+p8gsNI/L3QodEHrZmhGuXRerfiip
         k03y9yzE2QNPKpP6GngzC6SkRLZooumVQLURqOMiHM09aFvGbQWNNMPDc4Mq9hkKJkwx
         8U1MgJiT4mTQRn3r15DnLlMZHx7e0hW+18cNKVBg9vhYGNFnupWNZqENsHv0f9+G/ZpS
         Ah0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744029506; x=1744634306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iy4szLRSe8vbxOkm8ppBiJGXBESdF1XCg0JLSJwZApU=;
        b=SYk26yyqcsMz601sIPPvoLK0bGBrZcu5TRDd/aPPx7dzX5xl+nzdwdjgNRKh8wAb77
         aDbn0+eGsESSR3ap8yeAEdNLQj/vkNF6RdWD21LjCeLjgkvaTtgLDKbcXEdZHKIwn5Ei
         9j9PEkcEUA6yPlIp/FY/xmkGlCWyvceb8DZ/gQRT+4O0x99xFd7V8xX7UwT2wntvVqYI
         AFQVf2GvdXio2PyMu8bgFZUbQTDUA36iPTS+OmrFPEeyYXrUFxW9LZqr+sYp2tuTCOtB
         FdPrq2trghhi0+AgxR0JNwiRDGnkEmD0EOm/u15lJ/PjF5iZbQcN52uVhSiWI6KuP1Oi
         n+lA==
X-Forwarded-Encrypted: i=1; AJvYcCUY1Kdbzpd29jo2itxEb7noTuX02y37NipAblyZeFequ2FRkCqIYHkKbMfrZAUQlL0C1nBBNhHgavo1fQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/sM7MGuE4biZGqOSTNcRdYBUE9psHThk6Tkti3IbPGkPngDpq
	crag6ayM8akuWubHvsm9HfCWOn8AZZ7hAT5qkwtZH0CJit5cd0Ust3IMSrKq2HiFHtU5Q/nsk6X
	47ngLNQECgkEW3eJCw0xJRUgrIoja58cC9s5n6w==
X-Gm-Gg: ASbGnctX+C9uq2g6izdtPknzcwkr490ClqfGkq6gm8i7uQNvz0hh9AzgF8krCQNqvCZ
	3lqPzk4DBR9H9qKpDbXygnKZEk/kvmYGvf0G5BbCgAfxEkX3T8herL2RS9/1zluNDaq1sqy90Fc
	MGy64M8RpibhlJOQ9EOg2Qb5t3P2HkC31tVFoExAf6tIm59aFENmnUphMcaA==
X-Google-Smtp-Source: AGHT+IGdH3gSPLDN9gl6cP7jpNmIl84e0kbjukzAlZsBAHpyHrW4IWPlbV43lMfcKk8pPXKe3hAYFgJpiXbC3nQ3wcM=
X-Received: by 2002:a05:6512:39d2:b0:549:b0f3:43a2 with SMTP id
 2adb3069b0e04-54c227dc8cbmr3043106e87.40.1744029505709; Mon, 07 Apr 2025
 05:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
 <20250331-gpio-todo-remove-nonexclusive-v1-3-25f72675f304@linaro.org>
 <CACRpkdYMRnmYD1YRavZs7MHEVFM42bOL2=6s4rJzFDnfLJ4fAQ@mail.gmail.com>
 <CAMRc=McBWncrCcX87a3pYeZ3=uYGNhpSrK74hDP-XNYrT8WMMg@mail.gmail.com> <CACRpkdbeObj7t=quffRrZtZQRRSr6GBeayN3o_8H8zGDD22XpQ@mail.gmail.com>
In-Reply-To: <CACRpkdbeObj7t=quffRrZtZQRRSr6GBeayN3o_8H8zGDD22XpQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 14:38:14 +0200
X-Gm-Features: ATxdqUGl2wqh4ZOWupG9tgo9s9dJU72oPdHvkqUaP5UmimCE45Echc5dShzPz3k
Message-ID: <CAMRc=McKgfT1ZLVzsVbBJ5pFc3bwcGT4AyXG+V0JPP0z6ft3tg@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: TODO: track the removal of GPIOD_FLAGS_BIT_NONEXCLUSIVE
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 11:02=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Tue, Apr 1, 2025 at 10:57=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > > If several providers with their own struct device is using one
> > > and the same GPIO line, the devres consumer is unclear: which
> > > struct device should own the GPIO line?
> > >
> >
> > Well, other subsystems just use reference-counted resources in this
> > case but see above - this is not a good fit for GPIOs.
>
> So to rehash, for example clocks and regulators are by definition the
> equivalent to NONEXCLUSIVE, that is their default behaviour.
>
> Two devices can surely request the same clock.
>
> They can independently issue clk_enable() and clk_disable(),
> and the semantics is a reference count increase/decrease.
>
> They can have the same phandle in the device tree.
>
> But GPIOs can not. They can only have one owner.
>
> Technically this is because the only reference count we have in a gpio
> descriptor is the boolean flag FLAG_REQUESTED, and it
> happens like this in gpiod_request_commit():
>
>         if (test_and_set_bit(FLAG_REQUESTED, &desc->flags))
>                 return -EBUSY;
>
> This semantic is in a way natural because what would you do when
> two owners make something a GPIO cannot do, such as
> one does gpiod_set_value(1) and the other does gpiod_set_value(0)?
>

Or even better: one goes gpiod_direction_output(desc, 1), the other
goes gpiod_direction_input()!

One goes gpiod_set_config(OPEN_DRAIN), the other gpiod_set_config(OPEN_SOUR=
CE)!!

There's just no good way of allowing multiple users to work with the
same line in a safe and sane way.

> This issue does not exist in resources such as clocks or
> regulators that only do enable/disable and that is why GPIOs
> are different from other resources.
>
> Then we can think of solutions to that.
>
> One way would be to add a new type of refcounted GPIO
> descriptor for this specific usecase, like (OTOMH):
>
> struct gpio_desc_shared {
>     struct gpio_desc *gpiod;
>     struct device *devs[MAX_OWNERS];
>     u32 use_count;
> };
>
> struct gpio_desc_shared *gpiod_shared_get(struct device *dev ...);
> void gpiod_shared_put(struct gpio_desc_shared *gds);
>
> int gpiod_shared_enable(struct gpio_desc_shared *gds);
> int gpiod_shared_disable(struct gpio_desc_shared *gds);
>
> So this compound struct will not be able to set value
> directly.
>
> The gpiod inside that shared descriptor need to be obtained with
> some gpiolib-internal quirk, not with gpiod_request().
>
> It will issue gpiod_set_value(1) on the first enable and
> gpiod_set_value(0) on last disable its internal descriptor.
>
> If existing valid users are switched over to that then the
> NONEXCLUSIVE stuff can be deleted.
>

I don't agree with this. I could possibly live with that being used
exclusively in lower-level core subsystem code (for instance:
regulator/core.c) but, in this form, this still requires drivers - who
have no business knowing whether the GPIO they use is shared - to use
the right API. Not to mention that once you make an interface
available, people will be very eager to abuse it. IMO this should be
approached from the other side.

The closest thing to making the sharing opaque to consumers is
providing a pwrseq-backed, faux GPIO chip that allows a very limited
set of operations on GPIOs - get, get_value, set_value - and return an
error on others. A value set would actually be equivalent to "enable
high" and be refcounted by pwrseq. I have something in mind but this
cycle, I already have a lot on my plate. I will get to it eventually
and come up with some code to back my idea.

In any case: the GPIO sharing logic should be hidden, I just need to
figure out how to make it possible to be notified about when the value
change actually happens as per Mark's requirement.

Let me reiterate: a random ethernet PHY driver should not have to call
gpiod_get_shared() or anything similar - why would it? It can be used
in all kinds of situations, whether the GPIO is shared is none of its
business.

Bartosz
