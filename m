Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA969254878
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744915557; cv=none; b=GZcC1Z2s4MTXvr71hrwa9LAFXZK1+231uNx1Q4OsqWWgj7SPPD3EHZtD/fMeW8ABkAeYezkzva36jUcGXLijxyapiFAIiB+jUqzDoa0KXOE3+zz2Gkn8PS8UF6hAZiNuT5l2nbz5si8w3EzZ+fXqcSq5YaMsUShYz7sK121Etps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744915557; c=relaxed/simple;
	bh=jrTUyd08bn3u5PKWmpLjDwO3weq/n7Is8lbKMUTLqUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrEeFZvMFr+ZhJKpRmpvhZmvm48GiWuprzb8xSEl5r1jLjzFS7lv6/E+QQb1mM2R86IpN2oYtpuy2Li6hwzqiD09HzN8JgJd+tM0JlOZE2AhXeKg+PHjwvr/CfM88Kvg80oeoFPa9jNK/vSeHl4oBRSXylPYdkQn1qakA4UoO8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WD0ulu0/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WD0ulu0/"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-548409cd2a8so1523074e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744915554; x=1745520354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrTUyd08bn3u5PKWmpLjDwO3weq/n7Is8lbKMUTLqUM=;
        b=WD0ulu0/5D0ZG7D6riHrX4l8iZXwehy8ZCTxXDTmseMTaz+qzEe/YjFb0KxmiPtNIE
         Dt9BHtm6MS03o51I5VSRYr+bdvBF5agW+2++NxByFsvyizBIBJpVInOhu4LmmLWYZi+t
         2PLH6l99RnL4ZVE5wd7yCvcq2DMKBjvo7rmooRVSTHFd8P64V/LDh77CqwcGqiK6Jeft
         EkITYmVtUIbSSdhtcTILJ3aIbGsXqPly9CZLnxwudo8P2tfKRnmQEEcVFuvaw59ieltA
         dMa5l2KDZjh+k1VnxbnfipPC7mbLGdBHF3cVWXrAa+TJNY5s3hzhglwkTw4LrRgqzvy5
         QiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744915554; x=1745520354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrTUyd08bn3u5PKWmpLjDwO3weq/n7Is8lbKMUTLqUM=;
        b=jkQhXemgS1H3dBHrajIip4LFV/tbmbALz0x367YahEwvj2TFklaOatoSjpmEvllISS
         vmMkTbgQKnsoy1RkDsDXlr1x/2CXn0ACik7wHzAy5fd7Lvzq8lY6Xifz9rxrwPsytclr
         Rf8O3/Js+jyF4+NFJo7vkpIMdSXw+PaPwmo/fCkRK8WJuq7WB+U4iMvJk2iJ6DzEj1km
         dN/ZyugcBMpDfmpmmTdwMD/Wzv8/+uzMGcQoH3IRclxZNNFU34WvvJ41R+fI9S/wuxf8
         8mktJPs8OTzTaAn+a3i9J7JL1NC9B7Abfp6q7x8EmqPZBlrU1vRIJ3ur5CfB8YNm2A3p
         vFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDut54q/cnL7M4YUWmYCQuviA/er7hsRTBtMj8JsSjfqmW5EywtlJXAk5wChOXiWuHIZ2ooK/+IWwwwmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx116N2qTf+p+Waq5GugT9+PJ2nIPv9CLsYdaXCXw3dlGvBk+eu
	3LpOWKcAmHG2YXRBWwb5UfZ1PFVZKDcLIDTVVi2XplSRurpqKz8PSwJ/iGb1ef9D1vJha+e6YGi
	hkc/jwjlvaxTtiyhCmr/SIhMkckaYAzylbrV51w==
X-Gm-Gg: ASbGnct5ADjJM0Csx7KF8SbsRG2cFEJ2GZGlFjG/lP1CgGTvIWOD/hxTQfukqctart9
	nJDs2GyGBrCpyp2Z7TgrYcSPuTIiyLWx4sdLSDo1sxNCqQ2Q5ZJGSKaJvjQ9uQKg/Qx8f+5sfG2
	Yq0tJe6T1NjP/1Xj3Q5ZrOgdCpF+/cmJ+zZaDNyc3MWoJLnXPTgydxZd0=
