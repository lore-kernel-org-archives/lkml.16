Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE1C2459CA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141040; cv=none; b=INKSysIzRpW+P9fM+jpHZuozoQGydAoTx8GE6bxzGfwlTVwuLK9AkvpnydiZTZWHzjoM+VOunmkeqjyzi4gNz/i5wBV6X/FMCsjAts6SM9LRK3slWXmt02zTe0MEcmb+tEJbZMYd8xUlDcymLZKPQiohXuYOry0+flfjd9X1lC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141040; c=relaxed/simple;
	bh=+wJ4mtvJxQV9Of78o4z8T7h5OkoJVVwCiX/s4mTYqrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bb81+fzzQSAYmNzMjpXN4EFI2GAREx+HXP2u4r0hy4AIk7R7DbI05xEnEixUz3fOaUSOdMI/kScXjaKKAdCzUMXCQ4on9ndTEACyanxpC4pzVBe3bzkjfkdJacNdrnPY30SIDHXjqF/aM4jGdfV88PKsao/cmYMhUG7TP+l99ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tJSQbImF; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tJSQbImF"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso57538045ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141036; x=1744745836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAVmmFMqgEQoM9IvKCTi8ICmk7vPzjaIgXMu93/RPNo=;
        b=tJSQbImFSVijnCLVvmFWByGkbQKO16KHNv/e26jfTckNDUccna+3dGH7ij5RUNesrc
         fA6S9ms64tQZqARKidYYl4bP9qvD7+BCLbQ/tAdwpSCPdRYfEhlbyHb4sF8jkjLaOcGF
         MeMnHUXzbl3aiDdxbo2tVaAATyBn/3yp6eGEpqf3uwc0lSe9Zka298t6mAKOA+/99vn+
         enMARJqZ8rAe6eXKuFyv9wQZC2JPONLD1ciGFHKodXIg36M592xJhaDpppU0mJwK+VD6
         d5+bvXR4HZJAYeW1eNqAv3W7SApOKnaI4/77IlFv2U4dLVzVyK3LQq1T9u/U8N5EOosf
         2HQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141036; x=1744745836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAVmmFMqgEQoM9IvKCTi8ICmk7vPzjaIgXMu93/RPNo=;
        b=BkT3Pk+TMXWrpx3GzkpodfBBvSudwsMaoYgsR4CSlF5Y8rvX5xMzD/DVsAIKhGVdqP
         5KYzZdcoW13QnwocjZsvvox2MyZFvcC1VQQLVTIaTJiS86qHQPotcqDJmuKFeKjH1KOf
         ZVMSt7pGbQuKKRxBBQDQIF52y9HrvwFEGUbqjSSllem3IYY1x5kv70C806Yte57EE+QC
         xR1C+tkeH+nvnKnDuToRASKenNROThR/5UnnVCk42VdzeZTOkZWvtz+Kbhqidw263o5W
         qUmVXyXwTUutf2SrvLUrMee6iRRA2xQtnl2P422Zlta9vvNssEuOWVNAeHP3jyIOeuAG
         sKxg==
X-Forwarded-Encrypted: i=1; AJvYcCX+OZSVySfOIWRiAwOCwBsTcSLvxfY4zhBzzvjwoCAe8VX7kiw/0Fb1ogPv7BvKPnu7GrRcLwZ0wzPZBEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvubU0RDrXigmLed83s2UUWQogfO0kc7LqrP1F/JCL7Nhh4Mzd
	aYFsMvAZ5MKc9Vd2IVOWEuRwJuyNrcDVq3Goh2k051R2h0Dk2+g0WMopU8NxqaQ=
