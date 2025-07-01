Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ADF2749CA;
	Tue,  1 Jul 2025 13:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378142; cv=none; b=qTsVovkP4+FgUSpiytG87Rgixi6ri3K/GUDAxbz4pRvUS5jXhmGiIt+GJtY1Ooq6Muy6qdsFeOBCZrRwZ4Q3OEtVeOF04xtbJbTiw1hiu5E/1UF3fv+6JEJdTm5OqeW/kY1/NLmEYve8/ndWV8znPQdQ6RrA7RPzbpMFuLSHe+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378142; c=relaxed/simple;
	bh=j8DqhOjO/y33zK4keb4QH8Ti7vNpk1R1IA2kSO2tRI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g644Ez2tsDvQ4ve9p70PUBnS97sXCY/WIutNmYLPzuECqQtauB35PAzicp+4kd/bTKVtcDeN+fQZFnaxN2Sv9KNABH9+aQ2pEr3g/nwYxqemsEMCDxfex7OIl1jigBGGFqKCSKqat8Kw3urDlCLbUchvrJ5vQJSP6UzJJT53vvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=mdMixECc; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="mdMixECc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=GwNQqB8pBJVwu+Xy+ljesQ25T/+91BIQflo1XREJg40=;
	b=mdMixECcLagBJQzyNSbxLKjgirGpbSIPT6x2HT/8O2EpMR17+Byz+sqe1JLTY/
	lAyKizyHyoNHO6ZomxZOwgR0m7sC3MaPg6bzzo5wsuHifiunl0uJc0qhK6mQbKVj
	FNT0NPsUI02xkLVZyWysdE1D8qNIn5MN7Rv9Ej2+tE2qo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnL6eS6GNopYgBAA--.3609S3;
	Tue, 01 Jul 2025 21:54:28 +0800 (CST)
Date: Tue, 1 Jul 2025 21:54:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	othacehe@gnu.org, andrew@lunn.ch, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-var-som: update eqos
 support for MaxLinear PHY
Message-ID: <aGPokie6sW/FCjWc@dragon>
References: <20250605085904.12199-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605085904.12199-1-stefano.radaelli21@gmail.com>
X-CM-TRANSID:Mc8vCgDnL6eS6GNopYgBAA--.3609S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFW3tryfuF4DJF4ruw4Uurg_yoWrKF48pa
	yfurWIqrZ3t34fK3yxWa13CF1jya15Ar9rur15trW093WxCF9rtr1Skws8Xr4DCrW8Aw13
	Xryq9F13C3Z293DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYyIUUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBdSt2hj6JeipQAA31

On Thu, Jun 05, 2025 at 10:59:04AM +0200, Stefano Radaelli wrote:
> Variscite has updated the Ethernet PHY on the VAR-SOM-MX93 from the
> ADIN1300BCPZ to the MaxLinear MXL86110, as documented in the
> August 2023 revision changelog.
> Link: https://variwiki.com/index.php?title=VAR-SOM-MX93_rev_changelog
> 
> Update the device tree accordingly:
> - Drop the regulator node used to power the previously PHY.
> - Add support for the reset line using GPIO1_IO07 with proper timings.
> - Configure the PHY LEDs via the LED subsystem under /sys/class/leds/,
>   leveraging the support implemented in the mxl86110 PHY driver
>   (drivers/net/phy/mxl-86110.c).
>   Two LEDs are defined to match the LED configuration on the Variscite
>   VAR-SOM Carrier Boards:
>     * LED@0: Yellow, netdev trigger.
>     * LED@1: Green, netdev trigger.
> - Adjust the RGMII clock pad control settings to match the updated PHY
>   requirements.
> 
> These changes ensure proper PHY initialization and LED status indication
> for the new MaxLinear MXL86110, improving board compatibility with the
> latest hardware revision.
> 
> Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> ---
> v3:
>   - Add "PATCH" to subject line.
>   - Fix wrong reference to previous PHY in commit message.
> 
> v2: https://lore.kernel.org/imx/20250604153510.55689-1-stefano.radaelli21@gmail.com/
>   - Clarified the use of 'rgmii' mode by adding a comment in the DT,
>     explaining that hardware delays are already implemented on the SOM PCB.
> 
> v1: https://lore.kernel.org/imx/20250603221416.74523-1-stefano.radaelli21@gmail.com/
> 
>  .../boot/dts/freescale/imx93-var-som.dtsi     | 45 ++++++++++++-------
>  1 file changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
> index 783938245e4f..cea8d792328c 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
> @@ -19,26 +19,19 @@ mmc_pwrseq: mmc-pwrseq {
>  		reset-gpios = <&gpio4 14 GPIO_ACTIVE_LOW>,	/* WIFI_RESET */
>  			      <&gpio3 7 GPIO_ACTIVE_LOW>;	/* WIFI_PWR_EN */
>  	};
> -
> -	reg_eqos_phy: regulator-eqos-phy {
> -		compatible = "regulator-fixed";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_reg_eqos_phy>;
> -		regulator-name = "eth_phy_pwr";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -		startup-delay-us = <100000>;
> -		regulator-always-on;
> -	};
>  };
>  
>  &eqos {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_eqos>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
>  	phy-mode = "rgmii";
>  	phy-handle = <&ethphy0>;
> +	snps,clk-csr = <5>;
>  	status = "okay";
>  
>  	mdio {
> @@ -51,6 +44,27 @@ ethphy0: ethernet-phy@0 {
>  			compatible = "ethernet-phy-ieee802.3-c22";
>  			reg = <0>;
>  			eee-broken-1000t;
> +			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <100000>;

Missing a newline between property list and child node.

I fixed it up and applied the patch.

Shawn

> +			leds {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				led@0 {
> +					reg = <0>;
> +					color = <LED_COLOR_ID_YELLOW>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +
> +				led@1 {
> +					reg = <1>;
> +					color = <LED_COLOR_ID_GREEN>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +			};
>  		};
>  	};
>  };
> @@ -75,14 +89,15 @@ MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
>  			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
>  			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
>  			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
> -			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x5fe
> +			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
>  			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
>  			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
>  			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
>  			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
>  			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
> -			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
> +			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
>  			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
> +			MX93_PAD_UART2_TXD__GPIO1_IO07				0x51e
>  		>;
>  	};
>  
> 
> base-commit: a9dfb7db96f7bc1f30feae673aab7fdbfbc94e9c
> prerequisite-patch-id: 2335ebcc90360b008c840e7edf7e34a595880edf
> -- 
> 2.43.0
> 

