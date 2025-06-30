Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6759D14F70
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273841; cv=none; b=HX/kXbvOu6MN0uLPdR2/M11+fU72R6AR062qwhyXiAYEszGGEFQBdmdaHfI/nVKQYyZGRb14mciyOJ0lRAxav9zLNm7LXDv57SzoTxSZ2MvxzcSNdBJHDFuQKtSSQS6Yj3aBtyP5jaeUFVjeHyfhtee2br8NVF4a2czBbKLGJxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273841; c=relaxed/simple;
	bh=tHwsdwlV2RdkOWQDFpeoiWYoZwLF4ObvF548D0kUzbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VN4teQAckWHqEKC0CJabkAKmM6OmGUcxNBvbWG9DHERSMGrDlEVrHSrPHcI7GVu0cdK+sgwuddByOzYxmsDSzcYMmEAwsFAVRzNJLH88JonHrTzsmLpuB9xyoKvu64InuVnrkxMTmO6aJy0x8LftCwiwfUyyo1KVonyvAMekJ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3FVT4QBN; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3FVT4QBN"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553dceb345eso2196111e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751273837; x=1751878637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/xWSuspPIRwEvJOqsaKy++PiaBV+Pm9M/ghPEWy/as=;
        b=3FVT4QBNeVs4vQas3m1v8QJU1M01Iq0dvFNHHKJXa5N4rWYbhbcNa1NlnQIYqIj64A
         BU36dbQcCh22NgHQLb21ZJ85+VG8KV4fdL6w+UuSKB0PkQnbABWsN1VDZoGGDFLAN2iM
         2vcUnza/2k7uF1z/PeXRR7Vy4TqwykTKQWcmM03m1nCEUNc1EcxdoIIX1AXjacQWFNis
         j4l36Q882gpkVga8k3eBYom6LqTk+IaznUS4kRpXijrKftZkczs7xLkr/vlcmnqNchD2
         wjLNQx58tIQnLMLwL3j0mY1uX6G86FN68hhoZAYsAamYPk63pgYr6mkemhppp9T6H07A
         SYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751273837; x=1751878637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/xWSuspPIRwEvJOqsaKy++PiaBV+Pm9M/ghPEWy/as=;
        b=w7vUBjHfWx0irL/xhuGgf3C5WviQMNLZKYpSd71UCaN1fjUOC/K7s47lj8/kC6mOoH
         U3pKX/kfA8dqFc6qiky8JEY8Bk5j05ybROwbedAXOt6lEMUrDeYzl1C5lbJEoZuUeIe7
         xuINDlb8bF9cBgm4NALKWpxAB/2sqVer0Y+nY+05hDHmEKXjPOgk+mU7IPxfs/cw1KN6
         AcWRGILlgiVUGI3wTzQFbI3raMazJlFzPEGPTnnggoRtIeMdmnYJIznR4Jt4DtPZ67h4
         dFCiikJDWfbQBp0uw/6Z+mC4yznrQPyNUCFsGRR0g2ADQGGRjiJ+sm3EPp05rurTFhVN
         pncw==
X-Forwarded-Encrypted: i=1; AJvYcCVpKdxYyy7NsRJ/xIZdB6Of7EmgiuzQzIbxo7Ub7uN7/FOiPv3du+GG83pNmoCwrOdEAQG/d5bZdE1yFdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOr432eG6RUoGgTWTx75rRBJBZmVKJ5Nxfaw9kKI9n2WpTiqGC
	uCqRFEFLPRe+NOIUB/xotiYegS7OgcJmZfHYErYt89trDXpCL2P83JcxrLEvIbHoOoJ7tfhbt9W
	N+8NdExrPIvnSx05lYPHDvA5Y9ClDzlcplLyjQh1TZg==
X-Gm-Gg: ASbGnctoWGgRrIbkP8aXmkKuLYQnmNaG6kdYDechqQZXPRE43zPJx4Y2XuUwYpEuEtI
	g1NcdaUZj2y6smOEM5TUlkaayfzhbUoIKMm/XF0sZkcFllc7oafJx4sk53hMKNvH9yWivXWDKBb
	Wn0+wP7EYzFQXftZb8Afzrlf+6+6V2sPnxOrB7lsFI/lSmAa5TYjyZO3F50mKRkSn1FCVXWHd2Z
	2g=
X-Google-Smtp-Source: AGHT+IEZFMQfEkJUH+3rY8y+TTsjGBa4rf9U72HmIeYMgNLHPeZASdF9kS2CmUz3M5ntnAe3s+m3HBmPq0QCOl4h/9E=
X-Received: by 2002:a05:6512:3b9d:b0:553:2bf7:77be with SMTP id
 2adb3069b0e04-5550b84cb93mr4367395e87.22.1751273837415; Mon, 30 Jun 2025
 01:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-4-d592793f8964@linaro.org> <aF67oAqLmRJzy4Zt@black.fi.intel.com>
In-Reply-To: <aF67oAqLmRJzy4Zt@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 10:57:06 +0200
X-Gm-Features: Ac12FXwUwnOAqU4puVzSKb72DH7ePHLAhCj8ihvhutkV1VkA2A2c_2dH8givJoE
Message-ID: <CAMRc=MfXVTqncPsJ3QKqsGDi36gK4weWX1iygpqg1C-XinCEGg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] gpio: sysfs: don't use driver data in sysfs
 callbacks for line attributes
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 5:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jun 23, 2025 at 10:59:52AM +0200, Bartosz Golaszewski wrote:
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
> Defining once something like
>
> #define to_gpiod_data() ...
>
> we may leave this and others as one-liners.

We'd need one per every attribute. Look closer, we do get a different
attr address in every pair of callbacks.

>
> ...
>
> > +     attrs[GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW] =3D
> > +                                             &data->active_low_attr.at=
tr;
>
> What's the point of two lines here?
>

I tend to stick with the 80 chars limit even though it was lifted.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>
