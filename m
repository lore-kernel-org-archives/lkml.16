Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82F23ED63
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630479; cv=none; b=ogInRf0A+XZE70TOjSeW6brYNOV7YcKCckVe2vbHgwuZ8EOtmF5g5JT+omgXd3A3ZutFy93aKkAatFYynZCb9SpgwmVftj/oIfS0xfxVBsqzFSBQRSaeErooKqPSk6l4RPjMw8JZgwPz0sCO1h07bLCfuy7QdhqvPRbrvowHbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630479; c=relaxed/simple;
	bh=BD9LHPkDVStugrsPWLu1TAtW7O6vEYf/8WnFBw7eLDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sf+UQAd8+smCJ2Jvifm0G27HOQohnrQoLLYwkWN5gPGvMSH82wXPkUW9vMtRRqghbUAvXn4kWLzx0aH+AbkuvqWxiBPbO54t6oSeh7Bp+wwEumGyvkcfAlhzbj9mfRXRA7+KLV1Y5mecAcKjcriiLyTdZTs4bsuDkvqH3JLcXq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3EkL1p6; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3EkL1p6"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55351af2fc6so7672417e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749630475; x=1750235275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLi4O+ULvnfNtNg6xLD2oflA5RXAT9+xlh/160huRoE=;
        b=A3EkL1p6CmMB5cplUEGzq906ZyukjpOSbUy3rUp6+CqDhHzCjm1a0DIq1sJ6t25lDG
         C1/z82enN+BbxGVDv6FnsUzOMsZZIgxiDqc2NmcauciibMEMFwAs58op5HMCOIDzYc6U
         X7jK9kVxx1LyHCgxqoccNIUgvdjVw04DyN1DLIfaCdDKWzhpN7Tzm6nrIVlrQPvAiryh
         9LyxTBRA17PkGmlLVfr28/eGSb1RoLQPxKHI+BIXCzXhy3yUUmn+GDQGRROso+yjTqCZ
         fWJlRegAG/fzrLfppm1TeyzsXyP0Fx0GzOIw9TCw7YzJUgOWst1PsZl1m50PNOdZ14+4
         iBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630475; x=1750235275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLi4O+ULvnfNtNg6xLD2oflA5RXAT9+xlh/160huRoE=;
        b=Xkfuqp/4+pe4U5HK+7GZ1KEc/yr8nZPU6MJ5xPfWj+t2Z08xnuYZb0ycD3LdsjlUCk
         DHuaWcPwVexa++mfxSPcE3auITVRDxI+XK/KiuLKNy5HjYZI6QlElTXVHWS7V4Bf2Vrl
         9uKaN5gxRvTd3CzpzIvPDX8gGT+vKxByg9t97zO6XaYDSZFO00KrZXxxXJpLDsEbkNmV
         3O7V8jzLLqeHDe+HKBkKt01wG4y3ez/5xgrg45F79HUbj43Pb8HsvQYGkNa25eHYHZk7
         kc2qyR6EOCIBNsme4KC67sJ2UPVvzV9Bhlii10f3IiFEie5u+QK2UCE1v8uKKtE+Nr2V
         X8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUOBaM9hPSk7rakdDZm5ngW/AnE0MemxKhxVZAhQ0LrCJJQV0AfPUJD7UXi7L1wAy9UhuS29MZuXQhudXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB+XXGZ7V50/zc3qVkeLEa8n1p45fhi8LchEY3p46cbZ6yPJWV
	O3smgcYzg/dM2Bpj/YByUs6Nw/P0mCDT9Z8WxAVUoii2rUPfVN7bagPWN7aTIr8X5iZRPoxSY6w
	SPeGVd8LizINT+TyNoChoeGFTPGeUPP670dJXNQefKg==
X-Gm-Gg: ASbGncur+ywY4WCP6YP2pbcx+Fn7EQi3kDNaLEaUs4Gr18WT9SlqriQc2VcGQ5ByV4j
	mWSEBztMhVpgX7/HaIfmBTvystUUKreOmP3rlEPLbltC5jbA7t5DB47QHfrg7B1PsP29DHIJgWK
	h/fIvpHO+vRt6b/LXxpjmlJG1L/ONEOw46EL0dGg1FOrE=
X-Google-Smtp-Source: AGHT+IGVZtOP8nKK2uYkpXDsoOHkEA3isqGOHWU2CiAMMjjrEpXLEP/80KjCyKC1JkPTolJziM77YfGezg1MoCsfb8M=
X-Received: by 2002:ac2:4c4f:0:b0:553:659c:53fa with SMTP id
 2adb3069b0e04-5539d4be3f5mr521706e87.5.1749630474846; Wed, 11 Jun 2025
 01:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-7-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-7-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:27:43 +0200
X-Gm-Features: AX0GCFvGsgMfVLX0X7q5zsPx9ZinW-WrALwB7s-SxhW2sNmB_lJFCYUU2-ulULY
Message-ID: <CACRpkdZ0W10E7UX7KDnej0SX_Jtuo8r1xSTJsGmXDrDYwArO7Q@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 07/15] gpio: sysfs: add a parallel class device
 for each GPIO chip using device IDs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> In order to enable moving away from the global GPIO numberspace-based
> exporting of lines over sysfs: add a parallel, per-chip entry under
> /sys/class/gpio/ for every registered GPIO chip, denoted by device ID
> in the file name and not its base GPIO number.
>
> Compared to the existing chip group: it does not contain the "base"
> attribute as the goal of this change is to not refer to GPIOs by their
> global number from user-space anymore. It also contains its own,
> per-chip export/unexport attribute pair which allow to export lines by
> their hardware offset within the chip.
>
> Caveat #1: the new device cannot be a link to (or be linked to by) the
> existing "gpiochip<BASE>" entry as we cannot create links in
> /sys/class/xyz/.
>
> Caveat #2: the new entry cannot be named "gpiochipX" as it could
> conflict with devices whose base is statically defined to a low number.
> Let's go with "chipX" instead.

That's unfortunate but it's good to separate them, and
gpio/gpiochip is a bit tautological so this is a better sysfs name
anyway.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

> +       /chipX ... for each gpiochip; #X is the gpio device ID
> +           /export ... asks the kernel to export a GPIO at HW offset X t=
o userspace
> +           /unexport ... to return a GPIO at HW offset X to the kernel
> +           /label ... (r/o) descriptive, not necessarily unique

Not necessarily *globally* unique, I think it's required to be unique
per-gpiochip right? Otherwise it will be hard to create these files.

> +           /ngpio ... (r/o) number of GPIOs exposed by the chip

I like this approach, it's a good compromise between different
desires of the sysfs ABI.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
