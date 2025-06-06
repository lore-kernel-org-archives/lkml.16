Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53836125DF;
	Fri,  6 Jun 2025 01:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749174968; cv=none; b=WWQehQkeIqeBMpG68CXqL0DcKSZQuXnFgSttwq34hHgXpvM31Hv/nGtNDkcQTPsWrVchN/e4Pyjh6o/8yI4Kgt2NVG3M+ksPa9LoAshX9EjSlanvckUh2JX8WFA/g7u1YcQXx5yr1FIbWp6pg6pfMv/ssPrxgVEFtNn/56w3+3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749174968; c=relaxed/simple;
	bh=C5//pQcnTZbOFzfaGvl6vHYS6lL+oPJHSLrCeE3Yuz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2PszaSkV3eWiLf/QpUGyhiLRxUl+TLFUGW+r3aLiZaRjjSu5WE19s15/AoRvwkZnVCsIFTuZSpnB8qMI/paDC/62mZ94UQo13cPfUWlA4hkdqzYj68yCYNbebk97xBKWTYEc1cj5awYPxKUIj4+gTWRCt8xqsnfqove9UOi4lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQ9U5hIl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQ9U5hIl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539E3C4CEE7;
	Fri,  6 Jun 2025 01:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749174967;
	bh=C5//pQcnTZbOFzfaGvl6vHYS6lL+oPJHSLrCeE3Yuz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQ9U5hIlCsmv2KoKgCVcs6YgL78tNZOrTmTxoqZlyvGf1kvvYiFd6uvhE1O4B/Vfv
	 75QD08qB15FzoOlJ9Ju2B5+KxNw6CId7EMMQCN3O1WP8UU7C3j8SimQkOBI7+D4aMh
	 LQ8bn9nWaUwiPj9tLxL6h2OFny2UNbQS1QmGcNHDLmdhuvl4AEx8NB1wL3i+2VvRCL
	 ouXJHq1uBcT/B2v1UoHfp8ahoobj9UGpYB4CSOT3JZlTkQ6ASIV+goKYIJGb+l0DR6
	 Ng4hf1at6tgOb0DczcfYSrP8sz64ShKyRA8UF/bhFa6MTQFnH0OBNjiOeTVNmaGBdX
	 /7ZiQPTEz6TuQ==
Date: Thu, 5 Jun 2025 20:56:05 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: clock: convert lpc1850-cgu.txt to yaml
 format
Message-ID: <20250606015605.GA3750566-robh@kernel.org>
References: <20250602143143.943086-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602143143.943086-1-Frank.Li@nxp.com>

