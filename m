Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713D4202C3A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750262212; cv=none; b=Z5Y0dvMydhcxlrqaOqa9GrXEkE8GsX2Ybj7m2H4h0faMDJqsK/Udpc6fpg7XwP1TM7IQp19nRG22y6NuUwOgquqQQNXXEQqqoEBsv9rU8oUbdWKWF7FuI6EsRxVDXOWsm0AFJWCBLOXlDR9r8xCPChSq3vt04oRMTB9gXGcMHkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750262212; c=relaxed/simple;
	bh=nU+mMq91N/UWADw8HGmAy5+zUzWzJ4rcaI84hTgFQWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNvm3fC7cds+ximGD484qmcQnQL1g3FuzeFf1m8fvJB5DA/9QC7cboXhqcwO/4SIbYvH53qYIwJor/r727nKa7nwkSgzeH7aTmiMgpzWdxbshevwClTt23vX0J4oZjMbY1y+zcK2ELgk2XlSSop/LjrWMbenRccMWMX4qTbS6Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kcT0vjJc; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kcT0vjJc"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so7049713e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750262208; x=1750867008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SoW2zv6xd2177smA7YZNZGTO3s0ei/AUqHT8Anc7A8=;
        b=kcT0vjJclNeg67X2qS36U7jpjI4aFEGT74T0pOo+6aKCZnJlXSTJ/s8QxiJoWhAFr9
         ifijBKjC8jJTBjz4uyqZLwpkRenPFFTxLO1O2FBqGsMxlykhYDjgDDszcU/1VQhgQs6R
         BjejMWI4urWb89ulTmLD78eYQCOCK0MYRXF8g1nyA1t1cRax71jk5bCtTWoahR5FVk8R
         6KE8PlHTs8EQeXvR/Y8JTbUWQiY25kqzT992p4YFbyHwt9RMdQziC4AzGPHfOSWKSnvR
         VG1Tc1Zha0X21Msu1CmgHD3+zfpbrtsqIcOppNT2eILq747/MBU3ZoT7HV8I93fuglc4
         hWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750262208; x=1750867008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SoW2zv6xd2177smA7YZNZGTO3s0ei/AUqHT8Anc7A8=;
        b=JqVsi1Frg6RZQJwtAcO+Rx1e71JJNKekAXlUn8gox2JL0goCDXsYkguQ686ih4w9DF
         u2QGq7h2TtIoV81o7Q4EnKXfeYbIFfrrxGzqmFHX1HYSSHKQLd7CD6NS5LwJ72XIX09p
         jrP+UqK0BagRXyAHWZdk2oigArQQ5FPU8SuLbssXOkmXxicacNLqsR4cipj60mELdZjC
         ulbhXoHHoZI8x+lpaolU6tM69mI6MuvdqMMHivDSahwCZGfpCdC2F0z0/NcVpIcpfF/H
         noQ/I7cmOMsMYnrbdIrsVlnBDFaM2Vp5nj2qDe2lrUsNodXQfa22jnfBRXVGu4y/8JcB
         7ceQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7T65x3qLP0tFpU3cYvu6FOsz2dlS1pxbPLlLcSg41vxZQxRtf0V/r7mVIZrRAbSDdcNdZvJYUC2h7sJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6xJRU3Q5HfDuVqf5W+W1IvkZoDMEC1cuxsRib7qoDSkjT7xG2
	LOUCTnR4kgBMirj93/SDQzKimUrWNvPshlhdgCvr3EcbsrQzs8oPrxYBqFQWxbUFOh5SSUVeSEt
	45Ao9YBkcBZRKxw7p9h4uzHsnW7LtnIGZioV9J11Jtw==
X-Gm-Gg: ASbGncs/FUEQ5H5BU1t7qYdH2CLAyv0Ie0xSqOzhnxMhTdHDydNrK3YMGEpJXCY+gZj
	uVo9TPFt8XRMLEjqDsNgz9+3l3HdQ5K61rsMTAYdk4VTH1sbMu7FeZS5a7TcNTGJnwkry1aMuH9
	NJihh6P4Mh3O5iTZchvVrMqjpDHNYnPw7y3fvSigOm1Py3FiGCc3C+zSnpFAgVZQpxjtw8u0V7F
	A==
X-Google-Smtp-Source: AGHT+IE1m1Ogu9I7M6Q0dgSpBL59IMMub8B4m4J8EjGGDgs0++uoBKg4e91Utwy4QfsbfaNFm7zOrDhEL0/MXkN2BEQ=
X-Received: by 2002:a05:6512:6cd:b0:553:252f:adf8 with SMTP id
 2adb3069b0e04-553b6e7d49bmr4870120e87.9.1750262208271; Wed, 18 Jun 2025
 08:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <8570dedab1a7478c39b31125ad279038fe31ac13.camel@pengutronix.de>
In-Reply-To: <8570dedab1a7478c39b31125ad279038fe31ac13.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 17:56:37 +0200
X-Gm-Features: AX0GCFuJ0P-a8mZ5E3bN-xWqYgqT6OiPTQDj1Ac3H8LtAqV2mZmqoaE2xuMa5eo
Message-ID: <CAMRc=Mc6ZSp+bu3i0-X-i_8=f69X0Rez98tGsS-g_uJ1nBH6fQ@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 00/15] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:38=E2=80=AFPM Jan L=C3=BCbbe <jlu@pengutronix.de>=
 wrote:
>

[snip]


> The contents of /sys/kernel/debug/gpio don't really fit any more:
>  gpiochip10: GPIOs 660-663, parent: i2c/0-0024, pca9570, can sleep:
>   gpio-660 (DUT_PWR_EN          |tacd                ) out hi
>   gpio-661 (DUT_PWR_DISCH       |tacd                ) out lo
>   gpio-662 (DUT_PWR_ADCRST      |reset               ) out lo
> The header is inconsistent: it uses the 'gpiochip' prefix, but not the ba=
se as
> the old class devices in /sys/class/gpio/. Perhaps something like this?
>  chip10: GPIOs 0-2 (global IDs 660-663), parent: i2c/0-0024, pca9570, can=
 sleep:
>   gpio-0 (660) (DUT_PWR_EN          |tacd                ) out hi
>   gpio-1 (661) (DUT_PWR_DISCH       |tacd                ) out lo
>   gpio-2 (662) (DUT_PWR_ADCRST      |reset               ) out lo
> If GPIO_SYSFS_LEGACY is disabled, the global IDs could be hidden.
>

After a second look: IMO this is unrelated to the sysfs changes. We
definitely should change the debugfs output and rid it off the global
numbers but it shouldn't be part of this series. Also: are you using
this output in some way? Technically debugfs output is not stable ABI
so we can modify it without considering existing users but wanted to
run it by you to know if I'm going to break something for you.

Bart
