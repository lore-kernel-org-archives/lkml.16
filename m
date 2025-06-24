Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776672CCC1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794703; cv=none; b=cThzzgH1fhkQCidHRp7xSaua5rpS++xDhXuMpXExW0jcL2in6hBPv2DjLbD0IHeoiUv/DISwfYTuO27VXiJCgFBEmwxaa0yBakujVb+HSA/D+xvZCpsTxIg7Np66r26eLQQzW/DkHG7PMGw8KcPN4C56yguV9a07xedW39aj3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794703; c=relaxed/simple;
	bh=B/ULaHUETU6DovdIQRhQ/RyujC0Dkl9fSx3NjtmEe7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEL4qEkxrKwVl4rjf3Njjp8lx3nlZVK2ARTH9168o9bADF78kq/qaGA78fG8p+pcjCL7ldTp9iw+9LLLHQZFOunjRuOPDY7LBlKakVt40oHEBerakbgqW3FR8RBRO/w318hmDTEY/a463iXJeVdKjj5j6XBaNcAJbNry51V7Ir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bx4nC00S; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bx4nC00S"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553dceb345eso6392792e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794699; x=1751399499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/ULaHUETU6DovdIQRhQ/RyujC0Dkl9fSx3NjtmEe7Q=;
        b=bx4nC00S1X0r3LL2R/hiqiaf8/D6l8Q6+/3VxcLz6FsOkAcJu15PLb3a11a5Ea3Pum
         ILW8cMasruwTlIVvM8njMKJA9urHb5nK3ePOPakW19RW/ieOjdzAJ57Z7ul4OPDxKFFx
         soZK1wyh7s2ydB2jZS0f66zZ2qhb70eQDaj3v/iVqxpA5T5XnLZqgtXjJ9cJYJC+CoDR
         qEnkJAIG41ScY4k8Bk1eWej5sRj5cKZJltwtuxvyFU44zGBbABPhGOCLbBi4bgZymI7H
         ztnf4+U0rK/C+O6sAqhPW2QMGm+2Mt0ZhpuCUa9WePXAd4hqJzPl4qgnnqsTJ2M4AxKL
         23Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794699; x=1751399499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/ULaHUETU6DovdIQRhQ/RyujC0Dkl9fSx3NjtmEe7Q=;
        b=Y5woJxsMWO4DMk/ovyiCN85F9R/PLtJGMZ1aFjM/xbt97K4VrO73rpU5S+5koP25on
         +onP37+rQ6N2JBn6QLzDImzTLblxu1Xz16LFxKev2yysUAuCSbCJrIvTEdD6j4Cn/Piu
         twVgkNruAhqTEaiJYLchz87HYzXQeYIQ2Yl/ZrUvoDHoH1U74afFlCC0rxy6Zt2lmYRP
         ri7DGy/DnuKoz2ZEeZ5OkCwZwmb2dvKX3bSD0cFsWUbXkD3e/BoDzm92ZyLMbnwi2dE/
         IN7fYEhKaSCsMGpmB0gTG6m+x4g5itxICfLLojlt8d5Ad+1OPYtsKchFdtdKdd6uDqJj
         5ndQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1gvcNccsvOqqKxr2/PTg0KoB517Hhj4007QsCD3nFCTYVdZnKhSdJWPQb/JKGPmCEB5iV0a73IXQ3cA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKDGGfsN497YM7QMQwKxDdp/Ujk5rWULm6Y8A1WlBze24I1MGm
	j/PP1kya8Si+rYFOVog/DovYrYTnFepAifHHNIv4XP93d2nUEwBYKpuKWO4WK4O7eqhIOqJlqbh
	gzgXOFaAyZw8qioj3yu/6Ur+bIXSjPXXqnsyEplYBVg==
X-Gm-Gg: ASbGnctKvUSS58HBL7XQc1w2i+NR6L6pVEBf+zDscHpPy8NYCVbxK30Iz08Js9RjyUg
	VjVDlNxUZuec/4pvikwFQn/9H/klvGkhZtjK+Ox1gj31PX/ifzouhFNnzFbeDGLQSt/mOkxxNPB
	Y1QeV6SfJbPLp6h3O1f9esywzgV89d0lx3TtV9uoeWmxQ=
X-Google-Smtp-Source: AGHT+IE7ZhidhDycmbWSPBv1SXukyv4UOsTnptIV0NVFDdvfjdJisylDEZywOQMLRXTZuVgtEJHSpJFFFA3MmjtlJ4s=
X-Received: by 2002:a05:6512:3b9d:b0:553:358e:72a8 with SMTP id
 2adb3069b0e04-554fdd5d263mr47305e87.38.1750794699262; Tue, 24 Jun 2025
 12:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:51:27 +0200
X-Gm-Features: AX0GCFuix9QqcfdydgWIF-t3O-vbnn63nX5F5wQyNw4KZuxuAr9t5L-dWlGRbto
Message-ID: <CACRpkdYdZQ4rKXPbiUve4n-p6q+HG4QS_oFkY1JDkJeqP4mZwg@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpio: move generic GPIO chip fields out of the
 top-level gpio_chip struct
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:27=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> The conversion of GPIO drivers to using the new line value setters is
> moving nicely along and we're on track to have all the existing
> providers converted upstream after the next merge window. There's
> another piece of technical debt that bothers me - the fact that struct
> gpio_chip contains a bunch of fields that are only relevant to the
> generic GPIO chip implementation from gpio-mmio.c.
>
> Let's work towards moving them out of struct gpio_chip and into their
> own struct gpio_generic_chip. Doing this in a single series would
> require some ~40 commits which is way too many to review at a time.
> There are also users of gpio-mmio under drivers/pinctrl/ and
> drivers/mfd/ which would require cross-subsystem merges. I think it's
> better to do this in stages over 3 release cycles. This series adds a
> new API for gpio-mmio users, hiding the implementation details and
> converts the first set of GPIO drivers. Once upstream, we'll convert all
> remaining users and once that's done, we'll move all the
> gpio-mmio-specific fields to the new structure, convert the internals to
> using them and remove bgpio_init(). The last step will be done in a
> backward-compatible way, not affecting the users.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm in. And I know you will push through with it as well.
Patch 1/8 looks like a dream, approved.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
