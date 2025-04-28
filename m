Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B941B1DED7C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745849905; cv=none; b=pFfSif9ekcSnHBfmNOh6mf+tRDxZ0uNnpT/VLfm0KFxZD+Mq3k0A09+f/tLgPYdvUq4Q+/6YWVZMt1Dpe8gMYsb4SWB40qdwN81wnRtddfx4Tfg7n3zdeby33yH0+rMWeyZkkRrUQcCWl5jy50g7Apo9KLsIGM67iOLFWKt5Qbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745849905; c=relaxed/simple;
	bh=PjRdXlsmJUpPvlWjlRcduIR1Eq5Vgg2u25y7fkkDmyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YmJ4gXaVVG89qP1bP4g+x1e1Xx/LGXQVWteV8Fp1HhdPS7jAuRj9ut7fjzq71u+XOkT19faEaF17QH01pqX3UpPbcRu9VO/ygeuCiO7c5guzfFWoqBHip+mg0P4fhb7bioyQdfwUpzqnm6XqzMmjdn93Ug6rBBaZdZKWajgiA6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jDr2VHzL; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jDr2VHzL"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54e98f73850so946748e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745849902; x=1746454702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXVvurz23J2+L5kt96WXTroBQ39jU0y6cCqiWeSQLFk=;
        b=jDr2VHzLbJ50BiFc8j1G0V7lsRiKW0Se2ri1Et6wLxdaTxeg0lkudTAWLFGqdvz0AF
         lD+teb4cYJzIBQ7buAdqQV78SOo7R6uod5Gh92hVNbqhSAOxQpqiu1kpyPXyZAjoGgSz
         gmWDu67pV/X9SBZfns7cFhc+0Fip+luuTNVntv5/y61h7C6CclqkedG0nUlrYmAAYezP
         UU2GrIxHri4vbhyGsNhoWp2UjyfANNbzCaN/JK16ZRU8JFPgZnCO1+7eDmVkQJyuHGh8
         x9nPpSfMpXCPLHa6AbXE8KY7YhSYLyb4pUPdskyJOJvXiBis/yyZBkw21SuRGnOnKKM0
         3GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849902; x=1746454702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXVvurz23J2+L5kt96WXTroBQ39jU0y6cCqiWeSQLFk=;
        b=nAHIkzssmAX9caWdzCy+DJMte+HFpoBg9PlVxzCa8O8g+tuQYDvPPBuNPHKIh2R3tS
         1TIkIt6vGmFlLb2pGOnzyrwWtuIyu6vpNC3cd8Qff1aD0yeQctdDaTXpG/7c3jk1EDMD
         9Y3mAfl2xP6juk5g6zatSFGVYstTW1wQrUdAl+x7L6GrCBzPXC8/fVTRiHRbosRAPdom
         +DgaQuaNIGdRTrxmMmSsZsXHKB9JQnXIU/dNw2gVl809rt7ecreMYr3oU78kD8R7tnu5
         yR3q8ZTrH0IPPO1f5pFzqD0oxNdHwRHQ2+H/MxBcjFQDoDWmcr6rWLP+sHQNKLlqDPn+
         a0YA==
X-Forwarded-Encrypted: i=1; AJvYcCUEAkH9k4BKvFxqvk+36FluMYhueOMRFxO7dMr87lOBV/fIywp03Ez/WUjGhVlYgDhqa58QaYm8OmTL/rA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9RAIxgLemLjgzZp+KZmmVTreSAigBtKQxZKSNCsV0RrYJotE
	RUHZTKTOTD87LSLuR0Re1n609S1rQXRkEnaq8OybMpg+YPGcNx61E87ODFU6NphqimsfZo3XI2o
	vDLei+47EQdo84erCg8glc7EdKEPbbcRPWFHFhQ==
X-Gm-Gg: ASbGnctA39zI44Tx322H0R8eFT1ecHjb1vUS//O+PCw8JjgXIVslxk84mtmPCz02FRB
	YRe+YDrgajZ27zY3wGOpHVvm8I4eVkGrH6I9cUyZxVRSdlGUrAk8bT7bB8dFOUqt/b6+fsLj/++
	MwbaQdJuHtTFgfjID5GW52Kg==
X-Google-Smtp-Source: AGHT+IGvhJeqWQVl7wUSjEu9Tai7VZXnkdRdnljHuHSmsEW0zEOC9vXIPg78pJyadRV6QxI6VqKiX008Vk2HwfUHtNE=
X-Received: by 2002:a05:6512:108f:b0:549:6cac:6717 with SMTP id
 2adb3069b0e04-54e8cc0cb31mr3406763e87.53.1745849901807; Mon, 28 Apr 2025
 07:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424062017.652969-1-uwu@icenowy.me> <20250424062017.652969-2-uwu@icenowy.me>
 <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com>
 <7e62e720ccc51fb5c7d023adae3eab35aecf0bba.camel@icenowy.me>
 <CACRpkdY0DXxDixZVhnRuKvSVbKQ6pSfLMiT2hf9818sbNG-4hg@mail.gmail.com> <0606c146d97ff98ff1412b98f49e6da0071801d1.camel@icenowy.me>
In-Reply-To: <0606c146d97ff98ff1412b98f49e6da0071801d1.camel@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Apr 2025 16:18:10 +0200
X-Gm-Features: ATxdqUFE5Aj3lBDc4lYvvht68VXq-83pWEXQcwlO7tgbNAkueD3gpN4Y7TmGwKM
Message-ID: <CACRpkdbPhKwjb0dkOom6HyzTrhPWvMPhX5M=nyxw1HBHNJa0fQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 2:26=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
[Me]
> > I guess what rubs me the wrong way is why the external users
> > (devices, device drivers or even pin hogs) cannot trigger the chain
> > of
> > events leading to this configuration, instead of different "magic"
> > configurations that are just set up in the pin controller itself.
>
> Well I am just extending what's already in use...
>
> Currently it's already supported to route GPIOs to GPI signals, I added
> the support to route fixed level sources to them, in a similar way.
>
> If any external users ever have the need of banging the internal
> signals instead of tying it fixedly, maybe switching between different
> pinctrl configuration sets is enough? (Because this kind of operation
> could never be as high speed enough as real hardware pins)

What I am thinking is that one of the following must be true:

1. The internal pads are always set up the same way for this SoC
  in which case they should be just hardcoded instead, or at
  least just implied from the compatible string of the pin controller.

2. The internal pads are routed differently depending on different
  use cases, in which case they need to be set up or implied
  from configuration in other DT nodes describing this use.

I guess this binding if for (2)?

Yours,
Linus Walleij
