Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA0533993
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750923444; cv=none; b=MCY22liD2mC/XNus/M4nPtM0eeOTQHNaC0N5VtPYsDs6E9IfWC7ucDJaIk5sy9JKzBeBuBk+cJxN6RhPekbNEYKjanepPQ4vGizUAOSD886FAZggsuDaIqqW7B5M5PKbXHwC9+8us4crFmU58RrA9aUielrsJ0iSGFbKivZ+hm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750923444; c=relaxed/simple;
	bh=QXhMV10Wz7CqqQXpjApUdNy2bQisjRPjJ/tBIS+0GIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4CTS+5sImy4S+SqgMx8qttvF8b5swTtySSb3VkELbb+45sLyM/Af+hxrD9B+zRnGfg6G1HJvYXZR8GxsgrxykaeDHJs4aje1UaMW/Qi05EAtN/lO6P2JS+0IHApspYzDrhnLrH8bcoisyTV4N7TdS6ULkoSfnpwzFhEopcL9xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lImaWJrK; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lImaWJrK"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso704009e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750923440; x=1751528240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5xgDDRdnL1An5NcO2D/hjwiAvuotn8HK0mys4ZOVaY=;
        b=lImaWJrKrwv78Rbe2rYJ5FK0E9G4mJYwwZa1QWTWhdLlEIOnP9rU3KP8dtc/timITf
         tAC1uT9Y+8LWqIFKDZknRM/TUTdsbQlP8lxO05OB5O1DTD3J4PHW9WcC98FoZlij6AaU
         3WFCHv/OlzU30OqUNUi1RrRwDSOGkCT2HGKq0Ab3oSqSi6gm8wDKYd+BRjW0A6fMHLxm
         P8pgNKM8ieFOtJybuxDD2xtDBVLPvLz4tNuDX1kHvZE1vJWAYbIL6dzH7DI93tDncW7N
         QpSqlA3IWn4vjy0D0+iIi3rq1LSgCq0QuFT1dHsKQkxOXD9jUBYzqyLhMcnR2oelwvcP
         oSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750923440; x=1751528240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5xgDDRdnL1An5NcO2D/hjwiAvuotn8HK0mys4ZOVaY=;
        b=vB5gafJYI9DCFVs1JhtBr6Bn94xrY29T0xX6apLoK+dyxc2So1Vpz2ieTqHV6cnyHF
         rLcY9ywmwP4wIh6clt4iCThCUm9cgcDsBacsM6qXmlPyfcH9v36rWV0v7acoo/1imHci
         2ORq4OriqRPj7Ef3w2/4mOMoJrGkvSh8ae6MwabCrxnEoAe5a0CrnkxQshnJaM2Lg+PA
         WVkzJZFWy62EvZIyvKSoxHNupAI+d2zIcXjMKEiLlXB05VECdLsGCwAOm9PBQYYDyhrr
         1CErDVQNxxzBHBOXQjB0VcX82c5HVnj+bItkXtpY/8h7S3XcZ9/qs2qTF1ipVAAT2TAz
         fR7g==
X-Forwarded-Encrypted: i=1; AJvYcCVdej5Bhv24n4MZlvB8rsF7ZCgPI6u/ZfcntnQoaqnKFsw8hte3dEAXOuvjD2NgEUc/cJQ+SZO7HznJmQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyIGbuSr02XdtwQMV35XCKLGVXzivRKmBpPIrqkwHlrcS35mmq
	SL1hJGxaVi6fzh+MH3SJa1kHaTUWUKUeRBJeleHuOsjD+gorP0ZIyW72bF01Vdpi9iI3lw3UWdu
	rp5L9+rJ2h+z4VtLlz1bdKQlVLSJ3MbSWZ7XFM9QVMg==
X-Gm-Gg: ASbGncs7Y0NunGNwqXLGiidPfJm1TyAhvYDK4ucTf3hYOGJHPIXw1ZFKjL/YSibOFRe
	dWmtGosSn5+yphOmi5XxrDjErlNrtouAbna9VPWKA7kTiboBx1YF70mP4FL3xmHxcXeM9zW5mbN
	GNVNntgNVY/qooGKNUCsMF8BZIrzDI/R+m0i3wllMD3xn23dDYGuQ2bzogzL/HIPBczZIVfRSQF
	Q==
X-Google-Smtp-Source: AGHT+IEnopA5Q1Izmpwb+jTucL/e8LSFIj7aeHFFtAUYPniTSHEVm5lKk5y1psWqfA3oZ97UXMJWOISXfGaVI9jovD0=
X-Received: by 2002:a05:6512:ea4:b0:553:a64a:18b0 with SMTP id
 2adb3069b0e04-554fdf63a59mr2194133e87.42.1750923439549; Thu, 26 Jun 2025
 00:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
 <CAMRc=MdAKpmVNQe=5yrGkVdmbfZ-Bsh_0p3-mrifEF2x1SVBhw@mail.gmail.com> <7pl4kxvzfo3nra5lubfb6tgmaqxex5oylw7coaadz6v7mnx6x3@cole43kvvmx5>
In-Reply-To: <7pl4kxvzfo3nra5lubfb6tgmaqxex5oylw7coaadz6v7mnx6x3@cole43kvvmx5>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 26 Jun 2025 09:37:08 +0200
X-Gm-Features: Ac12FXzsmncwi9WLdhFOoYQmmkcGONg-k8AblqHNV1hmV2Az6X0QpaHZFtAuzgw
Message-ID: <CAMRc=Me7dm7BmTSW1U758oCJ+4W4p6ixU30D5YStk3nyuu8rVw@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/3] Input: convert GPIO chips to using new value setters
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 7:54=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Bartosz,
>
> On Mon, Jun 23, 2025 at 09:59:07AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Jun 10, 2025 at 11:40=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > >
> > > Never got any further feedback on this series last cycle. Resending f=
or
> > > v6.17.
> > >
> > > struct gpio_chip now has callbacks for setting line values that retur=
n
> > > an integer, allowing to indicate failures. We're in the process of
> > > converting all GPIO drivers to using the new API. This series convert=
s
> > > all the GPIO controllers under drivers/input/.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > > Bartosz Golaszewski (3):
> > >       Input: ad7879 - use new GPIO line value setter callbacks
> > >       Input: adp5588 - use new GPIO line value setter callbacks
> > >       Input: adp5589 - use new GPIO line value setter callbacks
> > >
> > >  drivers/input/keyboard/adp5588-keys.c |  9 +++++----
> > >  drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
> > >  drivers/input/touchscreen/ad7879.c    | 11 +++++++----
> > >  3 files changed, 18 insertions(+), 13 deletions(-)
> > > ---
> > > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > > change-id: 20250331-gpiochip-set-rv-input-bc12818c5732
> > >
> > > Best regards,
> > > --
> > > Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> >
> > Dmitry,
> >
> > Could you please pick these patches up for v6.17? They already missed
> > the last cycle and we're on track to complete the conversion in the
> > next one so I'd really appreciate these going upstream in the next
> > merge window.
>
> My apologies, I was hoping Nuno's conversion of these drivers to MFD
> would be accepted and these versions be simply removed...
>
> I acked all 3.
>
> Thanks.
>
> --
> Dmitry

Does this mean you prefer me to take them through the GPIO tree? Do
you want an immutable branch?

Bart
