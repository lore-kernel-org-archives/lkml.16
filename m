Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229F62D12F6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248559; cv=none; b=dyOkFoMmI5UPDim9wQCu9AoVOb5bgGgbvmC7+0Z4UDckr6Hv+bbu+A383CHbWX1YwYOMyhEhsPoCDVBwSNF/Cl3rCNYqVYGoyhccSjHbZHbZQ/ZSizKOP6l5PTVSiSzbQdgnd1je74xatCqxLjtHlJ4UkGLTMma12LDKf8AUAcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248559; c=relaxed/simple;
	bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nT24GRBYwwDV8Q84AvStm0impVXpVp1EL5ZWPafJN7S96OMBi1BK2zGzCE7EN/t+kcC4seCaJ35EtJKvOEZd66KDFu8XJ1boV9ES/HKsVKodTis574x/N4cJvJuDM4HAFZBDrqVRW2MjoHgB3uzIbrctZi/XvY1uVnrB00QRUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fcNaYx9o; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fcNaYx9o"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55220699ba8so8498219e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248554; x=1750853354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
        b=fcNaYx9ocTR/+8hYqOW8FhFboXUL+/OQgeECOYXbcA53Qi8IqsOXoSpOo+6oDzPrP0
         pCLE+4yrCBHChGIen5vnic+pvfxEB9pE+5T3hw+6AhG5x1eDl655GTt0SRnBfVvQ2gmf
         b7h6Xe2GOTTf8OtPz3n28Odx5zfYI6xWqZYos037aFunRWgxxZsshgI/Gnq55H1rn5WR
         zpsCZBue4eKlZ9yh4qSopKRVUp8Zc62GyDmMqXjQgNvMyrK8+huzk6upXdzPab2cZvcP
         fFYHb45+yFbYmaejUBnaCUhVi8BpIfdD0netIFmOnhZgsqOovX5Y01sORd8rjq7csFfj
         GOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248554; x=1750853354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
        b=GxkdF+3aoStuR5Ae+RyskyjBG0TZKwg5SSAH6Pe7w2ZNycnjCiYuziRsiyF8RCJK5Y
         g4ltqXdgmRSI2xQVjIkTx9iGazgI4TrQceydDCe3ijPQB12I4VHPxBVoaFUXvzDhLZ+s
         4Tht5DEbC2cRzYrqNAL/pcdldujhdWOq193tHnyap+geIEPfiyrYLWdyHGQtRQAJKIOy
         N5ztoW1NlPvrBuJ1sXn7pj6mBYZ1WjaUYBQvhlrV+Mau14CpvzarkKeKMvamjcv3yRz7
         I42NPn73ThpMvLeUveIlyzyc3Sc4rz4HCCxH0MSDp8tSra3bf+VuKgNLNqCiRFOoU+7M
         Y0ug==
X-Forwarded-Encrypted: i=1; AJvYcCW/MzgaohySfd5B1u3LK41SDXI2gDw4exuUF2dIMMOIPznqcyx9RfZvJq0sUF/zpyMifydYsGP8sj1ZWg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyZvQ9+cy9O3YiB8GTJ+uBoJmEQAI7+/gO4zHT9MnsHMdQ3q91
	rO+4j4Y//5EeAo60BCXjxjiSe0kIbdvXdKukVM7SZSYSpitmaYr7EAM+Da4D8ofeq7XBhExO3Gf
	pnjRftU0GUaLwM0kfN1lU1x3tYdO55V9sqahA8pfUQVbkOpNEe46S
X-Gm-Gg: ASbGncuupUuY9Qs+opIw/AZDbh803mFpR1IJdiluAOic8skYl5NFmYBo+/Q25VyQBBP
	GsHhEDiP/T61MaOYF8S6JkXbPbi3XQ6tKSnLFHDcwRv6FMWGWDO6LjDSHdCYyrf7y7fnfcs6Znp
	e5XZGjagFHnRTSoVRneM/ko72fJzj1h/vIgZnzeUlDmpY=
X-Google-Smtp-Source: AGHT+IGC0m4FXYYQm+k0AXFCSy3bx6F7/2cTaiKhBBnuAbB+6N8ybTZnHZCukOOueaHxtyfLbUpPRBURy2oO4IVfhl0=
X-Received: by 2002:a19:5f17:0:b0:553:ca33:46f with SMTP id
 2adb3069b0e04-553ca330808mr1234493e87.29.1750248554215; Wed, 18 Jun 2025
 05:09:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:09:03 +0200
X-Gm-Features: AX0GCFtzAwHH-ht5UUznh81aEY-DCCdnUYFURG79_8pBHXv4vb2M7QItIyT5tQE
Message-ID: <CACRpkdb3+uQ=PG+ne48hyvdTFeEQBxXtq3CwxpqEmd1m9o9fNA@mail.gmail.com>
Subject: Re: [PATCH 00/16] pinctrl: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Support Opensource <support.opensource@diasemi.com>, Baruch Siach <baruch@tkos.co.il>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 3:15=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts remaining pinctrl drivers that still use old APIs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij
