Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABB126463E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322180; cv=none; b=j31qCDdv92yG4dPtfbi3T3hPKKQWAc+RbEhPeyLJ14DpnjtsMFOrl4iDgmtwh6E3FB0AlFLLkCMaxCtwvlirs7A68V/4XqIFu50mOYA2vlHU5fk1dZfhk/EIfO89RFF+q8C9lo8r1Xp1oG0PwLvTSVwcsDbvvYwCuNmtN7R7cXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322180; c=relaxed/simple;
	bh=yzf9de8tjudMgAFImVxK60pD4txhktnI7YYgbi2dkYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7jENZkGAjcNXBnj6d9eoIAY4WpCRLxvwglNzEQnKxE6OXOz6CsQG2Xt2kKXOZRLdvpcFR0anFcHarpMc+jvBxPRisJGaLidlXSWsqJ9yoFxuNx64iwqulTLzyP30xIPcH8GQcBo3JTSJ/8d+jzhH6XsHNBnKOb1vilCi0xgLkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ga5jSC+C; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ga5jSC+C"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b553e33e6so4293491fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322177; x=1750926977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzf9de8tjudMgAFImVxK60pD4txhktnI7YYgbi2dkYs=;
        b=Ga5jSC+CC3c57/umT5qA2vmrESoZ8QHlsHGHMsnOmZRE7np10F/p+RmzJv5rtSMcK6
         9gh1mctNVcC3pEpiryO4IuFeZsfMkqdYktPgtzmztNQ3o5rNAlG03jim/A+CnrekZ8uX
         dVyltll1LczZBlCOVoVul44mt8+tGbDVAstk7+sqrPa8EkPWiQQQXJNf06gbweZFptsx
         4q4HUDa3EMPEhIgKefPuq9Oqz1nlptZeFzq4btoAa0atFoQ1jtJC68ajX4AIEfaBTxQw
         P+28uLnYnlT5eBlXCnTR4hAQzLJzy+Us5ujrdCF+ypicKf2jlD7JqHDeJcx3ih0nr5Gx
         Plaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322177; x=1750926977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzf9de8tjudMgAFImVxK60pD4txhktnI7YYgbi2dkYs=;
        b=ql7LahCrqKO8XpwRqiB3ECm4rXgTuWJa4nHkd3qG7lmH4F1cRZ7hbB69ifdN1bbZJP
         rNvd0qWZJChujh5j1RubbYJFKt2L9zWw5F+GMhNqtGaX21Zat5HNlJw8ZrlFXHCOy4Yg
         q8NveepAk7MIHZKX0r+FerKrZPzxA65Tw9WKrlFAtvBw/rR1sh1KIpZJrziUJ2CGN/Ld
         muHYw0TLQkimScobHpsVUZCHUDxM5TvJ6wYJl59vE0ypTpKk1Q1Rk2S1g8zIxV6KATNV
         u4NgKKf15DMagOjd0ZfC81I58iUDacyxhhOi/DyZNZ35F6ZVQER9GtIiNhIPXH9767LU
         mCbA==
X-Forwarded-Encrypted: i=1; AJvYcCUHRt4I+5wQZzdL/BDw+Q60e6bMfmNmFE0IzjnbntWLWHSRqb98UYNvNb3P4yE7wfTElB6A5HzXOPsSYhU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4LL2crWpqBS4pCpyuhHXXLMO2dbkILLoiQ82IuGACq5V8R1Z5
	dX2z7/+R/br2/Qi53LYCqR64BpvCe6VhbRrD0IshoJev1HRo+LzovLITld48KcebXfV4vHWAVor
	vepjOT0hCsfEeC991bBl/zYDDfavIQoOBf+eXRHZXLA==
X-Gm-Gg: ASbGncv6ULwpn2S6oKX2gze90GVPMXkUxoBYHaL4DsglFsGJxo5jpsinZXDvNWyICvS
	dFViH+J9bJyEJPnd6j1Vdic9nPXGwuZiST3YwJBoGUjPnk9p6i7hAXETjjNFZmOE7DM1g9hx247
	KV+Xma7cu5+vXjq4pIIPvocJ3AnkbDCWdRQGj7qvNG6LtDPtAxY9u8GkA/SxPP+PRZo57K4ZLsi
	LQ=
X-Google-Smtp-Source: AGHT+IGROhB1BHEhVf7lp3K17L78LdhcTvHXtwk6/ks9ka8oVJATyogYr8tNLZyP1iVXGY7Rk+OL3YCyL3i+oERqtJI=
X-Received: by 2002:a05:6512:23a7:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-553b6e74f1bmr6127957e87.16.1750322177403; Thu, 19 Jun 2025
 01:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:36:06 +0200
X-Gm-Features: AX0GCFte8Q5wHOGkWFWXjfIA30NLlYd4ISVYqo5eAKH8rrJ08AS71jryqV8KALU
Message-ID: <CAMRc=MdkDF_HjRvCvUdKueRgNYDxe=aeGeWAw9bBgnAZ=kxZAA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The lines on this chip are input-only. GPIO core can handle the missing
> .set() callback so there's no need to implement a dummy here. Drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Baolin Wang <baolin.wang@linux.alibaba.com>
