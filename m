Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906411632E6
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918006; cv=none; b=G8Jm7aSxt6wGaTTm01nrBD69xHwmeBhGhisAtDmcb1qdmiZZWvoQI1qSqbnPgUt78v6rYcRZx4OeiHnYgmXbppakH3h1HEbczlo0QAsko7Ng4ihnq1BMiY4rt5Zgrf8MpERmA9KSMbS9D8n4W/vZDChtZTtzCXcGqPdnpwd3/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918006; c=relaxed/simple;
	bh=/PL3F+Odm8sDQkKZjBFX/dKsMg8zyOLm688XjDETz80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZF6z/mgan9b3qAEYGzOHNYLLmzvv2PxDQpBiL+Utndmyw2FtAdlgR+sxWVCGAQs/p4Ie8jhfUY7HIxnf0GbbYTMoaRVC/Ihn1OnH8br+BZIgme33eN2blrtknLjZ1w3BsO81jvtp+Y4bE8OqGWoZVSSvkc5fKQpFNgtuvwmSNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kkTkrQFC; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kkTkrQFC"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30613802a59so19950221fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738918003; x=1739522803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QG4fsHlA6ZIYyL5J3zXb87BTeZ5glrN9fOoi7j2CduM=;
        b=kkTkrQFCPWYLtgout9JHRJJC8tpVXpNXy5KCgtqd2KdXOjkQCEHTEeWfy+nhl6J2vQ
         OHqF1QtsyWChcF11y3Ki5hEU9OJx5iej/alllh0QSj1i9+WwvPNUYcYt5mNiv98t6o+I
         OY8XZdJ4H/r2A9pGz2dxDuXdiPqPtW3i43eK/FN6pvqHFuOV6u84XA0tYtRfB460efRj
         ZrKDQVsPY2jccLgIjgPZf5tnwNKBvFnPjNDtP598v//vz1qYtEaucXYcdlSbchGDSugy
         Rxolyh7eAZgQfDCJntEcODrwNCwJcD2pRf7H2p1m99aSArvjXOn+1dk73CsCDT0aHid8
         pGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738918003; x=1739522803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QG4fsHlA6ZIYyL5J3zXb87BTeZ5glrN9fOoi7j2CduM=;
        b=AUgbZYDull2xoHkH2dfJ+2U4uXbX39fqGug9c6a7kU5eY1jnAXf9cJ0NGp5siXP1Ud
         5oGUXlN0uGQa81lEPPbzH09gYRRnAqeYLQ+1bXr/u4YEFBDx9PBOSrZW7vaIOgDtTTBD
         LIPsIum92H6ufw6q1XufeecS4rf5gRMhi/h84AVXoDDKTBG05ff5iHwFnSbU+gmUmvj3
         FritCokvLoBN+7kZN0YQdwyL58PrGugE08gGJVPHDFH6wYcxUjC2dVCbk1GjZuakVd73
         JDGBsdD1xwRuOgbP3AP3XaHikWJe4vt+xbxxj08tEYVB3GmuEFBpIYy4h8+oFJ1NbYmD
         LG+A==
X-Forwarded-Encrypted: i=1; AJvYcCWDAMglds57yu4XCqj3ewylOFBVSS3fQrbzfBvgeJN9+PitC4C8l+Uk/CZH1UkPadyLG/WbXq2FwL502Ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfyVOwzwKTEDka5K1Wn9erKIx8qAI7gf6fk9+B1VJy7V3KB0E1
	HFnq4AnsVPI9US1xnPJdd5eZknSqV6TQHG0mDvsbTBpvRZX0Bou6zmn9TvmfAdvNu6Kxtev46vj
	r/j1tCZP6Z3KwO1V+VG+PMPKDblsmCa2JDl4DYw==
X-Gm-Gg: ASbGncvLVorQFyCVQ32qaykHRnoi9FO/3eIHslHPXDfoE+2/hA1ZTRKoIncWu++T+n/
	tvBjDpnbxzHZ0d6oBg9/kmYzL9VitdaEgsTOrxfKj0XbwKet9w7SPffQCHOnWKE7yHUZg0YOMEl
	uZVFaycAgVLbhfQ3mfpztpy4xxT78=