X-Gm-Gg: ASbGncsqB8AxYGQxY+mlllRMCXMkpgAZfAtiareQa+p1CVWjI0gNPwglW/r60iDduGx
	HnYYVisLLSsuimPelvTi6/S4fKaVLnLvUyfebFreasi5owWvUpafHfQa/GnuWPa2STMszYpEl7d
	Ui0h6PffDxC/jssJOBG2w92oMU8LjWnf1SR25hE3TVcCYlaYf9ZMhh/e01eblzeZFyBgf0NEsV4
	D1tvSwoWA2HoGmlS+jUXZSuoIl4UbU6FiKm0Tq0lK0fIcwJA6NfDc0AlKFGsDPKZo/w9GWpF9Xy
	bnVYYk9gJ7XIH0mxPMfhWE022fZ8zxaMo/8uGp3g2Ts3VfZCRJvOHyekZu4vGzaDkj9mGthDNwE
	5QJY0+3S1
X-Google-Smtp-Source: AGHT+IGulyQQjReVRnDuoSM8kxZarQuWui0Km//IJmjaSJXFEscRj7yZa06+RRBFm+gIsw8pskJdLQ==
X-Received: by 2002:a05:6e02:1487:b0:3d2:b509:af44 with SMTP id e9e14a558f8ab-3d777165920mr2598035ab.8.1744141036387;
        Tue, 08 Apr 2025 12:37:16 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e3aa0sm653506173.126.2025.04.08.12.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:16 -0700 (PDT)
Message-ID: <6a1a8470-0dde-4fe5-96de-810af39686d1@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:15 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-2-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-2-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 12:24 PM, Haylen Chu wrote:
> Document APMU, MPMU and APBC syscons found on SpacemiT K1 SoC, which are
> capable of generating clock and reset signals. Additionally, APMU and MPMU
> manage power domains.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I think you could update your copyright date, but otherwise
this looks good to me.

Reviewed-by: Alex Elder <riscstar.com>

