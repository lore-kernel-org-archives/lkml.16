Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7A0204680
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484539; cv=none; b=MMZXt5GGE7xhNBIjUwUrjLiRygPkR5DBE/cNwoeGlmUjzFJrUKhlSPH1RhjXQG4mBWy14WNajP9w4dFblDNIABmQUgzM8DfGU8DNJcSl0SYDDENS3JVao58QZnXnnhWL8HxwkvyItcmwur2bQktQLFSUXM50g98gPM/g01Uh20c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484539; c=relaxed/simple;
	bh=bN+ogKEKRzfQQuY4t0TN0TGxrm6Tw0q/1hhOwW1I+ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ph4FgErRe9S4nT5t71I8U0Ooc90zRBwDAdjPnw1alhoDN02cImxgIEvaeN5BajdrMqKvbiDZ/N5FiMnCZwQ85fDXFrZV1fbQ+4a0a0zYnBk3XX5rmEN/CyHulptntT/i233s9x/5kM/3eYzcHv9jGCiIQlKAULP+so9vtlZYavs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DB7L+g0E; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DB7L+g0E"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso6876941fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484535; x=1746089335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQRA7d452oryDtFvJjN4gzdIi0T+CiF3zcn8EUThZUo=;
        b=DB7L+g0E8n/ocHOXDvLaDw7VMLHqrc0CM2WTDAL4ZwfHtEpDLarD9elbKn3DsT5ukd
         7MCado8Uanz7ectGCeyPsQYZLqeo4IOiKHX/igv6BIvu4w3L8I86EXieQfjdIyybA1bl
         W7lK8GT63sZBO4+cZff7i3frbKidUMOAJOaHUAXTpKZRySXDPgdSuJbI4vjo2PUpcDTj
         NGDoF9M4+2qxY4EsBWts9rjIooLdL9zZLsBXx2c8cdg9zvgF3jsNX3IHq0jQyPr+yHKW
         iTpP4GTefbbB5A66FcwRh4iZqDm/arVSfbyeQLfjo2OyaaCh8VA4bDB6y4XQgW2Ldblg
         mB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484535; x=1746089335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQRA7d452oryDtFvJjN4gzdIi0T+CiF3zcn8EUThZUo=;
        b=Z3nyIZAvvMCtSLUpwL41HRBi3fvq2VuAg5SI99/RM+Q+5ViFUlMrA93D7P4+Eq2J5U
         wwhY+hjquPurbAzcIHh6ICHie8qdUYHn1us0A1uiL9qJB09Od1aiDmMd4+NmqHrI6CCB
         s0mP3BoVmJzAXY4dzZ9zsr92Ad5cub200E/c/xygJJY0nLK9FSjVuH0N5OOp6j+rmHPG
         cqRBzr+tW4RkMYtAU6jrIlHmhGiL/PF4acQKso8KeohhqxYHWW+rCfEkQq38VclJM1C3
         UQmzVUzCuFBN877TqTfPp8RhpXKzp5VYmfiJ3Ew5/kJtfvimpMOmI66Qxl4GhPPwqtYh
         E50Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIjGdhwKgDMCExxP/fyL0zlp10cDVzGway4hclKp8Wc5G0Si3bOWunig/HJI7PgR9Pqeyuw9XtrqE8eBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5xwUsn9fk1HZkSP0jmm0L3V88FVFos0qi4uvuRkdWLrcBgyIW
	fc/jqneCQ2S5wqKUhRXS4f9TQM9QWebsgnSiNIe3y5UIb11dhU8H6aTmkg50y5BMqhyLGy5b7EK
	BixlqJpIdimKuMSvX6yOCG9bv8SYR8XJqiVy0Rw==
X-Gm-Gg: ASbGncsTuLVwtE9F5/Fwfz0TG3q8Ls91R12gZtzvwFJatvyWiujafeEJZj+MbK72eS7
	Y1M5j/1kNLY/rAUaqixBO4cKLl9Ozv7S0lPOjN4I8ErrxgVzFW5vyvRfFWK019h8ikrmPhannbv
	EpCbjaeKGoaLr3NuPrDhVQHw==
