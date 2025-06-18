Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6DE285053
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750250100; cv=none; b=GYFgdIC+XpQRb3zMAHlaDI5X4iiq1kNkMgOwLLItPLTZfD8ZLTojC8MZLVfwbDqPpcOvOr43eE/7UiNmulQQQXt+6cb1EhCj57+vQdhC5az96MPMWdnnXAP1x77iDBYORqJRQejUT7Eo9nucz4widDkKpCpVc3LYYe0kK8zSCGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750250100; c=relaxed/simple;
	bh=trzbB0BU18yv/+x//j8upiNsDilrRGudW+ydLxNsrTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwS9vFohTarP+pysD/1nP4J9xZoD0xHqrmOWQylLWJaXnUl1aOA17TpiPGaIrDuhXnQQRjR9MzZkQGskhN/lZ7XOuEB5fIEkOWRte6fv/cmLsYrizWNmihBQ0oJbcDxawUl/r7blhv4kHCP0w0t6vKprY4HzyJzuCeTCAmaVCSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KeIMAZ+C; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KeIMAZ+C"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b10594812so7094873e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750250097; x=1750854897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NCFXvXRzTnNTsIn79B1ObpiC19qiQmFuZrgGsmP12M=;
        b=KeIMAZ+C07C/TSwGgI8YQ8mGTCU7FC9d3QpYJPp3j1DP53wks60vZly/ekmkMxGarG
         JJFx0XTJE+3hLrm+ZW+C90GJYz1lTjoLPNS0DmagrVcNAe4QFBF6NhzvPmfdM1JpBYGM
         mowETEP54QbrzqmzNC4mMT+2cOlhBZx3N69b0A2itY4eTngElqeZI8k5cjq3XjeDTUXs
         BSN3PjFz6/LJUGGgabBEdT10Yx5/08MBHLs47FQHQ1kHrUYtsihkCUmpOxhtzDRKAQyI
         /e+xJ474CaHnUxi8iyfEiP4NveCKyNdPHzlJdM0rFKTQ0sz3955bfWFOQvZic9Msdzme
         3uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750250097; x=1750854897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NCFXvXRzTnNTsIn79B1ObpiC19qiQmFuZrgGsmP12M=;
        b=HAkBqcwAwn4zOZAy07u8DFFSlFnwaB3MC1gUiMjhow+NIP5QJ9OIBlOmhaB/eokX2W
         xkAlQRbvyYGTdvIFUSp4BU4pWe3n/K+BMWaavN6NRjOLbRiu0guBNx052oOJRSKHOEqR
         xDOz/lYCj75kdkGUrWHuuWTf8cEo2ZkXysbetDIpHrnG2FDbFa9YGSbfQXfK+RO7UJwR
         v6P0KBIVZWD2zC9gv+raHJOSFCMdPe7MRKW6I/hA72+E7O6Dogzal4u7fy2VIEtUt8Um
         GxcUh/yhMfrH9CCAbSEL4U3KZS6FbWdA0bXOmy8G9rXX72dBcJaiqgunDL04JfUDMenS
         JnUw==
X-Forwarded-Encrypted: i=1; AJvYcCUs8hOydepPX+M/ABjryr1ArkBGSFzBPnbidKjRjZwtikLrCGJTpvrcIL0f7qnuck6Rsy+SFHoNF8t5n9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCP4glfvkD6awNz13KKhQTZd/gquB43CEd9eHtjDhSNy0diMgV
	zMMz2uq7NS72QH8WVU3q0Swt3LXPN1PYs2DGv7tS4ZjrVWaeIHyQqkQAARYUIKl95pP8/u4fRIr
	HUZiK0qxLkdaMG7XKV72qBWx3iweqilYmKvhv7Oa5sw==
X-Gm-Gg: ASbGncs8rktyg1ZxO7PL9qTburvczyPQD1ocmDvYtaPNR8ojyhDTSItSi+h9BNvS/US
	+HdjU2dxcTEbms6ZqBK0wi83QbXy83Vr5WbVl4W4Z/I6FqPYT7BGm76CcA5+6UlnlEKZgDTjavn
	Amn9OV3eFkmdL6pCPOI7ypT7w6tUo6IEC6SMc8tDOXKWmGiAwPIrxlEq7QCy0DIeyt3eNI06TXn
	Q==
X-Google-Smtp-Source: AGHT+IEcY0ia8sTwoRAYv0yUxmwNgwPhm8wtdrftfa4ddrwo+GTxfk9hINsrO5aUlvjYzopy0PhTBONSdU1zFixC2QI=
X-Received: by 2002:a05:6512:4005:b0:553:a30b:ee0a with SMTP id
 2adb3069b0e04-553b6e8c9bamr5355914e87.24.1750250096692; Wed, 18 Jun 2025
 05:34:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
In-Reply-To: <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 14:34:43 +0200
X-Gm-Features: AX0GCFtJGsl5fi6e6i6LCEjO1TuJe6n2Li_qY-Pi8nS955_BMUgd9yxByrvzkO8
Message-ID: <CAMRc=Mf==gzqXEUMd3D_-XYG7Bg7dSMLgjg3sq5-GoB1BUGchA@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Klara Modin <klarasmodin@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 1:59=E2=80=AFPM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> Hi,
>
> On 2025-06-10 14:33:11 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpio/gpio-mmio.c | 53 ++++++++++++++++++++++++++++++----------=
--------
> >  1 file changed, 33 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> > index 4841e4ebe7a67d0f954e9a6f995ec5758f124edd..9169eccadb238efe944d494=
054b1e009f16eee7f 100644
> > --- a/drivers/gpio/gpio-mmio.c
> > +++ b/drivers/gpio/gpio-mmio.c
> > @@ -211,11 +211,12 @@ static int bgpio_get_multiple_be(struct gpio_chip=
 *gc, unsigned long *mask,
> >       return 0;
> >  }
> >
> > -static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, in=
t val)
> > +static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int=
 val)
