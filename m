Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6D8205E25
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083554; cv=none; b=VdBsR1gOYhm7Zhq9Wqd/+8Z30ChrQk4Y6llgzTWxSbKs9lbeK1vv7/EA12jedsj1Xs5YARNPseEZzNmqp+mu0+1Sjc3THjAh4OsHsSQCX91AFuqaGhGe20T9/Vdwj7GUIysOMxxPcKsMXek2W4AxKn4d4uEUKV3zVzq6d2YGtHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083554; c=relaxed/simple;
	bh=b96m7kxZHTBACeameOSZpw+VySdqhzZqCch4/6wPATY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+ubSbX3cFgebJ0qTAJTI+t3DBhv2PXODQh8P/i4lZVsjgM2paZzf+b76mo2D5FpYcNygy/UX6mAQoZ/DhPEoLSmwjkHIgkzcwgOkVTr/nEW7r2vboPFmksX46wwwIVdravijE7j2coaLksFPjwDdiSy+OieUUZ7ql9G+vnSxEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nVtO5PVw; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nVtO5PVw"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32aabfd3813so39385101fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750083549; x=1750688349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjlCKhc+nJk2NX1o1aydG/u9MSs+dWUFPeMh7cFAnJ8=;
        b=nVtO5PVwA3e0WjYNx49KJmQQltey1Yse+HI5mPnXm2tyPxV/XSibC3ZX6OOTXgRkCF
         W/RPXHKQkR746NwtW4x6mq/3I9osV7CjC325JcjVuyxWqzvLiHnCfIDKTTbPI/A8/ico
         qjmfgOQyLyVmzmM86Tb8ShFmknNak9VSAhHMXHFOSjOt8YP9sBxR93IFBeJyZYaEEi6F
         F6JBsq/QpeCqT6p4zUkpFDBbUhkUozh6bRMC19V2Z6ojhBEIQKHTW5vvloFyUTbnDQZ4
         Q+7+vgEazEfhiIyB49Zqll/Z81Yiyn9tyKoJUahrvQjyYZilbvMIuwq39FvS0TZ5mx8D
         SnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083549; x=1750688349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjlCKhc+nJk2NX1o1aydG/u9MSs+dWUFPeMh7cFAnJ8=;
        b=TDxBKS+Iuakh5Aves3qP5f9+Y924EHYkDVsDrd9NN0bt+kogcXUTyEWPBW+l8YXIXs
         wPwqYx8PIEy+c5SkXJLvC+CvfN0R+8IbQtrtMlr+3xQvMNYNNjtYczHYBjFGk7HokjDs
         V1wd1r1fLCJDYMfNe3GQmoK/xQM1E64uva/68DzP6LLY4iknINpS5pVWVKqrZYs6frRa
         qYmCMDCbzkqk3R7ubHItefehEGRn0rwCHD5Lhi9IHcok49x/RxLOFSZ5U8ojnzkVvzBH
         a9LTBP0sJJV+IyKMOn3BItOZqhpkPmtm1DAxKKnTQ8AW/d3hO+41IQqlGV5e47+1zMaj
         twKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDa0WqbjhtJ7G5tuyGb3ODnhPuDKRil+Uc3ISScGue30oVKwt/JCrxc32UZHVM+P5OFjx4e4Cz+o6IMGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHFXGdZ15q05yBxGIepuf4Jq6C4qSEruRVn3K7qqdPJcIypbXK
	N+4b/tbQTapR7d7TqK+6X6YvOIg2a+ltHHfJyIKn7Cp1xohe8O5v8u2xwSeG07m//zcWDA8cdJE
	404oBXTYBc6K7bZ7ullhXTJcyvWA+SM/bELp+jhZg4w==
X-Gm-Gg: ASbGncvockZAH7oeO+bJ1uwUoAqRIqyZld9ZMFWBsMTU1KwO9o0FFEgT3sEjsNbK8H3
	X4rfz/dFnOOwyRTi1wCE+ETwjLe5RPm2pnHrK8x82SjntaCsIIBNv3EcUz+U9vJV1ED8cqrCH2N
	mrSAszp1cK5M4BYeS1WjfOr4yyb7O2hH00+FfgupMUwipT0sx83w/uHayMMzOl+RUMG6c7Fq9J6
	hA=
X-Google-Smtp-Source: AGHT+IFhsJRNxrHop6DXKfCyU43YwbpjtsLT/Bcmo5G5HBLftVCHvVtNynD1qZ5BZd4IXfCUTatu5SORN9Z1hHQxrT0=
X-Received: by 2002:a05:6512:138c:b0:553:399d:58eb with SMTP id
 2adb3069b0e04-553b6ee2be3mr2564365e87.24.1750083549546; Mon, 16 Jun 2025
 07:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616134503.1201138-1-s.hauer@pengutronix.de>
In-Reply-To: <20250616134503.1201138-1-s.hauer@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 16:18:58 +0200
X-Gm-Features: AX0GCFs6KLo4fiC3VTNOPFqqONBs_YX3mUg6gQ5D174dhTdgyY6-2YDANOkq7Q0
Message-ID: <CAMRc=MdEN_xTm=LDkh7Hi08UnaEsVZT7B41WKf1XALxXBLvQBw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: fix wrong error probe return value
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 3:45=E2=80=AFPM Sascha Hauer <s.hauer@pengutronix.d=
e> wrote:
>
> The second argument to dev_err_probe() is the error value. Pass the
> return value of devm_request_threaded_irq() there instead of the irq
> number.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/gpio/gpio-pca953x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index b852e49976294..e80a96f397885 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -974,7 +974,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chi=
p, int irq_base)
>                                         IRQF_ONESHOT | IRQF_SHARED, dev_n=
ame(dev),
>                                         chip);
>         if (ret)
> -               return dev_err_probe(dev, client->irq, "failed to request=
 irq\n");
> +               return dev_err_probe(dev, ret, "failed to request irq\n")=
;
>
>         return 0;
>  }
> --
> 2.39.5
>

Please add a Fixes tag, you don't have to resend, just post it as a reply.

Bart