X-Google-Smtp-Source: AGHT+IEm0faBVdVl9PjoHwoJbVHYreUiIDgEOuDYoTNcEfQYuhaKkIrH8p9HKr5Sdn3D9dm5RKdAJZ4ezE2+znUjf1c=
X-Received: by 2002:a2e:a10c:0:b0:302:3de5:b039 with SMTP id
 38308e7fff4ca-307e57bc6b9mr5403511fa.8.1738918002457; Fri, 07 Feb 2025
 00:46:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204175659.150617-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250204175659.150617-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 09:46:31 +0100
X-Gm-Features: AWEUYZkmBgMCpveGQvSr0D8McJ0InmKUA3IpAMEtZrdd4WfIVBN0a-0mnZDOhBQ
Message-ID: <CAMRc=MeS1gCP2aNKs9xydqLQQnVbWHbVoSqTyLzVcENDFZYM=g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate some code in for_each_requested_gpio_in_range()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 6:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Refactor for_each_requested_gpio_in_range() to deduplicate some code
> which is basically repeats the for_each_hwgpio(). In order to achieve
> this, split the latter to two, for_each_hwgpio_in_range() and
> for_each_hwgpio().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/gpio/driver.h | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index a307d8ed9c51..24890ecfa0fb 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -549,20 +549,25 @@ DEFINE_CLASS(_gpiochip_for_each_data,
>              const char **label, int *i)
>
>  /**
> - * for_each_hwgpio - Iterates over all GPIOs for given chip.
> + * for_each_hwgpio_in_range - Iterates over all GPIOs in a given range
>   * @_chip: Chip to iterate over.
>   * @_i: Loop counter.
> + * @_base: First GPIO in the ranger.
> + * @_size: Amount of GPIOs to check starting from @base.
>   * @_label: Place to store the address of the label if the GPIO is reque=
sted.
>   *          Set to NULL for unused GPIOs.
>   */
> -#define for_each_hwgpio(_chip, _i, _label) \
> +#define for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)       =
               \
>         for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i); \
> -            *_data.i < _chip->ngpio; \
> +            *_data.i < _size;                                           =
               \
>              (*_data.i)++, kfree(*(_data.label)), *_data.label =3D NULL) =
\
>                 if (IS_ERR(*_data.label =3D \
> -                       gpiochip_dup_line_label(_chip, *_data.i))) {} \
> +                       gpiochip_dup_line_label(_chip, _base + *_data.i))=
) {}           \
>                 else
>

Can you add a kerneldoc here as well, please?

Bart

> +#define for_each_hwgpio(_chip, _i, _label)                              =
               \
> +       for_each_hwgpio_in_range(_chip, _i, 0, _chip->ngpio, _label)
> +
>  /**
>   * for_each_requested_gpio_in_range - iterates over requested GPIOs in a=
 given range
>   * @_chip:     the chip to query
> @@ -572,12 +577,8 @@ DEFINE_CLASS(_gpiochip_for_each_data,
>   * @_label:    label of current GPIO
>   */
>  #define for_each_requested_gpio_in_range(_chip, _i, _base, _size, _label=
)              \
> -       for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i);        =
               \
> -            *_data.i < _size;                                           =
               \
> -            (*_data.i)++, kfree(*(_data.label)), *_data.label =3D NULL) =
                 \
> -               if ((*_data.label =3D                                    =
                 \
> -                       gpiochip_dup_line_label(_chip, _base + *_data.i))=
 =3D=3D NULL) {}   \
> -               else if (IS_ERR(*_data.label)) {}                        =
               \
> +       for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)        =
               \
> +               if (*_data.label =3D=3D NULL) {}                         =
                   \
>                 else
>
>  /* Iterates over all requested GPIO of the given @chip */
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>