> >  {
> > +     return 0;
> >  }
> >
> > -static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val=
)
> > +static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> >  {
> >       unsigned long mask =3D bgpio_line2mask(gc, gpio);
> >       unsigned long flags;
> > @@ -230,10 +231,12 @@ static void bgpio_set(struct gpio_chip *gc, unsig=
ned int gpio, int val)
> >       gc->write_reg(gc->reg_dat, gc->bgpio_data);
> >
> >       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gp=
io,
> > -                              int val)
> > +static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpi=
o,
> > +                             int val)
> >  {
> >       unsigned long mask =3D bgpio_line2mask(gc, gpio);
> >
> > @@ -241,9 +244,11 @@ static void bgpio_set_with_clear(struct gpio_chip =
*gc, unsigned int gpio,
> >               gc->write_reg(gc->reg_set, mask);
> >       else
> >               gc->write_reg(gc->reg_clr, mask);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int=
 val)
> > +static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int =
val)
> >  {
> >       unsigned long mask =3D bgpio_line2mask(gc, gpio);
> >       unsigned long flags;
> > @@ -258,6 +263,8 @@ static void bgpio_set_set(struct gpio_chip *gc, uns=
igned int gpio, int val)
> >       gc->write_reg(gc->reg_set, gc->bgpio_data);
> >
> >       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> > +
> > +     return 0;
> >  }
> >
> >  static void bgpio_multiple_get_masks(struct gpio_chip *gc,
> > @@ -298,21 +305,25 @@ static void bgpio_set_multiple_single_reg(struct =
gpio_chip *gc,
> >       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> >  }
> >
> > -static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *ma=
sk,
> > +static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mas=
k,
> >                              unsigned long *bits)
> >  {
> >       bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long=
 *mask,
> > -                                unsigned long *bits)
> > +static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long =
*mask,
> > +                               unsigned long *bits)
> >  {
> >       bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> > -                                       unsigned long *mask,
> > -                                       unsigned long *bits)
> > +static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> > +                                      unsigned long *mask,
> > +                                      unsigned long *bits)
> >  {
> >       unsigned long set_mask, clear_mask;
> >
> > @@ -322,6 +333,8 @@ static void bgpio_set_multiple_with_clear(struct gp=
io_chip *gc,
> >               gc->write_reg(gc->reg_set, set_mask);
> >       if (clear_mask)
> >               gc->write_reg(gc->reg_clr, clear_mask);
> > +
> > +     return 0;
> >  }
> >
> >  static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, b=
ool dir_out)
> > @@ -510,18 +523,18 @@ static int bgpio_setup_io(struct gpio_chip *gc,
> >       if (set && clr) {
> >               gc->reg_set =3D set;
> >               gc->reg_clr =3D clr;
> > -             gc->set =3D bgpio_set_with_clear;
> > -             gc->set_multiple =3D bgpio_set_multiple_with_clear;
> > +             gc->set_rv =3D bgpio_set_with_clear;
> > +             gc->set_multiple_rv =3D bgpio_set_multiple_with_clear;
> >       } else if (set && !clr) {
> >               gc->reg_set =3D set;
> > -             gc->set =3D bgpio_set_set;
> > -             gc->set_multiple =3D bgpio_set_multiple_set;
> > +             gc->set_rv =3D bgpio_set_set;
> > +             gc->set_multiple_rv =3D bgpio_set_multiple_set;
> >       } else if (flags & BGPIOF_NO_OUTPUT) {
> > -             gc->set =3D bgpio_set_none;
> > -             gc->set_multiple =3D NULL;
> > +             gc->set_rv =3D bgpio_set_none;
> > +             gc->set_multiple_rv =3D NULL;
> >       } else {
> > -             gc->set =3D bgpio_set;
> > -             gc->set_multiple =3D bgpio_set_multiple;
> > +             gc->set_rv =3D bgpio_set;
> > +             gc->set_multiple_rv =3D bgpio_set_multiple;
> >       }
> >
> >       if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
> > @@ -654,7 +667,7 @@ int bgpio_init(struct gpio_chip *gc, struct device =
*dev,
> >       }
> >
> >       gc->bgpio_data =3D gc->read_reg(gc->reg_dat);
> > -     if (gc->set =3D=3D bgpio_set_set &&
> > +     if (gc->set_rv =3D=3D bgpio_set_set &&
> >                       !(flags & BGPIOF_UNREADABLE_REG_SET))
> >               gc->bgpio_data =3D gc->read_reg(gc->reg_set);
> >
> >
> > --
> > 2.48.1
> >
>
> Isn't this missing to convert gc->set() to gc-set_rv() in several
> places?
>
> Without the attached diff I get a null pointer reference on e.g. the
> spacemit k1 driver.
>

Ah, yes, sorry for this and thanks for the catch. I will send a follow-up.

Bartosz
