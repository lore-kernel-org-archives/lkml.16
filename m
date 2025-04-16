Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B2418A6A9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789772; cv=none; b=s6X+dRRmcw3lUQgNMdShciZywIJATNOCOKSn+n9CzAofiuhrDaPJ40BDWE6fawk8TNidm0dX7xife+kkWcQan7bl4WCFj4lri1+xcYlArhd82r1FZF6DDuMrR3yMfZ+b45Matf3S+2/3Cnw9i6ARbO6kQsFexa7iOmhJBwzou1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789772; c=relaxed/simple;
	bh=y6V3AOLdTv8dlanS3n9ETQGh16vUI1tGl4CKTRTctpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMIfZHj3z1WunzxTavMxLuYCm6wdiaQRUVBE7dl334eEPDBk7oqKb/L3xBAmTSwRl0iIdKhkXJDz9VS1u2OLol5ejSznu89G8CM1ElXVqGDh6O2zXkyahrv9LKHTR20UTsDKAJhFDyqxNczIPuY9Zd9lDj12xpKZgq9yw+d1QUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FrJA4UIx; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FrJA4UIx"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso4973531fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789768; x=1745394568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Li318XyTiN/uJIOI6yN8FSyh+RWJRrMKNpH3kjEmCJ0=;
        b=FrJA4UIxJShXW+zB22cMC4pK+GXJmBQi31ykbYysCNcLWXL+zWROXIhN7W4leUKYMc
         R5XMd/pqToRTvyLSuQvsEDQCjpkKErTXz0fstIt8Nt9js2+626slK5T1xHfG2AD1e79J
         M3CZ1nSw56EeyDEYwfNfsdlbYQ4U0xjSCzR4xz6fg51BIIWWclzKy2VW/sArWZSah9Pt
         dLYgtlZrtTjoTDzM8w50USy+gQzI7Tv0ilSEMcS2AumvmMoFj50oX0dsg+dAhIPCtTR8
         hvm3VZF6WiszwyWuzGWZKaipdFD1pvyDaISP5KhCAAIl2CrR46QjuvRpxdKbhk+G9S1s
         x/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789768; x=1745394568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Li318XyTiN/uJIOI6yN8FSyh+RWJRrMKNpH3kjEmCJ0=;
        b=u3txJbNVn9mPnjAgHTNcSUJG+VnIMgJY+MBfwcxge8dkujb+EDyQpm31d6X9fP+7qh
         RYwC3vgPmuQ2TcbTsmVkMLBkRDl5E2tiA1350/d5P35GCs343seEk0I4wil6IbiUH5RG
         YTYAge7WcvIE/QQlaZ/HJjKdSxZipd1NwQJdI/HHt2LHAcCz0JZ+pGoD9dBXxwquvV89
         yxaeEosQF2mevWbdNaOa6lRSH0sQyW/cd473uwMXM56c0OMa8S0yKMpuPrG1i3zYHyNs
         Z8YsK0xn+3bwWPsVG/xVwxJidPDFpWbhhFnkqc0dfKYwsgENz3ZfnP2PnSwg7+pZGTeX
         Dkug==
X-Forwarded-Encrypted: i=1; AJvYcCWel6nhrX/H1mqYjDds7RCl2Ul1qvRIEd5CTCaTc0jZ9GLMyJrF2kAjVby49XqbivRy/tomHsCtCmQ92UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRIjJfk3LcsxeibNh9dD/sxS3egLMJc4zpxGlgKF1U7Xu1o/V2
	2+p1FCD0skWzWnEPv+qrsSoouNVkCsA3qTBCBgCjAdZiGeux9UpppfVyJOhBm2mUa/C4C1vnACk
	p7vjimjnV3R5+dTnjfkauaygIf05Gw041f/r0gQ==
X-Gm-Gg: ASbGncti9GLmUsu9Z2sw30wJfQYrnb3EWBvNJaK9CDdRTX/94RyA7REgS9SGHnd6SOs
	u3jpY4QEEP1V+dn5qo+LPMpTrI6B1INjoobbPoLdrdJRRxivaHXWSoEwa7VBzoEwmAts1aUSLRb
	eme/16y2gHMRL6G6KfI5CUOQ==
X-Google-Smtp-Source: AGHT+IEPREySuoOfp15YyWzzTmAt01Tqbj/2VqmaXRIkeCym/y8X/7ABrRBdra+DcM3mt8+IdmE3iK2e3PADEhQvaGc=
X-Received: by 2002:a2e:a801:0:b0:30d:e10c:cae0 with SMTP id
 38308e7fff4ca-3107f74da68mr3089381fa.20.1744789768244; Wed, 16 Apr 2025
 00:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414-asoc-tpa6130a2-v1-0-5f4052e656a0@nxp.com> <20250414-asoc-tpa6130a2-v1-3-5f4052e656a0@nxp.com>
In-Reply-To: <20250414-asoc-tpa6130a2-v1-3-5f4052e656a0@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:49:16 +0200
X-Gm-Features: ATxdqUF6aMsd-1N8yiBF4iVw_pbJpleioZMe0w-CQnoYIzWZdrI1NmDNikEtseg
Message-ID: <CACRpkdZz8vpQp5utC_oT54LrZB3kOdMO7VTQ5K_tViwB4WXXUg@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: codec: tpa6130a2: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 10:35=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> - Use devm_gpiod_get_optional to get GPIO descriptor with default
>   polarity GPIOD_OUT_LOW, set consumer name.
> - Use gpiod_set_value to configure output value.
>
> Checking the DTS polarity, all users are using GPIOD_ACTIVE_HIGH.
> so all should work as expected with this patch.
>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
