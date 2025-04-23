Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AB328CF52
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421411; cv=none; b=CYsDsJD32yHvues4OBgnLnqrjVHAyXGcDVwBBZ4XroX6ddUEmSCKaLDJ8VlZuGzrnBOOuMqivXyspt52YqBv3f5RUD6AwpIQ99Zr9ZHKovW2mTkbA1XK70nifG8fEMgpZfu21/B/MpO6JsCkx7bTZrcu4fwpwJnE2K10MGchmGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421411; c=relaxed/simple;
	bh=wiQRxjVfq6FHjvTR4eF4WEQlEgSYtFXiwIFHwN6ZJdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7ZJRby5ddlVmDCdeXBwJNXW04QJZ3dkAzVJ2sc8nOAKFb1EpnMlDvJ6/Sx298uU8M5yEvAxxY6cjqlqrV1PZNAkGjIubinpPTcTXrmCFezMkhOhsTv36oZ4qUCZaHFtHnZ8WmR8Z97syy5ltqif8DgoXCfeX3oY+yb7b9eHjWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OjPls7wN; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OjPls7wN"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso17781fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745421407; x=1746026207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jo5fNYX7M8KjPw/nzhDjJuKY3qNiI/6SOFAiqZVsVI=;
        b=OjPls7wNqoIHWJqn8Vtmy4jfhirj5aOrFBgpxDsy4m1towrIGT5zXUMNjwFJUO8/IL
         g7jsiWCs5cA8zDI8bGU1znOZXshKwoEX6iqtDXaf9nn/jfZqF64bJ8Zka1mYpCbcRMGr
         KIgHo7WtE2Gofn1RG8ZgGnWel8B5hTJi+IMenI3Zj8hYk2K661e7iNfoahxBX3xG6eOq
         zBO4VR2dYMweIw7CBFBTt+n7ks7rU09WAcSDA2i79ZnCrRDM+nUOpyXh/aalXYIUsTq6
         Frmmyt+DZiPRLJAfqopWdKFCdHGzxYW4Fdw6WWGrPJX9XgeBJzFA/F24E3JwnspCciVz
         +7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421407; x=1746026207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jo5fNYX7M8KjPw/nzhDjJuKY3qNiI/6SOFAiqZVsVI=;
        b=M/5vlFwIc7njYXx8ZoLmH7g1zk8noOqbGfwmF0wXUCvCKitp1uLQzGV+ytvgoJWIWv
         dNQEL7cZSB5FUMMoNAYaOOcI4x+RmWS6NI2COVyOIotcl5pJwfPiL4RyA5a0ejFSMUxF
         fBmAbVt2OISxDY1o7GdOK0NEya/JEZIP9Xgh28tCCXc6vJRcF8jev9BR2YmNyDNCboBz
         y11N311RmhSZd9tSw8MHwCzalf7bJ7DGj4DRNmMnkMa3eCYhONpTvEHdhxJe7z9tJkDr
         Vhr0BhbnALwbnVwELdEoTjm5uZPzQTSk7XFvDb2JZ69M2ktn8KIcggoA4j+Wp8FTI2Kd
         ACBw==
X-Forwarded-Encrypted: i=1; AJvYcCVyoHmpdJ5g8BPRevdPyWMm71RoLYOuGsz8/WsrdRqGxhvRD+xDn9Qox3IMYD3tVmoI4wMPVehJmIoULXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqlxkbKdbe39Ep9acAvJF/CHECiB9BKMSPVN9RKEX+ltV15c6I
	5Rpl5kyCQdKyGZaGFadTaWzWMbw5l7ibuWj4xXdDHaD9AOKAYiKK5VHJ5WRyGB44iFwdSGxyYRp
	cj4WgKb+h5uazGQh3r5O7LQ2rWNwvgaBul3mkRA==
X-Gm-Gg: ASbGncuVzRMlKlBUy7+4XS7Lh2NNpSgCOl9qqtD2ZS2Fmr/LyzG+xmc2mlbZkkeu6JW
	2e4fr1VY/nOeH86JEEZzzqY1dyRrmc4rE84WpIY2bJCH4pR7oZJ8onQWnQg2RjSeYyGb12Errwl
	019ZrDd1u3TMbq6NO4i+M3gZ8VuRI6/TxV4yqBh9WtW+wmh56lO3MmQg==
X-Google-Smtp-Source: AGHT+IETE/k4w1fu2U8cN+Dnfk6dutM38e/zDtMkQO31fN5/T3kjC7GQG5tDFfOMiRyAghFnvFrA/27CKuuGkDO0Ong=
X-Received: by 2002:a05:651c:1463:b0:30b:b956:53bd with SMTP id
 38308e7fff4ca-310904c7e91mr63840301fa.4.1745421407059; Wed, 23 Apr 2025
 08:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 17:16:34 +0200
X-Gm-Features: ATxdqUELgS6WCJFQes3519gHJSdg6pzOWNNHSfSI0N6izE-OdLoImE-rCQIjitc
Message-ID: <CAMRc=MdOVSWzt-J4_g+4H-TSVYyc0tCOmog0WSpHUqE+hCEe6w@mail.gmail.com>
Subject: Re: [PATCH 0/4] MIPS: convert board-file GPIO drivers to using new
 value setters
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all MIPS board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (4):
>       MIPS: rb532: gpio: use new line value setter callbacks
>       MIPS: bcm63xx: gpio: use new line value setter callbacks
>       MIPS: alchemy: gpio: use new line value setter callbacks
>       MIPS: txx9: gpio: use new line value setter callbacks
>
>  arch/mips/alchemy/common/gpiolib.c | 6 ++++--
>  arch/mips/bcm63xx/gpio.c           | 7 ++++---
>  arch/mips/kernel/gpio_txx9.c       | 8 +++++---
>  arch/mips/rb532/gpio.c             | 8 +++++---
>  arch/mips/txx9/generic/setup.c     | 8 +++++---
>  5 files changed, 23 insertions(+), 14 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250324-gpiochip-set-rv-mips-43c07e67328e
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Gentle ping.

Bart
