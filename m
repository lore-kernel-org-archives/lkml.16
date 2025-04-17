Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4001207A03
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872140; cv=none; b=VtHeWq0gKahYcpMts64U2hI6aFwTLAqOD5H0ExqPjHYT1SFtEkU7+Q4Qj1BwEt9vwrO+XI/KFqHmv7TbqgqxkQmFwBfLM49mASDyf5TeB33+8YNdbCloxXFvUzTR0OdP/aEMeSveQ2+wcmKMLAsPlK16uCrgIbjtcWXUPGZc7i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872140; c=relaxed/simple;
	bh=HAa5MK3MthDMPQcfWVF6XuiMcrrT9amfqYJR+OXWJMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lml6uN73BMFgLD1si0UtHlfkGQb1nL6INhHuTXyr51LN8Xj52gu2xcpCncaTO+aRA88OgV4h4/HunP0C209Si4IWyEzdO+3gjZe3WwvIhJzt2fOMtV51Hng8EhaFH4uwRFseUG59AvrUGcJBzOTbbD/yC7jtFfxlaEwoKcx/u7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5GZxjam; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5GZxjam"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac29fd22163so59722666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744872136; x=1745476936; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dhOBMdnj48blKw6YV7gc/9oneYA+xqS2pjcS4PzI4lw=;
        b=k5GZxjamvB1VlpBLHUxLbpp0Xxii78JsqYyhvfNsrpXNhc31zOdEwFtdvCO1NCpH92
         6h+asjjM8hdIoipjTZAJoq49gSFyY3/zq5BA8z7Tu8bFELFqF7p8tIOnF2hBRchHvKdQ
         TYYNSWv/MRz6YBrp0U3UXODXWGUSAN1PRJnFN2gXh0NNCwSMJY3x/OyQGFjNCpwOv/j/
         nj3gdWacYJ0h3yMygb/u8TCjfozASmTHT6X89IeEgEFnWbLCvMpCwznwe61lhujtpjqR
         tj79ZA/YMz722OH3bdV2DycL1HL/dKiabBIYPHaoQ+g67XAyzRx/iO8MCWCZHoJ44ntK
         4b3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872136; x=1745476936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhOBMdnj48blKw6YV7gc/9oneYA+xqS2pjcS4PzI4lw=;
        b=LmYjvnt4pwBxw2DZyJGM3cd/pzBoHcHwRgOp8vtymSIDd/MESuPl1xaa8W6NEsz5eH
         t09C7XDlcypkhFGd9QDI5MxbU1icjJwgtbOBTuoqv1Df+Op3ONXy07O2PQKtiq7uY7L5
         wm7PxwU2Mg6jqonCIaAo0vm7VXVnJKKQRlrh2inu0nk5rdGmN8hlqtULIltPchQWD0Ch
         G2TAOzqi7zFXnRKKyFZlA4WrEigAct1J7VIkuwJ7pd2BPdOvHF53tbXcU2jgXjAGvlnR
         HbCYoOgnredPfbs9oeLhK9cifDdRSfSLCjERdHj370Gi2+nggGSd/R7uAO8mrHecUGKP
         D8eg==
X-Forwarded-Encrypted: i=1; AJvYcCWCLCHLH0blcxGzLus8l64CSXTrzLzYFSEuOrpfP3dCjRvWrhu95RyOxSkoz35zV1uzJgBQUmeScmmfNIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM1GMVtg2YoWRkQfb3+8Cq+BEmYOqZFtGhHs6HU0GjZwir6viY
	zcdUvtEe7bHtZZjHB7GUAx2Ee0Ah7bjasFV1NFFpLTjf2RE676oN4b64ZffmoGa/qtRfpRciZoH
	ZTWu4/C73bnckj/wvsvo1lpdDxmLSE/0+g33WPw==
X-Gm-Gg: ASbGncvpS+8UeBPn9QJRNdDCbR1vszg/byF0V1co2n9rz6Jl0CUDq0cp3qrPE8xEcU2
	97nDxtueg3n5uwZn8s74B9gqKfMAIuF66mn2bVVlgbgrjRKgtcN9NtMhDInaxpP/Xq+M/VwIp8t
	NDbDuKsDQPZkRZCAjJcAUVWV1bnMg9FRTAqI6SioEvGzvrU2IsKPnDdQ==
X-Google-Smtp-Source: AGHT+IHwQmW4uLoxd4O86s85PWQDVE6I5QgHoOdxvS68frFgXriQWYv526JyoVIGGquD0xEBBdrZTykIPd6kRqLVJVs=
X-Received: by 2002:a17:907:2cc4:b0:abf:4bde:51b1 with SMTP id
 a640c23a62f3a-acb4298011emr405993166b.21.1744872136202; Wed, 16 Apr 2025
 23:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org> <20250416223706.GA3230303@ax162>
In-Reply-To: <20250416223706.GA3230303@ax162>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 17 Apr 2025 08:42:05 +0200
X-Gm-Features: ATxdqUEdk8B4qOm49Z3JjfkRT6lA8RuMaY_llvKtObT7Pr4tgUtNyFqCuqU8FYk
Message-ID: <CACMJSevPHdo9ZGaOyGV8rrhJHTN4+-0UB0+sz=Z5jc_eZybjcA@mail.gmail.com>
Subject: Re: [PATCH 07/10] pinctrl: sx150x: enable building modules with COMPILE_TEST=y
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 00:37, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Bartosz,
>
> On Tue, Apr 08, 2025 at 09:17:44AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Increase the build coverage by enabling the sx150x modules with
> > COMPILE_TEST=y.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/pinctrl/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index 464cc9aca157..94eb41bb9cf2 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -541,7 +541,7 @@ config PINCTRL_STMFX
> >
> >  config PINCTRL_SX150X
> >       bool "Semtech SX150x I2C GPIO expander pinctrl driver"
> > -     depends on I2C=y
> > +     depends on I2C=y || COMPILE_TEST
> >       select PINMUX
> >       select PINCONF
> >       select GENERIC_PINCONF
> >
> > --
> > 2.45.2
> >
>
> This appears to break allmodconfig with
>
>   ld.lld: error: undefined symbol: i2c_get_match_data
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
>
>   ld.lld: error: undefined symbol: i2c_smbus_write_byte_data
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_regmap_reg_write) in archive vmlinux.a
>
>   ld.lld: error: undefined symbol: i2c_smbus_read_byte_data
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_regmap_reg_read) in archive vmlinux.a
>
>   ld.lld: error: undefined symbol: i2c_register_driver
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_init) in archive vmlinux.a
>   make[4]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
>
> I don't think this change makes much sense in light of this error,
> unless the driver was converted to tristate.
>
> Cheers,
> Nathan

Makes sense. Linus: Can you just drop this or do you prefer a formal revert?

Bart
