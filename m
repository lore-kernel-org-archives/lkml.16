Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26852215F6B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128069; cv=none; b=MwnloY6tLS1OtlI0eD64jPoKMB2rrQ6pooLOcPVbSwxMJ3KVfWerWLaBgVCrAD6dBk4f+6FoktpktNcnzyyXuKskmgXYi0EYLlHLN6gs+pi7CMd1C91fXfXVDLiaAKrEd8o75hgs5NHnFDcjIPqfWKJdjto6Y1wwZonqw7D3I+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128069; c=relaxed/simple;
	bh=jAG6UOMOffV3gCVoCmbgmLMxOpZlx9u8Ad39RHvZ1TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGdhMCgbfCiIrd4Bw4LOaxEE0d89KrFbP00LL4Y555EC3hpQJTOOv4PmHTXcBwpNqGGG5z3UCD05Gorguq5LUkRwQLK2uWaJhfLn4M9tHykDl8h2fIRmkHbb74oPPQ2Lelgvw/KZPG+ef3v5rw9SNdmhny5FtklvxSBBRW1F3Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxy+1epp; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxy+1epp"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54e98f73850so6215727e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128064; x=1747732864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAG6UOMOffV3gCVoCmbgmLMxOpZlx9u8Ad39RHvZ1TI=;
        b=zxy+1eppz0AOm1YjT6rvKlsa5iMWWAkQC3+DLhyvnNkmS5KdD+kIjB7uDdODpZoBPO
         MTttUZ5XI9A0q9ACZ43hFuXk5aU7I9Fr6gVn9WvjDbi0p4Hp5ht+6vtgvWJ2nhwnHFTJ
         VNkmbpN5Y1Um747b7nCwGKbjz+/mzN/A2b8gxSjh+g86/iz+aWgrdGoihG04Ks9g6AON
         bwWF3mI57wxnODdicxu8jx3SWtApeVvgvaKbSSOniRlJAGVhNn1G0bi2PEkDdrJDsH08
         zju4mwRXBPHAtigQ7RlYRAr2veYMcd8TUJ0qkzlJ0P+cGor00OjKAXE5u7CYcjxkGiDQ
         +7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128064; x=1747732864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAG6UOMOffV3gCVoCmbgmLMxOpZlx9u8Ad39RHvZ1TI=;
        b=FYPXfTHWJuPgpZeehCvNOlp1t3Dtvltb/iC38PZdbplz9uRHOQqYsX8TEhvRuGYPSo
         5AsskzImClSwWRIoQkPQ83JaGkTPbbGtSldSme7nI482hmRzcbFuZqrnjLmBtYSOdrD5
         ++YNHu+FcZN9yoECnTIRKOMktZOF1tT5DY7UN+IeJUrFyqyfeaG4ad0xc3zSiPviTvp9
         0+BJxMBGBCxmSEZaiWgwI+jRc+1IB0n4pmN/EvpjmLPTIDPwLj0H/0nOjG7OZXJXq1HU
         FeKO615f2WKV8UquyICNopxqfaOWzDUKKdzniBrse4xDgByy/7kpVuwsPASN1SDdV3lE
         6RJA==
X-Forwarded-Encrypted: i=1; AJvYcCWhsuERsQsaMAew7zYgmVa3X1Z+RG+OEvtMUKJfAOeye0Z3l/CQPtLbUSmgtKq0cdR+x6zg5HVaUvOcFto=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbCcJsZ7wSAh7YkKEbmCVu6NDxNydQkfkhIBd3hFgkfvw5ni1h
	GL8nCnrUfMTbkIbNrBBfeRUeNnPf8jGvhTrSGi2XX2BwW7jDZw/8sqYe/oJHueSJrhY5Oq4an92
	5JRUNjo/ndpcHmOXRQqi+sp5L3DwMt5KRZP2Se1oQFgpkgA3Rr18=
X-Gm-Gg: ASbGncsSat0zOcUVI8IzR0aHLL6vXsbTWc8o28ywkT6LPn/etJsQbYRQXooPvIEZ6ur
	M6h+ixVONIDXwfeLMdDWgJ5DjUwoZzkH2gndBvSsr1g47wUWd52q1uf6eresfXyPQm76UnBG0Q6
	69eoIjFHJEenwcUA5pHUfoFkmN3wOI7W6x
X-Google-Smtp-Source: AGHT+IGKvl0a9PYMoR7pe3tZ5kyPbARxdNFLenyjWORpsYZx6Qr+/V56jGkku8jVsQAW4x2zH8hvY9ZJIUWfZ8j8uTg=
X-Received: by 2002:a05:6512:6408:b0:545:f1d:6f2c with SMTP id
 2adb3069b0e04-54fc67c37b8mr5182580e87.18.1747128064206; Tue, 13 May 2025
 02:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org> <20250430-max77759-mfd-v9-5-639763e23598@linaro.org>
In-Reply-To: <20250430-max77759-mfd-v9-5-639763e23598@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:20:53 +0200
X-Gm-Features: AX0GCFux1HtYoXX3UiKQeMd3kDVZuoIvGECfOVBviXvO98OxIVsjOGF-W-k86hk
Message-ID: <CACRpkdY15L5PpV9ah_0R3ZPZVMh18OR+Dg2qXiBG=8Kq79-rjA@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 11:03=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:

> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
>
> This driver supports the GPIO functions using the platform device
> registered by the core MFD driver.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
