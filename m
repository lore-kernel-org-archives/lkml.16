Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE6E24A07B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141394; cv=none; b=AIwnmd3F3AaUuGrW4zHKjyuQUUMvPab3Bijf5goKUzauD0dgbXSQrYzQoHgMXMBzNI5ffhXcr6zhj5WvCIR3P0Qz4QkhDrPlGPKe5XgE85koWT6jThPCUboFve0bp4yddTBDWWx+0Mcgmm98TBNYJ9sh1HcCjPniYo3+nolQIfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141394; c=relaxed/simple;
	bh=x8ieU4EKi2B4fi65n0AYV5vqCBD7U2SnDPQDI/RK5MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaU5QEzcJeH3i/Dp4RYbQ/CI2JZNAwIZcF59RWSE7T/xhKGWE2w2PGSBi7d4KVdt9+jZOSayahf5eyWHh8w1piQH7NvnQCk1CZoUWysXOehz4zIAR3TFtJ2S5nL5VuWIlBOoq0GRGmTlrcx4rZIryebbuWx7GldXDNowcX8y7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LmdMWaiY; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LmdMWaiY"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-310447fe59aso51587851fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747141391; x=1747746191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bckFuN4azCmbNe0b2Ogt/F42jsbbCCh007jmdEYNzmc=;
        b=LmdMWaiY3rwMXY65xWrlSDrBZm5+MGKWVYjRItOT0iySYAjIoFEfFtvNH4HibHVQ//
         Bf6oHPC0ut9DSRzLtOwFIbO+OzGEgRfk5lJ0siI4SBah5tzM8VkXj3qjrbplEN2nF/Ig
         JadL7xMuwjzGvvxvxQEIgku4Na98fQgev1cYh0XvgeKXGwQdDDSA+zfiPXq/s66G1QhR
         npOA1HcJcpPOXu4PnyqSD3fhfn9EYg6mLY2p0VqvBBVZAwdFpfBhLLCxqtMKv736vK+h
         CpN336LJDgfy28yB9itUMJmzcODbp1TzZDst3saL9ulFEz2ZB196gikdTxVQ9wwtY+8A
         7ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141391; x=1747746191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bckFuN4azCmbNe0b2Ogt/F42jsbbCCh007jmdEYNzmc=;
        b=ltHAApSSaagDtRwK817sHhen7fjxh9A249LLwsHsRTMNyqV+O+WzAc21lTmu/1XTIZ
         9rcvAC8xLxHWh/FvJaOxFfjGCA3ogs+aWUIX/6bDVQRTsk8Wkck/8gl0iXSfSaG4Bn1e
         Bffn+gfhwGmfNgNooZvYU3sdJiy1V//7otirdZB7p66Y87VywWpRSzBIdtwOe2if+lQa
         cCkzIsDPxeyM6DqplEujQ3e0FKnamUe39DElBd5P5QMpOi7oCrqWMzAqQhmN83+mnwxL
         eBTX+5LBmKSksG5ka2kN0r6XGnJIupu2+1B5PwCIRplhKGk0PYE1fIE8mw2AteuiXBUQ
         UGvg==
X-Forwarded-Encrypted: i=1; AJvYcCVUooOdm+SKGe5HgjzZXcK1RIMiePQOrBepTZx2jX2rOrRbpNWFy80vMu6iXT+Y7N32kTvm9lS6x7uUHCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz97gZixo89c8hPPtVTFwbRfEx4nthSUwM8wToGLXSrdbDis3NG
	8LzWSCbGeAByRlBIvuFcL8oYlmo64bLe8ZWecPNoMKx9+Scj0ea/Oad6Qyfh1YD9JBWuAM4dqax
	9WvvrWIa4Ron4AM964wcWopoXpP2eHcsU4tSPMQ==
X-Gm-Gg: ASbGnctO0ggPfLsv0/CJPXAnJ0jFZwWbo833Kk0guUm9w7JK/FKmEV70bJJLvafIq/B
	1CigPFMFK5EI8oQDMK2WPRabOUzFqKUpsrteyWMnUlz0JWpQj6Mg/U/FDEhXpjM1KvBaBEpR94z
	r45jH/tyq7hSoTVWpy73iXQJhCPK3eK7yP
X-Google-Smtp-Source: AGHT+IG41x6HOlIO0IJUYhQJ2UY3oU18tjuuOsvxrjmQ22T794qYcI75spC45YpUWkdDO5fUQhcFroeonzakK7RK33I=
X-Received: by 2002:a2e:a549:0:b0:30b:fe62:2329 with SMTP id
 38308e7fff4ca-326c455e0bamr65757501fa.11.1747141390612; Tue, 13 May 2025
 06:03:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:02:58 +0200
X-Gm-Features: AX0GCFuUcIfML44aAdhDDQyW4WElAah3qOFUrVK8KAK7hsanUNq0ZohV10DNP3g
Message-ID: <CACRpkda8XSuO8-pY8K4gRsK7Ny6=PqcgKdrK+8A-3ghCfRTBLQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

thanks for working on this!

Also thanks to Andy for excellent guidance on the series.

On Tue, May 6, 2025 at 5:21=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> This is the fifth version of this series, addressing the few remaining
> issues identified by Andy.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Looks good to me!

> Thomas Richard (12):
>       gpiolib: add support to register sparse pin range
>       pinctrl: remove extern specifier for functions in machine.h
>       pinctrl: core: add devm_pinctrl_register_mappings()
>       gpio: aggregator: move GPIO forwarder allocation in a dedicated fun=
ction
>       gpio: aggregator: refactor the code to add GPIO desc in the forward=
er
>       gpio: aggregator: refactor the forwarder registration part
>       gpio: aggregator: update gpiochip_fwd_setup_delay_line() parameters
>       gpio: aggregator: export symbols of the GPIO forwarder library
>       gpio: aggregator: handle runtime registration of gpio_desc in gpioc=
hip_fwd
>       gpio: aggregator: add possibility to attach data to the forwarder
>       lib/string_choices: Add str_input_output() helper
>       pinctrl: Add pin controller driver for AAEON UP boards
>

Most heavy commits are in the GPIO subsystem, once the nitpicks
are addressed in v6, Bartosz do you want
to create an immutable branch for this and merge into your for-next
and see how it works, if all is good I can perhaps pull the same
branch into pinctrl as well.

If this is stressful I can do the same operation in pinctrl instead so
you can just pull it to GPIO from my tree.

Yours,
Linus Walleij
