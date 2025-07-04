Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404EE2BDC13
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617633; cv=none; b=FeLT9/3g0G5lsxVDDQkGKJwVzdhaPIT+pqiBcDOESSdwka28Yqiut0q3ea9w5/nhAn6YORfy0wpc1my/Vao6snVcXvDIxrOo/rtI8rITERq0/ZA9ZgvI9rVBpHlACojmG1YbgHjG7ofsuztLZcv5UCuLL8kRWXDs21/TCk+xeA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617633; c=relaxed/simple;
	bh=KyQG4/PtXk1I0N8JEou8JyB93SVP5PTQ2ACI4AMtZdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8eYijMnZ9RB5mxgOdKYMSC/QLoieIR0Rth7VFrFYNWU0+kXSvtk59sepUObrwrlUMGs94ECTAxqCs2yhsndVNPoVa4cpQMdEbnFVLLIHcbFx+5SbCqfWF0H7nVdNX3ECMG1/oeyQipy9QEaZD5G2bS8MRfClmPcZqWk3jVsasU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nznebFvT; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nznebFvT"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b595891d2so5658761fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751617630; x=1752222430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MAVLF41QmphRvqRBx4yeoftDy/YqQapTAiNPyaFzl8=;
        b=nznebFvTA22RTOMZvHFZzsd7rNJKGAKZIFJb0n2qrjV34Xjzn2Tjtq4LMWqtwv6pfI
         BBvozIQhxce9sKDdqvPLkgI437YypMrKbYxUaPhDCGyMxyaewXZVUdcd8tbZAzqkaZKI
         C9MpDcFi3eHy2Np0yeeHIjt6tAMfMlxLWtZBX+W5Tb9oUME6YalO8Cl+2UyszUMSIiFw
         wRZZX1r9aE1yQWHR402+iA8SWD/D9AQbVL+0YKmjFPRuBFYuFcWIwQbNqQquci+gAqTX
         Vt8+sKkvotYx0QXeIr8Os86DxhRQQcIQ7q9sUkE9LOijaViykqUJQdUVoVvu9kUIGP0F
         dlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617630; x=1752222430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MAVLF41QmphRvqRBx4yeoftDy/YqQapTAiNPyaFzl8=;
        b=PFiOQFWDRlEkbnHYGg8zaZLB9YjAKS2MHHFTiGq55FjrywRTyBlWxZEXfpB76uq9wb
         NFiHP7ZHKuXNH9DGA+dcAgA+oyYJIFBlGKxqztDceWkx3DnlmxTEEmwJm2FTbOsXnMal
         ZYNc7UT8iCVtzvtkq+XT4OFg6HmJFyJ4dA6ZaDNJD0+CAcEUi+cDdHs1J+tBEh2SJJ0C
         2xl0UAC8MnLDAAMRO7QcchwHNgdj9DCdFBDILCogVHFq/15tNBW464evmyQwvnQ705st
         orDV/OdsnXOJEydwRi8z+kkUqEaLF+ai7swLFS4wlGzHZO96+Iku1HFLdL19gpkFxE4f
         FQvA==
X-Forwarded-Encrypted: i=1; AJvYcCW5Ize+OOW6ztNIYImy36SafAfYur55HJ2uvHLbLI1ZlCfTwu20ADOlvjRHA/N9Y7n86XgSXu8P+DGPhIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLHqq2ueFqfCl2kKEFgoQkHErbtUWAgV79JjtjdXPDYGEtewoG
	jfqmEpPE5x4F6Ohxnzif+du7KJIOh+2WR25vCLiRGXm3+GcHIEkUJMBWK8J28iO7oPY8VrUKq61
	MFWFVieh84NzWbI2FquY457GXkdrdKrzOBF4iTGu7PQ==
X-Gm-Gg: ASbGnctOhqGbE8E/2X5S3fxgwuzpvdp/aoK9IX5/NP5K+QLJ98kr+8gFBzaQxGRfnVC
	3Bog6jMDgCy0lNbMy0D3EH1RMrfZmPU3o+rEmYG5BR/fnYpnWYmrEC7Gp6k2OOw+qwj7nMOSMmX
	B1UBFrVjm8BHv/eRh/JC3jfjKIh3nq9e8UGLAh89fJJI26TgzY+yqp20MCPTjNaZHxLoGUoSLSJ
	g==
X-Google-Smtp-Source: AGHT+IFs9a89t3WB+Sx+Cdpp8ljm2QeBOISKgp49Ml1f7/SqzSNJCWirzIGOCGoUWJUDcONIPDY/mAc44F8rbBRpRLE=
X-Received: by 2002:a2e:8a84:0:b0:32b:50c5:2593 with SMTP id
 38308e7fff4ca-32e5f59c739mr2995621fa.18.1751617630354; Fri, 04 Jul 2025
 01:27:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703191829.2952986-1-hugo@hugovil.com>
In-Reply-To: <20250703191829.2952986-1-hugo@hugovil.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 4 Jul 2025 10:26:58 +0200
X-Gm-Features: Ac12FXyuss_6x_4e0DROEyXhPHF7MGwZ75tlcuNi7uvqnc0xqRBj_OAhsSL1laQ
Message-ID: <CAMRc=MdP5BMVF0p5W9qSRZuPKBa0YCTxB-gLQWT_r0hBp+8ksA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix efficiency regression when using gpio_chip_get_multiple()
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	stable@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 9:18=E2=80=AFPM Hugo Villeneuve <hugo@hugovil.com> w=
rote:
>
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>
> commit 74abd086d2ee ("gpiolib: sanitize the return value of
> gpio_chip::get_multiple()") altered the value returned by
> gc->get_multiple() in case it is positive (> 0), but failed to
> return for other cases (<=3D 0).
>
> This may result in the "if (gc->get)" block being executed and thus
> negates the performance gain that is normally obtained by using
> gc->get_multiple().
>
> Fix by returning the result of gc->get_multiple() if it is <=3D 0.
>
> Also move the "ret" variable to the scope where it is used, which as an
> added bonus fixes an indentation error introduced by the aforementioned
> commit.

Thanks, I queued it for fixes. I typically keep local variables at the
top of the function (just a personal readability preference) but since
this function already has scope-local variables, let's do it. What is
the indentation error you're mentioning exactly?

Bart

>
> Fixes: 74abd086d2ee ("gpiolib: sanitize the return value of gpio_chip::ge=
t_multiple()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  drivers/gpio/gpiolib.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index fdafa0df1b43..3a3eca5b4c40 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -3297,14 +3297,15 @@ static int gpiod_get_raw_value_commit(const struc=
t gpio_desc *desc)
>  static int gpio_chip_get_multiple(struct gpio_chip *gc,
>                                   unsigned long *mask, unsigned long *bit=
s)
>  {
> -       int ret;
> -
>         lockdep_assert_held(&gc->gpiodev->srcu);
>
>         if (gc->get_multiple) {
> +               int ret;
> +
>                 ret =3D gc->get_multiple(gc, mask, bits);
>                 if (ret > 0)
>                         return -EBADE;
> +               return ret;
>         }
>
>         if (gc->get) {
>
> base-commit: b4911fb0b060899e4eebca0151eb56deb86921ec
> --
> 2.39.5
>
