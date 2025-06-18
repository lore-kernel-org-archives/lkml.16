Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF28288534
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750247545; cv=none; b=maFpX8yFXYxtx/yJXwpzeOshtgczxKo7/613QIC84Z4K0RdfABbJ04UMF+gfqWkpsvc2T8TQUMRapBc19O0B2th++l9ZGs11WezGtUC3cBEbKKC7a2daKLvn+FT191tLIv1ZKi7IABnWibqF3V2LZd3p99iWc2UFbelE7KDTOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750247545; c=relaxed/simple;
	bh=eU5b1jLZCw8nEnzB6yiVdmF+qD8sNWEFFSroG2gd7fI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2fP5dft0TVVy32FyxkGZXFDaKBve65yMWO9as7lm/+0hVTWoP/ABRrlmPKwwN2MGTj+/2EzooYwxfBZ5ltv3BKCJF/MPZxMoEuVUiJ+KxMkQguOwgD0FqurqM3dkfCdRh3Flh7VAT74lo2S+bPfRtipzvignREyRwWKr4VNKDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aiB6xGUZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aiB6xGUZ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5534edc6493so7326991e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750247542; x=1750852342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eU5b1jLZCw8nEnzB6yiVdmF+qD8sNWEFFSroG2gd7fI=;
        b=aiB6xGUZOykjxsf3HYlkaHplMNq57ST94UOJs+JYv9XKSphRWgYNkKAXLIuWfg44QP
         HqUwoknbkVAZFbCL7yUBwqrBuH7aVlEIea3beXfbXwXtJP9js+eswPzqsTUHqF+9v0fl
         8UGr/Kp7i7Vr8PxUsoBUA2aQO5fPIx9tUqMDrgn56A8knewnIchmCT7r2dGcv4gJpmpm
         7C9ibt6wNoiw6ECW7rrwrvyzHRjhBxOZkv307erGff9QCYgxOBBf49PtxXwjuYRsjRmC
         Gk/fQ7YBf1v/oL1byEkjEqVzpGm2xLDuzr47OmJPmIfXWsGvos4ivhwdkBYXMyuYfP5j
         az7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750247542; x=1750852342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eU5b1jLZCw8nEnzB6yiVdmF+qD8sNWEFFSroG2gd7fI=;
        b=hmVuU7hQZ6ADQ5W2YNQ0yS328507/ShgB24NmXWultYXjE5yqf98CBJGwshlWEUMmC
         lw8dzyxUFT+13hfouxNaU9ZlPD1b99ZQQ19IHnw1SmwfaVhHMcDuzD6cnNPvJZDJuDFq
         4dsDw56AmjjNjWZ0MEPB+KWPhMjW6EzsNWGCEEtbE9hfhIvaKMBELLF4TCfwlNW7xGQB
         tMexAoMy+oeFXjpuRG2QJP+w0bHCNEK0YVezk2jCKfRlXUD7CBD+nZwPJmIMlT+eOEHU
         RUR7XMBHv07xVbeM+voex8mGlBS6rdD70B/AsItJUoBUXSVuGO952thfsKUScF3Trnca
         yqZg==
X-Forwarded-Encrypted: i=1; AJvYcCXlbbFgd55g13iGZDc6u6CC6YTicEaPjBwUHDAID2FSP2QinZXXMmKumBGZsyaXkVKJ+QZioMh9yfdKvFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLnxgNh2sTcBri3zx9Q0/mDG8OGZ39g8reiE2HZRhtuYkzpyOn
	4TNogd63yKvMw3d3TgOIepOuhKpAb8a1RsHZcAuXVgA6g3GhkxG9dMiRLq08ri3i2gO+mjxYIzj
	sXJku/F1+WGfPDs3MBOVqPM9ar34r+IFHve/hULIXdA==
X-Gm-Gg: ASbGncvFNN0Yu++N0ofJ4NKHJChCKPZLrfpPwQEGNdBXkld2El8EorAQyr6OMiLzKQW
	jj2McQu3cVpSgeWvs/XH/6/TBTfyyair6J6JDVm7x2M/6vYqt/VNtbF2iyvz4sOI/Bf6iq1Zw5u
	xtrvQT3QzULe9/Bo1MIRfmx2GqWRzXwncZP3ZThp9/zBE=
X-Google-Smtp-Source: AGHT+IHjWdSTmS4aDTVqDd7NBp2OPbykUx652+t/IZOVkWWGf64J/RLFbhbxDCwVOIM7rfV41BeoBeUWfyaPxf5hCjU=
X-Received: by 2002:a05:6512:3092:b0:549:8675:c388 with SMTP id
 2adb3069b0e04-553b6f5fa33mr4843249e87.52.1750247541573; Wed, 18 Jun 2025
 04:52:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613114518.1772109-1-mwalle@kernel.org> <20250613114518.1772109-4-mwalle@kernel.org>
In-Reply-To: <20250613114518.1772109-4-mwalle@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:52:10 +0200
X-Gm-Features: AX0GCFvi_Kw1gkeOTQZNsLTIvoCnOqNgSVyelJU-92RYyRLKgU7_lLqQN3HGdew
Message-ID: <CACRpkdabkT4cGLVVrAfSk_ehiiY9HLzpfsvUOEXH4wH0bXxPuQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] pinctrl: pinctrl-tps6594: Add TPS652G1 PMIC
 pinctrl and GPIO
To: Michael Walle <mwalle@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 1:45=E2=80=AFPM Michael Walle <mwalle@kernel.org> w=
rote:

> The TPS652G1 is a stripped down version of the TPS65224. Compared to the
> TPS65224 it lacks some pin mux functions, like the ADC, voltage
> monitoring and the second I2C bus.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

I guess the #defines for this to work are in other patches so it all needs
to go in at the same time, so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
