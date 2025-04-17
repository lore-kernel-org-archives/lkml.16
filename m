Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC2C219E99
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875749; cv=none; b=L/PzsGXnjAUh8qtL/WcILQgO17KM8IKl3tkk+EKkcOeYVVh1UXPYYo4QTMiNU5DJlq6yeCGEWvYY3NpUQGtcUYLT2xvvYskoI7Z2Sp39ncG7+GuZsAymohHMnZ/+/cz8UQ7CEGKKcCiPCFrzQlivzgfMipiu57g/Km4SqDPmDww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875749; c=relaxed/simple;
	bh=l9yxI+Mba9CUaTNrgCthTIf1TjoMCLU0SYdNd1ClZ+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGY48czjQmBm2cshBAvk+zG4tZ7XlUA/w+kGqPSE0epiWBLUYe2BXr0/f+jUEc30MkR/Iil9RFyEafpwrnJxlNaKJTq7h9VQytj0jpPV51NZdhw/SChU02DafRJX+uBdzDtY/ndAtHMe5DYtIfuSxtLBJaXtGuZf8+5eszMdi5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wnap2H9g; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wnap2H9g"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso4760431fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744875746; x=1745480546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9yxI+Mba9CUaTNrgCthTIf1TjoMCLU0SYdNd1ClZ+0=;
        b=wnap2H9gAK9NNteg++8ryeSQa13UjKbjK5x1IyIbpzWmN40rnBiVOp2GN9au7vocBE
         By+9iQFOxEbx6q1caCk+cyaO69oBPvp22y0bwwnhQXReJa7VmYkQ+rMeE8zyenLb7owJ
         b7Src8UWf/7rdM+cr3+YYKSpXBMu/hzBOCMCQdSCunqSYp40qzb463awgut7wzrhabyS
         i+NbP4bX61SXTx/RxmLupBwL/h1qXj20BOuw0B0w0DYANCEYTTpl2LbMvwTM6eVN9NAY
         xQY7qkMhxkPP2RHT+T34uWBhE9hHDD2Imyg52dgx12GxBMAyp+/48pzbraNZ26amMv0v
         I4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875746; x=1745480546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9yxI+Mba9CUaTNrgCthTIf1TjoMCLU0SYdNd1ClZ+0=;
        b=eH6rcThAj9Ydnt6iRYjErxMNLZ0vH2gw2bLIxhQS6RDSYHxgFyjc1pfm6ellxJBFRJ
         LInpAXGqwpYZHONDos5aN4Wf8kRhbcIhvCk0f1ObB7Gkbwkt+LWpWXZYJ7LvfQtPVpEi
         nzJZJ6tahd+Al1d2xVhYxxKLOw8/ZbPp0jBObThngWQ3V3NQItYy3wVgCqjqv+5rA11M
         S54niHUIo+5iaX7oh6fFAPzzZ+QDRTTnET8sx/isM3VkSLhArVNn9ZUm7XOYqNuEyHzk
         WuZuci8horIIZszE6HtL/sBiWEsvUah2d2MBjG9KZePnvArWaPbIfEGaGJuar9SsM57A
         Cqhw==
X-Forwarded-Encrypted: i=1; AJvYcCUKQieALM1mJVWD6cE0aMabVYFkR1ud1sLrzEzUsHoDc/kRs49AgiVLm/7ICYCbyJYHrCkka9whrVQg4DE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGWQXjRXN4JXLDT/MXrgC1Is2uNy6Im5jaRGhG0dE5RpVlcr5C
	QlLBpXBxd4RDgVFXR5nBgPOaytiyogTlHJ9XSNUAfl0V7Pn7XK13oPY/SLp6a6Jeew0XQAAoOSs
	koxXKJ/4I3XLn3XbvikPzTOHGKoKyqKG5LCiaww==
X-Gm-Gg: ASbGncui5OA46iCYxcsYMWOqj8kLGWgJhZBti5FdDbE7nB1gcstW0/SuqZMQrOyvuv2
	LQxGi30GLJB3tP9DyzBI62a5mCifAvxnWoZVTUv8a7GkH8z7ajMkUR/PWJefoTkZXLYQplHfR7i
	J4nsMk67gpfj4v024UemXCrg==
X-Google-Smtp-Source: AGHT+IGS1IRdJZGaZOGBt2o7TAzE4ajC3kXe2lrY8hS5Zx1+HVIOORQPGpXWTLFIUHBjt1Qe5pOZPC9xWwoJZ+1T0rQ=
X-Received: by 2002:a2e:ab19:0:b0:30b:a20b:eccc with SMTP id
 38308e7fff4ca-3107f6bde0emr19717881fa.11.1744875746101; Thu, 17 Apr 2025
 00:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
 <20250416223706.GA3230303@ax162> <CACMJSevPHdo9ZGaOyGV8rrhJHTN4+-0UB0+sz=Z5jc_eZybjcA@mail.gmail.com>
In-Reply-To: <CACMJSevPHdo9ZGaOyGV8rrhJHTN4+-0UB0+sz=Z5jc_eZybjcA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:42:14 +0200
X-Gm-Features: ATxdqUEL04h0FlK145WkXx_Q9dTs068nZ1YOBn95bqrfuRW3dCGJeGM7IpJjU74
Message-ID: <CACRpkdY5KJzCk1sfznG6DFMmX9T=pu=im_a6jTeAT68pO9SBAQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] pinctrl: sx150x: enable building modules with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 8:42=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:

> Makes sense. Linus: Can you just drop this or do you prefer a formal reve=
rt?

I just dropped it, no problem.

I'm amazed there was not more fallout from the patches
so all is good!

Yours,
Linus Walleij
