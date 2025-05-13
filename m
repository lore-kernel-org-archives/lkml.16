Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A0128DB72
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141483; cv=none; b=R5FqIq7mC1BNqTBUCSkXTL7NqbUTUDV4hWTPQwjT2emUpJZ6qv+iu6FC2N7rRP2PVjVw2gXuv9D5ir4QGHYSwjxFqych4N7ma9fkCJwRlYNJignSuVLOjUS+i3DYjnwbivQR8GO9Dr80mkGuKG8GK7cMnA1PoIFB1M5W20uUHfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141483; c=relaxed/simple;
	bh=u2ZxOoIdi13WjQ49OpkZmrMWrhD/oEbMUsIPhKeBTyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2BIZ3fh74FN+iDSGDJV99hlF98y+mRjtUnybwNffu+hDB14gBuuU2Q4W5DQiTuKMen86Ff4isxxe/syTQhEyj2g0Fsralz30MehqEOwiB/QDv0PRwdIg8+LuIPU1Jy9f3a6My7goq1QfxKosbL3m80M/ABeCdsDR3ML97MnFY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dzDc1MxF; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dzDc1MxF"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54298ec925bso8061616e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747141480; x=1747746280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2ZxOoIdi13WjQ49OpkZmrMWrhD/oEbMUsIPhKeBTyY=;
        b=dzDc1MxFX9l0eKW09Qiu4n1QLoU2CGDka1JcQKsBBpJReUKrnIrFXwbwyHY/aTt/TL
         GIFigvw6T58hxPtWMWwUvarXLcHwfiaQBHzg5sn2YdOxJyVjRvoy/vGzuluuQeWLFbZb
         x4ndBLz1CN+dyERQLXyTPBMVZZn0Y7yNLPmY8EAZktJzeXepld0iP+lzOxNrSvRN0g4j
         67hqRBd2/H5cr0CZFTUrECADQoqbATyWg69ukw4/VbxuPCIljXltzJ/asDGRTdqWKbmR
         xOWtyZx7Uzityi5uc9NjwVh8O2GTneXbcoZ1k0xMzBaU1NX/biSNTaHOE8UyqGFcUzGH
         2+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141480; x=1747746280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2ZxOoIdi13WjQ49OpkZmrMWrhD/oEbMUsIPhKeBTyY=;
        b=eR46y1X+X0CaoxBcs0AAOBUHGRQQRiKXPYC61PoeE76VqkciKkfK5ktuPl4g7QqN9w
         OeBeaK1FjIOIK6mvzbChfBVJ/uEUZrkM8Nvf1NQ4Uf76M98Zg3OUkVwLd48I/bMYz1Cg
         Yd6V8MwMiunBwvXBdg2VMbTj5GKjFZaeGFd3sg0vv6K0jdBOoHLAKg+Pw/zgv8BFO43M
         aRykM7xIGYKnwymUVLK11oOgDvgrPi8zVJhxEn1qO5idazQ9N8odzkSl3xF3m2dQeVQZ
         0ixnydAn+0v9QTYlshB+3ynj7WZnXi3FOhRpNJshVs7JpE1iHsM+u8/N9PUsKs98u5CH
         whhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyjblMTD8lZgUxvxMeUA4q5w7E7tbNUkcrXIN2xE5gaQ4katTO+GvjzQyo3tDcvDwKUbnUEBwhWLE8Ry0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+7oudNDviqLB9HbkPi4s7Ok8lIZtmhRJf8KFIDunbfrvNkHtK
	nD407Mt978T1mg/sRbB62oolDHlwhReCC72bSFafOp29H17+nyI0dUL4zIHCt64KC40dnpNhdzI
	abeEV7P5y+AR6t5yMTw4JMj56LQPKSSHI7qCIqQ==
X-Gm-Gg: ASbGncuvXmmmAsU99Ny+D3iWJOkp+N9tC0a22RbLz62IJFhx10piaQ4dyEir5QQ7Eln
	vhwYn7ZZhluE7m2EXt5o92crvx8FQDBams4uyozRzJa7F8/iZ6bSeLlsR0fAUuM/8mT0lxlBSYk
	ivBVn8vmLqikwtvzGB8BapL4NyvocyBRN5n1/kBwo7F04=
X-Google-Smtp-Source: AGHT+IHvP0gooDDmu568VdD7x6FFv8psYcJXM3XY47vCtvEw04TEGbdJAZqsD4ocAj63/kyy4PnOyiTDBOr/SlE5CrE=
X-Received: by 2002:a05:6512:608b:b0:545:1e2d:6b73 with SMTP id
 2adb3069b0e04-54fc67b5d02mr7159396e87.13.1747141479717; Tue, 13 May 2025
 06:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
In-Reply-To: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:04:28 +0200
X-Gm-Features: AX0GCFt0sjPwjvA5EozAKBAvIh0YXGHalZHBo5O9eCpuXVR3ChNSqR-rASM-_dk
Message-ID: <CACRpkdaBrxwWd4JPAJCZRj1Ov8a_6U+idGzi2pnEr4MJ0Eyf2Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 3:07=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix.d=
e> wrote:

> i.MX GPIO numbering has been deterministic since commit 7e6086d9e54a
> ("gpio/mxc: specify gpio base for device tree probe"), a year after
> device tree support was first added back in 2011.
>
> Reverting to dynamically allocated GPIO base now would break most
> systems making use of the sysfs API. These systems will be eventually
> broken by the removal of the sysfs API, but that would result in GPIO
> scripts not working instead of essentially toggling at random according
> to probe order, which would happen if we unconditionally set base to -1.
>
> Yet, the warning is annoying and has resulted in many rejected attempts
> to remove it over the years[1][2][3].
>
> As the i.MX GPIO driver is device tree only, GPIO_SYSFS is the only
> consumer of the deterministic GPIO numbering. Let's therefore restrict th=
e
> static base and the warning that comes with it to configurations
> with CONFIG_GPIO_SYSFS enabled.
>
> [1]: https://lore.kernel.org/all/20230226205319.1013332-1-dario.binacchi@=
amarulasolutions.com/
> [2]: https://lore.kernel.org/all/20230506085928.933737-2-haibo.chen@nxp.c=
om/
> [3]: https://lore.kernel.org/all/20241121145515.3087855-1-catalin.popescu=
@leica-geosystems.com/
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Well that is an interesting way to do it. OK I guess!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