X-Google-Smtp-Source: AGHT+IE7By8Nl0BxiZtKTH0/jnSaFSHNwDqu5lHCKflXtrMxeoGrVVWZsRliLty3NtgjSGU/XT7xVZJZbRmvKEOyiGY=
X-Received: by 2002:a2e:bc0a:0:b0:30d:7c12:5725 with SMTP id
 38308e7fff4ca-3179ffb04f8mr8038931fa.33.1745484535556; Thu, 24 Apr 2025
 01:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422162250.436169-1-uwu@icenowy.me> <20250422162250.436169-2-uwu@icenowy.me>
 <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com>
 <B4C8B369-E345-4133-A106-7C5E71513329@icenowy.me> <CACRpkdYgkDpC1iJ-KaZj2GZ3A3_V=3-KQef_nCRhMDrUK=FHXg@mail.gmail.com>
 <c5efd677fd2199cbf8f9d6006905acdf19da02bc.camel@icenowy.me>
In-Reply-To: <c5efd677fd2199cbf8f9d6006905acdf19da02bc.camel@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 10:48:44 +0200
X-Gm-Features: ATxdqUHt-uv_Jd5XJrneHwwa9WAzFXDYu1AWIehUvUHevx0I0mgG49yxhuUvhlA
Message-ID: <CACRpkdbmF5BucsRjGZYgT709QA_Qnd3VrDoXg9dJdtAb_QLPwA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: jh7110-sys: add force inputs
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 4:22=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:

> > So clearly the entities that you affect are in the same numberspace,
> > and that is all we care about. They are not enumerated in any way
> > orthogonal to any other pins AFAICT.
>
> They just share the field width, they're not in the same numberspace.

OK I trust you on this, I just had to put a bit of pressure so we try
to stay with standard bindings.

> The design of the JH7110 pin mux control is quite simple and stupid:
>
> - First per-GPIO map configuration to map the GPIO's DOEn pin to
> internal tri-stating signals.
> - Then per-GPIO map configuration to map the GPIO's DOUT pin to
> internal output signals.
> - Then per-input-signal configuration (note that it's no longer per-
> GPIO) map configuration to map the signal to a GPIO's DIN (or fixed
> low/high).

I get it, I think.

So if I understand correctly this set-up is necessary to use any one
pin as a GPIO pin?

In that case, consider that this must probably be deeply integrated
with the GPIO subsystem rather than the pin control subsystem.

For example GPIO usually has this:

gpio-ranges =3D <&pinctrl1 0 20 10>, <&pinctrl2 10 50 20>;

Indicating which pins are actually routed as GPIO and implicitly
contains the information you need as to which pins are
affected.

There is also

gpio-reserved-ranges =3D <0 4>, <12 2>;

that can be used to say certain number ranges in the GPIO
controller can *not* be used for GPIO.

This type of inferred information should ideally be used to
infer the configuration rather than hardcoded properties.

And if you have pin control as a back-end to GPIO, the
callbacks in struct pinmux_ops:

        int (*gpio_request_enable) (struct pinctrl_dev *pctldev,
                                    struct pinctrl_gpio_range *range,
                                    unsigned int offset);
        void (*gpio_disable_free) (struct pinctrl_dev *pctldev,
                                   struct pinctrl_gpio_range *range,
                                   unsigned int offset);
        int (*gpio_set_direction) (struct pinctrl_dev *pctldev,
                                   struct pinctrl_gpio_range *range,
                                   unsigned int offset,
                                   bool input);

which you could implement in jh7110_pinmux_ops to get
a tighter connection between you pinmux and GPIO controller
portions.

I have a strong feeling that the missing piece is using these
callbacks along with the gpio-ranges to connect the GPIO and
pin mux systems together so that you can set this stuff up
in the above callbacks instead.

That would save you the weird DT properties that will be a real
pain to keep in sync with the actual use.

Yours,
Linus Walleij
