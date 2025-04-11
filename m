Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA69D1F3BAA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381749; cv=none; b=Vzk3F9hKVMQuP3M7rN6qIVlg39dsoDtR8X/2lLayv4KARXXgsDuq1TiCBpE2ovusZzFfxJt10U3fIeg/6yYgUo9s/12rgSVqRK5i0fnsX8gQMpFAeeJ6xVgvabUuEnJ3S074EDI1qV0ewVR+VusQecN/Cx3L6siORYW3tiHl3tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381749; c=relaxed/simple;
	bh=bhizy26eG/So0sRXK/OKdBRBEZzylaC/kbJZbrp/KY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fRRNJ7mXvF0CE25lZMMSMIgoTlyawBtPdQHomwwOAqmJS6biUgG29YRRnaLrpkWTLRLIgPDdwUoo0m4OKZakLPw3VsPzMvKpXzg/zVfIyiNmBGbwE3muElnSyRO4mVLyr1zInckhDqY6SKr33DTIeha5Ts8x+lbIdx5aYcnNXrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VtqG51qG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VtqG51qG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso18670015e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744381745; x=1744986545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDVClodjbP7WgqfOUXGhJYRlrZjTGCEuJa62uKxhb0I=;
        b=VtqG51qGVYEdxFLFveN+0VRtV0vo109SXrLlySOW/Tt82xHJuYP/weBDmQX2YtSOYr
         2KWk0wAMHkaYFj8QnkPnTtAbEqrbOsErrcsk1BlU/RnQ5KtDxqKSQxJb4l7dqh5ZM/eO
         s2esx5zOY1Bj1MxawAAFBK0JL68HbltyEtPKrEAlKHv1c06U1HjzD/MUco65nWbT/gjk
         UIkTpXh75XkQnqkgf6yXehxRKMgxsCi5FMfYWHQmNR/X7LzvO6Ztq3dzOMQdriYyJMNp
         9APNwtIoNSZxjfHqfSbB3KbM1m91uIoVudMMq9vbDkI5buoP0PZFLJhym0ofQgsCUO3A
         wGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381745; x=1744986545;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HDVClodjbP7WgqfOUXGhJYRlrZjTGCEuJa62uKxhb0I=;
        b=Cq0MGo9crxiVbmWXu9f+FiaR2sNxldnROoEkIFcwmqcy5HNo9TaJYW6Vlk4Aq9IvUH
         Nc7yI9+56linGMNE58KyMb/1/Q55pKMYZxHfiPIOF0i+DPBHvqxFcUfNK1apw6dKjWsJ
         aRjwYTN3r5UiNdfsz0mO/kFI2agooDe87kcP6u1xK96g+BoAN6KMUvI7R2dGlv2G/idy
         uxD9PAmvI9UCvi0cDoU54LeIhjxWdm+K8duaBmBdafbr+JwsMlThehWaqK9BuvG4bgry
         8LAnQ2cAQxfMEaXNY1Zv6JQIJAaEFnfZaU1MGXI4hp8Q4e859BfYlGEjRl4W797halKv
         +EyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVALMtTwhBFfGUz1gzO4Q/b8FVeYwTtrr0j78MqcEffwzkEasxr4998EbSUitkFV7dvYi8KBGMWRRY98Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5R6zcH8iVzUfvtRqIaunGoso/58OLeHT1PqxoL4gndaSFnfUs
	flAuv6VoKzBLt0lO8nkToubpna88halLBVtJsAfZ6U/1eBb9v+zB6YSLgrJxEMo=
X-Gm-Gg: ASbGncuvHUvsV5Wyev072Cwp4KkPI9Ii6TH75vYJ07v1HXLmg1lWilZ7XL7mxIB7jvR
	YejsRVLZvE4YIwigAZcW3yoso2w6Iikohvf9YZ6dznLKScOeuCIr8LSKGIWhObV0RGqJPdz0CwY
	L8k625pGXppHZHtgAxKKHPDqQWOsPlMHqv3ZnvhyyEP7y4uPnFjI7M4KUFXvMgjZar9fzlYNkT9
	zI4MAP2GNhdu3ql1585oHevlSSxPI9lGnyLltLIg9gmumEFtyHhFAXQqTdV7UiurwOi4ED1LP9a
	ol8qv/89jKbMYHixg1jg2lvhlJh7l74Y6nyC+Dk6VJODmFFL
X-Google-Smtp-Source: AGHT+IEMd+8lqysG6izH7R/apKkjPjImt5zgqWC5HaUT+WT21VIlA4YDnTZixy/Lp0r7GGgQ19nKwg==
X-Received: by 2002:a05:600c:4f45:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43f3a959a54mr30766125e9.15.1744381744274;
        Fri, 11 Apr 2025 07:29:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d757sm85173315e9.5.2025.04.11.07.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:29:03 -0700 (PDT)
Message-ID: <e59df78d-6dcb-430a-bec5-c1e47f3b3b55@tuxon.dev>
Date: Fri, 11 Apr 2025 17:29:01 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ARM: dts: microchip: sama7d65: Add FLEXCOMs to
 sama7d65 SoC
