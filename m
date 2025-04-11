Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F81F3BAA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381782; cv=none; b=s3Ri2sPXRjSb/s5VRn2eUxnMrph+rlxg6D8GVkpKbwn/bw+71Rj5zZLw94lIxf5MaUORj0gHSJiq+SULU6p3+0DfegGVqX5HQLfni9S8TsGX92wBEM1lV1tiHvbAW2x0LOJIzg+kbE3fI1b4Npk+mGM6Xet2kLea1tOiR2Hk7nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381782; c=relaxed/simple;
	bh=/iEDuG2zIehPz6KVZMTx7mu4Lm71sDlFq0jr0v8mSrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SB1wmDUz4LH+BWQlAApDh/t/BxD4F0VMnxwfsI3mhuNgGVY5237XcUD/78UjH0PRy10SVfVszMF3z/QE5A/fqzGpy9tywchBIJ/KLSqc1MzbrKo5B2QLF7EmVSNowNTRsVBZ3F6vKy3lPJmxg2NECzpheB8VHLAo3MVupfksdNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=X/vMj+OO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="X/vMj+OO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1320515f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744381779; x=1744986579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8hqxBUyC0ns9eaPvESS3za+oYCsUAFhI9e/U4xWblAI=;
        b=X/vMj+OOQEiTDPWARbkN6qmjFHOTPup+RI/3K1768rfPWYChq3rq7WxEXoxlZrZthR
         D1y+9V6oFFRnC91LkARWcmPWY/oBgBpVkFays1KTPWMxoDrqPQX2slz8B5s3X2yD/GIw
         mioDMXySt0X96eHnDw6ES3ZlMh5yh3djw8XoylmHo/DODkoNLJ5XgsqPL7VqI2WvfBwr
         e7oCDqkvMjlTUXvQ4V2QLmejR9fCQsiybSkWmFMDko912iHUqjRakZaxniKsgmWYo7dK
         DSJ05D4vS9GsMZJrr5mJ1EzSwwXasJI0gm9UmPD2rib19wD6sRq+DBodrsXWldnAEanQ
         tq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381779; x=1744986579;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hqxBUyC0ns9eaPvESS3za+oYCsUAFhI9e/U4xWblAI=;
        b=b8nwLLv5xLE//pelSgpqQbZ4U4u0QxcSgvpSy2vdRqhU8ur9BBS6CqgIK9mo5wY3s6
         kRguFgy0OAr20qqU59hhHGFCzHFQ37M6iSfaCq0Z5FiKxvYl7/vsINEl4CYzqEhFnXpX
         ha4Buj9UGL2eWNVl6vnCKdgvpsDy5GN/mQMTqyRew7bti9bIITgUJVojtbfphuWUNS4Z
         a6cWD0NErw76H+eBwvkXGPMLdB0VneBHY3r87oCALz+7nh94v1rJTeTNDqoe1aE7PN7R
         B8em0TGFehuaHb2hB9IY8DSA//oDPQU3NWKOKNFyS+1CxRdUCiigc3ZV/10CJzzULkeK
         qPEA==
X-Forwarded-Encrypted: i=1; AJvYcCU2A08dyxC7UOncgUut/T3s8d3IzllHQw/OljDgj/SQcZ3uM87lC6hweHcK/Gulvvcal5gBtY2egAJgGzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFUT9IIBA+8Je6yd8lZpHbJDjeW0/dYFKNJvxXxJ8irOKqSOYL
	QXszCiBxomYQmL1nhUdgmr8i39khg8YPBSwZb2lWgo7UkEZML893yBz1NE9Wx5c=
X-Gm-Gg: ASbGnct0cNEep9eX1AxI09+bCfl3iFUWIjD+5ftxdGN19sIAkp18tuwXQ6X28cIwL4T
	qvydLaOkEiO3u+7RljcgfSs13+mWBanuMiEDIQArAx8vMWa1MxRae3fXauR+pP6wx0F2L9CmDO0
	khjd5RcdqVA1jWjtOJQ0nEqRUOUZZl7fRrtRxg3IPpIDaOiBwBI8d/P4VyQq9Xwvl+JE6xSsCIj
	gxYOkbJ9nM2azcFrnB799Of0i8yPgE42qCeEu1dmnYpW3/lnBGQwcUP1kCsoHZQejBOi/aF53Ax
	VTRMaPEwkCEYWOz4WnbLGAQJZGMpyx1gGQnD6Y3zrIN60qBs
