Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A776D20B804
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371526; cv=none; b=opYHqpfM+h5fLxSFaWC68Hj93SuSi+JEaugJPgsqmo4vDhrtoP0UwkUSCS6v9dBIYplBYM2ZpRTrrlvLQfWeRiZwvXhl969A9DUBUbvC8o/T+iUaA4IzXZcLaKdwIEKpDlrhaIoLxjLR2fkwqpBAn9D59K5T3iqCb2SY3I/qU5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371526; c=relaxed/simple;
	bh=odkZFZUi0f71HBPvN8uYjy7mYt551ylhud30ueDx3R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1Q1xpC07fg9ngzqQA1rjqSA4/Rgx79J5+Wsw3oY6MqBhVL0qP19Xq4a7fGcgxTStvj7zSg+nw34DfSY8P0XmVP031sag/4tKUuG0roSG71uGptqbz1YFUAA1m2r3H3kF2QZNfYhggaDo8dU+aME6kCfHfL7WBbgdgV3RdV2sJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3gU2NpFK; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3gU2NpFK"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30de488cf81so17533121fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744371520; x=1744976320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dh8vYDsog/Ci3+DrgXMQu6sX2O8M8O9Wafm3pVbf48=;
        b=3gU2NpFKoBHjKBeoK2isTG4PGs1TxydkmO6Q7r3d0i4xZ23tf+PMwiGRAN0xFGiGr6
         4vSuHNE+YhHv0Mhr6JtTTtI4M/8FzXi3fWqtx5OP8VqA0IUzJYx1UME3xEvZRF/Eh1ey
         uU2lfyl5GKDXgn7fCgyWCn37wMvG6y90Lyf8AMUvb+dQ6jJWEDsrnyycy5YrNutG0xoP
         rBwI0bsfgM4ifxUXwP/OTRqxHzw4o2QEG1bJPq1vvgmBS6fFX2e4IUMfchh8SBQp1FnW
         FMbFLyWKbuKoF1BbawgybKzxdIxZHuASTGrasoznUwfq/ahWlnR4pXXXXgi49+z2aYsE
         xjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744371520; x=1744976320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dh8vYDsog/Ci3+DrgXMQu6sX2O8M8O9Wafm3pVbf48=;
        b=Zy11HSl1uEAlqnBL0fFT/0u/AbNZLAcosdx+y5VYxCFWzOw69iqTvtI5fYYn3SaUvT
         OgQaf3Yf4rQMHYmPtY9522xSbA3NiEzf39gRKydUjjTBX4LgpFLCbsLcb/4Fv08hoXx2
         CWHLfl9Hyv+lqEMd1MN7esURb1nDoa9UOwm3A6VwSZy+iC5B2dqfwbyHYhqa6IfNoUeR
         OYsXcePq8UVQJeK9XxlffFyP9MzzYBKusZPPem2eZtUUgc5z8qQ4BuD0XD/U/RidXu1k
         gXWsnFHBQEJEAzOD+rWG/AMVjWV+9/8NRXokXhg8OvM7FAsfaB9pLCP+9mJfft6Eb971
         6WUg==
X-Forwarded-Encrypted: i=1; AJvYcCVAxWvoVbJ4EUtPWBnvbdJqfOg0PCkZcL6tUQE7wZ/Iv4RlZ7X/v8gLKP9ak02xt2tvjkdLo1Y91c5cQTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZq4c9xfnR0yyVi6wse5bjm5LkJje4EQfghW/Uo6+KwL+TtQzC
	izyGaEfjuCGhw+yfTe62jD+jCuo6hnX4S64LylCYUJMMJKTx6SCxqKVjZguoarHUqhcMRALrSHt
	aZVhdSGb7/dq/m8jKjDCabpIFlnL/CaM2DtQcdw==
X-Gm-Gg: ASbGncsgOb7zAcMFx1BFDc+TMxUhjG8WD2LGsfxk6GE3cS2LtZa1/q6P0apdeZ//f6m
	aC+MpUM9vuT/np1TNbP0t3E+WS7JZmWOvqggE6cXGAIC4gorps0w+6H2CGPPwor/8rkQPX6l6d9
	TpD/I3lzp+YJ6m5QzIdaB3jnEodhK57jzCNT4akjh71DQg0ODVJb51fflV
X-Google-Smtp-Source: AGHT+IFFm00GPIYdXZ4l3vc4zErYQVOB90f/c77ivhuoRRZN68YVc/a2XaGhO2gIGxfB93Qso8/XMsIqT+2Mct+UlFg=
X-Received: by 2002:a2e:bea2:0:b0:30b:9813:b011 with SMTP id
 38308e7fff4ca-31049a7e684mr8679781fa.28.1744371519491; Fri, 11 Apr 2025
 04:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-mdb-gpiolib-setters-fix-v1-1-dea302ab7440@bootlin.com>
In-Reply-To: <20250411-mdb-gpiolib-setters-fix-v1-1-dea302ab7440@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Apr 2025 13:38:26 +0200
X-Gm-Features: ATxdqUHeXHWBZ4MIFvMYwmaS8Gr1mIm67O6dg2SJ8aNNGnkJhnRQNVQbFwlbeI4
Message-ID: <CAMRc=MegvXZGAVA210rjnFuKZwg4appN4nAJNejfC2jpY0JLOg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Allow to use setters with return value for
 output-only gpios
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 12:31=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> The gpiod_direction_output_raw_commit() function checks if any setter
> callback is present before doing anything. As the new GPIO setters with
> return values were introduced, make this check also succeed if one is
> present.
>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index b8197502a5ac..cd4fecbb41f2 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2879,7 +2879,7 @@ static int gpiod_direction_output_raw_commit(struct=
 gpio_desc *desc, int value)
>          * output-only, but if there is then not even a .set() operation =
it
>          * is pretty tricky to drive the output line.
>          */
> -       if (!guard.gc->set && !guard.gc->direction_output) {
> +       if (!guard.gc->set && !guard.gc->set_rv && !guard.gc->direction_o=
utput) {
>                 gpiod_warn(desc,
>                            "%s: missing set() and direction_output() oper=
ations\n",
>                            __func__);
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250411-mdb-gpiolib-setters-fix-b87976992070
>
> Best regards,
> --
> Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>

Ah good catch. Since the culprit is already in mainline, would you
mind resending with Cc: stable and Fixes: tags?

Bart
