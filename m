Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA362221567
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788963; cv=none; b=pdSIjMX/tFUlORE/WXXq7W3q0ixkjmkXsNoL7HWxZ0vy10JSNghhS1QYha8gbJO6l7mKIXvb4fjSrSzOUAPdMj4dtzlGdYHdkf72x83/2E604+qUbyJb6FZDRifVIQYgA9lFrDAbwc1lJ6ALOdQpGfvkEn6fFcxv018p6nMsYg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788963; c=relaxed/simple;
	bh=utHL6CUHYCqScb8aWOZTdLTjaHpP5+HYoKwpnSAv4bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kc+hOgi/U9bAOi3la/UGDExWm13Jd4ivaXBFrk/AvgrCgmUgrZ7esvZumXslS99TG5iUHXIMKWctTYPtkRg3GA9+NvEmKL6CnL5C33cqD0goMvk21HhuLSWK+2EKKcx6xtM99+2UNDEOWymY8PD2H+mFdKagUno/lRl1qHnqxEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lu3GcZPN; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lu3GcZPN"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so56605611fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788960; x=1745393760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tahJOR44ovG/8oTG2DD87WyQ8FqTumd0rmUHp9pfS34=;
        b=lu3GcZPN+XygfeaT2uHJayCF6M+/wfAPQ/bNsYGXAxeR+WRfQ/tkWJHaSS+SZoHgbf
         RsduXzY2ze1fG4ztcLqfU9FZ0h27ogNF0IL/K9015x58ey4l+myjAmT3yz8Mb3p7tgT8
         ca4KthVRjNVU5/0V9jTOvWEe9PSfRA4jxO3/xnnmVCeQVgJuNztTHZhRBcdgonT2sydU
         lx9bel5VhZoMQswpK6A0jfFjCCxb9KRlm0EkwwDAx723eGBa0cuauyLXzP4IBR73IL++
         hAQ4eNfoQkEjAnIGAQ6DBfJNrJuLcCW6nEPe1rRgpc4P3mdob3HPQH47Vadg93KLTrS8
         T0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788960; x=1745393760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tahJOR44ovG/8oTG2DD87WyQ8FqTumd0rmUHp9pfS34=;
        b=hdUARYDa0QGuEwyx3a0UEWmIIfRxNZkvLVaYBRMzIliztKXLUPSKkkSoSv62C3n6RD
         iXuEEGQuG2eO/t//2jKNF38Cl+X0sMQ1dR3zuC08vtMg72GWr6ih7OXoZKV65qtdzu42
         8yiywnLtwudHvHeDpBLfRbBjHGseY3kcsuU6r9MpWjPgVml2vo5iLzTp1PV/JryYxv//
         2gRSNcAzu6ZZ99FpoVrGEb6BveKHBYtqsX+e6X4Vy85y2aIDQi1QQHGpNp2J3kgf+V/b
         2zJvh8Q7VSlJHeD3bVlJTc9STtY2NC+MICKc3AccckQE331IDcMG1dKiiIEMLcnwdLBk
         xGVA==
X-Forwarded-Encrypted: i=1; AJvYcCU4G3h3i+REjMHAKlDUmyjL4K7lw60wwQHKsv//kkAjyRlmrS+Bp2h/h1D2pWAM1lCLN/JJvgGi5IgQkTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfjuf0zAX2mN3I+HX3kFucLlf+/Tly2pQS4fu54DD/J7tXLwaX
	d5LnFgkMCVpHPIwdfOAzFzdaejaHlYyon761Oq3oqKt77pVV7iDO7N2yDbSPxR9FIrpk/eNbgFk
	dQhk9WXmDigBDHiLmCNEhhkteimL2Up2nMd2/dQ==
X-Gm-Gg: ASbGncv5U1V7VDZoUVrQ6ZmhXmQvSjKA7gzo+Y3iN+DLAVyUvamJDe/0g+ghE0Z9kmn
	V15g9tLXfb7B0bIp23x7KzapVfIpNEFOPb9J7v8/XWyX4HhdlNfiJ2eHPSmxddnnRnBGYjrcwA9
	2ob63lGesLr6TkcBe7S3MbFQ==
X-Google-Smtp-Source: AGHT+IH24Ze7Uj+sez6vaxU18ssHrwQYzi2qOUAKOEfNuhruNeH0Yi5FTQWh526Drs8Kqf/boypXWbGB6xmSwB0JtV4=
X-Received: by 2002:a05:651c:b0f:b0:30b:d44d:e76d with SMTP id
 38308e7fff4ca-3107f717f28mr2363111fa.26.1744788959942; Wed, 16 Apr 2025
 00:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744325346.git.Jonathan.Santos@analog.com> <2a789531fda5031c135fc207a547f2c3f00a13ea.1744325346.git.Jonathan.Santos@analog.com>
In-Reply-To: <2a789531fda5031c135fc207a547f2c3f00a13ea.1744325346.git.Jonathan.Santos@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:35:49 +0200
X-Gm-Features: ATxdqUERw-HLaVcEGEBRc9LkrCdUDVa5ewjlkgrTDVV5Xmky5Ym5mhn0wiOk-Q4
Message-ID: <CACRpkdY0VAkW3v5mBzxz5u5RfLv4zpj5sy-zpx8Ma9+0=8qQfQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] iio: adc: ad7768-1: Add GPIO controller support
To: Jonathan Santos <Jonathan.Santos@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Sergiu Cuciurean <sergiu.cuciurean@analog.com>, lars@metafoo.de, Michael.Hennerich@analog.com, 
	marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com, 
	brgl@bgdev.pl, lgirdwood@gmail.com, broonie@kernel.org, jonath4nns@gmail.com, 
	dlechner@baylibre.com, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

thanks for your patch!

On Fri, Apr 11, 2025 at 5:58=E2=80=AFPM Jonathan Santos
<Jonathan.Santos@analog.com> wrote:

> +static void ad7768_gpio_set(struct gpio_chip *chip, unsigned int offset,=
 int value)
> +{
(...)
> +       st->gpiochip =3D (struct gpio_chip) {
> +               .label =3D "ad7768_1_gpios",
> +               .base =3D -1,
> +               .ngpio =3D 4,
> +               .parent =3D &st->spi->dev,
> +               .can_sleep =3D true,
> +               .direction_input =3D ad7768_gpio_direction_input,
> +               .direction_output =3D ad7768_gpio_direction_output,
> +               .get =3D ad7768_gpio_get,
> +               .set =3D ad7768_gpio_set,

Due to refactorings going on in the .set calls please switch this to use
the new .set_rv() callback that return an integer (errorcode) on failure.

Yours,
Linus Walleij
