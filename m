Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5124D297A7A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723709; cv=none; b=Z7r/FFvdF/lCT8jBKqNd63GeR/m0BMbzhxSkWw5Cb1MYIBRVqLiI6jg9qxYdzkC4AO6Nwbj5e4ozM6mD0CYeLrbk7JtrMt8a/XxdDjsQ32QFzy6eDOr++kV2gZiNxh1ygr0ONWgHaA3+5oqP9vGzQE7+03nQhmT++OiIb+GCq2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723709; c=relaxed/simple;
	bh=9Lbh+7hzgAiAiJ/8SkSVwB2DuQWmaK9EPtpUj2ZKxuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuWLaka0+dOE2QGMkMAm5N2tzd1jPdOv7b+S2zjI/aXjNHEJ3Vw904YFyjdZ5x04v1haMSttq07PkP3LxN/pX6Q0ar56evhubO1bXuV56+eXWGqdtvBw203ayim70AuEsPEPFkUnziIUmooAn76F/IPKwXCDaEHLot0Uyjo8sM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q7S220q6; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q7S220q6"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54954fa61c9so6789585e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744723705; x=1745328505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2G8Vl/X8cwgzlmMTGpt4sUnpxcefqO0e/GD3wsd/Rw=;
        b=q7S220q6m67XnNdaaCr1O9ZY7n7yAsNdpy9SKXvC/FwgNa8oB7SnzWtDllvMlDRann
         jyzC1YQzEB5wvZgqlA48XbSa1/s7ETAMQj3XUqQZUofCNEA4Rgd/P/WElFQXJYTcPfMq
         2k5c6acMArW7NS8VHT/lPaA6zojuW/Y28fSA4KH05pSWhKqF2u407/or+ECD0L0aEJL5
         To5WNgIqnwE1vlr0p623AC4N1qabS7BeKjEC5TtxTBtaysV8LC1PMVZoV1NHRAwcJGW5
         kk5hVwEjfA1m81SzdqsLWPNRKylsGALF1DiYTPLpM2DQfxvsJxCqn2D6vfHQfqfmqbrv
         lhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723705; x=1745328505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2G8Vl/X8cwgzlmMTGpt4sUnpxcefqO0e/GD3wsd/Rw=;
        b=MATKQEMkunDtxmeGy3/pYCYZEGuE8blPj5oUkWXQy7hKcfugT+5qUfzqf7ZDmpBYLr
         mPEpVCtv0TAqFL53Vu5ZaHCFcF6OsaJSFFJlMw1VWxJdgKjqYG02HynAnTHA+YPYmRLa
         4bpA4laTBX+1QUZ/McZHA1pI+9/GuZlYn/p2u0uGyNQqDyGQ7h8a+OOprTamME1mPpIn
         9W16KWLhNR56cntUWlcCtOhwhwtr+YmB8b/XeQrG5sTAdV10nA7+FXqJROh+cMtlawvn
         uMBk33B5HPJvaiAu6pdqpf13pVBgMCsaiohPbCbXfVwAlEf4vbcEEvUbIzPROQ8Yyhsb
         Y4iA==
X-Forwarded-Encrypted: i=1; AJvYcCUbETHa32hVdtv5b1lfLwBtA+ZAOEngyWLU+ghKPd9v6Bg0uoURqkbZWH/TekhecAScb4/5/S29X+8IsfA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5O5HA+OuT6cxuBT7YZbncEB/6H40cuvkBImVZhVh60L7ZFsxB
	5GYTI0I2lojFMjlQDB7IRBJ4bWNaFNce9AW+aknnyNUdh0SH15a/+b+PmdSWoAaafkLZfm6UK8T
	mcJ+zeQS/Xja7aBS8C/2njnNaS/AIC5dbhFY4Gg==
X-Gm-Gg: ASbGncsPUSt1RGIcDR/zvNtJU4O15mg09GLjv8jHB3TN8hUNAnCqtoF0uk6X6m1MJKD
	ltEtO3NlKXv0bhRk/O6nkzEVA5I9Lb7sxeZM0k1Xx0t37eoCAjSxCwoKgaVMdvNLnTNzZtHRYp+
	TcUdN9FYz/JNK9gyiWcHv8ow==
X-Google-Smtp-Source: AGHT+IHmMXF3I6f2qsaz3mct+UMDjiXPBMrGobd2YBejGWLNmLWUOe8eFZ98Uz9qIivZ8WHIIdQPC53i97kmYyMrqXc=
X-Received: by 2002:a05:6512:ac1:b0:545:5a5:b69f with SMTP id
 2adb3069b0e04-54d4528bc63mr5049718e87.9.1744723705280; Tue, 15 Apr 2025
 06:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com> <20250408-asoc-gpio-v1-3-c0db9d3fd6e9@nxp.com>
In-Reply-To: <20250408-asoc-gpio-v1-3-c0db9d3fd6e9@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 15:28:14 +0200
X-Gm-Features: ATxdqUGReCdFD3en2lnWCizJiHE9r1iSq8BAJ8EIcKsEdsmuhiE73Y3SOpYj5h4
Message-ID: <CACRpkdaeUs3Yfa8b8=Rhy+Qw4GMcNuEWXmKsK60qOpYB4oHG6g@mail.gmail.com>
Subject: Re: [PATCH 3/7] ASoC: codec: twl4030: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	patches@opensource.cirrus.com, Peng Fan <peng.fan@nxp.com>, 
	Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 3:41=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use of_property_present to check "ti,hs_extmute_gpio" to set hs_extmut=
e
>  - if returned value is true.
>  - Use devm_gpiod_get_optional to get GPIO descriptor, set consumer name.
>  - Use gpiod_set_value to configure output value.
>
> While at here
>  - reorder the included headers.
>  - drop remove hook after switching to use devm_gpiod_get_optional
>  - Add return value for twl4030_init_chip to propagate value to parent
>    in case defer probe happens
>
> Checking the only user logicpd-som-lv.dtsi that uses polarity
> GPIO_ACTIVE_HIGH, so all should work as expected.
>
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
