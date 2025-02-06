Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C121419D8A2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865842; cv=none; b=rW8eV8uPMS47pYINSh62b65nAK0XhqWhBVdIMiWgLdrBcnB13Y8FyXBdUhNctTkXXeRb3CAz8tUO+GuMeZu1O+zThlTsdILcOdYf8J9ytJ8vhuml2Q9FrmB42WsxLI7wnhEZna2/W4PcYjZ9ZqcO7GEeTjcouQXWuDxmbq7c/s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865842; c=relaxed/simple;
	bh=197lp3kzwItmnztsj2amEy4Ts4sUwvD5wd25DtZFya8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GN5WZmKYjTyiLpyZHde2DOQO7Rl+x7VKBxHGgsGenQRKxMGEQZEyB0t+6vAvQ261QpErCKTkD5Z4ufrtQySeOrAU1TjCZcL+tbSlMAC/MfcP5R0Ra/HmWnx9CqlQrz2zUfMsWIUhVf7q7ytx3Sd3XV5CU+lYk3DpFKRFqLCWBlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FFeOuAHu; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FFeOuAHu"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5439e331cceso1519460e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738865837; x=1739470637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MVWUvrz6I/EjcUog/wJCigSBALMduOPBpWQgvDyB4o=;
        b=FFeOuAHutN34rCWmRwBmVPING5Ib3EZINfkYy6HfqWluVEWJRLaxVVeteS4Wa0KTTR
         KrrsDGOnbu7QS42Gun+ZpJSmaFc5BIkp20EOlq6R7Nev0DSZx6J+gVMpSDeX4oU0mPUr
         Ifk60wpQX2/8Nk8ucszSWP7nJ53LExgPLOGNI6zRM6209XwrcTEgMWN63UogJUzDq3NU
         5rUrmCqp7NPQqiQk32Xk4gEPm9NH6+9wTQtsw5H1QixGZzCUci9Ujdy+MMZ1mzl+gufE
         fCmWCnpqXO7aTHP0uhpM7WIXbotRbxhuQs7zCVQ+ZksnfHLx30b/oC/VdCRelvuVx5FZ
         JiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865837; x=1739470637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MVWUvrz6I/EjcUog/wJCigSBALMduOPBpWQgvDyB4o=;
        b=tjthTMecaN0iFhKY19h3sFRnQCLIS4hwJ/5IQOdyKzh5mltDGa18hbB6tlwNxzLNLT
         k8E1g7nYI1vDIqzBsH/WVubyZYN+7Bzhmgl+2gpg2biCTvaFoIJQAMeir4jORaTJq8tX
         M1UW2vsvPpEXG+yJwg9XTvkx4zKmYzIr4f/Af9JAo1LSuQqkAocaAMk8LxeqXkcQswSh
         wyjBUC1UlnSETMKKfDCfGqeT38xr2YArqesktpJt8engS3g7to0vFfzQYgUSGeMSMPna
         WBddM9dg5AldAEwVh5m0fjsYHe/iOv5Fo9xKuten623LhBREJ0aH8TWA4Q3XGGqL2LsV
         lULQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNLEq3miNH6Pz6D3ShbFQeuX0XT9VV5E5RgULZhIponhH9h1zy0IsJfzdAcFvPV/xI7yYM13ZtCPii7l4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6w628G+nh7uE2U5uD/M+m48+zX5ytiNtdGxVbf88kSALhwyKv
	HqyI/aqeBWT6JS0LlAHyAG7m2DiLny2O4ALyAnNSaobkiFzbTIo0fhJ3acSseIho6Tx4l61NEsJ
	jovd1RNg611dswqBV/DNV1izow9cJjAHAoANfIw==
X-Gm-Gg: ASbGncsJr3a+tu/SqCOb86EaBmck0/shDbzGqukvD5iWKiH/FQbFguU1Hpv8RSyep0y
	B9Getny4M+V1VzxXHlWMyGKnVxUAIgVwHn8y2D6wt5zs3FU9ADuaa9/lUvS33mVyhlWMyZpc=
X-Google-Smtp-Source: AGHT+IH3sHYKWyOD5ia3rmPaUPdB8KYuQwRoGoxGcTpzNmXeS5xrmV3mgCN6Tr2QiY+B044QqFQhDWxhGS1tixCTg/o=
X-Received: by 2002:a05:6512:1044:b0:540:1d37:e6e with SMTP id
 2adb3069b0e04-54405a438a5mr3117203e87.33.1738865836820; Thu, 06 Feb 2025
 10:17:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206143714.182230-1-brgl@bgdev.pl>
In-Reply-To: <20250206143714.182230-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:17:05 +0100
X-Gm-Features: AWEUYZmjY00VQRyj-wROvCwcjvRKMHYs9Ew0heG6nw4BijJkAe4FJsZiQNQlpkw
Message-ID: <CACRpkdYKY-fZED=ZCjuXD5s0TYYxBsgFwJ2ga-rHkx4k6FE5Bg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: don't build HTE code with CONFIG_HTE disabled
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dipen Patel <dipenp@nvidia.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, timestamp@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, Feb 6, 2025 at 3:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Hardware timestamping is only used on tegra186 platforms but we include
> the code and export the symbols everywhere. Shrink the binary a bit by
> compiling the relevant functions conditionally.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
> +                                              unsigned long flags)
> +{
> +#if !IS_ENABLED(CONFIG_GPIOLIB)
> +       WARN_ON(desc);
> +#endif
> +       return -ENOSYS;

I think you can just:

if (!IS_ENABLED(CONFIG_GPIOLIB))
  WARN_ON()
else
  return -ENOSYS;

here, so it's not so ifdeffy.
The compiler will eliminate the second branch.

Yours,
Linus Walleij
