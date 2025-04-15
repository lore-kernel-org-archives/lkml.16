Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393D1297A42
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723613; cv=none; b=BwLCuF5P1Um3jJiyrih/YGGbx5GMlKECyrGm5sMl0XNLcQ0KeNY0Bv5YN25HyMZIGZVNzO9GygGJ7B+fvfrVsESKPEiY8BzsyyGLW0Qz31H048JJ5cR5mw6pdc1GwOusCBEcG33kmB2DnNiJpHEWEjirIWqKw4QoAlh14MFKNos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723613; c=relaxed/simple;
	bh=lVXdbLNZc5AGCI/m+WH0+vrOmz260sal1dEBRrG4Lac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHknmL4kQYqLM8WclYrbLmKWKbWS1pQqQeUL5F7MM3n03W0VQ0rRGys425DcCttCA15ufu36StK7QzwekW6YxaeToO0oq8KJ1WV8lEcW3vVjvQjtgU1R3hC1MICJZ2b7u3qibb+Hh/TN5o4dfe0rgdvEw7hk83cj3+ESLvwXci4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x84K+9JZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x84K+9JZ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso51177371fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744723609; x=1745328409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mnIUnyte0JjCrqPlk/shKFeBEN1cfamo5EuUJhYbWQ=;
        b=x84K+9JZ940rR+ZAqCTMQC8kYH8VKUBGulQTc5MaoMQlIdau5hMsOtxcMRkcJHv92g
         NK3LDYhtkPF19j6EMZGqEfSGxpy45vJ3Qi2aoIe9JQCbsSo+sXlyEQ+A2Mbv/FKtq6qI
         O+qdupf1eE5HPuYihO3dBl6uZGIO5bh4C3LW40sfjqVcGODvbl4ejOIFkvLv5G8GYLoV
         fYg5HTpHue80XuMTsEpK0SOPOE6GnRJzZhj55NNj8G1cch7YiHF6fjAlMZVzS3sZbR8v
         bhOeDLgODQHsLK2iIHMsO+c1dnh4e1zmK1zfqKYc9+jevR1+ps2FEFRlzSMbuFw87jiQ
         K8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723609; x=1745328409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mnIUnyte0JjCrqPlk/shKFeBEN1cfamo5EuUJhYbWQ=;
        b=mBtom2jfAOCkzjK/4JuVZkpK56iwJP/GZcuxm5+jJXyT8pXl90gS8E4pdpNs/p9Vkd
         Sd4QNB6/kAirL+gX4I46SXbjy8w1W5yiP9/Cs2vfNxSpr8MpwrXcNZwyapXMNCb6b36k
         t7k9QrFBNYxCwnYlaE5HDlhB0zkYbme19DVfPlm+/KOVnJCIQ+eAH1C7xjr54pC6K9Ug
         yrKy0c9ZvtbgjFRTqkPqfd7tB0MijB6/LIudk5ZqYjrTPCi35uPAgQbmZXG7NlViu3I8
         CjnyZpcfxhNd6oznoI0p1IJv6pMML9gH0AYVsAXRRZ97Grkk28YdwYcLMDpLM54Wl3iL
         ZMiw==
X-Forwarded-Encrypted: i=1; AJvYcCWmtLSTd2t65A9bkphXSMD8zddkI8nvmENXuA4O1euZ7OLGNQua5Pi0Z42vgr0oTaN/h9M6hb5dy4RTQaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy546X/6D54EPu/oHRyOHqxKlLwb3CgLHKQShTbI9iHr7YhUNm0
	Y/mBC/rxIGSg38ART5i4oQnH9bChpjEWDmnN5yWttIRi63Qp/2393Urw5p2FZXZavvYgsWIW2Zy
	eVw4MyZWkuFFlCzhQnz91J5hwRTM2ePp2RX+MNA==
X-Gm-Gg: ASbGncvUt2MAusUa9JcRtAwPvKPwAYzLUbwnKol0h8xPtJvB0a+E9j7bdyUWy1Z6bTe
	dRwiOH0QXUfZS70Vwpxs89I6iRMQTaLU5ELOg52HAxiBG1qtwnezYkY497vLzR0LIGW3tapehkT
	IDR1S3b8u9WKRsI/DpFFIhhA==
X-Google-Smtp-Source: AGHT+IGaqMdDORoDk0oIpmVA9qaXULvhBDGAq3POpJ1BzdO1XxYTT5N0Ria/f7LYgIqZ49z5yfw6KL+iKeZIN3qeueM=
X-Received: by 2002:a2e:ad07:0:b0:30b:a187:44ad with SMTP id
 38308e7fff4ca-31049a80842mr57070551fa.26.1744723609211; Tue, 15 Apr 2025
 06:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com> <20250408-asoc-gpio-v1-2-c0db9d3fd6e9@nxp.com>
In-Reply-To: <20250408-asoc-gpio-v1-2-c0db9d3fd6e9@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 15:26:38 +0200
X-Gm-Features: ATxdqUFtZb5w1hNZ9E0eX8yQcoRtW5MfxsP225UqiyweepZUJaPgIck-w3NPl28
Message-ID: <CACRpkda=LhY0XCdA+YW=1J=YSpBtB7rxViz-3OBzXhkdxmxWLA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	patches@opensource.cirrus.com, Peng Fan <peng.fan@nxp.com>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 3:41=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor, and set consumer
>    name.
>  - Use gpiod_set_value to configure output value.
>
> reset pin is active low, so when request the gpio, set GPIOD_OUT_HIGH to
> assert reset and later deassert reset with value set to 0.
>
> While at here, reorder the included headers.
>
> Checking the DTS that use the device, all are using GPIOD_ACTIVE_LOW
> polarity for reset-gpios, so all should work as expected with this patch.
>
> Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