X-Google-Smtp-Source: AGHT+IHD7Cas+STyP0l4SArtn2i6scRGDrYYRpRyE7WLAnpJy9q9S7ex/ksN5K6SfcSK5n+MPRT4DA==
X-Received: by 2002:a5d:59ad:0:b0:397:8f09:5f6 with SMTP id ffacd0b85a97d-39eaaebed00mr2197064f8f.47.1744381779046;
        Fri, 11 Apr 2025 07:29:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae977a7fsm2151767f8f.45.2025.04.11.07.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:29:38 -0700 (PDT)
Message-ID: <ba68477d-33b8-4b3d-9a88-9f6bee6feac3@tuxon.dev>
Date: Fri, 11 Apr 2025 17:29:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ARM: dts: microchip: sama7d65: Enable GMAC interface
To: Ryan.Wanner@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, onor+dt@kernel.org, alexandre.belloni@bootlin.com
Cc: nicolas.ferre@microchip.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
 <fca0c1deb74006cdedbdd71061dec9dabf1e9b9a.1743523114.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <fca0c1deb74006cdedbdd71061dec9dabf1e9b9a.1743523114.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 01.04.2025 19:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Enable GMAC0 interface for sama7d65_curiosity board.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../dts/microchip/at91-sama7d65_curiosity.dts | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> index 30fdc4f55a3b..441370dbb4c2 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -105,7 +105,58 @@ &main_xtal {
>  	clock-frequency = <24000000>;
>  };
>  
> +&gmac0 {

Please keep nodes alphanumerically sorted.

> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gmac0_default
> +		     &pinctrl_gmac0_mdio_default
> +		     &pinctrl_gmac0_txck_default
> +		     &pinctrl_gmac0_phy_irq>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +
> +	ethernet-phy@7 {
> +		reg = <0x7>;
> +		interrupt-parent = <&pioa>;
> +		interrupts = <PIN_PC1 IRQ_TYPE_LEVEL_LOW>;
> +		status = "okay";

No need for status here, default is okay.

> +	};
> +};

Missing blank line here.

As this are mainly cosmetics I will adjust while applying.

Thank you,
Claudiu

>  &pioa {
> +	pinctrl_gmac0_default: gmac0-default {
> +		pinmux = <PIN_PA26__G0_TX0>,
> +			 <PIN_PA27__G0_TX1>,
> +			 <PIN_PB4__G0_TX2>,
> +			 <PIN_PB5__G0_TX3>,
> +			 <PIN_PA29__G0_RX0>,
> +			 <PIN_PA30__G0_RX1>,
> +			 <PIN_PB2__G0_RX2>,
> +			 <PIN_PB6__G0_RX3>,
> +			 <PIN_PA25__G0_TXCTL>,
> +			 <PIN_PB3__G0_RXCK>,
> +			 <PIN_PA28__G0_RXCTL>;
> +		slew-rate = <0>;
> +		bias-disable;
> +	};
> +
> +	pinctrl_gmac0_mdio_default: gmac0-mdio-default {
> +		pinmux = <PIN_PA31__G0_MDC>,
> +			 <PIN_PB0__G0_MDIO>;
> +		bias-disable;
> +	};
> +
> +	pinctrl_gmac0_phy_irq: gmac0-phy-irq {
> +		pinmux = <PIN_PC1__GPIO>;
> +		bias-disable;
> +	};
> +
> +	pinctrl_gmac0_txck_default: gmac0-txck-default {
> +		pinmux = <PIN_PB1__G0_REFCK>;
> +		slew-rate = <0>;
> +		bias-pull-up;
> +	};
> +
>  	pinctrl_i2c10_default: i2c10-default{
>  		pinmux = <PIN_PB19__FLEXCOM10_IO1>,
>  			 <PIN_PB20__FLEXCOM10_IO0>;

