Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA0E19995D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755899; cv=none; b=haPA3LkxOkK4PX+49CacpQWB3o6c+GsfQwQoHsKpczHaijehFk9ww5AYe0o0uFnIwgUJMfWUQMTQvCboR8zathctPzIVkJzGfortlRuAEkTozRXv8wcFtmmGuTHUDKTRcbU0xnwt15OtUH6KFy2jBYJGZR1wh5SfKu7dji88aFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755899; c=relaxed/simple;
	bh=OktGT+TBkq3WfpZd1me7J15mRYBZ6g9T1DYDBuhe3d8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fN8vuvOoEMa/msXlfrt+G/Q5JqeI6haluVtjm1rPTJEcRC9/xnLb+j9NlhugkbCC85XdCU6tsldclOdxSI/VjY+UvW816LH3nq0P0Kc9aYRBuc1QUkloKef2/BtjBd7ice2N8GRkmKmdfBm+O2uQ4Wr+VvfS41xKiuY0FeQVrsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=awDtH6Sm; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="awDtH6Sm"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso17463561fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743755896; x=1744360696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjK7W0Om4uq93pjMJtCwW0RKoP5OEp/tohd8eg66f0s=;
        b=awDtH6Sm4pWEr6KInTiEOOi8NnZyDAmshppMr4eQwj9VhLy2EshRGyZ/WmootQn0oj
         OoQJLc8jRb9Xmlz/YA2gJyLUJyP+HXn1PAeaToVeOFSD4ladaH7FKdNv/3gu5iKjoCav
         VOHBvwklezw7I9mkfDBZB2JIjwtglcKweoGjK+Co1oYmycg2ZwgoFgBaBrpRtSsMJTZF
         Yt8JBAI/qKPyvjVQGwAFaCvBeCQIifzPIbixUKxoTv2wJvBCi1Ks28q9K4iPhzKxzOP5
         yZT/gHo43HobB1gghIk3cWNKFxJEnOL+BiBLeWq61RABgDaFc1x1vXn6HdlT/+ouJZBp
         /H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743755896; x=1744360696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjK7W0Om4uq93pjMJtCwW0RKoP5OEp/tohd8eg66f0s=;
        b=a+i0xL5xPwPeszw5Iny1obEhajltJ7ml8NDX963oCCqbQh4AhORND3NqCw+nyy7rIf
         adIlNppFrxJF/HTO9VD6hP14FscGfDOqB6Bu70ijXt9aVfjjU3cSy1VLAIitVASaFn+m
         TRrzPTYlZepdJq6PDr5CjO3gxoyuyeohMQQ54HjYXzY6FmL476DDlca61zFrBzrjmiFL
         frS2BG3HvNJ9O/olzccGWVnxyBbdZLI/jyE8GBMyenGeV4JymOFyaQJ0MZEogC3mGuKA
         +h9zIIiscIIHINUCyZYDcGBjFoB1msoh6dnl121910vjT1vkUw7rRabcmEUw1ge616e8
         yIzg==
X-Forwarded-Encrypted: i=1; AJvYcCVTRKyOPv+1vnXq89hVdq+iNXBX30IcHjtJ8WC2hNM4zvPHBzLqNmWG7eEziUfcb/uDSE/DrGhA92gDJd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YycJzEpMT+P0fgf4g0w0hM35d/AMxYWptoq/2mEEwEGEeD6TWxL
	cQ7MQBaexzntfIWwS778WiGhfSK2Uyexg4Tnp8MiAI6vZwOdwCGMT2LlkYxw3Jn+CG/AIisGvMv
	CmZIcWctVqEXPZq16HGSvvi5slH37Z/LysyEJaQ==
X-Gm-Gg: ASbGncuZ009jb2zWAqkXfvCOvYVSCWaGCQR9HMgUugwKOPhg4bILEEr/DypDKX84V2d
	UsCQXb00J8jJEDk1dbKnzdQDA6IuzclNX10LGZRMYZMzwCAemACfDeF4eieJep6mJIix6vQ4Rda
	BIEW2mMvYDyGgBnj5ViTTyY45yi77BRW7bPjKaXs4SlfQGFIGDh4JfbXRkGA==
X-Google-Smtp-Source: AGHT+IFo1yqcfYeeSlc8DpjiZKDyI9rcLin3wb9oxxwP6e5Vf0xIJMSzOKpz/A/vVvQ7XboHvE1K21R5AhhVXknfqdg=
X-Received: by 2002:a2e:a588:0:b0:30d:dad4:e06f with SMTP id
 38308e7fff4ca-30f0a0f0da0mr7997421fa.2.1743755895678; Fri, 04 Apr 2025
 01:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403160034.2680485-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250403160034.2680485-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 4 Apr 2025 10:38:04 +0200
X-Gm-Features: AQ5f1JoFgmR-MJjXIiICCtTNAV6gI4tCP6L06BPqgDcRNqu4WYtSJEQRY5AjDtI
Message-ID: <CAMRc=Mf8AyxAeNbBbiQn1HdkrEdODmTAhTmrtiAp6H3=HUPSWg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] gpiolib: acpi: Refactor to shrink the code by ~8%
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <westeri@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 6:00=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> A simple refactoring of the GPIO ACPI library parts to get an impressive
> ~8% code shrink on x86_64 and ~2% on x86_32. Also reduces a C code a bit.
>
> add/remove: 0/2 grow/shrink: 0/5 up/down: 0/-1221 (-1221)
> Function                                     old     new   delta
> acpi_gpio_property_lookup                    425     414     -11
> acpi_find_gpio.__UNIQUE_ID_ddebug478          56       -     -56
> acpi_dev_gpio_irq_wake_get_by.__UNIQUE_ID_ddebug480      56       -     -=
56
> acpi_find_gpio                               354     216    -138
> acpi_get_gpiod_by_index                      462     307    -155
> __acpi_find_gpio                             877     638    -239
> acpi_dev_gpio_irq_wake_get_by                695     129    -566
> Total: Before=3D15375, After=3D14154, chg -7.94%
>
> In v2:
> - renamed par to params (Mika, Bart)
>
> Andy Shevchenko (6):
>   gpiolib: acpi: Improve struct acpi_gpio_info memory footprint
>   gpiolib: acpi: Remove index parameter from acpi_gpio_property_lookup()
>   gpiolib: acpi: Reduce memory footprint for struct acpi_gpio_params
>   gpiolib: acpi: Rename par to params for better readability
>   gpiolib: acpi: Reuse struct acpi_gpio_params in struct
>     acpi_gpio_lookup
>   gpiolib: acpi: Deduplicate some code in __acpi_find_gpio()
>
>  drivers/gpio/gpiolib-acpi.c   | 146 +++++++++++++++++-----------------
>  include/linux/gpio/consumer.h |   2 +-
>  2 files changed, 72 insertions(+), 76 deletions(-)
>
> --
> 2.47.2
>

Will you take it through your tree or do you want me to pick it up next wee=
k?

Bart
