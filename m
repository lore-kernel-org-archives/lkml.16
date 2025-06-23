Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0803594F;
	Mon, 23 Jun 2025 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688948; cv=none; b=Qoct42rEe5bYebKuoTL+t0dRBvwW5UK2+FVaDup9WgmYOMbmxMLBssIZJrFHwVpx6Z4U6csYeHpFlyRcl3HkuLlObwnrD4/LPxxiNZMj+Xkh26F3et+tMZXTLWuhk24nVP0pfiwfHfLiO8ORJXu4nydalrUV6H5ruiFJB6hKoRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688948; c=relaxed/simple;
	bh=iETrDTxF2h0Jz/EA2/ujzXy+/qESUCrSq93X7gVgmj0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SoiLggPmzg/rtMkfTToFPYSCWba8guhBpvtUIqpXYCiaBurmNNq8ys2M+ydkSXUWDxN3nQAGk4ndoRyBR2foYMp2mgsXTA7px+Ij/UJPzI7DDM40NU1KgFbuOpYxVodpL5sRkekRYdZXY1ieHAG6sXXxM00pDqadobeVth1XF2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JvZ2X/EO; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JvZ2X/EO"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55NESxFn1278087;
	Mon, 23 Jun 2025 09:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750688939;
	bh=28qHpeJ7n3i+ZmLypf33BQPEzMkO3cAjs7UitAeXugs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JvZ2X/EOpGlRsganSuUUE+PJAJhid3g9wMVBCFpGtCvRqtXdpmyKu3wb4HDr0oPK0
	 Jh042cw9t3ELPlYEu9qASLMUL3lOLE59Y+FDSaVLfhs1m/87LMMy0K4bBC1z6TaTtD
	 xwwTw/yQcq3p5dx5FpgCgmfaDQLuiFEZlzF0aZiU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55NESxow838469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 09:28:59 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 09:28:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 09:28:59 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55NESxAP070412;
	Mon, 23 Jun 2025 09:28:59 -0500
Date: Mon, 23 Jun 2025 09:28:59 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>
Subject: Re: [PATCHv4 6/6] arm64: dts: ti: Add eMMC support for AM62D
Message-ID: <20250623142859.fankjmvhdo2bxjgd@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-7-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250623141253.3519546-7-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On June 23, 2025 thus sayeth Paresh Bhagat:
> Add the necessary device tree node for eMMC controller along with the
> required pinmux configuration.
> 

Could this be squashed in 4/6?

> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 27 ++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> index c98e4c98c956..5ceecdd68b3f 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -20,6 +20,7 @@ aliases {
>  		serial0 = &wkup_uart0;
>  		serial1 = &mcu_uart0;
>  		serial2 = &main_uart0;
> +		mmc0 = &sdhci0;
>  		mmc1 = &sdhci1;
>  		rtc0 = &wkup_rtc0;
>  		ethernet0 = &cpsw_port1;
> @@ -226,6 +227,22 @@ AM62DX_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (M20) GPMC0_CSn3.I2C2_SDA */
>  		>;
>  	};
>  
> +	main_mmc0_pins_default: main-mmc0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x0220, PIN_INPUT_PULLUP, 0) /* (Y6) MMC0_CMD */
> +			AM62DX_IOPAD(0x0218, PIN_OUTPUT, 0) /* (AB7) MMC0_CLK */
> +			AM62DX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (AA6) MMC0_DAT0 */
> +			AM62DX_IOPAD(0x0210, PIN_INPUT_PULLUP, 0) /* (AB6) MMC0_DAT1 */
> +			AM62DX_IOPAD(0x020c, PIN_INPUT_PULLUP, 0) /* (Y7) MMC0_DAT2 */
> +			AM62DX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (AA7) MMC0_DAT3 */
> +			AM62DX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (Y8) MMC0_DAT4 */
> +			AM62DX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (W7) MMC0_DAT5 */
> +			AM62DX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (W9) MMC0_DAT6 */
> +			AM62DX_IOPAD(0x01f8, PIN_INPUT_PULLUP, 0) /* (AB8) MMC0_DAT7 */
> +		>;
> +		bootph-all;
> +	};
> +
>  	main_mmc1_pins_default: main-mmc1-default-pins {
>  		pinctrl-single,pins = <
>  			AM62DX_IOPAD(0x023c, PIN_INPUT, 0) /* (C21) MMC1_CMD */
> @@ -397,6 +414,16 @@ &main_i2c2 {
>  	clock-frequency = <400000>;
>  };
>  
> +&sdhci0 {
> +	/* eMMC */
> +	bootph-all;
> +	status = "okay";
> +	non-removable;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_mmc0_pins_default>;
> +	disable-wp;
> +};

Make sure we follow the ordering of these properties:

    https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

> +
>  &sdhci1 {
>  	/* SD/MMC */
>  	status = "okay";
> -- 
> 2.34.1
> 
