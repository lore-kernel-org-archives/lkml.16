Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A1E18DB02
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777925; cv=none; b=L/GnRSe/1BHpTx7QS5rERc6fmJTCmRuH9SnH3TIsV4jKYCfQTNDtr/BnpYTrACj67BajAJ2QRyhvmiC9taB9XfvEIKwFu4IdKQj1gqVTVGYItPW0cRBTF9Mh5yumAjL+4RF4R4cGls4bXs9K/88peBxHSw6kzJ+FFnWG9NNLzpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777925; c=relaxed/simple;
	bh=DkNK4V4s8P1105G9M2GaM/bKTLtt9JfO/Y81L6C+ekY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWZGeGK14pROvnwE9yD1Oy6NV30ZjN+kbf0coYNenaEDEksCgjEgPYxdjg9ykK/r6Ko1ulJjvmSQAgXFtcZHovJq/nwEXpF/ORLPdVEWJ7cAt5TVKRqUyLih8nnYt9RhI6/iio0gJROJ4YIhxmRMPd2iE+fSOWZlqg1netIiZGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3JH/LaB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3JH/LaB"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54b166fa41bso2220519e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746777922; x=1747382722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkNK4V4s8P1105G9M2GaM/bKTLtt9JfO/Y81L6C+ekY=;
        b=s3JH/LaBOmiDNvpbxFIFQLtt1a64gWoyPEGGXaF448cfHxXWcQ3jsE3VaW2gFYg3Uq
         ahmtOJb+vl3OHm8kN+yZ+YZDIRSkeafnb28xNZZKNdqPwj0U9IxHaPBGGAgfovkqLDsZ
         PZHMjf4WLfjn/r5BY1jyAU+JlVu/J93ATXoXiOcLflMQCrDekZUJlIuzMsUxwl6Bz/HZ
         /c4ZOywCKZYSAZNfjW1JWSePkOl2pzD7wnB+jp6JIlCotCQXmSsf2Knmv6MlD2MnQAER
         elMAkX9s4m3GXoXNlxVhdN9GwdYJvuF30+/cMtgfQdNuxL4y9y/RxUnaHkJsRKFJFr6U
         jA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746777922; x=1747382722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkNK4V4s8P1105G9M2GaM/bKTLtt9JfO/Y81L6C+ekY=;
        b=P2M6d9nRjaPZF5KzhF6NQ9NUSVN6aVI/eFt+U8QiNNQ25h3ZfbGBKx5hOAARxDjXrv
         nAu7KX82yz6Wn9gdxIjC0yjX+IUuIYaLZKOysfpE6nMEBZOlIPZd3frZ1XT2mtCgbt+y
         F1Qvm0UHadatEwNJuDXhLs8YTiJh/gccilSN6IxWroqUXkGkl8LeLOJRJXAgnl6HxyP9
         DgBbRHiivStMMl0bDr9KZgNhdidtLoialiD352xtyJRBMf9zNLjib8Kxg1etaggIkrx6
         VTUVGe+0N+myl5u+48K8QRgx/nW+wmDyQWuwhlw5qtWiM7/1pqUf/gjSSXXfAmEfDotd
         Onfg==
X-Forwarded-Encrypted: i=1; AJvYcCXsHO9QZoMEfwjj+nqah5dzb6oZ4rdHfgdx3WCP7m4nWb/u7m3dNHugLJzyOXLPX2sFXFYykWuFO6b7pmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJHGJo8FFKd0J34pptZnGAADxY92RXxGxvBNOdd+H26m7W+VLV
	5eIDcQ4YwoVf95jkPpummCOVRsesR07ROccM4M/m8ZZT7C5rEHFmh54vIMPEB4tWxEQVLrXUKo+
	aWLbzi9cQKrfR8VfVn8gLIMnU+TG3CDRFrhu7iQ==
X-Gm-Gg: ASbGncvSsIGK2qogPm4iPht2MJ6rXus3ntEwfXoN19Ej2su83Own3S31EE//d9MxgKW
	IlIR7dVnCheVvxviaUXp6nWtQfCuFJjyISi3twk+mub0Lvgeg6DxLUxim2f9qZ6ht3tt8gMXaei
	hNyzbhDJ+M4Q5+GJ2AweuihQ==
X-Google-Smtp-Source: AGHT+IHygTOWySTUQ1JX00eO97lqc6HJQVUyB58fvB2NipEYZeQL68WbWlijYDIMb2+wa1Msnq90mTMLlhAfQvVGkBw=
X-Received: by 2002:a05:6512:6802:b0:54c:a49:d3f4 with SMTP id
 2adb3069b0e04-54fc67602f6mr649569e87.0.1746777921621; Fri, 09 May 2025
 01:05:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 May 2025 10:05:10 +0200
X-Gm-Features: ATxdqUHooQ8Ld9mj2dz6cfM7sdUGr8k9BsEqfTdMAuQ6XUXjp9g6npbLz8jBOxY
Message-ID: <CACRpkdat91GuhtkYw8mzzt2fgufktWCy4fnA5Dkos2=pWfWftw@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: mediatek: convert GPIO chips to using new
 value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 11:01=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the mediatek pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All 5 patches applied!

Yours,
Linus Walleij
