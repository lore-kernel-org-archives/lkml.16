Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091C121B9D6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629788; cv=none; b=p9bCcsWe0JSs8Wp2Hb/QKZgarG2J2HViYNwOrBeDnEDToQC5Yikf5lPORzc3OzZxvNb72McdgOcgMB1bsCuqyicBDDYnpVidqXckuAsx9CuOe6SpvjBsZHl0rKkCCyS8TGBrrBJXmbEZXRZNcuE0YfXRVMOkJiKf5g/49XgE9n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629788; c=relaxed/simple;
	bh=+edy7qtTEHG7Xpsy7/yvwDq9/uQxNLsTOhXcpVrSwkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2cJpecL0hFVFddwNStQwKWfky2xKFa8RDb8nvvXe9knSjLz/FeaVyDGNEwuzB3n/GI8uDRtU/9H5IPIWUnbA9thv80TGGeXaG7pddt03irNw+ibnW7V/bdmn5YNPeFPKQ+IhEorDIijNp17JpprVj1gwhdZqJIBpg9QQYqPFoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KWZ82OQG; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KWZ82OQG"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3105ef2a071so66685671fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749629785; x=1750234585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+edy7qtTEHG7Xpsy7/yvwDq9/uQxNLsTOhXcpVrSwkc=;
        b=KWZ82OQGOYXUpE13AsGbNPyj274UEdKczArgUuRf7/p3129a78YDTJ1qL7zFc0aP+X
         Le2bXf7Sm7okyLQQIa8Q4WOyHMec/ppFRLHadwkw2GPNmrc9bLdqe2pSE9vFSkWV/m4+
         dKn4MAnoT8MzCx0CDO50gbAq9bCLxkvFEw3YpEfX5YMCwzQx+CiR1BjnBODd3RH3B0hm
         Vbwgq/HYGUwg3H7dlqB7Zu9aovHkYtUGdy1G9lqx2/DRetWClrlMudGDhoeR5F2C0P/o
         FfA0QI+iB0EgR0LwMTyDiVAPhIakrTdKDLXPXkTtcz+YgHw/bDzdasz9Th6rGqFZNl21
         GseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629785; x=1750234585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+edy7qtTEHG7Xpsy7/yvwDq9/uQxNLsTOhXcpVrSwkc=;
        b=NVn66idfpX1L3SP11UJ6LlylsKoqh47xwYvCH3sC41wjy32rBfQiCChtDyG36mcfZ3
         ZPLrDo8uy2oT+pe4Fv+ZwF3sGON5aOtoq+YAXeqbsJBPP/++NJ5XL+RT1YiH96nRhoYl
         TIfTIGeZeCzSPlLeS3okEXmitERWgT+dBW7CHtF4zD5u0XKROmRk/+gZqh62v+SFi16f
         1giubB5GqaKhmgvDgHbD0Wp5yl5VBZ/DAm0oCAhkXBIF/HtMiUQulToZNdKUuR/KKCd0
         4rjFjMRg9zznuVc4EYs0PKA0J/VUHLTKccwcnzaEy6GAhI90qwne1bissb36YS+RWuqr
         D5CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLG16trkad9w16pd2JFBXR+J+Vya/EsqjPfC5gmpxIn+uf6Lj9Ub/zuC3Ew90rJg5etOoVN/S+YZ7eEcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+2xJ+goUBRaLlgexYVO/i2Cvux1m/8ytCIM5rdDJgQ43l0P4G
	d+HiX8aNFx4W0DdNmhXekdy32lNoyykb20bcwcmQLn6hDBrn9ZTXmHD5Ew9ycjmxd2TzCySwL4J
	7DBH6N3ZWwEjvkprw/xTSwnrGj+K6+IQO5ZBanHXnKw==
X-Gm-Gg: ASbGncsDc4A8Ea3h/CgiMdOJKL7dbFBDyYjbPrsuSUgLqFONS9GinOMH2KF2oSczXi3
	Qp6G2I3oZZTnyHQH2kj763/DIuu4hUNzjvlIymcGhVCUn4cfQwaUCWBA256LivpBHQe2oBSRVpC
	/IfEsGY6LGK2lDxKA4s2+avDzlE7AP5VvPW6tpeDUi3Wk=
X-Google-Smtp-Source: AGHT+IHH1hH6JchkbIAW/Na/IOT2Q+HO0uX/zRCZwBszAKd46SD8mCleQoRNeDZFhr9ICFVN3eRLzunR4Iu+iOrppWI=
X-Received: by 2002:a2e:a781:0:b0:32a:7e4c:e925 with SMTP id
 38308e7fff4ca-32b223d1f3fmr5281631fa.21.1749629785160; Wed, 11 Jun 2025
 01:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-3-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-3-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:16:14 +0200
X-Gm-Features: AX0GCFsmra0zAZkpI3W6daJ90z0p2NXXoO5pFUNGj8TbbcP_336w78jjco6DTwo
Message-ID: <CACRpkdZnwA+tEuthZXKaDPobOMCM5K_SJFZHfhErcO6uRoV0+w@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 03/15] gpio: sysfs: call mutex_destroy() in gpiod_unexport()
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
> While not critical, it's useful to have the corresponding call to
> mutex_destroy() whenever we use mutex_init(). Add the call right before
> kfreeing the GPIO data.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
