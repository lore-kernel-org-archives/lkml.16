Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426D038F80
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251812; cv=none; b=TWdIILAdt1S/ng+h2aX01CJQNAogMtXq44r1AiTXXVZwoirmez2W4Fw/KI3tH4WYuDaFqw+2Sm4kO6+zNATmXWIL74QZBaefNScZwlThsSFFXMoMk8J0Kh/Vr/jVD8IS/9aZIJMAe2vFi4vr+fZzQSPfjwqC8LVzHCTiQMLRL6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251812; c=relaxed/simple;
	bh=tFx+nAgZ8AJsRRvfdecebhXbuJcNn8oWUIIvk2cM8dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LL8FhN9QYZPmGvuL7QkXuPXRn2AJgvH9x92a3fd8IOsAaKB8II2JCJhXIP6PpjJbhuXWESBOGjgaZ7OE0+sFGIOBg6AGCNOn3T26I68rVptjm+8EcopR+o1U/Rdf0xAiozv8WJGDXbMlNyVLw3Y8LltH43kKJSPflUhKmLHn9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bs6kCDY9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bs6kCDY9"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-551efd86048so6883378e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750251809; x=1750856609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFx+nAgZ8AJsRRvfdecebhXbuJcNn8oWUIIvk2cM8dg=;
        b=bs6kCDY9848ignP8gnIhm+8gIZj1nf5aqm1g+Eo617UJtS0fNe2gCMk/THkMBe1Tir
         tf+EmuhzlXH9LbmMvYACHpgTFo4DQnp27ppVbycz4DSfZlHawAlaZs/62fjAUSAk5lvb
         S6MvjxjiVzwYoqUcwjcqx4S4Ra2m8BIGYFUxxuqf24zX6J71KlUB3j0EzOCfSmjWIlMG
         cbDWK9+dA14Fh3FG0dmkUAIv2v3Ifjg1oC0F3hO4EwSL/ljKIpZBRMBQ6Oor4OZzAJEk
         J8Bzjnp6Pc7KxLZs65aIt+sWEvSRneXLxQYuS0Fh+MlrH+lXuE2sJYD7ugTcS5zcqcPp
         PYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251809; x=1750856609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFx+nAgZ8AJsRRvfdecebhXbuJcNn8oWUIIvk2cM8dg=;
        b=R5GR7erdiNA0tt/s23qGDRJklO/0OxDPRjz/xW24a7SIhcXZxgfeanImOPiCfCEwmr
         XQ5r27dcVUhQcB+BkcRly2EFqQKpZLaJ0I8oAXrhbaX4MYERm5dmO1sxu1ShAKfxmOAA
         rSTmqCWSexTpg/6ofzZ3X1ndTHHC0oCcMAwCZvup2RJdg1CSQuZs7wX4ciOA9PkdLCbI
         L0LDQn1IXYOZItIJEgNn0igpSKh+ob/hH+12Kivh5ZYjQrzxbfmomdGOJRoxI9kWcj2S
         D6bbh2oGgiEUm/OnCDc2X4DmvdnXAC7Z4AQHIGHV9R6o4pG/qaG9G2m49N5jUDtUY52Q
         dV7A==
X-Forwarded-Encrypted: i=1; AJvYcCUSw6sVFsP+Bo3G6hYZ7VnegQoIUdNgak7hm+6r6O6MLx/yPRzKKUgRoKAoowPWJS5yOL+IdC5NrzeKfNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOkv6ZscpYxk3aJuHe276WzOtJqDa4wzd7fHbBupyERBUIVlWO
	yqA8/fuf/Cma3WO9uLoL142S7aRS/YZRrt06Oi3akLBs2+Webv15FEnmGxyHx1UrlJS3bIiEHNq
	9co/wpcik5V2+R7KydklhlF70i7HckBjYYFdG1yvzoQ==
X-Gm-Gg: ASbGncuoeS2sdJtpFmAJjDWfa0xIw7gsk3TlCgagWRUNPgnjnCBhf5gQbBBME4EBXyR
	WSn3oaaDTF/OaGPQzo57nj6zgbVIr3TKRkApIu0Ax7bBHiXYcZpzm69+p6EQJ96BKQb8ou2PqwE
	emhw1u9iIINtUMheBD6hnCznThDEqh8oPav4tZIy1UHkBb4vWNDFK1+/fTQJxRwHYQ/Go3iC1I9
	PXOiBfV10Jp
X-Google-Smtp-Source: AGHT+IEq73Sz7VEMckQ6LcsKf9Ah9LwsuMzT2V+DGZ7xnubvjoAkc8Z7a8qWgDSaz5X2ovUTBOfo+akf/lut/OxE/YQ=
X-Received: by 2002:a05:6512:3e14:b0:553:d444:d4c4 with SMTP id
 2adb3069b0e04-553d444d84cmr738304e87.50.1750251808808; Wed, 18 Jun 2025
 06:03:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org> <20250617-gpiochip-set-rv-gpio-v1-9-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-9-903703881fa2@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:03:17 +0200
X-Gm-Features: AX0GCFt5YjdlIT0r2MYTgVPiMMrWQk90C3yKPcU3IZdAiNWl5mP9-Yr7Xyq2AcM
Message-ID: <CAMRc=Mf-SnaY8-Azv5p3nT9z5YK0-Rtr4Gs90c6B+3+eoJnTJA@mail.gmail.com>
Subject: Re: [PATCH 09/12] gpio: reg: use new GPIO line value setter callbacks
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I missed one instance where the set() callback is called directly via
the function pointer. Will fix in v2.

Bart
