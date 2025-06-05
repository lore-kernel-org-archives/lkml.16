Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B112420C016
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129409; cv=none; b=Sma1a1uq3vRQZGeogCsuXi90bT2XmDlVH4qAkTBphrJrw3thsmrI88Rmn3TyBDfQnXS6SuZs3HWn9fndjUJ5pvNu3olq8IrekDKP5VUhNzAKAd3GyqIuQojtdqfVutfFDjMrySZSNiCK8fZDRGOg/uNxot3wfIjZQgO0jyVBgOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129409; c=relaxed/simple;
	bh=k0Hbyy3QvPmBEmGfE+iw2klZZIGcUzF4JX5g7Ivo23Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZorkJCX/W/vjqhuLrcbOhSuVkJwd64Fie3sDgqvkw3JW++GifW3hUgmANkOIdevslQXS3MhYwN+qQTRLshXEaNCLpr6IznWcG8ZzFSUDZP9JFIp7dzIQD358Dk0qRtBJhTJ2VnQQKMhTHzGOLtyagvnxUEbWr1Wg6bSTZ//sTkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WqCsjrL/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WqCsjrL/"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1154407e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749129406; x=1749734206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxXez72tmox59Cq75Oo66zXwfJ67mOMcPg20hwp9f4M=;
        b=WqCsjrL/PINi7XA3g9VTu//V5gowv4RCHLjliivBp/UCZElsxBvTrQDRoE4oFskZqG
         Fsclrv6k6VUHvlmLszGfItAYZq9/r/cjuu0FGKnjvKmTc07epoAa8R0qzxPObcnZrRbd
         d1tKwphqo32XgMBhlSnMBlRYQ0ouQeP3aL0OzNdeHGZKj7tK6/Zbnw/5YNaFxNl5Lz8M
         j5kXfgruW2JIWl35alN4saTsSds8ipV/p31Iru8w0gQPm4eQifeYaz1pFjujn7LVvP34
         aVn0ZXJFEiTtmILWKSH7sRKbyRuDvENHy6Rj453IKWtjnxZaWcJD8Jq4bOU9OuLpjib+
         9lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129406; x=1749734206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxXez72tmox59Cq75Oo66zXwfJ67mOMcPg20hwp9f4M=;
        b=ZwnHITsAt8TbOxdKM5cGnKOIIKiYvbpgjilaccUUQqMk1BB+KgUdE71RlGp0aP6vbK
         KZgk23SVn4u3TvgbPixJ9rPJ6tAdv7sVYXAoKzJFZdSJi53iaLqt7kSszPLWF+I0q4CT
         w/6gj7jKwRbW2B8/RPP1VIXk7Jxk3mHHaAhQroYTVcOpDPXkRj7lozqnkuW5kwa1J5Nc
         2hMUhdhknlT+CQpC9fuTsXRXitzRgmEwDc3AQfVShvlsrMiWZI4HXDM5YH0Jnuvb8Mq7
         OCpIWrduzFU4VKVnsjghELHJO7PTcHdTb/1AbXQX3XL8+W1Hzfhq7ICu3oMoPbhx7n9L
         E/1A==
X-Forwarded-Encrypted: i=1; AJvYcCUrjFoFgLt0O1OvZU0OSc3nG0RHfFpzsEuJn92wsVtBayQ6YoESXKeuPgCQ3QSF6+bdb5lDCAuNXxiYU+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRyY+4DOor5J8CBeJSnTv239OqCLOheK7PiPR4AyYUBvG4uaSG
	TdOiC6lz/udoVthI2OGrsUHDirMQ5Faunq1ES0hOmHeAFMts44Zr8U18rfSraxC7Xilpl5hZyhq
	X0ZMZU0N6vPYn6ak6cvM3tK4XfMM0zSl4vaPDQsBLOA==
X-Gm-Gg: ASbGncs/lezw5ICgWZ275I6YX4owwCKTRYYrFnMtwHVdqeC7hwr6tXFl4UmE5/KlO1e
	xfkjzDU8PqIq+asbARLB6YIgsBaztqE9JBorBHfO0RgANn+zz4jhAx2bC/hUH4/78u+e2TYH3Ad
	HDJ0SEWov1S/SpWRMZRL/heE6TMH5pYfz83yEIsmmYsSORaGB4HvF+Qkr10J3Q8dY=
X-Google-Smtp-Source: AGHT+IG1FLIfsa6ezMp3MccDVHC5XAJOHj0QyInfJVqCTEun1SDxwdcWFvKFJCuA2PNkGlpvqJmb88wRcDaLGqLLsh0=
X-Received: by 2002:a05:6512:10ce:b0:553:37e7:867c with SMTP id
 2adb3069b0e04-55356df2a9emr2071437e87.50.1749129405586; Thu, 05 Jun 2025
 06:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com> <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
In-Reply-To: <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Jun 2025 15:16:34 +0200
X-Gm-Features: AX0GCFt62eNdDo8nSZ5fnuh_lgkPFAVa1oZqnviWb6rgA9ggBUhsLTEWXYkHUBU
Message-ID: <CAMRc=Mddp=rmogziQ2XrzsO-TiRh9A5U3v8UxJqz_so1otPMLw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Introduce HDP support for STM32MP platforms
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 3:04=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Wed, May 28, 2025 at 3:33=E2=80=AFPM Cl=C3=A9ment Le Goffic
> <clement.legoffic@foss.st.com> wrote:
>
> > Cl=C3=A9ment Le Goffic (9):
> >       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
> >       dt-bindings: pinctrl: stm32: Introduce HDP
> >       pinctrl: stm32: Introduce HDP driver
> >       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer
>
> Can I apply the driver and bindings patches 1-4 separately
> from the rest of the series?
>
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
> >       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pin=
ctrl node
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2=
 board
>
> Or does it need to be merged along with these?
>

Would you mind me taking patch 1/9 through the GPIO tree as I'll have
some gpio-mmio rework going on next cycle? I will then send you an
immutable tag to pull.

Bartosz
