Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620DB28DF21
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140910; cv=none; b=cHVAxKUQPK6DjwIYHB2OM9Hqfcp3SlIqmMAggH5bfNOGNm9Ih+PvLXtWB/xZVrGoBS4UOl8JAQc9AnfbBxa6pZaikqu98ReyJ4wUD7fv76cHOIYwV5kpXPvXWYA5m4WA6JKIrCgjnrLEPaeoYIZ2sBpRE6EIPwcotkZ8x9i8tZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140910; c=relaxed/simple;
	bh=V4YyQVRHSdZGH95X6Dop/K9VSHUKb/zy1JX85cuCZ+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NYgVBYcdMqC3qvUt61c0KZeCT+dUtqUDp3g4XIM/dmlWgeCuXdBk/h1qFwIyD5q3CKpwtdztKQumj4redtTPm0e/OuhvcmlCVOUf2zOY1ML9rVH46/vZV7oXz22Q9f1QVjMpyPRHe/Gxr4sI8FfUfkedTZihSOUwyO2VgspRu94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YrWUVTU2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YrWUVTU2"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54d6f93316dso6935058e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747140906; x=1747745706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBzqHhCokto4VQmydUL0xYsmAFrm82zvVpsZ947pF1M=;
        b=YrWUVTU2yFiPvxemnNMDrhJsEoJ4IkdDFTiuATVrjiSIpWNYwzSyry1h1CEOwL6ZXj
         MCvZGSyh2DG2rLvJ4YqMCl1TKHCqGMphV2MPcJmZfjwvspBy2kiMioCCVeuwJQTd0z8h
         PogqDWxdEnYh6yYy0UhwB0OP5/AAOzgwhWcU5j359LGmQouzsmsO/vQ+H6BvC/jYJP/W
         MnwSZd+/BXuVeXJ0P+viojL9ueAZPrgVaXHYX3I6gEMCeys9qr0pqkqWpYSmmyJjbkgJ
         4EoT/wObRPmK62QnVgMtU6z3TY292YivR87jRZkXxLBqfVcYqVM/LeFspLOXYIFREdiX
         svIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140906; x=1747745706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBzqHhCokto4VQmydUL0xYsmAFrm82zvVpsZ947pF1M=;
        b=iCZ4RtQeAKH4MkGDwmzAJ7EZ3emN2SoQ5j1AXDj6IqZ6fP8JEAB6TTBDL3Pea9HNnR
         Gfm5OrPDWcodp/5w60dtwjlKVifF/MOGcpR361QOJCukaILZA0zTR06ERko+EUeOtg+Q
         t4f+FkDczFyqunAwyRHrIFU2KvU05RAkNvsq3hEVKCG9odspR4kNtaHE9EyNu/Zr9Jlr
         hfaDzYtILwi55Eftyv+pY5YxUcd3CY+/0j0oJ8yogAAPwkPm4p5E89s7xivv1NtkP79h
         eJsM0JzAd1Js6IAizbgTsA0vxwjEZdlLSuQNGhlJhX/Qnkd8Tmef4lVhLS3CSI2zASgz
         Aw5g==
X-Forwarded-Encrypted: i=1; AJvYcCUjoqCcav5hi5TSLHvspH0V/CZUhJz5SEnudnYHr6WKjvcdcRFd7kW3r51xBh285kNHl9TqFA97sBFfcoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw840owaUyegSprV98cs+b1BSClXl/95x6PC1DYy6SUfgioJxUk
	0aJYwRUyHzuGSci5mde3z3J4A4LTyWoWwGaXPPQCvLTmDJfpQL/Ek9EGd38cB+dyE/VgWsenMG7
	cjV41x0n5TZtfp5D3Y8FCBuXbwV/oUi2QUjo8xw==
X-Gm-Gg: ASbGncspSe64fDUWLluDtasZOxuvz7u9Lyrsj0rAqdZesr2pWPwX9QkjL8GmpiV9Fos
	IQPGMtjHyn2YLrtG91t/nH4CG5W13e9YRRWIujmFsGM6pysDnTSRBHV70z7B1aPNAHqaGASn0dD
	T8x9GeiJqYbu9XMNhZgdAaQA4Kxp1gM5Gn
X-Google-Smtp-Source: AGHT+IHTFGyGwp9ZkTHbN6H+qRfhqiaJF5qklk2HLXLvdnKeNStMq5u0eI1KtmcABLjQWHC/XfGr6wXO7uX8wsZ2Pj0=
X-Received: by 2002:a05:6512:260f:b0:545:e2e:843a with SMTP id
 2adb3069b0e04-54fc67e46fcmr4489655e87.38.1747140906451; Tue, 13 May 2025
 05:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com> <20250506-csl42x-v3-3-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-3-e9496db544c4@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 14:54:55 +0200
X-Gm-Features: AX0GCFuU44C4FSkF3AR9zYUwaxaJQIxJSQKAhzs5A_rmQVyc3t3w14XIErFsNdk
Message-ID: <CACRpkdbFASLw+Sr6Uofa_F+csmETa8h=YhDWkZOfF1x2fq9dOg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] ASoC: codec: cs42l56: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 9:31=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value_cansleep to configure output value.
>
> Checking the current driver using legacy GPIO API, the
> nreset value is first output HIGH, then LOW, then HIGH.
>
> Checking the datasheet, nreset is should be held low after power
> on, when nreset is high, it starts to work.
>
> Since the driver has been here for quite long time and no complain on
> the nreset flow, still follow original flow when using GPIOD
> descriptors.
>
> Commit 944004eb56dc ("gpiolib: of: add a quirk for reset line for Cirrus
> CS42L56 codec") added quirks, so the gpio request API will work as before=
.
>
> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
> no in-tree DTS has the device, so all should be fine.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
