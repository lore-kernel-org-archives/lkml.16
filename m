Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6F13BB48;
	Sun, 27 Apr 2025 04:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745728754; cv=none; b=IYozCCk0MzkvXv/gcaNpZw9ulJ0BqIZdcsSPVpGDw57NomwFQac7lMKjDQPSS4+GPXbFRceBBKfkZOuf8LwzpOmlc7u9AwKiIqStXTJzvdDSqFBCcmzsYFISLpYDfm63qDYrSHgKl5kMJ4l5/fz33+hQx3SWNvJRAtmOOQFofDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745728754; c=relaxed/simple;
	bh=CxRjuhcn6CdMASiLbv/jvj67GsPBZzDFBWGJp5nka7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgOizlg2ZkwcTIetlhqy3ndI2xG5aC6KfdnqVo/ENZWoP5lGa+7992mG2R9YuWJaAYcye4nPtvm37CGyE6iG1ojXzqmLZZepKA3AJvNcc0cZpXzWXwi2D7ST/LqWtZ5V2cw7hg9/Sly/2liOecggnqOrrwPGsmm6DYAjF7Hhqnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54af20849adso3709120e87.1;
        Sat, 26 Apr 2025 21:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745728750; x=1746333550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNo7qe9Lz9mlSgoeITrfWOs7/oXxKQcv8brSPsNOFbQ=;
        b=RrZFSI86mRY/fTYxZG73Gpau1slk3eEeANJUQfTf+0XKDk35cd+PIzdLKmfHSNXhLU
         eKFbypcdaqGvHU/yX0s0ZDckDPVoE1LAjfevurd+6l8/MOLXoed3q8xznP6bPTCmlm6o
         iBrmSv2gd7PhgDt1UCUidhtcyWBHwIQVINQrrzAjulymYBzUuvhD8q2T3r0scfBJkz9X
         uZofqrw1zMOSMaOIOry8c8mpxbd3qOqEeieDKdSs9GKtKZriVQdOyKtyx5qI0DDOK+G5
         Uc8a441wOSG6O2euSk9LHAO+0m8aYI7ekMEHIQgFIzhECup9lcEVVuo1720BsM7kufTK
         j+bA==
X-Forwarded-Encrypted: i=1; AJvYcCXR4cocRs1viXvEddlMrWwDUvmHViIDipCsEck6sBQ5KPnKbHaP3klF0MpneBl0t/NGEMXUITLluxSPjXaf@vger.kernel.org, AJvYcCXex5bgxIezUSF0/UcwyPF/NqZgW/sybt8TVNRqxP9BjHfuzQaXd2/JUI67bzoxHfYOhfhJ9NaZVHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEcpHBa2fTwjkSHiHQ6tbBABuvd6QF8PHsBNePzUc6rj2Dh6Ta
	swNCY4nmZhIqcZUTeFKaUEOrAX9y9trroLJBcHc5JTNySEwObL1S9TvpaTrj
X-Gm-Gg: ASbGncvvcsyBTcCjGE568461OJc/YJi+qepeFV8X396rf/T/etHwcETYeXD930NO/GF
	SwW2qRkDvA7tyMfkg7G7+V7wRduSFtVluq24DqsIuW6mqK6ZHtHPdvjy4TUPvS9ksvfJM414YLJ
	nR/eU19WKml5wxJeyAKbNUg/s55XQuZO4pLYywy1hlToCb8NZsWGAjayVc+gZdvCc1hzXl9uJVL
	fdSyUYXEz5wl75GkoXLQouuDCicD5zzu1TI1ZrHWJY+iq5EVf3r9CgU/PJB6c6Yso3UCdo/puwY
	jyAxR8RpTSseEOIPjfVJ6aBQMrNBRVSW72McOr+zX+N7QAUAwNJHzBYu9lED3vAi2mI3eKiLYA=
	=
X-Google-Smtp-Source: AGHT+IHTJGaHUecV7WJepgG25e0hjTUjfUZJbjN5FKaUyjQXS5qSYoQ9fYSmuarWGZMCT0Mt2GYO2w==
X-Received: by 2002:a05:6512:3e14:b0:542:2139:636a with SMTP id 2adb3069b0e04-54e8cebc61bmr2040286e87.7.1745728749733;
        Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bf7dsm1224856e87.100.2025.04.26.21.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso37276901fa.1;
        Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRzfqgmkrFSYwOc4YDVO1io1Xuym59PAlIkMet0FJvQlIJmgzhEgooAWzqkw8Jy2elucgYGlfnMPSqB4p4@vger.kernel.org, AJvYcCXz4Lv8mgAEcO1NsLObkr+stSc57VixLgftVDjqgdqFKSLVi17A226uhJRwVv21m7DhrGapryCPXMg=@vger.kernel.org
X-Received: by 2002:a05:651c:12c8:b0:30b:fc16:d482 with SMTP id
 38308e7fff4ca-317cc3b4babmr34833351fa.3.1745728749245; Sat, 26 Apr 2025
 21:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org> <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 12:38:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
X-Gm-Features: ATxdqUFqwWzMoc8bpc0UG6R3aiwwevesO0_bqj7uRg6TeOMZWI1Q6QZaB7zJ9oE
Message-ID: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: sunxi: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 7:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual drivers, even
> though their choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/sunxi/Kconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
> index 1c4e543366ddb76c1669b577c1ac337dc1be616f..5e2f92bfe4120981ab68b175d=
ce798ac8b3268b0 100644
> --- a/drivers/clk/sunxi/Kconfig
> +++ b/drivers/clk/sunxi/Kconfig
> @@ -2,13 +2,13 @@
>  menuconfig CLK_SUNXI
>         bool "Legacy clock support for Allwinner SoCs"
>         depends on (ARM && ARCH_SUNXI) || COMPILE_TEST
> -       default y
> +       default (ARM && ARCH_SUNXI)

Just wondering, shouldn't this change alone be enough? The remaining
Kconfig options are gated by this one.

ChenYU

>  if CLK_SUNXI
>
>  config CLK_SUNXI_CLOCKS
>         bool "Legacy clock drivers"
> -       default y
> +       default ARCH_SUNXI
>         help
>           Legacy clock drivers being used on older (A10, A13, A20,
>           A23, A31, A80) SoCs. These drivers are kept around for
> @@ -19,14 +19,14 @@ config CLK_SUNXI_CLOCKS
>
>  config CLK_SUNXI_PRCM_SUN6I
>         bool "Legacy A31 PRCM driver"
> -       default y
> +       default ARCH_SUNXI
>         help
>           Legacy clock driver for the A31 PRCM clocks. Those are
>           usually needed for the PMIC communication, mostly.
>
>  config CLK_SUNXI_PRCM_SUN8I
>         bool "Legacy sun8i PRCM driver"
> -       default y
> +       default ARCH_SUNXI
>         help
>           Legacy clock driver for the sun8i family PRCM clocks.
>           Those are usually needed for the PMIC communication,
> @@ -34,7 +34,7 @@ config CLK_SUNXI_PRCM_SUN8I
>
>  config CLK_SUNXI_PRCM_SUN9I
>         bool "Legacy A80 PRCM driver"
> -       default y
> +       default ARCH_SUNXI
>         help
>           Legacy clock driver for the A80 PRCM clocks. Those are
>           usually needed for the PMIC communication, mostly.
>
> --
> 2.45.2
>
>
