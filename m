Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68810221F15
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749296631; cv=none; b=ejJRt4PckMHJFYvCXKaUQ0EglOUkWMXeJFJwrfK3Sfeopz3Yac+J/AxyA5256rGik5V7iR1se4T9+0yX+tbOahHndFAfRyLP5c98s3Q3GP1rWFLVkwUzYB6fkbFauBf5v7Wis1JgcIMyIRcNrzFC7cskk46MJDpIXQFjXt/gGNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749296631; c=relaxed/simple;
	bh=Hr7zzO5u1HM7uacO7vS/tAbaVq9gIsvoN/ixGSB5p38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVC+y6lJ474265XLZo+pVPt/EDa1whi6GWhJrUXfowFuofXtKEaRNkfeS2dhCqrp6fgD/yywDsm5WIky8G4nKFWdPpUPnW38twQRDkaIm35dJbxYfA6RBjY1WHb14HaCXDDOX64bfCgS3aYHZSK1PuCum61oX93Fmy5RUsp3NiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AF1IEvsp; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AF1IEvsp"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad883afdf0cso554638866b.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 04:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749296628; x=1749901428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5GGyL7EzSr6uUL04LjmQHJjuAFms5UHsKE4WRS6HTc=;
        b=AF1IEvsp30LBMa5o6P0EoOz0Fi4upwnRcauDPjq0OJI4vfK2nU4FbcUCxJ6l7/76XP
         9EneI+sO+tQyuW4LwM/TrEvb+jeyx0NCdzP/Hu1nA6PBA+25hUYyY5hHrSI8zT6uB8sE
         RKLQ/HqYt9WEaIg9Gi7oHNBoIEOsdpX2JwLzx3g/JJ6qHDg7HGN0f7tLwC4Mv8Pyz0Qz
         /AgCybJVy7LIAt55ObA56i34GPXBdp7J3/qxiT1PRAP1sNYl6cglXd1Va/xxwOAcvUlW
         xY8SbybB8lmfeXcGPjJsSuI6+S4lp5Hx666toWcnhYwJYfl2y50BHZ9cHbpniS70yI2X
         6XIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749296628; x=1749901428;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5GGyL7EzSr6uUL04LjmQHJjuAFms5UHsKE4WRS6HTc=;
        b=wv3VbXPnrJdrMChGSwFPxdpnS2esHxvKYinZGt/bTtrsieLqW5weKjMruFcAWBqijn
         VVdNJ7ikUzyb8KHE5ozL6dQPAoeK6e3RglKY8zZpijnUq5KNEGuA8Q4swBSdDivp7tuZ
         vGPsYMkrU3dgdZpFzTG/ldzP5kV2CznRWXi9Jw2mL/2UevjYK9fURmXemqYxFSTcK3CD
         KTYDeoj69myL23gtscb44Ml646kspXOgDWJpwZOqGjq7aMK5tHD0iZVcHtBAR/8vHCou
         QmLXeMAVtLJ8B+oeOkm9206Lwhqq6rgTL3R2wikDfJtrlHzOsM/lu3oNIcacdAzy461e
         WYGA==
X-Forwarded-Encrypted: i=1; AJvYcCU5JlBrcX1VQDI/uFwHS8/uT5pSHwznqlKYU0iBeGutz1/Q3yhJUBeLQiwJNFMyeAGw5JPPYxNgKaEkJSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOw/otCWpkYdbu9WeV3ypUXWUucPv8t9MizxACaggDtbdfVljE
	zb5NdOLElHKKK2LW4tWtlXrHjuiyCRPFZWkjv2TzkKwOwfz/05akPjKNQuMFHAW4y5Y=
X-Gm-Gg: ASbGncsT9GKr9OWbiSlRXRc7/C/3uowjuSQ38csRHrv6suMZq069xInJLL+FHKR5l+3
	QUcmCln/EMej1xTJR+R7k9HZiN7afcX/E/eCY3kzfGN+f+od4UmUBpIE5WGdvz2f1htjb81r2eU
	D5OovA/fp6S9Bh5OyeYw86EfYDBgiVemV6aEIGyH0XMG7BsDjwZcHTG2AvXvauRlKScv9Ldq6qK
	7w3jXuMMhiHvD042BF6BRMYcqV7PCLWhvNMwqFN4jggXds0+JiKeqZZFRYDE3rZkk6O+TRo+8ke
	9jfS2qvAHmceoNoE+g6aHgGzlc3ww2XVfErDqL2d2rCTJa3FjY7gPcS6GUR2zaof5tgF3kA=
