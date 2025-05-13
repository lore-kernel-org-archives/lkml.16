Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D17428DF25
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140937; cv=none; b=Oz6Fq6xZI8ySkNazeDkfAgb83+xQStuSSMCie1dEmWhJ7Jdkw0YftfF/SHfUo2peWBi6ZCPDQiLpkiF2PRgAhgsIFeDBBJKd054VSxvTfOl/DG+uOntSIyCvoy2mViL7D6lfJ3UclVm9nUDVUsQpRp5zwCYcJ6WDQGYNovScKBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140937; c=relaxed/simple;
	bh=iylBZ6YAVkkMCPfAbOKWmfwqvwPCdi6SPesOAiL14QI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kuzmk3F7qZjA+ZPFvOilAD4/Rf0RqtYZ25v3tFc5fGSQcYeusve5kbfOU8rcIbMWH7Efzxc7gTWrWEfqltzWFGfnGHVeh1t2eohtMiJe2O3VXG34tkHELUazNcYQaVVw8G03rTwweMgr/AWBUz8LcX59edp3S3Uzd2UinHPZ7aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z52omiM/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z52omiM/"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54998f865b8so6226049e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747140934; x=1747745734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1xNrA0HPyCfJuTLRUZWT26fcpFWFmzMVhhKAX2/RlI=;
        b=z52omiM/mz4Cl8dd7yBrOlhVU8SenHLAMwaF7+1aghOdVKH12oQqsN34CzrYeDpvPM
         H6awPiEGVjzo6GmiMDHl7d+703bcW3BHF+ZS5puhc0ykRyjIDTUwcL+OOFtvtq1zceEu
         zGawtUFsbV0QB9AzM7ayo+gBhOzRKEKfdn+i/0yJv3/GU4w1uH93jafm1O5i0FULkUO8
         RcsPCxb6Rl+jpaWw/mlpmTTQ+Xh2JtXd62Tn3YONbmwghDtzDozDbs5X+3QcQ8T1pngk
         wlQAoA08YG41eJYuRn1lrAo29/FjjeycpsZ718fiXd84PRNZ2C2o7JuVanz+H1WAsebt
         GkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140934; x=1747745734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1xNrA0HPyCfJuTLRUZWT26fcpFWFmzMVhhKAX2/RlI=;
        b=w/kC+65hs/RSiXZqOP7BJO39tRJXs1wK0OyNjindLHZPsvTPplmjDiBJcLGIP4es+d
         v/V9KoBhTFYf6LBBswjGiIiHJpd+wLtbNl14fdR+LhqxiZ7Lp/AFv5YcwBVM7n36GP3s
         2DR68J63BwLw1Jmo+gqcgImMpSFIG7CXV3olqwKcU5cfZfol0G11HYP+nB0MojyZ5Yu7
         Ridul9KBMAmwo9tGRAY9sU4XeKKGE9kDUWuoIpiH4HXpiiq9h5VnDBdAVOQ4l1aqRf0f
         rARUDucb8wXvXdyKrS1R9AQkInAyaCbDEJiYNqd718WG9ycYWWL0wVVpggQevMS05HQ5
         cwzA==
X-Forwarded-Encrypted: i=1; AJvYcCUyOfYFH3nPZZyZ8MffIGLnsg43rXkBtJMJFJvQSQ+VDO7psEoRroVQFpz9PHrXVrcKvARhRZIsBYvx1A4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+TqrPf2pNNFm5v+xOja4mBfcOsPvB7ZyPuD54T41haYY6moe1
	uW82Qg+vQEVQFrX8k4JiMDne3lXIyCJBCTX4lppblkVOugokeWfMAFi8B+oPJJw7WKlRaBTv57z
	XQA0DlH4YUsDVnDzr8j4dv7shKil0RBjHepc6Nw==
X-Gm-Gg: ASbGncu7J0tr2dv+BwuiWeHSXygbuJCMVG0GmwLPgk54OSz6riC4r7DA+4X49eVWhT2
	y+2BjKLKxK7te63JQZ7eKUcisxPc1OHlaTtv95IeQVGw1lec7zBOtF8DzQgdV00O98dSTmj/8v+
	DONpP5IAVFowbRJI0qrI22q+xzGdwx2yUL
X-Google-Smtp-Source: AGHT+IHGovcuelmkIHIcldh5FppOD2U89RgWqFm070+YuOgGBNXYGlP0KiMRTWQlufrTDljXXvF3C/mspJXZOd7T2qA=
X-Received: by 2002:a05:6512:608b:b0:54d:6aa1:8f5a with SMTP id
 2adb3069b0e04-54fc67b883fmr5938671e87.13.1747140934068; Tue, 13 May 2025
 05:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com> <20250506-csl42x-v3-6-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-6-e9496db544c4@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 14:55:22 +0200
X-Gm-Features: AX0GCFtLssLQUl20MHg0DqNZT_Bw55zYPugiENgOkv8p9lbTgkALLpNTHQswSks
Message-ID: <CACRpkda+QuDqBf4MvpE2=w=tg=EkDnA_dnfg4+kt6k2bJNtBrA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] ASoC: codec: cs42l73: Convert to GPIO descriptors
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
> reset value is first output HIGH, then LOW, then HIGH.
>
> Checking the datasheet, Hold RESET LOW (active) until all the power
> supply rails have risen to greater than or equal to the minimum
> recommended operating voltages.
>
> Since the driver has been here for quite long time and no complain on
> the reset flow, still follow original flow when using GPIOD
> descriptors.
>
> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
> no in-tree DTS has the device, so all should be fine.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
