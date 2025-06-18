Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE49E2E54CC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251430; cv=none; b=m+tAshBQTpsfLkD0yLqDq/bQRGn6ZzcnZNs1nCyZJwWvNO2jXFN+v818oE+7Bh4fRypJX+BJOIkgCsQzQcsIOnybpqTLNYX4Veael3DI8gKdJWZENve8DUNw0wJawLha+lIcOVF+grdXDynbzCFqkp0q3rMT/WV2uGN23bPJ7yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251430; c=relaxed/simple;
	bh=chU3ZzgX8ixQ80XuNsDpy9w595hkOFK6g+6/L8GwJwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ep5f+7FGEclyvXxtfIGGFzGMcQ1fRn1KaqIJZjO141Xo441Q5fMK8I5xgyko7VZ1Mwzrz4EBa+YpNuUHCtG2lf0uoP6rdZHt0d+zNKTnWZJIYoij5UcaqlojkGHKsQhWLNYMP84QETLoB27356+LAmGrx49xRIm1R2c3tuVBdIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vooGQp+c; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vooGQp+c"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e81a7d90835so6583728276.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251427; x=1750856227; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2X2h53UoNZQhDXBsMhRcUUHtA/t5wbotkmy7UVTkX7E=;
        b=vooGQp+cXA7Bl9EdDFb5l+L/SbQXuI4V5FZ0RzgjuAXNy2/KAcAyg2o0IWDzripkkE
         tBcO61mGf6On7hilM9Kk8BA7p/r54kdadUGCT7+RjJWLFtKtD49Ey3xovothllGuoj/4
         cxXsMsagUqhtNDY9xe3IgmmjXPfqYXJqlV92vCEkihxdk3DWBzTR13Wc9w9peHStJI3V
         2RGg4jkTHOtGpN/1nexrUJ0QdBXUzSHI/I18yISa6Mx4qaxv6QSZzxrY1VkWUzOfo/r6
         IL7vbyCJIta0JWgxjWOjrHPMkACNqcs8A1MbsIp1o40U5q2UIjPOipsV3G9Vi/CcrE/r
         7Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251427; x=1750856227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2X2h53UoNZQhDXBsMhRcUUHtA/t5wbotkmy7UVTkX7E=;
        b=mjIHil5JT+qPvIfpfNaY6qAtBW0dEobDo9cp7uHB/mzD0+nUbEmwZIz0Lz/tnT89Ow
         4jhA2ysWAlWz24grKQoyDNhZsvhNZFH4g4xNYcm7ArPyxItOikyNyFU0IvCFPzI3IbBa
         H1Njv9o1h41q2MYjqizBUVEn1h7cCsqywpc2hR6+/CBgzYRkPHhvTYuWx0N0k1lsFJlq
         vpeNg23zgQN8sODbEwYvfZAdsSf87obh1sINR6p40M8tPPL45OpK2lIvzggLuOXo9mTn
         3czt1sA9T4l2K081pjIeIasjf2uc5RRCTeND53loyMEt3psICx8sDB/BgJxsInGwe0lC
         4y0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZDar9+H3mCCfbc/V9rAMSX6Tb75RxDlqy7cW4KBEKQoImlVWYS8pP53pPjUbm8/RxX8OWaoDQn/wHVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKdckYl4iSwJ8F8UuJu+dPZ6beNa/QkDKRo+0FlLTl5VIEEUb
	vrlIbHahMFNmXRWYiuBXW5nIma47p/qsk9psVIdgA1RNLk8M7JhfQORoFWNw8vzGu91Vx/mvUs6
	nCVnLdn31yAlsz3AepJTqbh7ACIpJla/kG6kEUOaTow==
X-Gm-Gg: ASbGncuqelOGJZhbbd2sE+WDiNrX6wjXM9Y4V18v76oduU4SWGxBYe88ODu9uKntsco
	DSape91XIFoRZZr8WeGAXjyOgIV0JDgn5scvGj0SD4ME/kT3LCuCe3EXQwAGh26BGgm+eOgiWFg
	EhPG2xvlSZsHlklv4/tYJO6XsCrcBGH2wGZmtwhqVEhFQ=
X-Google-Smtp-Source: AGHT+IEZlf2SkQ6pDtcOhhdvV3LmUw3iR0H22QpguHg1V4liWBddtmQy97+4HMMAxIbIevgaVnIrB0SHGsEYRyBVYzQ=
X-Received: by 2002:a05:6902:6303:b0:e82:2b85:ea3a with SMTP id
 3f1490d57ef6-e822b85ee43mr16723424276.32.1750251426746; Wed, 18 Jun 2025
 05:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org> <20250612-apple-kconfig-defconfig-v1-1-0e6f9cb512c1@kernel.org>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-1-0e6f9cb512c1@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:30 +0200
X-Gm-Features: AX0GCFsnEI_9cu3U9fY7I_D0EnrNerJPcmhYfg39LAqv66uN774UfRLbAU6VCkM
Message-ID: <CAPDyKFrQ3Uj+coa0WCG00_pyaxu-yEnH26qmS6tevZ_772oZVg@mail.gmail.com>
Subject: Re: [PATCH 01/11] pmdomain: apple: Drop default ARCH_APPLE in Kconfig
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, iommu@lists.linux.dev, linux-input@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 23:12, Sven Peter <sven@kernel.org> wrote:
>
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
>
> Signed-off-by: Sven Peter <sven@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/apple/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pmdomain/apple/Kconfig b/drivers/pmdomain/apple/Kconfig
> index 12237cbcfaa983083367bad70b1b54ded9ac9824..a8973f8057fba74cd3e8c7d15cd2972081c6697d 100644
> --- a/drivers/pmdomain/apple/Kconfig
> +++ b/drivers/pmdomain/apple/Kconfig
> @@ -9,7 +9,6 @@ config APPLE_PMGR_PWRSTATE
>         select MFD_SYSCON
>         select PM_GENERIC_DOMAINS
>         select RESET_CONTROLLER
> -       default ARCH_APPLE
>         help
>           The PMGR block in Apple SoCs provides high-level power state
>           controls for SoC devices. This driver manages them through the
>
> --
> 2.34.1
>
>