> ---
>   .../soc/spacemit/spacemit,k1-syscon.yaml      |  80 +++++++
>   .../dt-bindings/clock/spacemit,k1-syscon.h    | 210 ++++++++++++++++++
>   2 files changed, 290 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>   create mode 100644 include/dt-bindings/clock/spacemit,k1-syscon.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> new file mode 100644
> index 000000000000..30aaf49da03d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 SoC System Controller
> +
> +maintainers:
> +  - Haylen Chu <heylenay@4d2.org>
> +
> +description:
> +  System controllers found on SpacemiT K1 SoC, which are capable of
> +  clock, reset and power-management functions.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - spacemit,k1-syscon-apbc
> +      - spacemit,k1-syscon-apmu
> +      - spacemit,k1-syscon-mpmu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: osc
> +      - const: vctcxo_1m
> +      - const: vctcxo_3m
> +      - const: vctcxo_24m
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/spacemit,k1-syscon.h> for valid indices.
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: spacemit,k1-syscon-apbc
> +    then:
> +      properties:
> +        "#power-domain-cells": false
> +    else:
> +      required:
> +        - "#power-domain-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    system-controller@d4050000 {
> +        compatible = "spacemit,k1-syscon-mpmu";
> +        reg = <0xd4050000 0x209c>;
> +        clocks = <&osc>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
> +        clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
> +        #clock-cells = <1>;
> +        #power-domain-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
> new file mode 100644
> index 000000000000..61c8d7360cf8
> --- /dev/null
> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
> @@ -0,0 +1,210 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2024 Haylen Chu <heylenay@outlook.com>
> + */
> +
> +#ifndef _DT_BINDINGS_SPACEMIT_CCU_H_
> +#define _DT_BINDINGS_SPACEMIT_CCU_H_
> +
> +/* MPMU clocks */
> +#define CLK_PLL1_307P2		0
> +#define CLK_PLL1_76P8		1
> +#define CLK_PLL1_61P44		2
> +#define CLK_PLL1_153P6		3
> +#define CLK_PLL1_102P4		4
> +#define CLK_PLL1_51P2		5
> +#define CLK_PLL1_51P2_AP	6
> +#define CLK_PLL1_57P6		7
> +#define CLK_PLL1_25P6		8
> +#define CLK_PLL1_12P8		9
> +#define CLK_PLL1_12P8_WDT	10
> +#define CLK_PLL1_6P4		11
> +#define CLK_PLL1_3P2		12
> +#define CLK_PLL1_1P6		13
> +#define CLK_PLL1_0P8		14
> +#define CLK_PLL1_409P6		15
> +#define CLK_PLL1_204P8		16
> +#define CLK_PLL1_491		17
> +#define CLK_PLL1_245P76		18
> +#define CLK_PLL1_614		19
> +#define CLK_PLL1_47P26		20
> +#define CLK_PLL1_31P5		21
> +#define CLK_PLL1_819		22
> +#define CLK_PLL1_1228		23
> +#define CLK_SLOW_UART		24
> +#define CLK_SLOW_UART1		25
> +#define CLK_SLOW_UART2		26
> +#define CLK_WDT			27
> +#define CLK_RIPC		28
> +#define CLK_I2S_SYSCLK		29
> +#define CLK_I2S_BCLK		30
> +#define CLK_APB			31
> +#define CLK_WDT_BUS		32
> +
> +/* APBC clocks */
> +#define CLK_UART0		0
> +#define CLK_UART2		1
> +#define CLK_UART3		2
> +#define CLK_UART4		3
> +#define CLK_UART5		4
> +#define CLK_UART6		5
> +#define CLK_UART7		6
> +#define CLK_UART8		7
> +#define CLK_UART9		8
> +#define CLK_GPIO		9
> +#define CLK_PWM0		10
> +#define CLK_PWM1		11
> +#define CLK_PWM2		12
> +#define CLK_PWM3		13
> +#define CLK_PWM4		14
> +#define CLK_PWM5		15
> +#define CLK_PWM6		16
> +#define CLK_PWM7		17
> +#define CLK_PWM8		18
> +#define CLK_PWM9		19
> +#define CLK_PWM10		20
> +#define CLK_PWM11		21
> +#define CLK_PWM12		22
> +#define CLK_PWM13		23
> +#define CLK_PWM14		24
> +#define CLK_PWM15		25
> +#define CLK_PWM16		26
> +#define CLK_PWM17		27
> +#define CLK_PWM18		28
> +#define CLK_PWM19		29
> +#define CLK_SSP3		30
> +#define CLK_RTC			31
> +#define CLK_TWSI0		32
> +#define CLK_TWSI1		33
> +#define CLK_TWSI2		34
> +#define CLK_TWSI4		35
> +#define CLK_TWSI5		36
> +#define CLK_TWSI6		37
> +#define CLK_TWSI7		38
> +#define CLK_TWSI8		39
> +#define CLK_TIMERS1		40
> +#define CLK_TIMERS2		41
> +#define CLK_AIB			42
> +#define CLK_ONEWIRE		43
> +#define CLK_SSPA0		44
> +#define CLK_SSPA1		45
> +#define CLK_DRO			46
> +#define CLK_IR			47
> +#define CLK_TSEN		48
> +#define CLK_IPC_AP2AUD		49
> +#define CLK_CAN0		50
> +#define CLK_CAN0_BUS		51
> +#define CLK_UART0_BUS		52
> +#define CLK_UART2_BUS		53
> +#define CLK_UART3_BUS		54
> +#define CLK_UART4_BUS		55
> +#define CLK_UART5_BUS		56
> +#define CLK_UART6_BUS		57
> +#define CLK_UART7_BUS		58
> +#define CLK_UART8_BUS		59
> +#define CLK_UART9_BUS		60
> +#define CLK_GPIO_BUS		61
> +#define CLK_PWM0_BUS		62
> +#define CLK_PWM1_BUS		63
> +#define CLK_PWM2_BUS		64
> +#define CLK_PWM3_BUS		65
> +#define CLK_PWM4_BUS		66
> +#define CLK_PWM5_BUS		67
> +#define CLK_PWM6_BUS		68
> +#define CLK_PWM7_BUS		69
> +#define CLK_PWM8_BUS		70
> +#define CLK_PWM9_BUS		71
> +#define CLK_PWM10_BUS		72
> +#define CLK_PWM11_BUS		73
> +#define CLK_PWM12_BUS		74
> +#define CLK_PWM13_BUS		75
> +#define CLK_PWM14_BUS		76
> +#define CLK_PWM15_BUS		77
> +#define CLK_PWM16_BUS		78
> +#define CLK_PWM17_BUS		79
> +#define CLK_PWM18_BUS		80
> +#define CLK_PWM19_BUS		81
> +#define CLK_SSP3_BUS		82
> +#define CLK_RTC_BUS		83
> +#define CLK_TWSI0_BUS		84
> +#define CLK_TWSI1_BUS		85
> +#define CLK_TWSI2_BUS		86
> +#define CLK_TWSI4_BUS		87
> +#define CLK_TWSI5_BUS		88
> +#define CLK_TWSI6_BUS		89
> +#define CLK_TWSI7_BUS		90
> +#define CLK_TWSI8_BUS		91
> +#define CLK_TIMERS1_BUS		92
> +#define CLK_TIMERS2_BUS		93
> +#define CLK_AIB_BUS		94
> +#define CLK_ONEWIRE_BUS		95
> +#define CLK_SSPA0_BUS		96
> +#define CLK_SSPA1_BUS		97
> +#define CLK_TSEN_BUS		98
> +#define CLK_IPC_AP2AUD_BUS	99
> +
> +/* APMU clocks */
> +#define CLK_CCI550		0
> +#define CLK_CPU_C0_HI		1
> +#define CLK_CPU_C0_CORE		2
> +#define CLK_CPU_C0_ACE		3
> +#define CLK_CPU_C0_TCM		4
> +#define CLK_CPU_C1_HI		5
> +#define CLK_CPU_C1_CORE		6
> +#define CLK_CPU_C1_ACE		7
> +#define CLK_CCIC_4X		8
> +#define CLK_CCIC1PHY		9
> +#define CLK_SDH_AXI		10
> +#define CLK_SDH0		11
> +#define CLK_SDH1		12
> +#define CLK_SDH2		13
> +#define CLK_USB_P1		14
> +#define CLK_USB_AXI		15
> +#define CLK_USB30		16
> +#define CLK_QSPI		17
> +#define CLK_QSPI_BUS		18
> +#define CLK_DMA			19
> +#define CLK_AES			20
> +#define CLK_VPU			21
> +#define CLK_GPU			22
> +#define CLK_EMMC		23
> +#define CLK_EMMC_X		24
> +#define CLK_AUDIO		25
> +#define CLK_HDMI		26
> +#define CLK_PMUA_ACLK		27
> +#define CLK_PCIE0_MASTER	28
> +#define CLK_PCIE0_SLAVE		29
> +#define CLK_PCIE0_DBI		30
> +#define CLK_PCIE1_MASTER	31
> +#define CLK_PCIE1_SLAVE		32
> +#define CLK_PCIE1_DBI		33
> +#define CLK_PCIE2_MASTER	34
> +#define CLK_PCIE2_SLAVE		35
> +#define CLK_PCIE2_DBI		36
> +#define CLK_EMAC0_BUS		37
> +#define CLK_EMAC0_PTP		38
> +#define CLK_EMAC1_BUS		39
> +#define CLK_EMAC1_PTP		40
> +#define CLK_JPG			41
> +#define CLK_CCIC2PHY		42
> +#define CLK_CCIC3PHY		43
> +#define CLK_CSI			44
> +#define CLK_CAMM0		45
> +#define CLK_CAMM1		46
> +#define CLK_CAMM2		47
> +#define CLK_ISP_CPP		48
> +#define CLK_ISP_BUS		49
> +#define CLK_ISP			50
> +#define CLK_DPU_MCLK		51
> +#define CLK_DPU_ESC		52
> +#define CLK_DPU_BIT		53
> +#define CLK_DPU_PXCLK		54
> +#define CLK_DPU_HCLK		55
> +#define CLK_DPU_SPI		56
> +#define CLK_DPU_SPI_HBUS	57
> +#define CLK_DPU_SPIBUS		58
> +#define CLK_DPU_SPI_ACLK	59
> +#define CLK_V2D			60
> +#define CLK_EMMC_BUS		61
> +
> +#endif /* _DT_BINDINGS_SPACEMIT_CCU_H_ */

