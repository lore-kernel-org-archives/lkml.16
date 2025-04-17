Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB5124290F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744893711; cv=none; b=gfHax6nmsc224zbpq5g+SxUTUSvHg4cy6mScpslvWZ3qJM/KOUia0PgkA9wfn9ZyuKGZXB77T8q5KWp6wehNyxHiqGPb2JfgmQCBDZIYJt5rN7usd2zN/kHPH5lG+VNnKZtRHwmLvtyqVj71JTSwO4KnaMoIV95lypA1NR/f3Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744893711; c=relaxed/simple;
	bh=nQIIrU067YTPjOc8LmZh4/vPjF2wg8asBmSLf3GZb2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kvee42ma+MzCZxI/qYnl1MJ0lSfnusSPfo1AbhY7VloeKgwlPhVoP6sQqXwW5q2qyUhdBJmja/52o1Bqa3ckhIiW0LRosH1M/OnhYPWOjXzOrnSWDti4CwUGQyLZGfexeRcaoUZ/QVj4z+6mQiRFL+fZ0csARGBMVqnQ1kJQzsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g42nueKz; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g42nueKz"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54c090fc7adso815365e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744893708; x=1745498508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ5lyKYfN+K0uYV9se5bx7j4N0g/Y1mbf+XUFGCcm+I=;
        b=g42nueKzZ04eVy6vvZmlMsoemoK8Hj/WzbiclabKX+DVq23/NEUMdXtZ9Td/5lkqy8
         RSA+kXAClrcSFInJCXyLPz44r8/WmmaW5eT0MU3682gv2zhITYNPgmkSwnC2GDQ/QCWf
         lf/EJyozmkFYDa0gyInvRi7wSzVHXll+UUOWKO+QZ1nl4vtFLfwm9b4/CCpMP+wvUfJ5
         qtupkr6jGWpGDBePjwPsKOL5NzXrbgUeQYgZUiylvrtN9MS/0oB7UxP/2FqYrhSZuI8I
         Yeo6tWuzs0nne1XOHSBEqFQpjthZlh7ZLPfKOs+qVaVxfW2LsbLnV1qUR/zdk5mrBNHG
         6VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893708; x=1745498508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZ5lyKYfN+K0uYV9se5bx7j4N0g/Y1mbf+XUFGCcm+I=;
        b=cgqsf0voilWGrL2QSMgOq2zhuJ5Z2WELwOOlIxzbilEzi0fOgL323L0ttxJvG4GN9c
         WHxDnq39XCTa25vlDXp7C5yfG+0H1YgbQFJVbJfSoFg3gLJSqExWsfHqWJCliBr/F/oK
         pLMvknF7l8pdesr+Dnj3RVwqkEOszIQffRZPudyRtzjLIrVJJ5SwKi1PC5XX0yEaAkA0
         L8vouWwyK5lI7B+786kUStzljbXsXtObKe48bXB4p6Xv38HU9AMO0id/DZT3PyANnF+y
         JXO/wTlE8bWFeWtDM3dHj27hvEBLmUnLIibp0fiKRTD2bTCauw2J1WJenNODj7jYnb83
         k9DA==
X-Forwarded-Encrypted: i=1; AJvYcCXh5EvmI/+xeCQJFTe9nlfzZYXtzz1QXbFWb2n6cS1hTjQphny8mTNQN0FyoU1E81t9sGQZ2c6ISNM8ecg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMflqQsgNf0pzSramT3n73ANP4xRuGfrSXqgDJMTHt9Y7pMxIn
	HHTyV89OFJuaxi+7PylVcXrC4XhVvOi+bNx4lCfGP0tQONU05/ANT8oESBPR5Cxv8/Byrkn80zV
	DK/UG+BHOHNwC7JxuuEWtyIM+Un0FYLKQOs852A==
X-Gm-Gg: ASbGncsR579PCnxAE/YbvJWPXYUtw2enMDdLkRIBTgKJv0yBcuP1enyFvTfIp80q685
	ZwyHkUsH8eJIyZOGhBJFrcli6b55Odq7elUjVgw5k0Uds1ume36HezwORgTNgaRdHnFVDELMQh4
	Udc74GKrmVPgd2jiLzN+yGbktQXe4wK/mkkucuxmze7q8xL4J2h8e0qxg=
X-Google-Smtp-Source: AGHT+IGCeVLIonXAZLoZuX26dLN3o/5NzBTerYwwXcLsLxVnsPGKrq48ijHC2fwB40UH+JZf3EjGuDJ2/FAZWXTNCFQ=
X-Received: by 2002:a05:6512:3d0d:b0:545:1082:91a1 with SMTP id
 2adb3069b0e04-54d64a7b6f0mr1692690e87.7.1744893707675; Thu, 17 Apr 2025
 05:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-mdb-max7360-support-v6-0-7a2535876e39@bootlin.com> <20250409-mdb-max7360-support-v6-9-7a2535876e39@bootlin.com>
In-Reply-To: <20250409-mdb-max7360-support-v6-9-7a2535876e39@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Apr 2025 14:41:36 +0200
X-Gm-Features: ATxdqUHVnRgKXXdU0felXL5SR5G-r5Je-4YU4gveufkl7eBQ6Hnf24ePYuscRak
Message-ID: <CAMRc=MdKswkm2jzok6Uw3cG6uDkVq+CMXbJgP3fRY+jHo+rPkQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] gpio: max7360: Add MAX7360 gpio support
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kamel Bouhara <kamel.bouhara@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pwm@vger.kernel.org, andriy.shevchenko@intel.com, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 4:56=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> Add driver for Maxim Integrated MAX7360 GPIO/GPO controller.
>
> Two sets of GPIOs are provided by the device:
> - Up to 8 GPIOs, shared with the PWM and rotary encoder functionalities.
>   These GPIOs also provide interrupts on input changes.
> - Up to 6 GPOs, on unused keypad columns pins.
>
> Co-developed-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---

Looks good to me.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
