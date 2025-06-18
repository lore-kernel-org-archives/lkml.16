Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226D2BEC2F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249984; cv=none; b=ZGnKw/2w/nUsVa/0xE7SKnyjtGMV0ld94KR/KhSVlogWVWUEul3mH+xfEudZzFaBrvo8pe7uzZm4hf9msKIzFdPJp/LW9JQtgF0Y5ydwvZJBdt4bPEqQqStwwXV1yVoW2IS+qoQ9W+IWBQYy/Ouy+0uiHTgvcwbDUFcQVHQb47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249984; c=relaxed/simple;
	bh=er9GV70+n6drdF5uljPxPj0kVCu/2tf7ro4DCkzk2hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bTt2Yr+fJiTr73f9eUr0ZH8JKQDk0yHUUVqra5pweUmVV8KiVZ+Hut5lfQZsFj3jRbAg4pv2Zh7YSwp3PRyNQ7YDRj24I0D7FbcIIPABYS5u8oJrOVERR5EHTDiWjOACQcnfgpvoREFXu1xPwpZiAzJw1Y6FxU+0mq0k24N8fd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LLCARptI; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LLCARptI"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b165c80cso5878530e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249981; x=1750854781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er9GV70+n6drdF5uljPxPj0kVCu/2tf7ro4DCkzk2hA=;
        b=LLCARptIersXCToPoA6P9kUhFEBGRn/tLy5hR9gXwal/nj3Ij6YoUjCxIBQR/nXq6k
         Rh4ANHZCGShUxlpm39HznVrnsUaIOU8bcQf/7rn80t4XEMHMEDaZqwvcW1/De8t+EjYp
         RoBTtz0zIh4rfChR7boxvQOcmMdVuaPOFVp5O0I4ZacwrdIyyDp3FPM4LsW9I7yk2yU4
         9OsP0EoUgGy2suC+lNTqx9qc5D4et1lYi45TpjYJfFm71lOmrYw5WdR9RnS9Jr7O9naO
         cuc6U7fO6sXu8NO7aJ78bhow/X6OblyEtEkJlp4IgOpMKnpuz8JUtmQQ8h3YeIGjxupp
         9jZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249981; x=1750854781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=er9GV70+n6drdF5uljPxPj0kVCu/2tf7ro4DCkzk2hA=;
        b=D1x8y0zaX32d8pJIHfIWmj7ibNDX3MGnsLYQrakERDXs+vJVr6W1Qx7a/EUKK1x7nM
         VT5LWZSf1RgnUv/A/amJ0RKkEmv4RCu7L+V0C/jYzD90uW+iIxtQVjEaII91ebh+HNwi
         YGtLjrF5VzlPQafHuKpWY5K7A+bDIadDp4vLqbgckiewdaSB9d8tq4XXVPfQKCaAPGZa
         ShexhuXHv6tKeZH8tHWZf5dxLgB45GerYb72cq6q+pUL+cMhbfniPqwjQX90xtD+25ME
         mPqTtPFVikd5qraUU9aLan6n+lxmRMGB3/U4F5FVFH6HeHawOzx9/GAOlB8elupfTbpl
         3KfA==
X-Forwarded-Encrypted: i=1; AJvYcCVVVBcmXuYSlEmfxaVaCWIVDSy0XlGOvMfdUqig2e6Cp+Z3qstiiL0btFvYlBc9IBNbISd7HVduo5wDNAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCVdomPM6QSBF8xQdsPHBOzXgg/IrMrRT4QYGNgtua204DFJCO
	UH6M6nixeuZWwUPCNW81/w+Hqcvfd4vSz6WB6uXJDye13UI1vBJAnbnhYRc1qgFui9PWTxLkzzR
	zU76oCEzyWvC6BlkI/qd+NDxcpQahVfcrzETypaUinpJWQ0LcjbbuIpo=
X-Gm-Gg: ASbGncsvKqlxsvGvs2teYvdrvCbev8a5bZkRgn2EaO5unMIWEmc0SRf8otPLKUFztaC
	rVjPeFwv3qWgDJPUs8zwZXhEQXrXQV4sBzLqo71auCjw23NRi0mp0fTI18BSLcxMvqaxZQ9xiLa
	MNtgQKXEauUHKSKbUAS0oyahtHBfsYn3mxisdAUdnxl6I=
X-Google-Smtp-Source: AGHT+IHq8x+MK2Q+KzO0wn+EOPqwTKlQ89Mryv/yfukFFFcWkFHUwXTR4wa+yfRd5KaBrFwNGubCyPjw0k/OwXSOfLY=
X-Received: by 2002:a05:6512:3055:b0:549:8b24:989d with SMTP id
 2adb3069b0e04-553b6da8081mr4547256e87.0.1750249980579; Wed, 18 Jun 2025
 05:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org> <20250617-gpiochip-set-rv-gpio-v1-4-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-4-903703881fa2@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:32:49 +0200
X-Gm-Features: AX0GCFsjhUtynB_l1wpCuP4ZMWcDzuGMXSliazPojtQjqWcgC-p_VmDP2UNLCdM
Message-ID: <CACRpkdZPPh4zjL2+2e1_2nsU13TyyDCcAhOok2cF4PGwnqA5pw@mail.gmail.com>
Subject: Re: [PATCH 04/12] gpio: pl061: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
