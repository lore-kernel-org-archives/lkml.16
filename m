Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FC01EB5D9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381847; cv=none; b=pRjHq/d+be7w8ZSmOjc5K/P3HLVEksB5w57y0m6C+we3Q3+3X+TnRtmNnhWGTQXcbpLKvg82IyCoxSaVdgL1lCD+S65vxgB6IbCNZy4mxEYccPgyNtDpExMP5r0d0s0rwehv1DGX06pPEUh4PhIo6xQlW6slDUZVB5e812yyc7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381847; c=relaxed/simple;
	bh=ECPVQZbpGQ1Igimn7f7XHhB52v/Enkp/cffCovYhFNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lj/dZkBVFcI93zljch7jymac0tm9nBDCY9sjoQGNfAZcp64yhCK1oopdVS5WbWU81Cig2tybG5cVcTOR6Ex2qreoJXBKobnEJq10bWjegWiduT9/QRcYsaFqngr1AKgC6v8TdH81IUM+Fpp1mTg0vSjh9ubq7HBGB2WzuVGazvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pR2HMHqG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pR2HMHqG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso11309055e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744381844; x=1744986644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ycoLQD9jfqJEzFVkDVUgdOPCxS45bX18gNlDKBK7d6s=;
        b=pR2HMHqGllZ1C0W+I/aJT6pfgWJgE9F+tscCFFTfhyPcobLb40o+I08E1YP+9JGRkK
         UvSUlSfwIVgvv/HV+u54mmYAhhf2dnoZAzS6xLXe9qSET/lAa4kvbouF1yuBNaxd1wN+
         Ks3JZr7wuc+ljuboMnO2QP3zF2WtQxZQ8iP0F70nYQhz5i+HHKsqJYhl9X6chJ7jW3cX
         kQedcrYHwtk8COTdw6fNCHPk9APXc2UnB8toyNmIWEEQA+FlqQ67Gt2N38wzSv3UD0OB
         ipN7c0OgZgk8sgK7HXoXNwnphc+cBdePuNXP/Tx6XxsaHqTpVaBb2JZqk8Jlyt+nM7o1
         x7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381844; x=1744986644;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycoLQD9jfqJEzFVkDVUgdOPCxS45bX18gNlDKBK7d6s=;
        b=lHykh9+rlywrI1t8D2onQPzrnogt4GGPDQF0uBh5LHp6ew0JhVroAZlcXQ7qr6bkHN
         67w5uG6m/nCyNIJxXuA4A2rCrJED/E70RKIngpINUIP3eVbuxQC18jgPcNfM2NfDwLrg
         uCkj5LjvBfqsObGNwcvNmLjoHakxfQKZ6qbd3s+VEJMqHQJL3JbSJJ2aXANb8fESPN2l
         T4iw8pVZ38ciFmWnSuchZ5R21eTAUvPKZLrvpBQh2juy622soB1brHPJZmcv/7aVYm4Z
         kRf9QK0de2HeXLmoBaUpvC6LPhm1OLuZz52v6Qp8HicQ9c5C6tAuDlcJzsCAwqRrtT76
         P+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpv90jwDkuB+hOaaU6uI9zP5P32/paPrmiSWe4Qyv4tCh8yUSD0Z/j/I9rEVwRYC0Ce679qTERFnEXXgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZb7qDJcVil1fo4MFHmVY6U+A45Lzvmia7JnuhMQCCYlBRbkwC
	uFfuvBwUic1GCEEk19UAsULoyrOcyUeTElYRUzkfuXMFiSsZFjHeJxb6jGJDfmI=
X-Gm-Gg: ASbGnctTrV5VeurGYimbTR0uFetm2JN6k0DfFmIfuQNTIFjkQw3ui4ZC95yZ+MoxLPj
	URYqaHUUV4hjqnxxO1ZCGKazfTbJvZp1E7vWTbazrnP5BaOpkXdRJjJu47uP03b0ztUMOgPrkeW
	MaEyrzN8CqjaUoKwH9VXxyJS9B6T2MuyBfVHJhaLYYZpP2nB1CtL1CJtIfkO3vY4432+++bt6G3
	YAjoJXFPVHCngZLaiktrVv2atD/d0iBrGofLUb7NYYUMdX32gnE5LXeGTaGrAbDyDZy9frcvqke
	RKeuiUEMw+FY3EjegTGr13xeCsToi2K12R8dg8wzTuzuU76g
