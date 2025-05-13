Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ACD212FA2
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127675; cv=none; b=Pl680TrMbQCGYCAt7lpKgRcbx0AP9wjxyvaPHpqNS75abRzgnaApQ0Sig+VtDDWAz4Am6Ew70OQMow8D4b7Ri3oVXbERZlE6qQ9yc0inIeHbDOsMwz2ds4RfB9oNOOKlaqlh7L8vB76J2/nOOB8hGfVte8Yqjpo0H9unpHI8Dlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127675; c=relaxed/simple;
	bh=Q/uYcJFCRbi9n0RluKfB8+V7rsioHHS6ix++3RBibK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCNTqFEyvBf6ysugPPR3213RRny3H/1LX3wmQLKEiCov9EHY3urK6jG5vieY4xtY4RIU3ft91GclfYtdwA7jaJKR+Av77V4hMb0cxU8xX9ozx4IvMR3WAFAEzJJvBZz68g6ide2rMpvPxxrcEAbAjm+DGTd7CYsSAU0qDk3wQGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pBwloJcf; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pBwloJcf"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso51610061fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747127672; x=1747732472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPT2M7dQVCwoY0XoZtxpGqSt0WuF/VvupzxxIVxiXT4=;
        b=pBwloJcf+Zl8Km/4WgQ6d3MrxKrBWxYO4bxgQXApWoswbs5LN15rckFKaxei7/Q3/r
         Kg2doc5MewW750xKwtW4HSuW+Jt4TQg8kg++gct3fvbJ/UYn0LKz5E7cG0erzcwdTk9v
         40M/sFzrxgw4u4IJwFbzvJMcM3k7cM6QNqOmXbw/k8tS9xeK2Qbc8rhu232YlHHaXtGO
         ZHgHhcP3VK5NpoU8IoIl3DKiZUfD8B6kMWCiA0fItHklaIqZX/iRWgvIx9FQru61mJTm
         iMOgNXp8ufyr+fG0xyrxsOJDIDj1VzeYG8xwKgGgQBPrZTcCnRNOdJ+8EvIoSZ5UAhaH
         w/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127672; x=1747732472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPT2M7dQVCwoY0XoZtxpGqSt0WuF/VvupzxxIVxiXT4=;
        b=AP3KhoUMamwS18TN378kcK3MujhriBMKr5JfzEGelOrfwnCriiDcGtNROAtjudggpe
         G3BbRm07LMLoZf3X4CSNZBL+kvbtmsmOVO0CG9KdwE5q2eFM3hMfG5EZhIg0M0NXynRi
         FQ1iPw0P1mgOYRhpYROuZNaozxEb9h+SesUHCsb8ws0z+z8BssDO9GkmG2RVQZtV8LAk
         hpScD1iM5w1oFjyeYpyNx9Ww6derIzFmdkK349HIkJkBoHvS8G/TkRc9xE6EWsZ6dqbb
         m0f8bWlqdJJF78UOWkxVi/sXNIv1gxZcy04TEQrVeHfmN09TtyNh8bhStUjk4BdapfHZ
         TPpA==
X-Forwarded-Encrypted: i=1; AJvYcCXvxxkt9dni8ezebGwP7x265j3wUIqIMQIak3s9wrj5t0Z9iCWMVyRfhJcenvputGfYAADpdDeQnpcLEsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyubGLwHQXAJyZ0N/ImXdujuTxdbamPpq6FAhMRu/VXn7SVf5LV
	i/vEynzUITGxhuDjm/5ANpFFLCcU/Rw6edBZef29Pt1ajODYYK2zE7gkSJvCfEpniBfFQB1a9qc
	K13i8zYNE/45mBDupiBmwTSfkeyGDvBRs1GzYjA==
X-Gm-Gg: ASbGncspoCzfdQE4MJJIsOtzQYgPwqs2B0YsZBF+LF1SBIHsLtrIwHHmAk5DxyH2ogw
	LJmynYTiUBttqJS6K4DSyI2opd5rWDkOkdVBYjm84w88WnzVjwJaBsMam424rWld3ZIuA24Y8Ue
	JBUfTjLseF3QfwQDcRlLOAb4Tk5E5M+IE5mR3pwWuHIkQ=
X-Google-Smtp-Source: AGHT+IGT90r08/EPJLa7xFcHs8dEZsvVwsKtrD3SYtO3tsoUT874GSFGtEC0f0XouGML5FKHHLXmAaxRLlyV0iZOEsA=
X-Received: by 2002:a2e:bc86:0:b0:30a:4484:3ee1 with SMTP id
 38308e7fff4ca-326c45b2d9dmr66266921fa.23.1747127671769; Tue, 13 May 2025
 02:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com> <20250428-csl42x-v2-6-e8056313968f@nxp.com>
In-Reply-To: <20250428-csl42x-v2-6-e8056313968f@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:14:20 +0200
X-Gm-Features: AX0GCFtWkMHEg69iQwsAHSe7I8-KBbaQqEui6BZnMH014mzUZ6UC1gyIf1ZRxWU
Message-ID: <CACRpkdZUxp3N+s=WdQGm8zpFP19LKUveN_5P+tfWi3OLeZWRxg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] ASoC: codec: cs42l73: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 4:10=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
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
