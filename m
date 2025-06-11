Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640B613A3F2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633051; cv=none; b=qKkFbTTY4aWRzlOOINyIIQMw8dMmGJG/EJEtcIeJgDYwgHBuFzVWu+PSjpGOrMA2+SVmrIz7asZiTjx+w5CwnVr0G2DKv0ThVCxEd3bnAo4llkXM37wmojAjHlhHwIGJAdtkVjX8KJhIYD8aZRCYeaNOpS6c02HAax/gSwB50pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633051; c=relaxed/simple;
	bh=UiP7bYtAn5bOurUsut0Hn+VxUCAjht0ysMqY1OYWW78=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UjyzU5c2OYoYlI2EeN8L+VXHJi+8aZyNNZDx3k00VsRm6NYrXxdsXJTjCBGkN40yBXXFmRoHPVfksybrpIqcdi6wWimwM4QaaNuqs3SOZd8AWoZCjh2Ns5CEO4+bQaOpEdW4fD3IMxUVYA2LSTiMeqRZnARz020ITDu0V5pxXsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4Rx46iu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4Rx46iu"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a365a6804eso3944819f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749633048; x=1750237848; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UiP7bYtAn5bOurUsut0Hn+VxUCAjht0ysMqY1OYWW78=;
        b=j4Rx46iue8Mw9LvH7E+xyLUvuMAl6/xGdOy+p3OJHLO5JDHCmRJPf6xWXjl83ilxRV
         44UXtqRSB7AmXiXKV15pTQ1oDtXy+hqSrdFJe1oo9UwvtsBpoyGmDhUcKmn6GYOkjMa0
         IJxup2yhTFOW5yfucUj+iw3981rPviP/Hu4vp6R8zX4niVut+gZm5MqL7PtDfvhDn642
         lxtp6S3Hv9XRFttJXj6eGsbVjqnfEEDsWjPbgRvIXQclHg0m6ZI5ScIIaUcMXCLYiBbh
         rs/8TRYIrLrm9TNQ5+hRf+FOARMg3B12J2k7lydf+SqqJTRA8VkUA/Bsr+v/9L23pXxI
         a3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749633048; x=1750237848;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiP7bYtAn5bOurUsut0Hn+VxUCAjht0ysMqY1OYWW78=;
        b=m+UFiTtaEtHgGumWUv/vvFgxJEQAE3hEuH1bYtuaXXYMcBI3GyNTM1n1y3d3Dw2Ayu
         OajY3kDN0xdaaEb8t1QZyXbEXKtCmzqqZYkCjf0xIrXBYM5/2L+xOcWuLZ51o17UiPl0
         WxnsxEpQyhyQiV0jIv6XoJnj2W3YtKy+gP5ebGBotwGJVrgNGpKHAwmkhwHEiSq2I7cc
         u2hVJiOWAdOnOZhDgXkfuTX6PSzY/DEuMnbXtHEsXeFRH/SGlhKqplANrPixoJrdhKgI
         9d+oHoH/Eub876HZAdzgodqxnm4tR332VdpRt17WjAANj49I+tYnXRCUKAbghNh5N7RF
         MQAA==
X-Forwarded-Encrypted: i=1; AJvYcCVXhbN169ObeeV4wQrXSfNwy1kYJQqEwcTaVMC66l64mMUONjPHU6slIaFCf3402aNxZ9XP9f39I8qb5V8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEXOJN914Mwl8ClWtnOtIReikolYucGq5wQYj8ggNUkhTGQ0hy
	W4m67SuvHOkP42rkfmIKuM9gYLOxHeEXYLc8ZOVNXQVHgO04/5jVGZFymxggIZcNRpk=
X-Gm-Gg: ASbGncuZ70uaCIbOwhD/5HNt88B6P7f3AMBYCEauxHolOIPdm8NAeNbTIn+ZLEBVvcZ
	y942tKRuGL7hOXQAVI+9m+lEXOnkxYtDxXApUNlseQh5dBIpkhYGP+MsqoQL/imy+0F//FHktpg
	SScZzV+KmzxN734Q4qR318O164fxMjbvBd8aUAseZt180dxqhi0Bd4BgY/Gr+pPjWMgHnFI4O0y
	9Izn7YZ1SOZapEAyxz8CgSP91uehjx/tdB6ovx52HWQVntp8BiF3ACebzzL/QsEBmjPbXEHmPNJ
	XE2XmbdPyF5lP47j0CAzxBBH0uj0LqwBGAoGrRReLHdENWrjOnxWVJYndHR5UkmXqxL1ahT2nmA
	y
X-Google-Smtp-Source: AGHT+IEff4k+mWiP2yvcP0rIRRQnaEfv6WpI06KYTc4P4gapt1kumJr8379OhHI99yqMB4EQ/QLR2w==
X-Received: by 2002:a05:6000:1a8c:b0:3a5:1c0f:146d with SMTP id ffacd0b85a97d-3a5586cb2f1mr1987274f8f.33.1749633047651;
        Wed, 11 Jun 2025 02:10:47 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm14652654f8f.76.2025.06.11.02.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:10:47 -0700 (PDT)
Message-ID: <35c2381d6abc565f60208e39d0e0ce1bf019809c.camel@linaro.org>
Subject: Re: [PATCH v2 04/17] dt-bindings: mfd: samsung,s2mps11: add
 s2mpg10-pmic regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Lee Jones <lee@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Peter
 Griffin <peter.griffin@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 11 Jun 2025 10:10:46 +0100
In-Reply-To: <20250611-fierce-whimsical-aardwolf-6cd33b@kuoka>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
	 <20250606-s2mpg1x-regulators-v2-4-b03feffd2621@linaro.org>
	 <20250611-fierce-whimsical-aardwolf-6cd33b@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Wed, 2025-06-11 at 11:03 +0200, Krzysztof Kozlowski wrote:
> On Fri, Jun 06, 2025 at 04:03:00PM GMT, Andr=C3=A9 Draszik wrote:
> > Add a regulators node to the s2mpg10-pmic to describe the regulators
> > available on this PMIC.
> >=20
> > Additionally, describe the supply inputs of the regulator rails, with
> > the supply names matching the datasheet.
> >=20
> > Note 1: S2MPG10 is typically used as the main-PMIC together with an
> > S2MPG11 PMIC in a main/sub configuration, hence the datasheet and the
> > binding both suffix the supplies with an 'm'.
> >=20
> > Note 2: The binding needs to switch from 'additionalProperties' to
> > 'unevaluatedProperties', to allow adding the specific -supply
> > properties for S2MPG10 only, as otherwise we'd have to resort to a
> > global wildcard with negating inside each of the compatible matches.
>=20
> I think this binding is getting too complicated. Maybe s2mpgXX should
> have their own file.

Will do.

Cheers,
Andre'