To: Ryan.Wanner@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, onor+dt@kernel.org, alexandre.belloni@bootlin.com
Cc: nicolas.ferre@microchip.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
 <d474fcd850978261ac889950ac1c3a36bc6d3926.1743523114.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <d474fcd850978261ac889950ac1c3a36bc6d3926.1743523114.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 01.04.2025 19:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add FLEXCOMs to the SAMA7D65 SoC device tree.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 267 ++++++++++++++++++++++
>  1 file changed, 267 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index cd17b838e179..9f453c686dc6 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -217,6 +217,199 @@ pit64b1: timer@e1804000 {
>  			clock-names = "pclk", "gclk";
>  		};
>  
> +		flx0: flexcom@e1820000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe1820000 0x200>;
> +			ranges = <0x0 0xe1820000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 34>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			uart0: serial@200 {
> +				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 34>;
> +				clock-names = "usart";
> +				dmas = <&dma1 AT91_XDMAC_DT_PERID(6)>,
> +					<&dma1 AT91_XDMAC_DT_PERID(5)>;

This here                               ^ should be aligned with the "<" on
the previous line.

Same for the rest of dmas on this file.

> +				dma-names = "tx", "rx";
> +				atmel,use-dma-rx;
> +				atmel,use-dma-tx;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
> +				status = "disabled";
> +			};
> +
> +			i2c0: i2c@600 {
> +				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 34>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(6)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(5)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx1: flexcom@e1824000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe1824000 0x200>;
> +			ranges = <0x0 0xe1824000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 35>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			spi1: spi@400 {
> +				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
> +				reg = <0x400 0x200>;
> +				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 35>;
> +				clock-names = "spi_clk";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;

Vendor specific properties should be placed at the end of the node.

> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(8)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(7)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			i2c1: i2c@600 {
> +				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 35>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(8)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(7)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx2: flexcom@e1828000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe1828000 0x200>;
> +			ranges = <0x0 0xe1828000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			uart2: serial@200 {
> +				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
> +				clock-names = "usart";
> +				dmas = <&dma1 AT91_XDMAC_DT_PERID(10)>,
> +					<&dma1 AT91_XDMAC_DT_PERID(9)>;
> +				dma-names = "tx", "rx";
> +				atmel,use-dma-rx;
> +				atmel,use-dma-tx;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx3: flexcom@e182c000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe182c000 0x200>;
> +			ranges = <0x0 0xe182c000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 37>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			i2c3: i2c@600 {
> +				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 37>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(12)>,
> +						<&dma0 AT91_XDMAC_DT_PERID(11)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +		};
> +
> +		flx4: flexcom@e2018000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe2018000 0x200>;
> +			ranges = <0x0 0xe2018000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 38>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			uart4: serial@200 {
> +				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 38>;
> +				clock-names = "usart";
> +				dmas = <&dma1 AT91_XDMAC_DT_PERID(14)>,
> +					<&dma1 AT91_XDMAC_DT_PERID(13)>;
> +				dma-names = "tx", "rx";
> +				atmel,use-dma-rx;
> +				atmel,use-dma-tx;
> +				atmel,fifo-size = <16>;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
> +				status = "disabled";
> +			};
> +
> +			spi4: spi@400 {
> +				compatible = "microchip,sama7d65-spi", "atmel,at91rm9200-spi";
> +				reg = <0x400 0x200>;
> +				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 38>;
> +				clock-names = "spi_clk";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(14)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(13)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx5: flexcom@e201c000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe201c000 0x200>;
> +			ranges = <0x0 0xe201c000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 39>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			i2c5: i2c@600 {
> +				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 39>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(16)>,
> +						<&dma0 AT91_XDMAC_DT_PERID(15)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +		};
> +
>  		flx6: flexcom@e2020000 {
>  			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
>  			reg = <0xe2020000 0x200>;
> @@ -238,6 +431,80 @@ uart6: serial@200 {
>  			};
>  		};
>  
> +		flx7: flexcom@e2024000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe2024000 0x200>;
> +			ranges = <0x0 0xe2024000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 41>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			uart7: serial@200 {
> +				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 41>;
> +				clock-names = "usart";
> +				dmas = <&dma1 AT91_XDMAC_DT_PERID(20)>,
> +					<&dma1 AT91_XDMAC_DT_PERID(19)>;
> +				dma-names = "tx", "rx";
> +				atmel,use-dma-rx;
> +				atmel,use-dma-tx;
> +				atmel,fifo-size = <16>;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx8: flexcom@e281c000{

Missing space here -------------------^


As these are mainly cosmetics I will adjust while applying.

Thank you,
Claudiu

> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe281c000 0x200>;
> +			ranges = <0x0 0xe281c000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 42>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			i2c8: i2c@600 {
> +				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 42>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(22)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(21)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx9: flexcom@e2820000 {
> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
> +			reg = <0xe2820000 0x200>;
> +			ranges = <0x0 0xe281c000 0x800>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 43>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +
> +			i2c9: i2c@600 {
> +				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 43>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,fifo-size = <32>;
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(24)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(23)>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +		};
> +
>  		flx10: flexcom@e2824000 {
>  			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
>  			reg = <0xe2824000 0x200>;

