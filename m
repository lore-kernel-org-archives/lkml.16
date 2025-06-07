Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C2220F37
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749296662; cv=none; b=s+0ucD4htx2RJGMpO3se4NR0jNnc6B4TnZAxVtEzZMsC/vdDcAxvVVaUOqQ2umDIp6MqbLVrNjkWtF/5BMuDfgFwGHJZ99iqxnczKLjKD/BrWW89HLkZs4tGMprGzPDdAKZclVP1mm9w75cOBsmYfm/g08eK16Kv8nFLoljH+kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749296662; c=relaxed/simple;
	bh=gv0tMOWwWLz9TNHcfO9BCckdP/os8K0yPX8V/NxNjNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJvyiVaMCOIoRghEAxMqzs2YrPxhIF9Lj3FzrU9Kww8s6tawHMC4i0+GkohEbTJiAnjR1CPPYIR+ubSJuzSrebAS6TGeeiCHEq3d1Km0j4/xuhMgsGii+fEDnFtZb08gSAJ1NV+nj/h3ogng51HGI+MKIAtGUUMZ75Wvd4STY0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=i4h6b5Sj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="i4h6b5Sj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-addda47ebeaso559226266b.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749296658; x=1749901458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UymOFrjabx3ry9XfCk+Bu/z/xm63u4bINQR9bUcHuP0=;
        b=i4h6b5Sj1/YxVOjsQpWrQtiCtX/BGlwKU9/b/q6azV5AdMlEYDWzNLz1EkCW4FjZth
         gaWuXsQzF1smqwdbyx0HC+6oYmwYmtkk6geJFzhI/gqy5I2uiERo0uHu2bvtRDjaUbcA
         blUjLMdow0fM8qt+yIdPUoA023Bb6R7kYtRAdz1uAtUKO1jz7MX7e6NP2EM6BVbmqXjI
         Yihd8/WLrq2PbkKG79xt2GxYzAJEH0fZkQ4zTzi4zssEEL2dLomWETMGWernt69AOk0/
         l+NRhwR1HrTJ6hbJLlFHNWohCyhCDiQPdO5OuhpvaYmaD4Go7xaRU3PB1KBI6lEzVS4H
         xxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749296658; x=1749901458;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UymOFrjabx3ry9XfCk+Bu/z/xm63u4bINQR9bUcHuP0=;
        b=WHU1oN7dbw7dJtpsou9KYflnyzm0BSmHfjLUI2F3A/LZOAN+/4GwWG0j5V3jhkVh2L
         JWYd0OPpBgOmA5ttoLm8aRPhRGsUiVC/An/6ooAi+ClOJo0XMxS1pgU1b94YXRVzlEB/
         PPFDSZ7TmXD4dgie0ZJbNx/quM69gzg63nsAZ/Jp+rHwYE3iIdMlPYRPI2jL90TPah8B
         Pie2cU3gMxWaMYO7fIUl9NisjIfFbBuSeZvVW79VWZpbB+XePXi/iMwly9SXxKaPE9yP
         t+8ZqCJz7R2jlQHGDbzPi/fvBnYuCuBpJcRcJw7gVvfYn5ks/OZTsV/eeksWsBW3GGd3
         PO0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhFfJFrx+EQIZ4R+CQhf5zxBvb9+EQAsAZ9jhFBlf6MGB1xXmLsDd95PXXMImYKZPCebhQDoX4W4dRALg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDssHPd3Shuf+v/zJphny33lPtWss6HjWTRzGXkGzwanvmI/J3
	c79/cCO22//4CKU1TlxdwYdu7ndoioJHkPRI16wTCum3CvLMkmY8xsSrBmlZrLFXLac=
X-Gm-Gg: ASbGncsSC1HT2a3d6VZysAJ5t1HeNN+n77nbssxAElPDw5cwLltGieESf4Cv8FphzaP
	S6d0us1QTp/TLn3U8pGrU/4GO6JHSUaZFx9VSdXWfpl1pxIuLgPpU8jaBSELlbsu14/SQ3dxeRo
	yRcFo8hnF+1etWQsSjEZu62EQIpjgHkCgSnlcMDNjyUqPbTDFYVBpdro+exl1zQ9SVGkFO1uA1X
	k66aD1txTji2RibODDu8k9Ek+Se+WoMgKR5GeVbPkJUEQrDUWiwBk/Yatocu3TI7S+fsMx31UsK
	gpaiDuRPR/UAUlcrbdqMgmnB+ca0VebYrZnX6Fqbbbh7+DaZj3dk01YZeHbS11nEaJT8ISU=
X-Google-Smtp-Source: AGHT+IEA1Rq7VWwYJS4G4kmb+z0nn7gMvEpZQk2GAonFxGlvr7kubnoaKOkM5BseiEpQ88K45+xR8A==
X-Received: by 2002:a17:907:9713:b0:ad8:93a3:29ba with SMTP id a640c23a62f3a-ade1aa06c53mr606411166b.17.1749296657956;
        Sat, 07 Jun 2025 04:44:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d5f9b37sm264185666b.0.2025.06.07.04.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:44:17 -0700 (PDT)
Message-ID: <9391cd59-b23a-4df0-9799-e9766adac460@tuxon.dev>
Date: Sat, 7 Jun 2025 14:44:16 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] ARM: dts: microchip: sama7d65: Enable CAN bus
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <0e34e0416c43f4de6d2cef5cea46087af4577a50.1747077616.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <0e34e0416c43f4de6d2cef5cea46087af4577a50.1747077616.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12.05.2025 22:27, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Enable CAN bus for SAMA7D65 curiosity board.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../dts/microchip/at91-sama7d65_curiosity.dts | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> index 53a657cf4efb..34935179897e 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -38,7 +38,24 @@ reg_5v: regulator-5v {
>  		regulator-max-microvolt = <5000000>;
>  		regulator-always-on;
>  	};
> +};
> +

Please drop the empty line in a different patch.

> +&can1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_can1_default>;
> +	status = "okay";
> +};
>  
> +&can2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_can2_default>;
> +	status = "okay";
> +};
> +
> +&can3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_can3_default>;
> +	status = "okay";
>  };
>  
>  &dma0 {
> @@ -278,6 +295,24 @@ &main_xtal {
>  };
>  
>  &pioa {
> +	pinctrl_can1_default: can1-default {
> +		pinmux = <PIN_PD10__CANTX1>,
> +			<PIN_PD11__CANRX1>;

The "<" on on this line would have to be aligned with the one on the
previous line. Same for the other places in this patch.

I can address all these minor bits while applying, if any.

Other than this:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> +		bias-disable;
> +	};
> +
> +	pinctrl_can2_default: can2-default {
> +		pinmux = <PIN_PD12__CANTX2>,
> +			<PIN_PD13__CANRX2>;
> +		bias-disable;
> +	};
> +
> +	pinctrl_can3_default: can3-default {
> +		pinmux = <PIN_PD14__CANTX3>,
> +			<PIN_PD15__CANRX3>;
> +		bias-disable;
> +	};
> +
>  	pinctrl_gmac0_default: gmac0-default {
>  		pinmux = <PIN_PA26__G0_TX0>,
>  			 <PIN_PA27__G0_TX1>,

