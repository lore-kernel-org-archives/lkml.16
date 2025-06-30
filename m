Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D53D28A738
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290774; cv=none; b=PzVxI3mD2UHOsZAxOmy3vO+Ts73iZpeeiNcOha1498FBqZI3xP1pwie2yGbGNyVeHFYF3yrUlBtqD/azLV3DS5Z50Dhmttp2NCkRzPo2A25qjHtmHrcgGDMfrn3VUZKneZgJ3fVB1Cwr27XBpexYxxbDKGTeXKl1Nle7D5LUwAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290774; c=relaxed/simple;
	bh=Z8BwjejyUtMqj3qDa68RlzA/aE15DCSP5zmd42SGGqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luPxIDYhV5ff5cUn1LENX5mIxbJ20Kgo9K7KN7w1qIXxb2EOZRtH7Pa7JVcwrcpTLU4MAS55e6RIALwJi629Lm4KEKMBCAn+ctKMhdR3xybY3eoVky2b3m2fC9nxOSmFB/Ir4ltjPDBsLO/qAyQ4KD13KBdMiS77ljdU5eImlao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UEvx9OMn; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UEvx9OMn"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553dceb345eso2522795e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751290771; x=1751895571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxJcYXt3DvvcXVxOrXPlSlJKlDq8rLnu+XYFfX/hOmI=;
        b=UEvx9OMnNoo/o9uJ7eYzR4np0sAsbRlUqBX5Xw0sBRCeOO66CFRPUtWIcFw40Dz1ib
         i2t+pVFyTOD7GAKFs9EJah9rnh5mNbVuZnuf0rSp7+j08BkLr0pT0zUVXn8ES4mC0sF1
         4wRHE4d1OPJW5gRcnqgDtFuUggBSUKaPzVsE5YSJdAsyG2vwskqhVmgqRxqM/VWya2KV
         VfqNkHx34cU6MfdLui5oMdQ54Wtg8xFoK8hlFq7uL508AMuHAxY8y1fs9IFzW8hk3tO9
         fHZK2Itl8tQPsjhzmA9WDvRCQv+owLAsRN4MIjpDCZaT+T5HEJInzGPeJj5wNJR63bv9
         E1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751290771; x=1751895571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxJcYXt3DvvcXVxOrXPlSlJKlDq8rLnu+XYFfX/hOmI=;
        b=tSN/IUJ6RfF35Q6XOCuFCAYUpIXOLsJ/vVf088ZuijDnaruX6/Mbuc9RHugJwRPK4F
         aiLCSqBHeuVf+FYy9c6ZCxNDD7ypGpWOf+uk6Njy5w8XKaLOL2WqizvkxFyihdh4C1hz
         luqPaCWRPsdbk+DD0uiIVvMQ+95MfM2T2AyVtgCxrCPoQjb/s6LBNokDUx+SC1VFHCC0
         F459UqNqsDNvAg9Nnj9svmmFh9GtGuXZsDcy+UtoyiMx/cKabaWI+1Rp6yBP4T5nFzTF
         cgEnoZKvL4enOOaWgzv7xxGsSpjWQgF1uVh4IkRhaN2qCzKj93yXKdFdrNzsIdbAK2fA
         u/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPcEZlUNTzrabNexL7mNfpMZyiT8zvf7YJhYudl1I8+lY0aAcBbCzTa4wQghioF/KWsdtUElE/wK2tSqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8vfOGCJduC2iEqjDYJXWnQ1YhfQlrIwErdGmELXQ5MKmDJDu9
	zUGmyZir8J1SgLtI66a+Iu1CO4rPO/EW9whEKixHKEwEmSCopmgHVjV5JXIR2NcOd2/xWOIZ2u0
	u4/Rwox6RFadWvZBZGwvUHaCGL+KDrUvjpYOXKIuJcg==
