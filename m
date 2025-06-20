Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA21C225777;
	Fri, 20 Jun 2025 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750427687; cv=none; b=eq1KwVnWnxPMPh9x1cDvdhssB545LSk4I65BHPtPakw1fDZlguXCyKsq4jTk2p0dNlJ7tlbsCmQ65YmvN6cEx4xgCHnGScoTDcpPddidWfWKELJriAVl9XAI9KODHljbqYokhanhZxoDOVlsdi+pT56JQDr50DxXwdICjvdTDMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750427687; c=relaxed/simple;
	bh=hlCzuFtOfFjS1WXB8RKyMr6ZXhuppBwt3/3Us2XH22o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aG1phRgn33joLExUmxiJff/76a2LeYtLTKvjL94QDRUwP32OEgGcBXjU3/89YGUa5CI9UeCS616czd6nao+01VjUw+xChivVkpIl+iNixretUJC9+smbxLLbmgY3Pxm+tz9+mVGAUjoGGWbLg8zr87ASuiuMruneIIzVGQVBwTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9170416F2;
	Fri, 20 Jun 2025 06:54:25 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 691343F58B;
	Fri, 20 Jun 2025 06:54:43 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:54:40 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: allwinner: a523: Move mmc nodes to
 correct position
Message-ID: <20250620145440.047e933b@donnerap.manchester.arm.com>
In-Reply-To: <20250619173007.3367034-3-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
	<20250619173007.3367034-3-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jun 2025 01:30:04 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> When the mmc nodes were added to the dtsi file, they were inserted in
> the incorrect position.
> 
> Move them to the correct place.

Yes, they were indeed wrongly ordered! Now "grep @ ... | sort -c" is happy.

> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 126 +++++++++---------
>  1 file changed, 63 insertions(+), 63 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 8b7cbc2e78f5..458d7ecedacd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -181,69 +181,6 @@ ccu: clock-controller@2001000 {
>  			#reset-cells = <1>;
>  		};
>  
> -		mmc0: mmc@4020000 {
> -			compatible = "allwinner,sun55i-a523-mmc",
> -				     "allwinner,sun20i-d1-mmc";
> -			reg = <0x04020000 0x1000>;
> -			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> -			clock-names = "ahb", "mmc";
> -			resets = <&ccu RST_BUS_MMC0>;
> -			reset-names = "ahb";
> -			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&mmc0_pins>;
> -			status = "disabled";
> -
> -			max-frequency = <150000000>;
> -			cap-sd-highspeed;
> -			cap-mmc-highspeed;
> -			cap-sdio-irq;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -		};
> -
> -		mmc1: mmc@4021000 {
> -			compatible = "allwinner,sun55i-a523-mmc",
> -				     "allwinner,sun20i-d1-mmc";
> -			reg = <0x04021000 0x1000>;
> -			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
> -			clock-names = "ahb", "mmc";
> -			resets = <&ccu RST_BUS_MMC1>;
> -			reset-names = "ahb";
> -			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&mmc1_pins>;
> -			status = "disabled";
> -
> -			max-frequency = <150000000>;
> -			cap-sd-highspeed;
> -			cap-mmc-highspeed;
> -			cap-sdio-irq;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -		};
> -
> -		mmc2: mmc@4022000 {
> -			compatible = "allwinner,sun55i-a523-mmc",
> -				     "allwinner,sun20i-d1-mmc";
> -			reg = <0x04022000 0x1000>;
> -			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
> -			clock-names = "ahb", "mmc";
> -			resets = <&ccu RST_BUS_MMC2>;
> -			reset-names = "ahb";
> -			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&mmc2_pins>;
> -			status = "disabled";
> -
> -			max-frequency = <150000000>;
> -			cap-sd-highspeed;
> -			cap-mmc-highspeed;
> -			cap-sdio-irq;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -		};
> -
>  		wdt: watchdog@2050000 {
>  			compatible = "allwinner,sun55i-a523-wdt";
>  			reg = <0x2050000 0x20>;
> @@ -449,6 +386,69 @@ its: msi-controller@3440000 {
>  			};
>  		};
>  
> +		mmc0: mmc@4020000 {
> +			compatible = "allwinner,sun55i-a523-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04020000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC0>;
> +			reset-names = "ahb";
> +			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc0_pins>;
> +			status = "disabled";
> +
> +			max-frequency = <150000000>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			cap-sdio-irq;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		mmc1: mmc@4021000 {
> +			compatible = "allwinner,sun55i-a523-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04021000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC1>;
> +			reset-names = "ahb";
> +			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc1_pins>;
> +			status = "disabled";
> +
> +			max-frequency = <150000000>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			cap-sdio-irq;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		mmc2: mmc@4022000 {
> +			compatible = "allwinner,sun55i-a523-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04022000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC2>;
> +			reset-names = "ahb";
> +			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc2_pins>;
> +			status = "disabled";
> +
> +			max-frequency = <150000000>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			cap-sdio-irq;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
>  		usb_otg: usb@4100000 {
>  			compatible = "allwinner,sun55i-a523-musb",
>  				     "allwinner,sun8i-a33-musb";

