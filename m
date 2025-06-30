Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B296F243378
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290848; cv=none; b=g1slIFhJCeII/X7j65JGqHp8cAdKUQvOkt2UyYQMIxf7dyQEpqlPamxbPJJB4RmOvVLQt9q4b87vzROvo55iw561+lG5qPJqJs+HwrpZsjYl9GuEWCmGQNYQkffcvzv0QSTixMrpXFk0aw7kDeU43+InxTWZQQnCuZV/aGOiqZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290848; c=relaxed/simple;
	bh=Bdfby/u6bdjw0RZMd+EKW8id3ZusrWIUx6zentQhWOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eyhu1SqBhn9uAUTh7PtP7If+to7NBnOMwqin4k/slzs2Sg3QeKGG5oKmoTfsW5gCP/PS9+w8Su+QGsD6BZ5D2P6XOR65EVYF7/2f5KFLYskbbR9FOjTJ+dOqS9+Lqsl0bHcHrXuscH0y7zyb9GYX3BukuZUCNMsniJQW8iCJZTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pGpHUUDz; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pGpHUUDz"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b5931037eso35129861fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751290845; x=1751895645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGQ8OBPWWUH7qxoscwJADjTSfSsFBxaQr+m3BPxVcZw=;
        b=pGpHUUDzD7LnT9XgEpBZZ26XxK563dQwXS7+vka4cKxGQXj8tOiBwHL8jfKD6Whgh1
         bSENxq7JphDA6vQtg4X+yOApJmDyVXp/SvJX/bqJ3G9OPwWHtAry+il2AyvsqaqKe2f9
         oIecynWAHgU25Hc4xmJsv0KyGVSTMW+qb9qG4VjrKR6UPWPbvtwg7IlNDadG0k4cDgoB
         ZVF5N5GP3Nhg8HU+mDX2GX482zzEPPViCZ8Pm1U4G9stmg/HovOgfVyqRW5Q7mR78PM4
         t1PTp6DEv6hTGmp/lnKsCP6Jyx0KiyxfhLrPmKFDGAqy2a71r2seXs7MzW0mgb9tLVSS
         LOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751290845; x=1751895645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGQ8OBPWWUH7qxoscwJADjTSfSsFBxaQr+m3BPxVcZw=;
        b=pcoR0fPAarF8aZ7Xos1cUGntB65fYT+7CqHuAdinFU+s9sS6PwJw+CURd09QQcrwPh
         Fd7pItj2J2po/FC2Ny5Ybz+avlUbwW9J+Om7xCiepEq0cjFfMXKOxQwkq9qiBt6gzkB+
         yHNd/hPlqErI4Lp6njr4I7tr2j+826/zU7MGmVfPdQ01+iuHTGk3N0bf0gh9n46PIB+N
         rvFzSomjuF+gyW05WRlG10OFHXdgSnDHTDzUMetv1LJBswk90X3LQE/rVS+qNQ99J7uZ
         dly3UD01AOedLmoPozco006qQK8JlGu+DiQ2/GX1wXVupN/hXglTxESN7Rr0fQ9VCgQl
         axUw==
X-Forwarded-Encrypted: i=1; AJvYcCVmwahsBJYAxO/8mhE4KqvAvhLSOTtoAYHjr0dEX+E7qn1RPqlU6wITm4FFJx72stx4of9uK46TpOpn4cM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxjwdh0iZ3lJmPxU+W6ub3UcGGQySrgxoXXfhEPs3ZsbGjhEzS
	Hi0K/UA6U/EJfJ4KjdYIUeoHZjBm8+bSDvU32VwRO3QBuxjqjGqaFHsYN4L8sJMdvQGN4AtLOXr
	ckxg5WgcVJAKmO2QwEF4YPGdpqc+grpDEdmAUdgtU3w==
X-Gm-Gg: ASbGnct7iSchLlmbL5FoZef54TNB/rAQsI970yEBs7UGEAWBWaZ9NzcoAZZ1eywdnkI
	E+5CacLY35/SitdPRcCRB70WxrlPaUPwt4jAGIoX/ne3IZfmPPJit+jkYNUr+cIxD68DTDZj+/M
	mUJB48GFWrJWjofOaNDYVzevSjaB2q8X196IYRfriR7gjJed6+58Dt8CRT08LoWZ4a8LqplR/Rs
	SI=
X-Google-Smtp-Source: AGHT+IFEKA2SLJQpysUlJu4jsICuTZHFEG1exDwjVz3c70l0NRetqL6g79HhvHWrXy3zPDak/MnPe1KGqiN5+Hwazo0=
X-Received: by 2002:a05:6512:3f1d:b0:553:2ca4:39e6 with SMTP id
 2adb3069b0e04-5550ba4a95amr4553312e87.50.1751290844699; Mon, 30 Jun 2025
 06:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629095716.841-1-jszhang@kernel.org>
In-Reply-To: <20250629095716.841-1-jszhang@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 15:40:32 +0200
X-Gm-Features: Ac12FXzqcQQBva4ynxgyaDsPaC44ZITNmwXtVHMx7t4B-6L8ulDkLpq6h6Gehdo
Message-ID: <CAMRc=McPmYLhPrRnkZAQWHX+wF2PvYhDE5rD_Ws5ExSB2sGPXw@mail.gmail.com>
Subject: Re: [PATCH] regulator: sy8827n: make enable gpio NONEXCLUSIVE
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 12:14=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org>=
 wrote:
>
> On some platforms, the sy8827n enable gpio may also be used for other
> purpose, so make it NONEXCLUSIVE to support this case.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/regulator/sy8827n.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/sy8827n.c b/drivers/regulator/sy8827n.c
> index f11ff38b36c9..0b811514782f 100644
> --- a/drivers/regulator/sy8827n.c
> +++ b/drivers/regulator/sy8827n.c
> @@ -140,7 +140,8 @@ static int sy8827n_i2c_probe(struct i2c_client *clien=
t)
>                 return -EINVAL;
>         }
>
> -       di->en_gpio =3D devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_=
HIGH);
> +       di->en_gpio =3D devm_gpiod_get_optional(dev, "enable",
> +                       GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
>         if (IS_ERR(di->en_gpio))
>                 return PTR_ERR(di->en_gpio);
>
> --
> 2.49.0
>

As explained in the discussion about this flag: I hate this but I
haven't yet gotten around to proposing an alternative, so reluctantly:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
