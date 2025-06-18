Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAE01D63D8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750266033; cv=none; b=kGwO6uPepVjRNeRZuPmj6STsBVcUcZ1tF/E6toBa0gk8R+BPeYmV3nCQ3dkga1OJwj0Rfgpj3LUZl2K8mSHIavgbGbMwBPr0bY273GsEqXI4Izgl4HkHX6HhA96b7m1xY02sNEZy8zYUXgacdqtm9xcBnn/5+PNS6ZB4+ao2uJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750266033; c=relaxed/simple;
	bh=+8Xdqwb6MvOa9JgOjMPmutzEepHU6LBWPxhoVAtdHHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EREAorp2q0eojDsP2Wokt75yjEp1uiNENI2A3b9LHWprg2nzi1gT1PN1LCLqNq+IA9jJb2Cq1PEEijDZ9hKhKkjlC3YqWRI52/C5gZ5O4j2SygFWHp5oBFW556fhT/+7reAlrJk1MGfBWVaQQGq6pIDT4yA0T/DRYxJG0OPKX60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gLlzbqTP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gLlzbqTP"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5533303070cso6911683e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750266029; x=1750870829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
        b=gLlzbqTPf/GdtLrDXOO1UxqicEoY8LKaUh1Hck/2/j6M7gHgMw14kX/GildZRh/9zf
         nAC51FFNJkA8qY4KcDgA+zaz+8rJPC9W30WytThRwAP3Fv6k4mwK4yMqaSMlKw0AeNtk
         4sFqa0liiR0XrECqxPTxvefJ6+fui69u4huVAriuIiu+SggLO16eG7RU9WiJnJToWT/E
         JqdtyRKPA1mCVXBN7PaSD0euGTSP0jQ4MF4/AgU196BoF7ew7D3DC8B2ZbNW7p1r9u2d
         q5q2g0ibe/4zcOc81a0kCFjMhNyggezAx4wzvqbfk8Ae/iz5pYkeIlveRaqeGwSLX7MD
         9HrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750266029; x=1750870829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
        b=qCnr+dyPTvkz6hjHp0Gs0VX8QRlkm02L1ly0YdGvW1shUAbh/HITJKf3ywbUi7XUK6
         wjZqqygN+UPfYZHFqKaTQQuoSYPbf/6kqJZQDD1UnkpKFxidKAE5JtoSnYqapvV86t+Z
         Wgvv2bM2Q8N481gOR4ML2XA87B+QZGnxislhgc1gQ9uYy14WbhlUlB49mEuqmET6WRJg
         TGFA9lWIl8f/qHz5196kCOb34iVIcjZTTOpJaLsM8lbD3ObiNpqdoIrO3pCYLo8tNpUf
         7LUFCurm9iFNbTcr+3puWS5t/gndXsk5LzUia88U/f08b1GRhL+3qKez5MZVSS87iSxP
         zKHg==
X-Forwarded-Encrypted: i=1; AJvYcCUjtMiLeQZ8ajjRiXRZx5l+zdYdEEmn3peaeB190U2aj0+LpyCk/kzI0s28dzVpY2Yp39Mg4d5YlV6wezU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIaMq+lHLV15gUe4Jc5xD7F0emDzAgnsuv+g6GNSjfi9LlWcDr
	7J2vBJ69uzBHb8m6IZxw5ds6uVkhjYROufzK6KtleFVskveoXSZnTrHNPqnydhcxWXWQLjwJW+t
	Xd5WDh9ytLAuj2qWVvp5tyBV//GhrT/A0QaubZ7v7wg==
X-Gm-Gg: ASbGncuF3zXZgMztTLUO3eRPQzJfQl7pl1YpDebwS8K445ULx61Nz/0/tPYq9gw2VzP
	pFnjXM0uOt+kVF7K1uMsFHb4/kw53Xo5AwikPfZCIGzp29/z6ODwkH1ijx1m1tKDEvESALyEJbo
	oNQ7Dk+l3kbUOOnR32Wt2Bn/ARMuBiikqTFjcIIYNOD4RAdAAK8UxcSTTn+CbQXLyL1ElREQ5D7
	g==
X-Google-Smtp-Source: AGHT+IFrk7wjLo0FScAaHSeULurkvYIZ6q3poIqbDoop4mdMvyFf4GdTA027YlkMWkLw9hocI1+ULYkfCsJCJgw5Ht4=
X-Received: by 2002:a05:6512:6ca:b0:553:25b2:fd2d with SMTP id
 2adb3069b0e04-553b6f16e9cmr4855031e87.30.1750266029272; Wed, 18 Jun 2025
 10:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <CGME20250618164320eucas1p28174732f38fd279fbba72f07887e5da5@eucas1p2.samsung.com>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
In-Reply-To: <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 19:00:17 +0200
X-Gm-Features: AX0GCFsZ9BzqvDbhrAHxtqvk55yr6p1JWPmW5O8GtAIoAiziZFdZwWCX10LDhDU
Message-ID: <CAMRc=MfWD7XGuuiLd5_Sh1vODfE-v6suM3w=qdufxXPtkW+HVg@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Marek Szyprowski <m.szyprowski@samsung.com>
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

On Wed, Jun 18, 2025 at 6:43=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> A few more changes are needed to avoid NULL pointer dereference
> (observed on RasbperrryPi5), because this driver calls ->set method
> internally:
>
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 9169eccadb23..57622f45d33e 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc,
> unsigned int gpio,
>   static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio=
,
>                                  int val)
>   {
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>
>          return bgpio_dir_return(gc, gpio, true);
>   }
> @@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct
> gpio_chip *gc, unsigned int gpio,
>                                     int val)
>   {
>          bgpio_dir_out(gc, gpio, val);
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>          return bgpio_dir_return(gc, gpio, true);
>   }
>
>   static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int
> gpio,
>                                     int val)
>   {
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>          bgpio_dir_out(gc, gpio, val);
>          return bgpio_dir_return(gc, gpio, true);
>   }
>
> Do You want a formal patch with the above changes, or will You just
> amend them to the updated patch?
>

Thanks, a patch[1] is already up for review. Please give it a try and
leave your Tested-by: if you can.

Bartosz

[1] https://lore.kernel.org/all/20250618-gpio-mmio-fix-setter-v1-2-2578ffb7=
7019@linaro.org/