On Mon, Jun 02, 2025 at 10:31:42AM -0400, Frank Li wrote:
> Convert lpc1850-cgu.txt to yaml format.
> 
> Additional changes:
> - remove extra clock source nodes in example.
> - remove clock consumer in example.
> - remove clock-output-names and clock-clock-indices from required list to
>   match existed dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/clock/lpc1850-cgu.txt | 131 ------------------
>  .../bindings/clock/nxp,lpc1850-cgu.yaml       | 102 ++++++++++++++
>  2 files changed, 102 insertions(+), 131 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/lpc1850-cgu.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/nxp,lpc1850-cgu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/lpc1850-cgu.txt b/Documentation/devicetree/bindings/clock/lpc1850-cgu.txt
> deleted file mode 100644
> index 2cc32a9a945a7..0000000000000
> --- a/Documentation/devicetree/bindings/clock/lpc1850-cgu.txt
> +++ /dev/null
> @@ -1,131 +0,0 @@
> -* NXP LPC1850 Clock Generation Unit (CGU)
> -
> -The CGU generates multiple independent clocks for the core and the
> -peripheral blocks of the LPC18xx. Each independent clock is called
> -a base clock and itself is one of the inputs to the two Clock
> -Control Units (CCUs) which control the branch clocks to the
> -individual peripherals.
> -
> -The CGU selects the inputs to the clock generators from multiple
> -clock sources, controls the clock generation, and routes the outputs
> -of the clock generators through the clock source bus to the output
> -stages. Each output stage provides an independent clock source and
> -corresponds to one of the base clocks for the LPC18xx.
> -
> - - Above text taken from NXP LPC1850 User Manual.
> -
> -
> -This binding uses the common clock binding:
> -    Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> -Required properties:
> -- compatible:
> -	Should be "nxp,lpc1850-cgu"
> -- reg:
> -	Shall define the base and range of the address space
> -	containing clock control registers
> -- #clock-cells:
> -	Shall have value <1>.  The permitted clock-specifier values
> -	are the base clock numbers defined below.
> -- clocks:
> -	Shall contain a list of phandles for the external input
> -	sources to the CGU. The list shall be in the following
> -	order: xtal, 32khz, enet_rx_clk, enet_tx_clk, gp_clkin.
> -- clock-indices:
> -	Shall be an ordered list of numbers defining the base clock
> -	number provided by the CGU.
> -- clock-output-names:
> -	Shall be an ordered list of strings defining the names of
> -	the clocks provided by the CGU.
> -
> -Which base clocks that are available on the CGU depends on the
> -specific LPC part. Base clocks are numbered from 0 to 27.
> -
> -Number:		Name:			Description:
> - 0		BASE_SAFE_CLK		Base safe clock (always on) for WWDT
> - 1		BASE_USB0_CLK		Base clock for USB0
> - 2		BASE_PERIPH_CLK		Base clock for Cortex-M0SUB subsystem,
> -					SPI, and SGPIO
> - 3		BASE_USB1_CLK		Base clock for USB1
> - 4		BASE_CPU_CLK		System base clock for ARM Cortex-M core
> -					and APB peripheral blocks #0 and #2
> - 5		BASE_SPIFI_CLK		Base clock for SPIFI
> - 6		BASE_SPI_CLK		Base clock for SPI
> - 7		BASE_PHY_RX_CLK		Base clock for Ethernet PHY Receive clock
> - 8		BASE_PHY_TX_CLK		Base clock for Ethernet PHY Transmit clock
> - 9		BASE_APB1_CLK		Base clock for APB peripheral block # 1
> -10		BASE_APB3_CLK		Base clock for APB peripheral block # 3
> -11		BASE_LCD_CLK		Base clock for LCD
> -12		BASE_ADCHS_CLK		Base clock for ADCHS
> -13		BASE_SDIO_CLK		Base clock for SD/MMC
> -14		BASE_SSP0_CLK		Base clock for SSP0
> -15		BASE_SSP1_CLK		Base clock for SSP1
> -16		BASE_UART0_CLK		Base clock for UART0
> -17		BASE_UART1_CLK		Base clock for UART1
> -18		BASE_UART2_CLK		Base clock for UART2
> -19		BASE_UART3_CLK		Base clock for UART3
> -20		BASE_OUT_CLK		Base clock for CLKOUT pin
> -24-21		-			Reserved
> -25		BASE_AUDIO_CLK		Base clock for audio system (I2S)
> -26 		BASE_CGU_OUT0_CLK	Base clock for CGU_OUT0 clock output
> -27 		BASE_CGU_OUT1_CLK	Base clock for CGU_OUT1 clock output
> -
> -BASE_PERIPH_CLK and BASE_SPI_CLK is only available on LPC43xx.
> -BASE_ADCHS_CLK is only available on LPC4370.
> -
> -
> -Example board file:
> -
> -/ {
> -	clocks {
> -		xtal: xtal {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <12000000>;
> -		};
> -
> -		xtal32: xtal32 {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <32768>;
> -		};
> -
> -		enet_rx_clk: enet_rx_clk {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <0>;
> -			clock-output-names = "enet_rx_clk";
> -		};
> -
> -		enet_tx_clk: enet_tx_clk {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <0>;
> -			clock-output-names = "enet_tx_clk";
> -		};
> -
> -		gp_clkin: gp_clkin {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <0>;
> -			clock-output-names = "gp_clkin";
> -		};
> -	};
> -
> -	soc {
> -		cgu: clock-controller@40050000 {
> -			compatible = "nxp,lpc1850-cgu";
> -			reg = <0x40050000 0x1000>;
> -			#clock-cells = <1>;
> -			clocks = <&xtal>, <&creg_clk 1>, <&enet_rx_clk>, <&enet_tx_clk>, <&gp_clkin>;
> -		};
> -
> -		/* A CGU and CCU clock consumer */
> -		lcdc: lcdc@40008000 {
> -			...
> -			clocks = <&cgu BASE_LCD_CLK>, <&ccu1 CLK_CPU_LCD>;
> -			clock-names = "clcdclk", "apb_pclk";
> -			...
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/clock/nxp,lpc1850-cgu.yaml b/Documentation/devicetree/bindings/clock/nxp,lpc1850-cgu.yaml
> new file mode 100644
> index 0000000000000..319bd2705c422
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nxp,lpc1850-cgu.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/nxp,lpc1850-cgu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC1850 Clock Generation Unit (CGU)
> +
> +description:

Needs '>'.

> +  The CGU generates multiple independent clocks for the core and the
> +  peripheral blocks of the LPC18xx. Each independent clock is called
> +  a base clock and itself is one of the inputs to the two Clock
> +  Control Units (CCUs) which control the branch clocks to the
> +  individual peripherals.
> +
> +  The CGU selects the inputs to the clock generators from multiple
> +  clock sources, controls the clock generation, and routes the outputs
> +  of the clock generators through the clock source bus to the output
> +  stages. Each output stage provides an independent clock source and
> +  corresponds to one of the base clocks for the LPC18xx.
> +
> +  Above text taken from NXP LPC1850 User Manual.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc1850-cgu
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +    description: |
> +      Which base clocks that are available on the CGU depends on the
> +      specific LPC part. Base clocks are numbered from 0 to 27.
> +
> +      Number:         Name:                   Description:
> +       0              BASE_SAFE_CLK           Base safe clock (always on) for WWDT
> +       1              BASE_USB0_CLK           Base clock for USB0
> +       2              BASE_PERIPH_CLK         Base clock for Cortex-M0SUB subsystem,
> +                                        SPI, and SGPIO
> +       3              BASE_USB1_CLK           Base clock for USB1
> +       4              BASE_CPU_CLK            System base clock for ARM Cortex-M core
> +                                        and APB peripheral blocks #0 and #2
> +       5              BASE_SPIFI_CLK          Base clock for SPIFI
> +       6              BASE_SPI_CLK            Base clock for SPI
> +       7              BASE_PHY_RX_CLK         Base clock for Ethernet PHY Receive clock
> +       8              BASE_PHY_TX_CLK         Base clock for Ethernet PHY Transmit clock
> +       9              BASE_APB1_CLK           Base clock for APB peripheral block # 1
> +      10              BASE_APB3_CLK           Base clock for APB peripheral block # 3
> +      11              BASE_LCD_CLK            Base clock for LCD
> +      12              BASE_ADCHS_CLK          Base clock for ADCHS
> +      13              BASE_SDIO_CLK           Base clock for SD/MMC
> +      14              BASE_SSP0_CLK           Base clock for SSP0
> +      15              BASE_SSP1_CLK           Base clock for SSP1
> +      16              BASE_UART0_CLK          Base clock for UART0
> +      17              BASE_UART1_CLK          Base clock for UART1
> +      18              BASE_UART2_CLK          Base clock for UART2
> +      19              BASE_UART3_CLK          Base clock for UART3
> +      20              BASE_OUT_CLK            Base clock for CLKOUT pin
> +      24-21           -                       Reserved
> +      25              BASE_AUDIO_CLK          Base clock for audio system (I2S)
> +      26              BASE_CGU_OUT0_CLK       Base clock for CGU_OUT0 clock output
> +      27              BASE_CGU_OUT1_CLK       Base clock for CGU_OUT1 clock output
> +
> +      BASE_PERIPH_CLK and BASE_SPI_CLK is only available on LPC43xx.
> +      BASE_ADCHS_CLK is only available on LPC4370.
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-indices:
> +    maxItems: 5

1-28 entries should be valid.

> +
> +  clock-output-names:
> +    items:
> +      - const: xtal
> +      - const: creg_clk
> +      - const: enet_rx_clk
> +      - const: enet_tx_clk
> +      - const: gp_clkin

This looks like names of the inputs, not the outputs. There wasn't any 
clock-names on the original though. You don't have to document the names 
in clock-output-names, just how many entries.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@40050000 {
> +        compatible = "nxp,lpc1850-cgu";
> +        reg = <0x40050000 0x1000>;
> +        #clock-cells = <1>;
> +        clocks = <&xtal>, <&creg_clk 1>, <&enet_rx_clk>, <&enet_tx_clk>, <&gp_clkin>;
> +    };
> +
> -- 
> 2.34.1
> 