X-Google-Smtp-Source: AGHT+IFYPM2ecURNz+KY8njmgJ0rduoS1cCZTsJy4S2rnHxzPS2AOlWb1aY1/rSLmFWLPbvB5251FGRtfitI6vEfyC0=
X-Received: by 2002:a05:6512:3f24:b0:54a:f757:f8b3 with SMTP id
 2adb3069b0e04-54d6e5566abmr5225e87.0.1744915553581; Thu, 17 Apr 2025 11:45:53
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
 <20250331-gpio-todo-remove-nonexclusive-v1-3-25f72675f304@linaro.org>
 <CACRpkdYMRnmYD1YRavZs7MHEVFM42bOL2=6s4rJzFDnfLJ4fAQ@mail.gmail.com>
 <CAMRc=McBWncrCcX87a3pYeZ3=uYGNhpSrK74hDP-XNYrT8WMMg@mail.gmail.com>
 <CACRpkdbeObj7t=quffRrZtZQRRSr6GBeayN3o_8H8zGDD22XpQ@mail.gmail.com>
 <CAMRc=McKgfT1ZLVzsVbBJ5pFc3bwcGT4AyXG+V0JPP0z6ft3tg@mail.gmail.com> <CACRpkdYev-uRGwsjbpnYWKUCg0QWy8ZRaFDjJRPVbHCPXPgX2A@mail.gmail.com>
In-Reply-To: <CACRpkdYev-uRGwsjbpnYWKUCg0QWy8ZRaFDjJRPVbHCPXPgX2A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Apr 2025 20:45:42 +0200
X-Gm-Features: ATxdqUGySucegjnj9BFvPO6jN2mnfvRTC1tIw3M4BUSqgppvyeIlTs3GVuwXgCI
Message-ID: <CAMRc=MdokhqKQu0-h1HVC_-De6GBdkGsTK3cJ-V5Q-x26ocAiQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: TODO: track the removal of GPIOD_FLAGS_BIT_NONEXCLUSIVE
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 10:44=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Mon, Apr 7, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > I don't agree with this. I could possibly live with that being used
> > exclusively in lower-level core subsystem code (for instance:
> > regulator/core.c) but, in this form, this still requires drivers - who
> > have no business knowing whether the GPIO they use is shared - to use
> > the right API. Not to mention that once you make an interface
> > available, people will be very eager to abuse it. IMO this should be
> > approached from the other side.
> >
> > The closest thing to making the sharing opaque to consumers is
> > providing a pwrseq-backed, faux GPIO chip that allows a very limited
> > set of operations on GPIOs - get, get_value, set_value - and return an
> > error on others. A value set would actually be equivalent to "enable
> > high" and be refcounted by pwrseq. I have something in mind but this
> > cycle, I already have a lot on my plate. I will get to it eventually
> > and come up with some code to back my idea.
> >
> > In any case: the GPIO sharing logic should be hidden, I just need to
> > figure out how to make it possible to be notified about when the value
> > change actually happens as per Mark's requirement.
> >
> > Let me reiterate: a random ethernet PHY driver should not have to call
> > gpiod_get_shared() or anything similar - why would it? It can be used
> > in all kinds of situations, whether the GPIO is shared is none of its
> > business.
>
> I get your point, it's just that I don't see how pwrseq solves it, so I
> would have to see it.
>
> I think a bit of my problem is with the name, as in how would a
> power seqeunce solve the problem of a GPIO that is shared for
> something not power or reset for example.
>

Sigh... It may end up being the same story as with BPF. I named it
pwrseq because a power sequence was what I was working with but it
also deals with shared resources.

> But maybe all the existing cases we have are shared power or
> reset :D
>

No, unfortunately not, though for the cases of shared reset-gpios we
now have the reset-gpio.c driver and its implicit sharing of GPIOs.

> I could think of a shared LED GPIO (this LED should be on if
> any consumers A...X are active) but I just made that up.
>

Actually, I have something in mind that may allow me to avoid using
pwrseq. Give me a couple weeks though as I have other priorities ATM.

Bart
