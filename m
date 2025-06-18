Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759BF2DFF26
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249618; cv=none; b=myhVYxBiefS7Xnc0RpHe2z1lFEp1R20wuk8i6+H2vq0bHV4wQALw3AyT4foAJXA49yDZ+Sgx7xYaNVTFI/H5NxtUxvD16v3ysWjIHwzQO45sXSx2ngZqbfLngwxS7ppOE0ubpUYji21K6/p40KIps34Xl5D6QtjJf5+PA0ZtFj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249618; c=relaxed/simple;
	bh=MeMY6ZvITBPQwHI52jDYCf35TLcxWMfuS+SdIkf7zyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFZT5ll6Vd4Vg/uA1y6KZI9ANzCAIovFtxjigU5LAxlrLAefL6JrNZHueMup3AL6nbj/Vi6zzVdo5seGkDQme+yb+3eHUav4uDAJkilUAAo42SlERDvUXYn/LTk+X/+nJUGZaHF5kwU9yDdJbtOJ24CIK0q+FpGoDB6EdMTd33U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udknWNOl; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udknWNOl"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32add56e9ddso55732991fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249614; x=1750854414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeMY6ZvITBPQwHI52jDYCf35TLcxWMfuS+SdIkf7zyY=;
        b=udknWNOlq1p+HLe0dsmC4jceUTWZ6MbqLrM2DE+ll+5PtE55I+GjyiNrnmzOkplk6x
         dyHCCUSAq25RV6+dgbHFV5VlsIRFAyHnyfQvfJntB5MCjIewhBy3J9Zuj/SrC+csCSzf
         KK9PIvHrROUJBkRghh7JsFKj6434/Hw6KkQI7ZTzyTtIgul5uTsnlw0WoKWbyRtCijA4
         Ub0sYjgunMwypytL52brArI0HGCNrhijVoN+QU+qgYM5l8xrFHOX46i7H+3I/YAgx0Qe
         pIMQ4446kjKFRDnILNXosSSJBStRIl4LOBcWO8vzuCof4ORQr6IQjH8qVpYxwfmsSeDT
         mhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249614; x=1750854414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeMY6ZvITBPQwHI52jDYCf35TLcxWMfuS+SdIkf7zyY=;
        b=gKPpD64yqrcLFWiIre6XIEoKUwAZN5aeL1Yi0zlzB0rfvQ0RnZ2uTi85/qVwBTz2iv
         TyuofRBrAAM6+V5ZI+m/Gih/Z4WQO9SeC2lIMqCtzodppyu5HS/DZzdoY2u7e0PA8qg7
         eKjB4xJrHdBn8OpEQTiVzG6Xzai9uxQhXy5RqNjvUCcLP2iAUc3rkDzWE9tPyeGvUMLu
         en9nEr4lrkRUHx5KBGTImggfG1XOYgqO/OBgTtmwOZgs2aZXtvLzOWnf9yZPeyRP5LC7
         TQi7eq3GzONcVnqX+cH+rGFHM3i+SAbz2Al4h1xobze7u6wlA++3DgPA2k81bPpR+HyS
         APpw==
X-Forwarded-Encrypted: i=1; AJvYcCVUg6fWWuaC6BPANqEZUUFGC/cJ4pcaIwsRnHftdGRdBeQgLeyYm2arWLwiyz5naTpAIt2VyKQi0pYZa/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQ0g/kS7gO/EA5bDZxrdNvn/kwoiX/ls4hLdEFFjR8/yLLJ8H
	SCSOTN0G+fNGbKeibgKrU8CSe+vU16rMYl6iU8GJo3GfO1A87JcFORbR5993N+hlEZNIHxQtcbQ
	NW2hJU0Fkumgfug+fiTSNDG01XCUYKoTxQf6iRU0CTA==
X-Gm-Gg: ASbGncuOwgm+g74nrxxXtRrfAZ02vmulIfqpLfOsGZgY+UdlrOSMjUNdkXj+jCycUhm
	QD/AniFNuIQGHKf9VcRYEfgmEpr2bPf5L0d0AJNCiBDkMRQoIV6hdVjHq1uRw6tUaFwsMrc6A5i
	jJcGHcRFj/niicBu+MYDBI4h6PuNJz9wxOL9sU1DG6bM0=
X-Google-Smtp-Source: AGHT+IGmpRGkPvcBAzQa2VYDunxKmHXXLzf37cM2KPcBdZgVLj8USxefk+Q+eVf5G/Wn/kDbl2XwzYwXpcHTfZnY1T0=
X-Received: by 2002:a05:651c:1101:b0:32b:82bf:cc55 with SMTP id
 38308e7fff4ca-32b82bfdff4mr2950681fa.31.1750249614434; Wed, 18 Jun 2025
 05:26:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:26:42 +0200
X-Gm-Features: AX0GCFslsN-cSw-dqPdU5r6A6ilGsRmidmHeaF2HfeRbo7EfHKHVSPh6Y3Xsvmo
Message-ID: <CACRpkdb0y9cBpxjefWpqj=S=0eXKZ_SeeKGKL5ePLNHkk_Wj8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] media: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>, Andrey Utkin <andrey_utkin@fastmail.com>, 
	Ismael Luceno <ismael@iodev.co.uk>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 9:18=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips implemented under drivers/media/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
