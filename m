Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B90F2571C4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778382; cv=none; b=uQaxdA/821/NqJE9tv1jHtdRR7bMc4ChBfZ/7TxregxbeJlmp7wZmzgpq0EIKNX68V9HfTkV+QcFadLmDDRFyiM8WZNCSJdrQDS09blye92N3xnn4sPVpl1Kh/LqtavQCtrQ/MpO2786J+/X13lh1k6Xt3oBxv8En2ANlVRVWW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778382; c=relaxed/simple;
	bh=Au849YRg0UNQ2jFTEcsVof5ccrqnHtmMmWVENNxHxOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tRv1Iqe+35B6P0lrbehw49P3TcWO6K1qZ8PkqXi1H9w1p+optheVFGaZdGpu5Rfm2uLPKiwhiWdkqZ2tZcntaVT96+q3vROYkMZLbFsAdxPbs9fy7xIKauoPgFrCpNPBUIy4ogk7SBYBxcgm/XyyIBSWEdmjX5Nual2I+HQQYdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PMklSYU+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMklSYU+"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3105ef2a071so70892531fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778378; x=1748383178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au849YRg0UNQ2jFTEcsVof5ccrqnHtmMmWVENNxHxOA=;
        b=PMklSYU+SdpefuYScwvk0mkH+kq8I+hrR122L7eiOKgfx3pMfYwEnqMYFdRguOv1j0
         DQYjpqtqIzYfAhWBdud4VmIo/03lPVxjCEFPmC0gyCIlFx9WzkTkDD6XYmo77zKFrIYd
         t1P8uyfNxpggkwNxwr1J96KTbYdyTrCX8zsGKgXhdL1m3I14+ZS2cQa6CF1PX6BQ4CjK
         MmcByXmfuHe/P+wuQiitDVmQp+kItbscfyCbWrgLnkoAWYI1BobNFPIV/4UuLyFVyxaY
         HSlO3tQhUXWWNTJA5eeyEbxasekevDgVbmWtqQmo13ysraY6yw1F0zgR77N20luE4gf+
         F6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778378; x=1748383178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Au849YRg0UNQ2jFTEcsVof5ccrqnHtmMmWVENNxHxOA=;
        b=vF+N974uIxgVYmk/34AebKsbCQHemkuIwH/ucHmm0AKBnnUL5ZF6Oi1eyeZtlEyD9B
         pnX6DEBU2FEBbLTeHV7itp2GNlp0CdJ+oiMV7ZC2Z11A89P9XspIqTbDdcqtS7XoEzpM
         Uj6+SHYgvZl/VuE89HafnW3cvcESCelUVldBp3mZiyBrKaeRHCdBk+EA0I2NaBZSBkE0
         93EUnar/KndOMnxn/rEd7r40fUh5ZjWq1vgAtPtz4wWy/DGk574gIh4HgsuyKOd8YXbx
         RYkVCFfaRYA3gGcqeepzNDeSL0Qgoma24dZRA8R+1dH/VgFIgnJoF7Kx0waOVbkb7yyb
         801Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOCGMKU0ynehMmdGeRHlS3bRJtUnj3rM6LYdMZhp5h6RTJPj5w5GRZLF+WtnrV5qMXvSxwMeIJq63VbWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZym3hwcvtmQNSwZQXQP0hpo53cNTKp+hW3MwKZFRCR+/IXdo6
	YqRvlpwFvbkWThqFrqsfmj8FHk8n3NGLjX03HgHfU9AVbFIbSsbUeBcjJrF6yrfdGA0cQ8PEuTk
	wAlu1STU1ct1Ht1FfMD2oS1U5qMZde6op6TUt4N7URxiwtgGLIn9R
X-Gm-Gg: ASbGncuaVZ2+1/5QYoXbtZC5Skihnsm2OOpIx2o0zsBaO9Wlp3YUEq6IwSwjNDt9oLc
	NVMT7T2y+7gnPPpcL1wlLbIdWYrf22ltBvEUv4TJJyj2YVBA+HV8lOUNXFiL5TalqmGFVm6n785
	abqd1Rtw2hU7wd2hygbXla/uSHShsYdBh3
X-Google-Smtp-Source: AGHT+IFGXmpd1II9RIoiTiuwNTr9SMDNaNasXEYSEeoFi+itIQs1c9py8jq9kh9xbrkCL4KgUzEy+knAlJTnnihOYdM=
X-Received: by 2002:a05:651c:550:b0:329:168e:1c95 with SMTP id
 38308e7fff4ca-329169d611fmr43691811fa.33.1747778378199; Tue, 20 May 2025
 14:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org> <20250519-gpio-irq-kconfig-fixes-v1-1-fe6ba1c6116d@linaro.org>
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-1-fe6ba1c6116d@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:59:27 +0200
X-Gm-Features: AX0GCFtNM9CIgVAC4sc2ZtRZc7sbjM3GrbDrSYWYg3sk65dU3IzkaI8NC4Q0PFc
Message-ID: <CACRpkdbwU0NvwfQTm0+pbsreF0FBk4ubbwnyeYmZxxpfBpGyNg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: pxa: select GPIOLIB_IRQCHIP
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
> are only built with GPIOLIB_IRQCHIP=3Dy. Add the missing Kconfig select.
>
> Fixes: 20117cf426b6 ("gpio: pxa: Make irq_chip immutable")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505181429.mzyIatOU-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
