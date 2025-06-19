Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D342E2609D0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322088; cv=none; b=MC/Ey0MNLUkRRTe5eofbvMcAArQzjBYKgIJqfglrDMTU3VqKl5OwbGsd4wqDqw8CdXWhD7e0va+h2Dq0Kcmf5qXjV0CyNYHIvSl73535XxOs6G88qQZBXahaGGTctdOvfSWpjA9Sl+9A94ODyny+N+D6i7pbHuawj78uA/qAn9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322088; c=relaxed/simple;
	bh=j0nhDKpQpxXWzr1mFcT2IFoKimPE79WTa7ayNr/hzWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CyoopPEbVzrT2eFiVYGRozna/edOENhX67c9tLO62S5LDV78K3DQG6PKByK1PbcONYulDENZ6mg2Yq6LcfGdu6Xi+KpLEPPsCK3VZurbtiOBWzCPno6vSCXb+uYYOovgtpQAfb3NTn/iIXvyTSiPRyr8Xnst68GWK9sXmZzxYjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V6uEHsRQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V6uEHsRQ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553dceb342aso283794e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322085; x=1750926885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0nhDKpQpxXWzr1mFcT2IFoKimPE79WTa7ayNr/hzWs=;
        b=V6uEHsRQQhapQjN2CsAqzBx423DW+SZb3peSYoP3+mG0rs497S+INrigilsSKZvttA
         iuF3fd+EuOkaihTUy7IP/f52aohksq3K76/NIOrXKFo9Xg6WSmtN5PtAwKXRhaHsqDec
         aaR77NqrmYCsn6msKJQzuDOhLrCVzSp1CXu6uUS3COCKCfLBkZ/Jfb2h4mk/vIpNnnXz
         479SNAmbVX8lE5Rqvf8JIRKVG4cLEQQf7Y7dOZ1VmhgIuOr3SlGMij6zra4gRiv395RB
         z3yuSWuPTfzzteuV5AlWbK92zneYc/9/tJXTU5+zGIGPm2ziDci9qY1K9UAKJiPD0j0r
         Cfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322085; x=1750926885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0nhDKpQpxXWzr1mFcT2IFoKimPE79WTa7ayNr/hzWs=;
        b=vVdftYORMLPYXwrAnZuVKW3NBbhWUjEt2yBbx4HUD00ZAd1CY7MrREZZqWHbUha+/F
         2qb5JW02cMASediKsCMF159zHmrWL/EZnXIaaWWqPWrtK5Mdr4yyNbYji1xNQ7rCXu2z
         6k7smFx6pbtze6UYG0m54bel1hsRQIhHxOu4ON99giZo2oQvUs/7UpIOS2l6c7Nf3kz/
         tdpVD0Ns2YaeWoJmMagiTpxXa6TS3AFR73azQxF9LHL7Yz14JEvkeAyNJl4K2BX809lc
         0eRAAx68ZdpYYBZKwU2WoKlEnGvPDKZeXcJUbL/lgEMRsiro117jDssHFgYYthfSu5M0
         QEKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC0OJnv1T5oNeDUDDhy7cbBA9g6i6XsrDJRKwybDFRpAG9UwG31oY0bWseu4ORfPq2aK0H3DPWlC/Asq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTyJIb3nQqRC5KrI2l775uiTYRSYfV44SdQjKIaEaLUYpYPB3g
	yZFiYAX/3f+nYzi033fGCc4dZa/DUZX+7+djggfKTgjXRIjGExaUD9Cq4viSSUp2/FeNQpYkHdn
	wio8hFIYhER+mgGx+AmX03I0kzmsGFhfwaf2KtOmSUw==
X-Gm-Gg: ASbGncuq7r8IE14P5I5uTsfRJZNU2GqQGBNUoRI+agWs7XqczZxo8q7K+pgGoCSWPkT
	XeDqYAKGKQFENaZBB7pv14cltRRm1vhfud3xa4DNFojJgrN3WijrKagdv9i/27aFcg2vGTE/cMI
	J/poQQ+6wtqldvSLvctNFhWVQ1O5Uk2rdGOat5XBQ9JS7KV0S1TIc8ITkXv2PolfBouM+eGL069
	yTFAwfskZG3pA==
X-Google-Smtp-Source: AGHT+IFDp85PzWD62QjUEKS6MevtLH60iV1DaBb/nwT7ioJL8BslMyztOttEsa1fNI7Da/cNBk6S/D+nhCaUS1yFP4Q=
X-Received: by 2002:a05:6512:b26:b0:553:252f:adf3 with SMTP id
 2adb3069b0e04-553b6ea5ce8mr6017773e87.16.1750322084921; Thu, 19 Jun 2025
 01:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-3-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-3-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:34:34 +0200
X-Gm-Features: AX0GCFuzcvha5PSQAEYMfe3d61ki6vxUCoj5DyKshbRkn7FeS0Wil9VqaZ6ngBs
Message-ID: <CAMRc=McmNfQHVpDtvJMJwGJmoVTkgQG6riGxfxYMed1Xre=GLg@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] gpio: pch: use new GPIO line value setter callbacks
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Forgot to pick up the trailers. :/

Reviewed-by: Andy Shevchenko <andy@kernel.org>
