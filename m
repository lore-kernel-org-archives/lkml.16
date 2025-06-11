Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F992777FE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646156; cv=none; b=HSiUs43ajzGDxmiYggPqJpVMdUunDPp3wCWBgVOONFVoTAEyeqgb5KgtEuPh7SmbEPIetaCX8DKFW735oHwmoa2lY8kHQOvzkHC4xyc4xTwTWxb/8Xt3FkRl0zh6hV1aU9UsRa2Uf/rMTkHF8l3HvPPw98+DYq5Jk3K/rvhievg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646156; c=relaxed/simple;
	bh=JEL5rHgZNb7DAsn6xBRypsK6BNQMJX3AEL99ZzoDNpA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKbnWv1oUwlJPZ4t0eW4QLHSl7bV3PeHS0OhQYEGnyRdxHC4F86Qe6lCiqqKqLm3Xt0KE+AgSPWebWyihehHDIPS/1zQXhgOlIl/4MFWAOCiwpMLCB0ofv8y11k1CcQ7LO5uXHGEDa6X4sWwgdjTDBcWZ2SWHcQQX/x/4FMz2yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=JYquwUht; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="JYquwUht"
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 612CF44713
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749646142;
	bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=JYquwUhtQeRO7wC/pNOwwKJCfHk+jwK/ae8GUsyqRV3FPtkBFOnnIMggHlU4DTQnt
	 dEk8Hla11cnNX2yHTe5ejju1iiHefQJQzePsMW9ZTPXx3cYX1v+wpNE633atfazEgJ
	 gr4Az8oOTKZ5UNZZhlmhP1shrqVNvy58uMxufejPQQLXYbZS4LZLAHCKm++XBqNctB
	 wYAGXbeUxmiwSEUswyY1Y9Rc6+y9L7UYa14ddrxvslPOycgPI0ZilGhg7wafSTFc7m
	 asTvht5EhQpXn8BtC6+MR4peaOO5LGuejHK2jvdELmiGSFuSHyauuxCTMmPXhNLcbP
	 KaiCXTLhiDEmQ==
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2e922a13d49so6024937fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646139; x=1750250939;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
        b=pxxGD3SZGoRhJU34X6pU0/Xa8J7A9VivRMQn02NRt0A97HbpHDvDsoJZxJJjs1qa4a
         XbwqphFyB6i9vVwnl21IeaqvQ3D5jS1RgwU+Ou1La5upR5gz785c4B935AZ2SBaHwAFi
         s0uezclr0JZeZuMekV5lRwtjgWjMoG7LPqzZO2FeOzyCL31WGQuMAzW/+vpCpEkKS6lG
         3F9Z1xM54KPWFSiBOqJW3UilcZgD3EYjoJynixsUz3zPNKbJkgfJP1Doob9qD7C0Lz2o
         71LVzwVI02vx8vtLxB4YI19oStZ+bsLO93QzgkMStyd2cvvtUQk7XhJCJpjaxOtiDRaB
         frtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDglx1f+afsun4dXv5MgL8UpRYYseJPpTTklq0OxYPu3I+/0k60edTXNLPJXEzby4VMwoNsjAwXWS8MlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YywKOm7aauomYGi70nL2TKBlg+f5DmKtvI7Nunlb4Swh4lScApZ
	XL16Aeq+em6mXDRMOmKY+Bu3kfv1B1ktTjWOwd4M3CBQMb6lPjJmFytwrbYFNxBIgVNqKZRtPSl
	oxxcHEIgJjoVMF207hDnoK8EOSmf1PZDl31Wftrbg/jkBDfrMZKnPXUXxAwXCCiGQo18XyRrC43
	Kg/PzioHACYoNGepL+eGGL0UZklssPxdSCnyJQkPCcMBKZ6Z0R4B9fp/sc
X-Gm-Gg: ASbGncuvyiQzpnNb2YfIX5/DXLLAxpRmksdliR8Yaa/gx81DsSYqzNAZjWYQ+qhBBLM
	fZOECW6uaqF6zjY9vHBKgXK0sQAPG2OFLrmZpWBYb6Af+q53+2P6mvFn10omPNy5wkgAA1PnaFX
	Lg3w==
X-Received: by 2002:a05:6871:e803:b0:289:2126:6826 with SMTP id 586e51a60fabf-2ea96f18fc2mr1940832fac.30.1749646138934;
        Wed, 11 Jun 2025 05:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzhqyM2kCCDhwaEPz02MLETIROTaGu5WeJENkIMCzCu3hfLe4ldyitgFfsfYyGdI6dZNlApiM1ratiR1ypk/k=
X-Received: by 2002:a05:6871:e803:b0:289:2126:6826 with SMTP id
 586e51a60fabf-2ea96f18fc2mr1940818fac.30.1749646138634; Wed, 11 Jun 2025
 05:48:58 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jun 2025 07:48:57 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org> <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 11 Jun 2025 07:48:57 -0500
X-Gm-Features: AX0GCFuz_RtY5rxDREJdwFYXLGRQkyQfytWb3LifI1_It-SfpAfrMZfWta2TVOY
Message-ID: <CAJM55Z9WzsxWGmQYH05hSisigTRaHuKOn8g3AsLJ9h6Womy2dg@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on
 other platforms
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

Krzysztof Kozlowski wrote:
> Always descent to drivers/pinctrl/starfive/ because limiting it with
> SOC_STARFIVE is redundant since its Makefile doesn't build anything if
> no Starfive-specific pin control Kconfig options are enabled.  This
> allows compile testing on other architectures with allyesconfig.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 65dac8e387985ac7f865d13325eb903f64645a2a..de80f3ee52c40f3a817f229a751909c590161594 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -83,7 +83,7 @@ obj-y				+= sophgo/
>  obj-y				+= spacemit/
>  obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
>  obj-y				+= sprd/
> -obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
> +obj-y				+= starfive/
>  obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
>  obj-y				+= sunplus/
>  obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
>
> --
> 2.45.2
>
