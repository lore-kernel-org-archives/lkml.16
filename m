Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7620458A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840617; cv=none; b=XP/THEydo8CpoRVTaHvRMsdq9QGoIcE2DqCbi5DZSiaW1oaYY7/GpklZxv0xVuclKig7oJJpXj8sDgkrxS9UjfPthT+p3BheXiuedbdWrpPmUoLH2hqGowFOjlsOxOvIXJDoj/K6XZo/pMP2gRIzFjCcpGF2JYaiwnZ9yOW36Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840617; c=relaxed/simple;
	bh=N7WIWDwBiFPBHG6RtziOKsfaaUWsA49kMC7wZCjMKe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+bhob7nzjtVYB3OYPmzviSce2PiR0+YiwSmIK7dPVbgS8t/Tk5kQPK29X30ESIT2iDYIYftg4bxrwpHClGMfszAvz/iG5k9UPYDGTFRogL6Hx3ahwJNpQzitwpkGJo2qQ/Xp4WA/TmuXVJd6tVFSXfEjTdJKgep1w9CKon7Aeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=O9XK9Xvm; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O9XK9Xvm"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso40010101fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745840613; x=1746445413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX/tC8coeF6pt/Nd0vQ2pLOJWZbhUUNTjjg2AdFwINU=;
        b=O9XK9XvmuRofTbQRIwS9OOX/K+Iz2cRiedvAQGwffCwGvuQQJ6aI2EKnMj8IfJvqrf
         g0uztvsm2trOG4QqvbZrM3yWKuQNdcX9fW39rX5uN4DXrCfJb1D4PEAlAIC3650cXccM
         fZcYDqMTpCwDv2LlV5NzIPwbCfE5vrb/UFPfodFsF8B83OP/hskd1Ly72eAHHPhT22x/
         ilgqAyetGgM4Xl9y5L1BzcPCHx1VXHGX32ZK5+MJMW7TG3ohj5amztf3/hxTuCbqgACk
         pqrERuQg+gG0zUoIOwNXizSyjE2IAJLL/KaeciGd7fC/PmHYuTacSr9Uam/CXhVtY3c6
         7kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840613; x=1746445413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX/tC8coeF6pt/Nd0vQ2pLOJWZbhUUNTjjg2AdFwINU=;
        b=sMU87bHl/vQBTqVHHCgUVShS2ddh9sM0qGhlbr38OUsKZL2qCkHZMnRpuLFpv3JX9P
         vNP+wrbMMTjNY0wYStS9izdNy7V/oTdmI9lbM8+K0b1o9pJBCiW1o3lM0+At3VuXW3GI
         7JFEPjPMmuZgm4++8Kaq1gyrAwVQfM80Vjj6FlCZpD3BYSNA2EnI09cvc44YmbYVABZu
         EPHbfWG/sa6YhtWLncx0WgME3KJxllF1SyPkDuDXciljbg5ggDkrxMvl1yh+qpleyVcm
         iphC/KLzvBlr3wUjsp9UsxF7mF31cNNzCxeYyuzT5xZbzf6idkzQwfhIcQGmHImrB8cq
         9tOg==
X-Forwarded-Encrypted: i=1; AJvYcCWAyW4tlvvl5CaeWUEp9JR06zRk2ukOMaBnUNj+nd+FyP7BKs0+kbyN2Rhj6ERW61ISDRwTbJP4ttlWDS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBCh6rrR7/KoR/o30XZYK0LsjpDwtoJK5sI1yw510uZYpoDaiA
	aYG5yhEh3DcDJ0SIDJHlQUpTmRBFsW6KByjU/FwcsiNqrkRLF7sC3Cz90VkzcTTcxeOmBUR0tuK
	OXRZzRzfIsJ6TJ0n1jJDzrd+FX/P6bAhvLHglzw==
X-Gm-Gg: ASbGncu6huN4G1wnCKUBuTfR557lVg6vj/KfSyyViq9sc7exGT6VDGGHWzmBdAVWqSQ
	3TzkkvPIC+f6HJ4uy1ImJ/abpA6KLiWyM8GCRPknlaHYIipMXpts3uridQ4B1RTtt4Hm4m2qN1r
	nlFduRY+ZYe2S8kvHnV90bNoXyOZr18ClC+Pa462EOJz2wX//FAQhOHQ==
X-Google-Smtp-Source: AGHT+IEX8jJV7HnhVW7+fghG4q9+ghyZY/XzjHuCql+UIJeBm8TXPQiK12eFFODxXmy05fbna2r7j5iNKaow+pXqX44=
X-Received: by 2002:a05:651c:158b:b0:30b:ca48:1089 with SMTP id
 38308e7fff4ca-319dba4f9d9mr29996981fa.2.1745840613339; Mon, 28 Apr 2025
 04:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org> <20250428-max77759-mfd-v7-5-edfe40c16fe8@linaro.org>
In-Reply-To: <20250428-max77759-mfd-v7-5-edfe40c16fe8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 28 Apr 2025 13:43:22 +0200
X-Gm-Features: ATxdqUFCxRnO3E7xcEweLG1JpD07L7-5rWx-FRd1gKrBNZ7uwi1zJAM7VnHWVBE
Message-ID: <CAMRc=MdDH7UPkhjBKr6hO-j2J158_u4Mp=++hjh=V0OtoJHX1g@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 1:36=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
>
> This driver supports the GPIO functions using the platform device
> registered by the core MFD driver.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

[snip]

> +
> +       chip->gc.names =3D max77759_gpio_line_names;
> +       chip->gc.ngpio =3D MAX77759_N_GPIOS;
> +       chip->gc.get_direction =3D max77759_gpio_get_direction;
> +       chip->gc.direction_input =3D max77759_gpio_direction_input;
> +       chip->gc.direction_output =3D max77759_gpio_direction_output;
> +       chip->gc.get =3D max77759_gpio_get_value;
> +       chip->gc.set =3D max77759_gpio_set_value;

Please use the set_rv variant now, the old set is deprecated. Until
that's changed, my Ack is revoked.

Bartosz
