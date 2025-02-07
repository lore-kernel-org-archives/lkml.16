Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCE12343B8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915324; cv=none; b=YXxNPKDCVZHEyaXghSTLcxLQ4BJ01sbe4mIIxusaK5dH08utoJcUawYrFmxqOvFtCtgOiWh2Bq1tdrPeh3ctlT06dTxkE8myM/1dVckGqdEZ24VVKG4q/Tbz9SBidPDAY0YwBxy0doHxYqTZTlgAAdukpCpSmDyYuIqgFD/4i9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915324; c=relaxed/simple;
	bh=wg7M3VeNI1uNtxFXFqf+8CE3L3YU9zZvMgM6VBEDA0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EspCPCHeEqw2r+mcQqTF8u95TVBTi914oOuAUadLSMTqH1o/9klYzxzUkb9A8SRAZXkk5RCgP/al6lC+435isD0KdOQNHDfstCJkkTsaAbVZvWW+Jt+HlasRyI9EKCbgmddBmqbXYPTSH1+DX2Zl23cPFFa0tFIfERh7HA6GnNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=anVkvNqm; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="anVkvNqm"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30613802a6bso19684041fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738915320; x=1739520120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOAWJb2vzX94RdNhQSlGKZAFYwRJCIBEJ11rOyxtNRE=;
        b=anVkvNqmZEbGItitdwZ4ezL5cz4QNRRfxhzyQnNEUPj/570Ipr8Aj6dsPjlNr7DOP7
         6RM1fCBAZ7Dig0Ub2EafXCIXhIqVRqhRQXuy46jKoSkXCURMzZnOQpmz4kWW7yr2vu9/
         AbdKlCpXjrGVi+HZhxed75Dl9SRBgF8+Qqt46S6l9OBxU1Xd98yTu3hRvnW8AfEAGb46
         O+H9a8n1vb4PzYmoyDMoWMxX7Fm/WMbFrGj0YKCBrB8L4WxbLBk4IzrUSu+12WyZ0M0H
         7XJAV2M9iOA41kMBhyMIXKuuJ9/zGv6Uyyw7to5YAC4yFmMLtM8quCxJxehLzSwE6E2j
         ceaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915320; x=1739520120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOAWJb2vzX94RdNhQSlGKZAFYwRJCIBEJ11rOyxtNRE=;
        b=f5OgzXJD0ajSzbRn2xQBip/1vWA+2yv8HH4JnO5ltKP1ha6Ucvk/ze5x+Xn/AweKVh
         cf2NEAxjIF65YaPOJd8Ti6N1TINxBzdovt5tPc0GQyT9b4zNVqxrR4janDHHi16M1GEP
         DguQzS2Ffq3HH047rZejwQQlJKDVa6RZ0pZWzZX5pbnxrxOcKyeCTxLFFwtVpYFFnrER
         SbYXQRROs7Gx5IjTGhA0uTdT+M24YY0VENahf96rM2F9TQfcbqPrt3+VuXygtPHvAS39
         vJduOO0nEjlhJ1cFh0HwH9nG5rPr3orop6zIuDYhdpmeJJZJq7ty4kcZYFJ6KLXHxXiW
         csMA==
X-Forwarded-Encrypted: i=1; AJvYcCUZPLVwkHhjV0hQgQ+s9fZqssqJLJDZmD76iXFRMNyRSeUkC5TadhKlP/fyG9+17RZDhVtpFBDt2kcBUP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YztwEJu0T5EXJ7+HGRuymnkVgxEXfYEeb5kEymEXxab0+kYDxpa
	Ili1c48KJu6I+Ilk+5MmqpskuD4195BUjSYDRAxxfhzEuWuZfe2E0W08PHemwcXNejiGMLrA8G4
	lP43kAnxr50bWygkfXcxy7azvL4ko9yfuRWNcww==
X-Gm-Gg: ASbGncuuMgZo/snUj57l7Bqv1YJ0Qee0Sts7HP12j1lAEcJJtxpGxt5y57w/w45MzGh
	nHnuP2Hs6tJ0JjE8LZlhF5CrwJF0aCOGrSDj3ej502avbiAKm0ftUfOGsVtT17+vGWr4qLJSb3P
	XFuQBEcB/tdqM/jVxd/sE2tDrKjOk=
X-Google-Smtp-Source: AGHT+IHQN7EW2uidYCyJgniKrSJh5CHau5RAsiJsPpkl9BjhCcmIHhiHYrNsdO0/XG5n25F3cY+ULx/9H3owm0JpQmU=
X-Received: by 2002:a2e:a913:0:b0:307:ce2b:ed82 with SMTP id
 38308e7fff4ca-307e580c8c2mr6906271fa.22.1738915319619; Fri, 07 Feb 2025
 00:01:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com> <20250203121843.3183991-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250203121843.3183991-2-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 09:01:48 +0100
X-Gm-Features: AWEUYZnnHn0Y93j7DoyQ91s-D8BeYKbpj-YuZV6sgQZrLbjP87O4U1rJxsSUKdE
Message-ID: <CAMRc=Mc+obxRPpMWNmSk5Tab6NmwM4gSzoHE8JtFf=k+u23QSA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] gpio: 74x164: Remove unneeded dependency to OF_GPIO
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 1:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Remove unneeded dependency to OF_GPIO which driver does not use.
>
> Fixes: 3c7469514dbe ("gpio: 74x164: Make use of device properties")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index add5ad29a673..56c1f30ac195 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1790,7 +1790,6 @@ menu "SPI GPIO expanders"
>
>  config GPIO_74X164
>         tristate "74x164 serial-in/parallel-out 8-bits shift register"
> -       depends on OF_GPIO
>         help
>           Driver for 74x164 compatible serial-in/parallel-out 8-outputs
>           shift registers. This driver can be used to provide access
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>

Geert: Just Cc'ing you here because you yelled at me last time I
removed all dependencies. This driver is under the SPI section so it
does have the CONFIG_SPI_MASTER dependency. I think it's fine to drop
OF_GPIO here but I just wanted to run it by you.

Bart
