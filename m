Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD793256C9D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778401; cv=none; b=cEaucyRdz2CQ3zLGenOSOkqh1Hk9YLxu80ysvGKZliI3OvCvP7R/dGV72d9InOLXr2HcQbo0su2k8kCqSUzN21ITieF07fAE3h64132CLszQilaj81l3ydzqyj6ZcfP9pDOviLI5hI4ty9hEjg8oBLFDufJMrHwAw+4YpbRjV6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778401; c=relaxed/simple;
	bh=IMUFY3ybOGSiBYIbjVEo1Ai4jJbkOoWr7EpGf493cfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1ybHkbmldn3TUZBuNwttLKcVQ4/vMyl/fppCigB5QHLXbUBhEX5n9giw/BnR03NN4a1lwaoVQcOe9gCd7lvKPQv36YTXQQR1g3EpOmb0+cI6RTIHqW/YQb5Be8YP9gFB3lsm83iUr25h1a3xN33t3CITaAdC9WoZL6EA6a9KFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I1KHkbAc; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I1KHkbAc"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-327fcd87a3cso51225701fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778398; x=1748383198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMUFY3ybOGSiBYIbjVEo1Ai4jJbkOoWr7EpGf493cfA=;
        b=I1KHkbAc3f3aFJt5ziNKRLWi1MsJrUs0pt+ke8QCYH1yEIh++6h6axEceD2ehA0eDl
         rj89vEJP/wRGYdQSDEIAtDI3oqQvCn2dVc41zeYBe6oy957q4b7Axjf0yEhVjCzvyTib
         kgtpjCcu66P6au38yRYUghccq/DZ3CUEJvTN71DtSs63t1O8vQt9TeY9eAZi7cZ1gyPI
         GiVag25bZ06nGlNhGbsRwEa/A6QK6u/cZbby4ghMfTQKDCvP9ZoPQFKQH75jC+5BUygi
         iOfToQBlvxJtkALMPWR54BTmyD25ZRLASdSEMxzkUBBEWr7FQK4ABcjg2rWnGZpUu4tk
         jERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778398; x=1748383198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMUFY3ybOGSiBYIbjVEo1Ai4jJbkOoWr7EpGf493cfA=;
        b=CipJRKSCUz+5Hb++Ug+9ngrbG+vCAp1dPaPoemQ7kSSNazmEY3SvnrLM667OY1ENb1
         C4TLxu3P2zxIh0nDxEYoWvlMDzNM/WzFt/Ldpv8sUYeeGaZYf4eABRGp8/lCDiGgKgN8
         BzZHvPpvnQjeEszqA7R9ox6XjVWW3Pmhe7sqFI55Ijj4PJugbkkenzSvdRE3duVk0vKg
         hMpArJmBuQSlo9ImXdjM0PjpaWX6Zyqug5nVt3F1GfYlzxor+WGhzt6OLY0IgKKCHjS2
         hA7ce4tbz34oQKqnA6CPcP35419kyVdqhX8/5tjM9jJ9LZGFX3L9AFt4cXzS4Qchnhhq
         tJFg==
X-Forwarded-Encrypted: i=1; AJvYcCUL4QiJpUByFbETXf9wQXTYRqTSmYKLD0SEe6Rh/sVkMwNzp2xzYNRcMEr2g7rQaoqVvq2DoRIY/eYbMHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YznH0vWIESQ0ekQDdupDTCMoqk+kPqPY11eGr8gWzKuKEkJaHk8
	BH2APowQc5KiE+sJVhSgYJWEZh2Xv16bFjCzfkDWwPrC8ggeK54hEE65rMPmrE3qXfg/pt23VqV
	fKac5JWanlKBtKQNQM4uF9F6Qk25UoGCGnILjPYOiaw==
X-Gm-Gg: ASbGncuZGkl98+vJIQ5fNMXAtK2MLfXJisxntZHfdY8wWmNQld5ML1mtWhFwHkSue2W
	5TiB9pxJYli3fJgZeFNyAl7C8OHDXSpiwFg0tEDTixkmt4pyraz7/VY9rxMD7a72VF8sozRJkqb
	hpVJTOJhxLg4nQ1d34eXLlplokvT3HJ6Aw
X-Google-Smtp-Source: AGHT+IFS3zMbLY+Uv4yK7T04IXAVa5UUBNsybViiV3N9L+FcNjqxEiE/5JDaeSLuLTbJWGsJq2bHdp8/1bSHtjoS5Cg=
X-Received: by 2002:a05:651c:324d:b0:31e:261a:f3e2 with SMTP id
 38308e7fff4ca-328096a36dfmr56331841fa.1.1747778398073; Tue, 20 May 2025
 14:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org> <20250519-gpio-irq-kconfig-fixes-v1-2-fe6ba1c6116d@linaro.org>
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-2-fe6ba1c6116d@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:59:47 +0200
X-Gm-Features: AX0GCFt6m0cGDfXHyZSyDb8bizNXDqo04JK2TIbhFyHHh2IYCeXYYPrIh9nSITU
Message-ID: <CACRpkdZiBp84OA643ekF8Yxs5O-JMBH2GF_FXh5YyOPo8Zx07w@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: mpc8xxx: select GPIOLIB_IRQCHIP
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
> Fixes: 7688a54d5b53 ("gpio: mpc8xxx: Make irq_chip immutable")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505180309.1nosQMkI-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
