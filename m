Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B7618E02A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343675; cv=none; b=I5tHdFDiceTS5KiSIOPGAs/rR2EMtVq8+G1Fppw/zR7BB8+9oNhY4WHiwmXMNGsJAA85Hbu/cfiDA2kdXIgMOVjzL7M+mAh5KFDEWrY9YW6DpseyxH2Y92MURPeVeb+W//426e/9PTEtwOSP8qJZKMWEnD5NPkpHQTVULcQWG9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343675; c=relaxed/simple;
	bh=npDsCsbC8yB4lDdI+t7kw9s48Aia79Vp0ui0m6EisQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jb8N5wCDddqZPUNWraagAxZfUbiwfvl1ZCRI261HlMBlEoxZ5Own52jKOhPC6Aa03/JDKcPTx+AEaWBwyIt9Dh9m4yvzHXSOIcsWPmHwR3byDYNmSP1nKWGPe9YcK6u+uS0UaQRi0B9A5rr3FKwNH0c16R897uXnoGYWawp4Vc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xdfldzVm; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xdfldzVm"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553d52cb80dso942694e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750343671; x=1750948471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npDsCsbC8yB4lDdI+t7kw9s48Aia79Vp0ui0m6EisQ0=;
        b=xdfldzVmsXsxV8SZVe6rDFWUuEhC9WEZjIOKl5aeole6QtnyWcJUJcuqL4DomesFUH
         exgezVW6d9v1DR8X9nkBC2ZzJ0DdJsUCbgwTtml6wl0IZjdnUx3hL52oSTHrLeElznOk
         McxFkcGl225hcHNXcb4pvBHQN/komGXsrFsW6/I7TB3y1qjOmoWJtbGlrFyh97TAkoAw
         36PxV41Px8SlaNiWoSh2+U6ZpBp+OdZJwtkzkKfpZM+GHwoaqjfOWXLv9DLszl1n4hVw
         EVKJhw9u5ADo0rfJ3vYwQQhPUQ7K3Shy78Ep5MKf28WH/1wz/ksL3kKjzWwq3XjAt0kV
         emfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343671; x=1750948471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npDsCsbC8yB4lDdI+t7kw9s48Aia79Vp0ui0m6EisQ0=;
        b=NEPg8+wVFrWYb/7xhxi7YwN3NBp19KgXL2smosPAWNfT/jte6+XKnDfO7AUURvS9be
         cjBtvAvT9bWkrvVhns5FXagBUR5gQo7usTG0qaZ6CEPy+1GU+UA4d8jfN4OPzH76xefu
         wyb8feJztiXW8dOeb3U89fgnFAlTcXmGvBia/v7NAoG56dzSNWqOlVYE1ojAy+p2u8bW
         S+m0D/5aPp8SoQHF631DDRy7aNVpGqF2/4nO1mcCJYsT9IiUxltLXCIps2Tq8cm6UnQJ
         2+cKrbBQK+6wM/G3n5+1vleGMa4zhdVEqeKDFfVRW+YKjgUMId1EZ44gwa8HelsHb10Y
         uYfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv4uoVmu4FCMZeNyVALlR1rN8uht1v/iQVDMJctJBS4gxdGp3yOG07OmtAbavgxQn+8LpJPOs0oFUT5J8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl5zRcXont+xVZPRsQdWZNW/QKkKnAJO0h8eC9blgYIlT04IlI
	8Ezi7WGx/nxog4B6mIS8XBsFDWEWo7bXF64o2s+GAJ52Zp/Oc8deJKu4PfNk7pg1gU3fSSrL/2r
	+jEbuK8Bksx6SO+Irks1cEcGMTIrs+Ae7Q75QOKWTCw==
X-Gm-Gg: ASbGncvobSUcdmQXa6XVvgpNuMVpznlmt0ChGKFaN4Ob8BsYVacXozOVxpL8SLMr0b9
	+nCB1gXoJ+Vr/DtTS4VBaHy0Qn1grUaGiITzkcuylIjzHW6C+aiRMFPaHvFoMJfSbxlmGmqCLRB
	8oxtL9d5Axq903Pzy0HH4aWTs1GsF/HbKq4qfJeVj8DRZ0ZQlrsPimmLNkqIVxDz6Rz/+2mtcSJ
	iE=
X-Google-Smtp-Source: AGHT+IGTg4fC3jUJFCbywRZz/VrLdnK1jrWH+Rcuacnc6SmvAw8kjD4XHlxnLFwvrsW49l4uIWj+tyHjhyD2bODyADw=
X-Received: by 2002:a05:6512:3090:b0:553:cc61:170d with SMTP id
 2adb3069b0e04-553d97f06f4mr1085732e87.21.1750343670809; Thu, 19 Jun 2025
 07:34:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-9-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-9-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 16:34:19 +0200
X-Gm-Features: AX0GCFubK_DwyskV-8MDyKBHZbV9NQDViI1V1zsdGePHy5OXUt193JhwAEyCNeE
Message-ID: <CAMRc=MembHffEuLYhg6-GN9fRA2Sk5WUCsZdLOTKNtdJYqPkRw@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] gpio: reg: use new GPIO line value setter callbacks
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
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Ah dang it, this is still not enough as there are users under
arch/arm/ that scoop out the gpio_chip and call its set_multiple()
callback directly. Next week, I'll just apply other patches from that
series and resend this one corrected separately.

Bartosz
