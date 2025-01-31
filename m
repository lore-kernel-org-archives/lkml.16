Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5DF139E
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738363570; cv=none; b=MLV1nLxKLVEjkciNZbmyG3rG3ydvmzycL4aTf3hC4w+t+YWaJ2Nw0PcVJkJw28665QlMCKdfqWxAk7b2xlC9XLc50aMJh/i4iIsdulgLlIBgNYSyW1L9GX9YkvqbpKcXFeBo7gamPtNdS7qd6yMHxitNwr7UV0orNUD/Q1bYTkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738363570; c=relaxed/simple;
	bh=fV9hhrVRP+qzrleYSIWXpKoYEuxlmibMFIbjPlpYr2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B77ji3iRm4DqRjH/8pZvLnpukr12ZQFAacw1MJGN7xnNe4euq8HMhW8dNgnfVphQhBV2mKNN2wFCO5jeguc4WO3j2u+OIVnoIibjurYVpXcK7ElqL0RbzlR9OmQ55IEQXiBsEs8rRIJH/locwtMnFGQ8pxW5QkIllU1CMz4Oxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZD5N+cS; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZD5N+cS"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30797730cbdso24049671fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738363565; x=1738968365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fV9hhrVRP+qzrleYSIWXpKoYEuxlmibMFIbjPlpYr2A=;
        b=NZD5N+cSwgVpbp4uBKSqg9Ag0t7Oh4RA/lD0W3UwbFHWlduW2tIowWiv6HwJBhUViu
         xSuh4Kje+bigOiOnBVSWZDT9VJXlhLagMHAUEt3NEfB0hwA9nNvX8kSTyeMTKHxw9yfj
         2rGKONg+p1SpUW6udf14oHRIPfnrGXTD8eYwEzaZaiDCgXJZzTH743+hl0zqAVEXITbx
         R/56S+Sv2LB9ARZKAfSI+pU+Zz2QkHjOEGj1XrtamsQO7VLQbPmaZ27VBJFl/uBnoSWA
         u5IMRUwQcuazoVgnlNRV3UBcRy6Z1bB71Y+sxxmOty/Foo4vtnmr2VEsq5IGcAyjRxJ4
         hw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738363565; x=1738968365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV9hhrVRP+qzrleYSIWXpKoYEuxlmibMFIbjPlpYr2A=;
        b=KEed/5DcZWSeiPBGjiKoLrg9AScV9IaFg4eCt9DPiWjzFQhDJ1J3eXAQBqKu0A6nvA
         dDrvuIIPZGSpSUwyeoAsUfxrwMuBm5lUZCsy1NEsJ0YMEdJ6ggvjl/dbiasKYW1IfNCu
         5hte9pd3uH4nMunkXkdZ61OLdcj4z1kL03KebQgxg9UHd4zdri+qezeXy/OQjCG9kqha
         xIZhn4vjANRBKZ99XDLQBa3QwJHcyggmMWnKs9LzUJTzgIcv7+sNWz2cMaOG3PD/zLdb
         9K/n6DwIXuD8nxLJb+eXfn2BajQbDHdB9LMBw12N2eEw/BB//Vi+DQM4+dXTbY8011Iw
         f3mA==
X-Forwarded-Encrypted: i=1; AJvYcCWoO82RI5kVCFPUY9YE4vHjAM2vjbuxpC9lDuzJNK1LCPZBffGrnrAN7Weimmg82qUB6ua/0OOUnywiRlk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8fZt/Qs5cVdypwbCrOWJKlWcwSwYD3VV6bQ8ATVRNIdQveXRI
	LVBsssZWI8W0s5WwplcxLH2E3jMz2BHt+AGRaKL/29Uvta+Tkz2FHJQ06WIn5q2GIxjdxZQHVzE
	2AgSPLxCuaMhB2bgXJeKNSOmWaf5xJjktxfDCzw==
X-Gm-Gg: ASbGncsfVpmN6wEiH3RIQixNRzNVLqZiX9YE89oJLKkZsn0yPM+n5T0UBxuvf+oySUM
	OCuroTofEP9mkm3BOItW7qC/JuuO7/8tS5KNL9Q3AxWfu3VO0w6uaDQAbVZFXOU2kjxsr928=
X-Google-Smtp-Source: AGHT+IHHYjxVhba4NRZORQamjtU7NeuHHIHelxxj9O/XIYBIqNCjtNKWK69c7J1JA7YkTDGQPCWMRncUBp/ITQdEaIo=
X-Received: by 2002:a05:651c:897:b0:300:1c9a:80ce with SMTP id
 38308e7fff4ca-307968e0098mr51916141fa.33.1738363564658; Fri, 31 Jan 2025
 14:46:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
In-Reply-To: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Jan 2025 23:45:53 +0100
X-Gm-Features: AWEUYZk_dyG4cveXgq-R2QdDjI5W5xxfEw1ByFh9vnHwzlCQYvkaIUdRlN711z4
Message-ID: <CACRpkdads3+XQqvZDJXmYHDLGfRK0H_S==72uqkuht2nEX1+rQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] gpiolib: add gpiods_set_array_value_cansleep
To: David Lechner <dlechner@baylibre.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Jan 31, 2025 at 9:24=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:

> This series was inspired by some minor annoyance I have experienced a
> few times in recent reviews.
>
> Calling gpiod_set_array_value_cansleep() can be quite verbose due to
> having so many parameters. In most cases, we already have a struct
> gpio_descs that contains the first 3 parameters so we end up with 3 (or
> often even 6) pointer indirections at each call site. Also, people have
> a tendency to want to hard-code the first argument instead of using
> struct gpio_descs.ndescs, often without checking that ndescs >=3D the
> hard-coded value.
>
> So I'm proposing that we add a gpiods_set_array_value_cansleep()
> function that is a wrapper around gpiod_set_array_value_cansleep()
> that has struct gpio_descs as the first parameter to make it a bit
> easier to read the code and avoid the hard-coding temptation.
>
> I've just done gpiods_set_array_value_cansleep() for now since there
> were over 10 callers of this one. There aren't as many callers of
> the get and atomic variants, but we can add those too if this seems
> like a useful thing to do.

I like it.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

for the series.

Yours,
Linus Walleij
