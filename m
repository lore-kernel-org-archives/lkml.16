Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805F21ACEC8;
	Wed,  7 May 2025 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746657361; cv=none; b=clQvNMf3WC13BU3KTxz6G6IlCsJK0k0IiyP8veBWvW2W/MKyeBoBX+leHGoENDTTdNpwEoqzMyqugHVCnn7FFrwXHofGzK1Cex/B+2PE3Qnol6fQyVJGfAq0GxgFPmXVE6qPmfKzgGkN/qR4ESordX23vvtQOPZmLBiczNmIAdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746657361; c=relaxed/simple;
	bh=HatrC2ZmLN8Nl17ZhtTK2kiutE2CHcwuvTNTKkyyf7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1IPaQHHJ+IvfwUPCfEEVfNEJH95671NVQn/Qik8fs5KKj46QWaDgqL4xUEPiHbuAx4NvmeOPvoc0nIexfM0BIgNIJXF6OUaOnScn584a1NYLQGUJX5M+E9K9dwgVe1XjUXUE/DT5LJnDqgtueIOwczD9fmHN2ipOh2bIJYTi6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6C7E6342FF8;
	Wed, 07 May 2025 22:35:58 +0000 (UTC)
Date: Wed, 7 May 2025 22:35:54 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: soc: spacemit: define
 spacemit,k1-ccu resets
Message-ID: <20250507223554-GYA505240@gentoo>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-2-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506210638.2800228-2-elder@riscstar.com>

hi Alex,

On 16:06 Tue 06 May     , Alex Elder wrote:
> There are additional SpacemiT syscon CCUs whose registers control both
> clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
> previously, these will (initially) support only resets.  They do not
> incorporate power domain functionality.
> 
> Previously the clock properties were required for all compatible nodes.
> Make that requirement only apply to the three existing CCUs (APBC, APMU,
> and MPMU), so that the new reset-only CCUs can go without specifying them.
> 
> Define the index values for resets associated with all SpacemiT K1
> syscon nodes, including those with clocks already defined, as well as
> the new ones (without clocks).
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +++-
>  .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++++++++++++
>  2 files changed, 150 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> index 30aaf49da03d3..133a391ee68cd 100644
> --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> @@ -19,6 +19,9 @@ properties:
>        - spacemit,k1-syscon-apbc
>        - spacemit,k1-syscon-apmu
>        - spacemit,k1-syscon-mpmu
> +      - spacemit,k1-syscon-rcpu
> +      - spacemit,k1-syscon-rcpu2
> +      - spacemit,k1-syscon-apbc2
>  
>    reg:
>      maxItems: 1
> @@ -47,9 +50,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - clocks
> -  - clock-names
> -  - "#clock-cells"
>    - "#reset-cells"
>  
>  allOf:
> @@ -57,13 +57,28 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: spacemit,k1-syscon-apbc
> +            enum:
> +              - spacemit,k1-syscon-apmu
> +              - spacemit,k1-syscon-mpmu
>      then:
> -      properties:
> -        "#power-domain-cells": false
> -    else:
>        required:
>          - "#power-domain-cells"
> +    else:
> +      properties:
> +        "#power-domain-cells": false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - spacemit,k1-syscon-apbc
> +              - spacemit,k1-syscon-apmu
> +              - spacemit,k1-syscon-mpmu
> +    then:
> +      required:
> +        - clocks
> +        - clock-names
> +        - "#clock-cells"
>  
>  additionalProperties: false
>  
> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
> index 35968ae982466..f5965dda3b905 100644
> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
would it be better to move all reset definition to its dedicated dir?
which like: include/dt-bindings/reset/spacemit,k1-syscon.h?