X-Google-Smtp-Source: AGHT+IG0eKeJpSoGWhm3EaDe2FVgK1ogPyIyd2nQfnfeftyiPLFYH1i76vcoPxnUODVZD6ioAN5T5w==
X-Received: by 2002:a17:906:7953:b0:ade:8df:5b4e with SMTP id a640c23a62f3a-ade1ab32de0mr529784366b.60.1749296627695;
        Sat, 07 Jun 2025 04:43:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade44af8215sm68237266b.15.2025.06.07.04.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:43:47 -0700 (PDT)
Message-ID: <201c7188-eaf7-4492-84a6-66d839062d8d@tuxon.dev>
Date: Sat, 7 Jun 2025 14:43:45 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] ARM: dts: microchip: sama7d65: Add CAN bus support
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <445c4c72243f1ba85e3681ba026cfefaf6036890.1747077616.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <445c4c72243f1ba85e3681ba026cfefaf6036890.1747077616.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12.05.2025 22:27, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add support for CAN bus to the SAMA7D65 SoC.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 80 +++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 796909fa2368..a62d2ef9fcab 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -163,6 +163,86 @@ chipid@e0020000 {
>  			reg = <0xe0020000 0x8>;
>  		};
>  
> +		can0: can@e0828000 {
> +			compatible = "bosch,m_can";
> +			reg = <0xe0828000 0x200>, <0x100000 0x7800>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 58>, <&pmc PMC_TYPE_GCK 58>;
> +			clock-names = "hclk", "cclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 58>;
> +			assigned-clock-rates = <40000000>;
> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			bosch,mram-cfg = <0x3400 0 0 64 0 0 32 32>;
> +			status = "disabled";
> +		};
> +
> +		can1: can@e082c000 {
> +			compatible = "bosch,m_can";
> +			reg = <0xe082c000 0x200>, <0x100000 0xbc00>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 59>, <&pmc PMC_TYPE_GCK 59>;
> +			clock-names = "hclk", "cclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 59>;
> +			assigned-clock-rates = <40000000>;
> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			bosch,mram-cfg = <0x7800 0 0 64 0 0 32 32>;
> +			status = "disabled";
> +		};
> +
> +		can2: can@e0830000 {
> +			compatible = "bosch,m_can";
> +			reg = <0xe0830000 0x200>, <0x100000 0x10000>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 60>, <&pmc PMC_TYPE_GCK 60>;
> +			clock-names = "hclk", "cclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 60>;
> +			assigned-clock-rates = <40000000>;
> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			bosch,mram-cfg = <0xbc00 0 0 64 0 0 32 32>;
> +			status = "disabled";
> +		};
> +
> +		can3: can@e0834000 {
> +			compatible = "bosch,m_can";
> +			reg = <0xe0834000 0x200>, <0x110000 0x4400>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 61>, <&pmc PMC_TYPE_GCK 61>;
> +			clock-names = "hclk", "cclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 61>;
> +			assigned-clock-rates = <40000000>;
> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			bosch,mram-cfg = <0x0 0 0 64 0 0 32 32>;
> +			status = "disabled";
> +		};
> +
> +		can4: can@e0838000 {
> +			compatible = "bosch,m_can";
> +			reg = <0xe0838000 0x200>, <0x110000 0x8800>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 62>, <&pmc PMC_TYPE_GCK 62>;
> +			clock-names = "hclk", "cclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 62>;
> +			assigned-clock-rates = <40000000>;
> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			bosch,mram-cfg = <0x4400 0 0 64 0 0 32 32>;
> +			status = "disabled";
> +		};
> +
>  		dma2: dma-controller@e1200000 {
>  			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
>  			reg = <0xe1200000 0x1000>;