X-Gm-Gg: ASbGnctOgiV6Uyd/Tk4ztdHRJvtSMFhr2/IyQfnxVertIeiWM/+X7HSFj54bGwe9Rbq
	iRuqBGFCCnlkWou+fgsyaVf837qw+ncDCuUwE+I00XK+cGNRnapks3wAwH5PSJMh4skbuwN4UsN
	kFHnubL2cWnhI9swWAPqAetEhNZZ9Qho3cy4uuZl7wEFB3WwnMJxNEBfRZtpa42Bz2ig79uShum
	IfidjIhrYKjag==
X-Google-Smtp-Source: AGHT+IF4ru3jiHKvPFuQfKlDxriAnoR6H5d9/9sNmyF61Ow2E7KtqD8/jBoz+OYFu2tcgwpE9YoeRRh1zDcxmrD1AL8=
X-Received: by 2002:a05:6512:3e1b:b0:553:50c9:c8a8 with SMTP id
 2adb3069b0e04-5550b8c5aa9mr3459411e87.48.1751290771128; Mon, 30 Jun 2025
 06:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <20250630-gpio-sysfs-chip-export-v3-6-b997be9b7137@linaro.org> <aGKQ3m87REse0abU@smile.fi.intel.com>
In-Reply-To: <aGKQ3m87REse0abU@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 15:39:20 +0200
X-Gm-Features: Ac12FXw5ZmGDkDDR0FI-fTe-4InhSSiapqfWP036ubGoaW-eyQX6KWK9FKimMgQ
Message-ID: <CAMRc=Md4f_CMWKEr+k7z0NosnDmXtM1WO1ONyzE0j0OgN2W3vw@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] gpio: sysfs: don't use driver data in sysfs
 callbacks for line attributes
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:28=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jun 30, 2025 at 02:37:13PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Currently each exported GPIO is represented in sysfs as a separate clas=
s
> > device. This allows us to simply use dev_get_drvdata() to retrieve the
> > pointer passed to device_create_with_groups() from sysfs ops callbacks.
> >
> > However, we're preparing to add a parallel set of per-line sysfs
> > attributes that will live inside the associated gpiochip group. They ar=
e
> > not registered as class devices and so have the parent device passed as
> > argument to their callbacks (the GPIO chip class device).
> >
> > Put the attribute structs inside the GPIO descriptor data and
> > dereference the relevant ones using container_of() in the callbacks.
> > This way, we'll be able to reuse the same code for both the legacy and
> > new GPIO attributes.
>
> ...
>
> > -     struct gpiod_data *data =3D dev_get_drvdata(dev);
> > +     struct gpiod_data *data =3D container_of(attr, struct gpiod_data,
> > +                                            dir_attr);
>
> > -     struct gpiod_data *data =3D dev_get_drvdata(dev);
> > +     struct gpiod_data *data =3D container_of(attr, struct gpiod_data,
> > +                                            dir_attr);
>
> I still think that bunch of definitions to wrap contaner_of():s will help=
.
> Note, two of them you are using even in the code below, besides the attri=
bute
> show()/store() cases.
>

I think this is overkill, the container_of() macro is pretty explicit
and having 4 new macros will result in more LOC in the end. I'll allow
myself to keep this as is.

Bart

> ...
>
> > +     if (strcmp(attr->name, "direction") =3D=3D 0) {
> > +             data =3D container_of(dev_attr, struct gpiod_data, dir_at=
tr);
> > +
> > +             if (!data->direction_can_change)
> >                       mode =3D 0;
>
>                 data =3D dir_attr_to_gpiod_data(dev_attr);
>                 if (!data->direction_can_change)
>                         mode =3D 0;
>
> > +     } else if (strcmp(attr->name, "edge") =3D=3D 0) {
>
> > +             data =3D container_of(dev_attr, struct gpiod_data, edge_a=
ttr);
> > +
> > +             if (gpiod_to_irq(data->desc) < 0)
> >                       mode =3D 0;
>
> In the similar way:
>
>                 data =3D edge_attr_to_gpiod_data(dev_attr);
>                 if (gpiod_to_irq(data->desc) < 0)
>                         mode =3D 0;
>
> > +             if (!data->direction_can_change &&
> > +                 test_bit(FLAG_IS_OUT, &data->desc->flags))
> >                       mode =3D 0;
> >       }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