> @@ -78,6 +78,9 @@
>  #define CLK_APB			31
>  #define CLK_WDT_BUS		32
>  
> +/* MPMU resets */
> +#define RESET_WDT		0
> +
>  /* APBC clocks */
>  #define CLK_UART0		0
>  #define CLK_UART2		1
> @@ -180,6 +183,59 @@
>  #define CLK_TSEN_BUS		98
>  #define CLK_IPC_AP2AUD_BUS	99
>  
> +/* APBC resets */
> +#define RESET_UART0		0
> +#define RESET_UART2		1
> +#define RESET_UART3		2
> +#define RESET_UART4		3
> +#define RESET_UART5		4
> +#define RESET_UART6		5
> +#define RESET_UART7		6
> +#define RESET_UART8		7
> +#define RESET_UART9		8
> +#define RESET_GPIO		9
> +#define RESET_PWM0		10
> +#define RESET_PWM1		11
> +#define RESET_PWM2		12
> +#define RESET_PWM3		13
> +#define RESET_PWM4		14
> +#define RESET_PWM5		15
> +#define RESET_PWM6		16
> +#define RESET_PWM7		17
> +#define RESET_PWM8		18
> +#define RESET_PWM9		19
> +#define RESET_PWM10		20
> +#define RESET_PWM11		21
> +#define RESET_PWM12		22
> +#define RESET_PWM13		23
> +#define RESET_PWM14		24
> +#define RESET_PWM15		25
> +#define RESET_PWM16		26
> +#define RESET_PWM17		27
> +#define RESET_PWM18		28
> +#define RESET_PWM19		29
> +#define RESET_SSP3		30
> +#define RESET_RTC		31
> +#define RESET_TWSI0		32
> +#define RESET_TWSI1		33
> +#define RESET_TWSI2		34
> +#define RESET_TWSI4		35
> +#define RESET_TWSI5		36
> +#define RESET_TWSI6		37
> +#define RESET_TWSI7		38
> +#define RESET_TWSI8		39
> +#define RESET_TIMERS1		40
> +#define RESET_TIMERS2		41
> +#define RESET_AIB		42
> +#define RESET_ONEWIRE		43
> +#define RESET_SSPA0		44
> +#define RESET_SSPA1		45
> +#define RESET_DRO		46
> +#define RESET_IR		47
> +#define RESET_TSEN		48
> +#define RESET_IPC_AP2AUD	49
> +#define RESET_CAN0		50
> +
>  /* APMU clocks */
>  #define CLK_CCI550		0
>  #define CLK_CPU_C0_HI		1
> @@ -244,4 +300,76 @@
>  #define CLK_V2D			60
>  #define CLK_EMMC_BUS		61
>  
> +/* APMU resets */
> +#define RESET_CCIC_4X		0
> +#define RESET_CCIC1_PHY		1
> +#define RESET_SDH_AXI		2
> +#define RESET_SDH0		3
> +#define RESET_SDH1		4
> +#define RESET_SDH2		5
> +#define RESET_USBP1_AXI		6
> +#define RESET_USB_AXI		7
> +#define RESET_USB3_0		8
> +#define RESET_QSPI		9
> +#define RESET_QSPI_BUS		10
> +#define RESET_DMA		11
> +#define RESET_AES		12
> +#define RESET_VPU		13
> +#define RESET_GPU		14
> +#define RESET_EMMC		15
> +#define RESET_EMMC_X		16
> +#define RESET_AUDIO		17
> +#define RESET_HDMI		18
> +#define RESET_PCIE0		19
> +#define RESET_PCIE1		20
> +#define RESET_PCIE2		21
> +#define RESET_EMAC0		22
> +#define RESET_EMAC1		23
> +#define RESET_JPG		24
> +#define RESET_CCIC2PHY		25
> +#define RESET_CCIC3PHY		26
> +#define RESET_CSI		27
> +#define RESET_ISP_CPP		28
> +#define RESET_ISP_BUS		29
> +#define RESET_ISP		30
> +#define RESET_ISP_CI		31
> +#define RESET_DPU_MCLK		32
> +#define RESET_DPU_ESC		33
> +#define RESET_DPU_HCLK		34
> +#define RESET_DPU_SPIBUS	35
> +#define RESET_DPU_SPI_HBUS	36
> +#define RESET_V2D		37
> +#define RESET_MIPI		38
> +#define RESET_MC		39
> +
> +/*	RCPU resets	*/
> +#define RESET_RCPU_SSP0		0
> +#define RESET_RCPU_I2C0		1
> +#define RESET_RCPU_UART1		2
> +#define RESET_RCPU_IR		3
> +#define RESET_RCPU_CAN		4
> +#define RESET_RCPU_UART0		5
> +#define RESET_RCPU_HDMI_AUDIO	6
> +
> +/*	RCPU2 resets	*/
> +#define RESET_RCPU2_PWM0		0
> +#define RESET_RCPU2_PWM1		1
> +#define RESET_RCPU2_PWM2		2
> +#define RESET_RCPU2_PWM3		3
> +#define RESET_RCPU2_PWM4		4
> +#define RESET_RCPU2_PWM5		5
> +#define RESET_RCPU2_PWM6		6
> +#define RESET_RCPU2_PWM7		7
> +#define RESET_RCPU2_PWM8		8
> +#define RESET_RCPU2_PWM9		9
> +
> +/*	APBC2 resets	*/
> +#define RESET_APBC2_UART1	0
> +#define RESET_APBC2_SSP2	1
> +#define RESET_APBC2_TWSI3	2
> +#define RESET_APBC2_RTC		3
> +#define RESET_APBC2_TIMERS0	4
> +#define RESET_APBC2_KPC		5
> +#define RESET_APBC2_GPIO	6
> +
>  #endif /* _DT_BINDINGS_SPACEMIT_CCU_H_ */
> -- 
> 2.45.2
> 

-- 
Yixun Lan (dlan)