X-Google-Smtp-Source: AGHT+IG9KQqbQeJI3TgkREXxzGXE7lhS6pak+H/rKFHdsabVkH8R63JSXWChvAVJyUcLu4rOG+zckw==
X-Received: by 2002:a05:600c:5107:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-43f3a92552dmr24937985e9.6.1744381843883;
        Fri, 11 Apr 2025 07:30:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c81f6sm84049845e9.20.2025.04.11.07.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:30:43 -0700 (PDT)
Message-ID: <6e52883b-2811-4ac2-9763-5974ca463274@tuxon.dev>
Date: Fri, 11 Apr 2025 17:30:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ARM: dts: microchip: sama7d65: Add MCP16502 to
 sama7d65 curiosity
To: Ryan.Wanner@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, onor+dt@kernel.org, alexandre.belloni@bootlin.com
Cc: nicolas.ferre@microchip.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
 <60f6b7764227bb42c74404e8ca1388477183b7b5.1743523114.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <60f6b7764227bb42c74404e8ca1388477183b7b5.1743523114.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 01.04.2025 19:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add MCP16502 to the sama7d65_curiosity board to control voltages in the
> MPU. The device is connected to twi 10 interface
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../dts/microchip/at91-sama7d65_curiosity.dts | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> index 441370dbb4c2..81abc387112d 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -30,6 +30,15 @@ memory@60000000 {
>  		device_type = "memory";
>  		reg = <0x60000000 0x40000000>;
>  	};
> +
> +	reg_5v: regulator-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5V_MAIN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
>  };
>  
>  &dma0 {
> @@ -99,6 +108,132 @@ channel@4 {
>  			label = "VDDCPU";
>  		};
>  	};
> +
> +	pmic@5b {
> +		compatible = "microchip,mcp16502";
> +		reg = <0x5b>;
> +		lvin-supply = <&reg_5v>;
> +		pvin1-supply = <&reg_5v>;
> +		pvin2-supply = <&reg_5v>;
> +		pvin3-supply = <&reg_5v>;
> +		pvin4-supply = <&reg_5v>;
> +		status = "okay";
> +
> +		regulators {
> +			vdd_3v3: VDD_IO {
> +				regulator-name = "VDD_IO";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-initial-mode = <2>;
> +				regulator-allowed-modes = <2>, <4>;
> +				regulator-always-on;
> +
> +				regulator-state-standby {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +					regulator-mode = <4>;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-mode = <4>;
> +				};
> +			};
> +
> +			vddioddr: VDD_DDR {
> +				regulator-name = "VDD_DDR";
> +				regulator-min-microvolt = <1350000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-initial-mode = <2>;
> +				regulator-allowed-modes = <2>, <4>;
> +				regulator-always-on;
> +
> +				regulator-state-standby {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1350000>;
> +					regulator-mode = <4>;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1350000>;
> +					regulator-mode = <4>;
> +				};
> +			};
> +
> +			vddcore: VDD_CORE {
> +				regulator-name = "VDD_CORE";
> +				regulator-min-microvolt = <1050000>;
> +				regulator-max-microvolt = <1050000>;
> +				regulator-initial-mode = <2>;
> +				regulator-allowed-modes = <2>, <4>;
> +				regulator-always-on;
> +
> +				regulator-state-standby {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1050000>;
> +					regulator-mode = <4>;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-mode = <4>;
> +				};
> +			};
> +
> +			vddcpu: VDD_OTHER {
> +				regulator-name = "VDD_OTHER";
> +				regulator-min-microvolt = <1050000>;
> +				regulator-max-microvolt = <1250000>;
> +				regulator-initial-mode = <2>;
> +				regulator-allowed-modes = <2>, <4>;
> +				regulator-ramp-delay = <3125>;
> +				regulator-always-on;
> +
> +				regulator-state-standby {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1050000>;
> +					regulator-mode = <4>;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-mode = <4>;
> +				};
> +			};
> +
> +			vldo1: LDO1 {
> +				regulator-name = "LDO1";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +
> +				regulator-state-standby {
> +					regulator-suspend-microvolt = <1800000>;
> +					regulator-on-in-suspend;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vldo2: LDO2 {
> +				regulator-name = "LDO2";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <3700000>;
> +
> +				regulator-state-standby {
> +					regulator-suspend-microvolt = <1800000>;

I can't find the schematics for this board. Is there a reason for keeping
this @1.8V in suspend?

Thank you,
Claudiu

> +					regulator-on-in-suspend;
> +				};
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &main_xtal {

