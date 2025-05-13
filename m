Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7AB2144C7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127710; cv=none; b=BbLOph0AB8ssV8i9UAV2LL9jJL3mBUF1vCqslsIA5aQW+YvEp4BDo/3a5y2ZH0skfToAxa3ybBmAU9uZ7YfAvItueGvUUHrZ/hQvZnxKfOJi6B3kDONzaGM9kUzIsYZNAfcZn/X414+0/mjM6o19YWMImf+1gh0S3iNtoTRC0Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127710; c=relaxed/simple;
	bh=W06RFHPV8gonnsmgauUbgxPzser5B7x04G1quNKfCEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sW5T05ucdTyrgL82m00D+r2z7PY5kQ9IacIv7+kaTHGxTJ0uYYhY2DsyQizuyeFN+cqtWGrsbe4S3WHWsylQfa8A347aWAo0spjrErAuKA/PrDo2EQ4PSZp8BEyH8atXbJYrkW2bPJXscukQ8N+o0YhiPMdfd/7IJwXOAS55Av8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfi8nwt/; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfi8nwt/"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54fd1650b83so2955207e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747127706; x=1747732506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAi9rrC5F3j79jXbmUzojQw3jaZE4Bz634vHF8LgQG8=;
        b=nfi8nwt/P7ekgP9NWzXr6wPMOgiCLtCZEX5G6Vic0bG06xGlKxt1EZeNRRqfRVjsBQ
         Oz+3IEXvrj1AMrto3DSMlWEe6igUX48AJmmPkQC2iuYP5g37ZPsfSN0LUQ2PLSWcNK+q
         2GUckCnQ8UKDo2t4nTszF7+WNR7QnFBRglQ9txIACU8EcFOS7W7G+77iFf5WENCPQQuY
         tcxjQVpFsRstsVjZELXgJG6QgLj9TofZhRyF0p5NrxkmGuV6YfAD0LbGrPyDqhX3D+C5
         5/SxB+tKpsfVenlzf91+Ivxv0+Nh4CmSdR21YJBec4YyvxfVETMajP+I83ylD4cCIk7n
         5EWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127706; x=1747732506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAi9rrC5F3j79jXbmUzojQw3jaZE4Bz634vHF8LgQG8=;
        b=aGNRK66qbMcOnHGA+ycDJG6/XE4xx4tLFM5Yx33VWidP2+jGX+6XvxG7WcrFCvymSL
         ORQkMoVtsvam5RWTuwccNXhqpeHaT1YIXmLV3p02z5n73/UpIjoyRbPysieZ1aDJxQe/
         x4SAe9dff31sG3222IhFOMSzpZXif4qGXm/fvoC4iFVjtGlsdsb1qn6Tsu79z5/yPs6X
         rFywOf+Jo6BQzjCAUssmKYoiyxJJX5GcG4t3zjjhFvUHjJZtFwJjTAIAkKDzF9uCdBPq
         1WrKDKdSRm2LZOPGkYjzrY/78V9k7NBCoMDLhiAop3IxgBvQAEMH9nS4otAa0bhr0Iic
         J1pw==
X-Forwarded-Encrypted: i=1; AJvYcCWdoCVIm0AqQ/qB7gr8TpWNZ3IVXho4j51RGKf+zX2cLSeXd7oFyWHSrCZOupji9aJ8uRZ7ykXw2adsC0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhL2gYXvg0NmU5OY+8bn3ANWO+deKGqR7Yh/vXU9XN88N2D0rC
	9JkBS4S1xo2TUZ6Ad2lFiBKXjKCm8YhWkjlWuTEJ41Yp7b3UknGRxbk14Pjbqb0NNWauWMwnOSy
	erazk036hWrIdn6xNFlioXBI8oa6SK4vmz8daJw==
X-Gm-Gg: ASbGnctC3bC9hFZgSz+0M/5vZRaj0D1fThUDiWGSa5inuSuuoTARTMzSLVnzMZajwkb
	f/vweVmcjDOV0H1F8XyB85pYOUZY+cwv8WmLchmRoMpbZwFNg0yVl7qyG3GrOMCcX/K4foU2S4K
	by+T3RqzFlrznjheivHRFPFmabncSNTQhS
X-Google-Smtp-Source: AGHT+IG5Frmll3jan8XW4q+c/ZaO7HyTn73Ya+M5QP0nrAUGDePv5va3dllLSktvNB1+Cx7B6+76W/dccZj2jM4v9L4=
X-Received: by 2002:a05:6512:228b:b0:545:154:52b0 with SMTP id
 2adb3069b0e04-54fc67c95e9mr6259507e87.22.1747127706188; Tue, 13 May 2025
 02:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com> <20250428-csl42x-v2-9-e8056313968f@nxp.com>
In-Reply-To: <20250428-csl42x-v2-9-e8056313968f@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:14:54 +0200
X-Gm-Features: AX0GCFvRRz_CuxUgIsjJYkT-hxEyuMzIQVYUiGbnvV1LNLCfN6Vvua5kol4mBmU
Message-ID: <CACRpkdbBKo8Qp5em+CngJOAQF+FPohfsi_V2SLUpNEsim=XykQ@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] ASoC: codec: cs42l52: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 4:11=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value_cansleep to configure output value.
>
> Checking the current driver using legacy GPIO API, the
> reset value is first output HIGH, then LOW, then HIGH.
>
> Checking the datasheet, the device remains in Power-down state until
> RESET pin is brought high.
>
> Since the driver has been here for quite long time and no complain on
> the reset flow, still follow original flow when using GPIOD
> descriptors.
>
> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong.
> And the binding use reset-gpio as example, not same as driver using
> "cirrus,reset-gpio", and there is no in-tree DTS has the device,
> so all should be fine with this patch.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
