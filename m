Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE632E7632
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791495; cv=none; b=gIuUNinpJAdSF68FWL/miEXKJ1aDOkl6lJFHAGwOwIAV6Q9HnIVh8PvjKlBDe8avraW5SgBDL5oG/z9KfHBKecDHtvdWhuxSD9qFm5UIKw97DQP7B8Ab2NXL/i/b4nfnljte7t9LOlnsKJkA5jhJkpxuDnzV47RabMICCp7K5sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791495; c=relaxed/simple;
	bh=npWwWKZPd5rdEqfk5ixF6kz+HcjFPiAMk+Q3wRxBc94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdeeMv2KWup3DbSOvUK+bJUrz8xKV3R4eJnjyFL3JdAMGxUOZM9CHhv18R2yOejgG7qikBDBuTIWmVAZj9psN8j5zlSXT5rLtnJMHvNzfJowx5uyBGcogBGI05H5nfc3b5o6ehzHPAoRY0J4+0UBn2F6Zbk/prVDRVzkZpx0iJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWE7unGS; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWE7unGS"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so1744891fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750791492; x=1751396292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7ui9krklnTDspgMC7AGFpPjhbbUuQIxEzApTtxeYDw=;
        b=TWE7unGSOuUxfA+RiQdEGtRaCAkTg6IrkT6bSQZThodttjPogdODQZyNfBW7I0xwJu
         nfX0au6WniRbRkA6iSosgwB2XHlBrOB8l1Ir84cbw6EE3+4nKpyPpjKEBG02qm7+HCo+
         4G6OYmTl6sdT0zTlxTzay5ScHkIele/6R3nM3bspbLGecKP8S1shvdHOE3nG2fb5FlR8
         4uB6+uMXvRdf39Cg8vJYEGKJ15dUAzj5hpGFkdKIHqmcwMN/TK1PsAsps7MqQJySIPSa
         FslFK2BVGdK36mkdfYhLdoalgGuUOd1ZQu0ByZOY/HlAEki88ioL6yFpb8L4yP6knnQe
         thlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791492; x=1751396292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7ui9krklnTDspgMC7AGFpPjhbbUuQIxEzApTtxeYDw=;
        b=lq2ER2MRGJPp0rOd3Kf26ggQHn1NBbhyP/1LU6/+IKD16xtpSka5FNGt9eEKMbob1r
         /dvPLmQiUX3sn8mlKIwFZN1faJbTVHJptHXe19WjQiP2xZM6IryPYpV5IAShbmrmvGY+
         J7G8dSkuSyF8+m3IpuXISfpHlizLX4IHRCUCyc0a2HW6CmgndvSodSphhJSAhgLZKfip
         MpNxFQ1DyKVaYDv2oyVo7DuJvfqFfVWfcc57cwncykzOcaLRvwMS2ocKf77l91TZjZJF
         xcAzRjXYqYh5oTqTIdyRJ4uaofagtfVrkJdk/6cqxE8/2jPtRQK/EzReWOXhzYqwBMN+
         wW1g==
X-Forwarded-Encrypted: i=1; AJvYcCW/tI3TrYwjzBzQra/hX82TAu/mqkY5SSk0zPux/3TUe13Excv0Xv2v8RRglAC4gUB1kwgxwJeXQsDAT+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZFFe5v0z6M6EGiWbdNUQjg+7BVTr2g87ZmS1Bjd+QLR0KFP14
	y2VXejurjv4kdgypaafFqVhuog+mpfLkBvcA7n+QRzXYjTh/wl2tXM9yke/WQJP8SMv0GBc5BMR
	3WzjIcEs/CdeLy+8+ZdLOS2vtw822XuJQyTCp2CHV2w==
X-Gm-Gg: ASbGnctVmxBaqTi69OjEvhG2Uo92qNqGaDbZ4ClvXmr//6tn6dlkF3Stvs/gW8UQwoL
	iXk/M4obbw9qbMWsej8U7uYaVzbXKPKC1aGbqHS/oStoHP1xwmvONJGkxJh/Ld4NXyEUUnbIu7u
	+/97rBib9CdiTwASZhxpJxSVeZ+A9B8s9tDJR/g5+M8BY=
X-Google-Smtp-Source: AGHT+IFHkwtjvOJNCrFEWstn9L634lZ8TSAnodhGn+aKzDIVOJMa02nwLbdMCDdRl+xviZehHHIuiwGlHeUOdx9D6us=
X-Received: by 2002:a05:651c:214b:b0:32c:a690:724b with SMTP id
 38308e7fff4ca-32cb968d882mr10090081fa.19.1750791491756; Tue, 24 Jun 2025
 11:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618095858.2145209-1-demonsingur@gmail.com> <20250618095858.2145209-5-demonsingur@gmail.com>
In-Reply-To: <20250618095858.2145209-5-demonsingur@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 20:58:00 +0200
X-Gm-Features: AX0GCFv3Y0xzvM4_ytzUY9wWsLoaPRcLNq10rxfdsma9gTvF5iQYKz-0B24NXH0
Message-ID: <CACRpkdYwBAaEi--y64oVwVcAMH9z0LO5ZG_fvNK-CuxdERiYBQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/19] dt-bindings: media: i2c: max96717: add support
 for pinctrl/pinconf
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS" <linux-media@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cosmin,

thanks for your patch! Overall this looks good!

On Wed, Jun 18, 2025 at 11:59=E2=80=AFAM Cosmin Tanislav <demonsingur@gmail=
.com> wrote:

> MAX96717 is capable of configuring various pin properties.
>
> Add pinctrl/pinconf properties to support this usecase.
>
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
(...)
> +      slew-rate:
> +        description: |
> +          Slew rate.
> +          0 - Fastest
> +          1 - Fast
> +          2 - Slow
> +          3 - Slowest
> +        maximum: 3

Would be great to have some SI units on this? Like how many milliseconds
etc.

> +      maxim,jitter-compensation:
> +        type: boolean
> +        description: Enables jitter compensation.

What does that mean?

> +      maxim,gmsl-tx:
> +        type: boolean
> +        description: Enable transmitting pin value to GMSL link.
> +
> +      maxim,gmsl-rx:
> +        type: boolean
> +        description: Enable receiving pin value from GMSL link.
> +
> +      maxim,gmsl-tx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while transmitting value to GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0
> +        maximum: 31
> +
> +      maxim,gmsl-rx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while receiving value from GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0
> +        maximum: 31

Maybe add some words about what an GMSL link is somewhere?

> +      maxim,rclkout-clock:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Clock value.
> +          0 - XTAL / 1 =3D 25MHz
> +          1 - XTAL / 2 =3D 12.5MHz
> +          2 - XTAL / 4 =3D 6.25MHz
> +          3 - Reference PLL output
> +        minimum: 0
> +        maximum: 3

I'm no expert but isn't this something the clock framework has some standar=
d
binding for? assigned-clock-rates?

Yours,
Linus Walleij
