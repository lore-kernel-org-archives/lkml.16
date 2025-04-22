Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EAD79C0;
	Tue, 22 Apr 2025 05:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745300745; cv=none; b=jRrErvqsn4m4v6+n1xz/S2gi8KTtBlXwijOzk+Bvs4QcRu3mGiU1R4qt6JXashaMXMEiont1LXoyG32wbEphY2GkvDpnexH1ftZc1gP+Xkn98hPEC9hM4OvUmFIrRnkTLE/31ppUo662f68k76/gbNONEteFdC84rnfbTZ2lPyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745300745; c=relaxed/simple;
	bh=hNZ3YWvgSgzfycXB5mMbZfjyxAPMwC3ZWfnkIP2c22A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iezJwTls1syDrmuUWoUvhbDTUsMtNxjJjNxf3lv9RuE7c/nqKY0i54dKp/EVDiimZ5+m4kkWaPqZZO558kD/M6rzuUqPM+CzV0jhzuQEfNP+zXmtx9pKaIcDVOzIml8ASKFI0yVyFTooj3uiSGdpt4nmokJeN7DWUea2fvoiHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=njpcIzaN; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="njpcIzaN"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M5jZE01123398
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 00:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745300736;
	bh=7k9B+9VG6goHgGuB8w9jIN886n77aHGdXpjo78qH00A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=njpcIzaNgcqWHUrYQ4d5s3qjKRklC0Z2oj/Pn5bgUzOfhetqTbsl7bwmMwz4apiWk
	 8+iPbYdbBJIwfub0Zx1Q5RxF6O890ZdYCadeqiN/u/lgQ6ZV/QLvGxLhxOfa1enO/A
	 sKFZFV6esiqjtTjOVBx3oZVLRt9Z8NSzPFPw3JOo=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M5jZia051289
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 00:45:35 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 00:45:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 00:45:35 -0500
Received: from [172.24.227.136] (moteen-ubuntu-desk.dhcp.ti.com [172.24.227.136])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M5jVcL048512;
	Tue, 22 Apr 2025 00:45:32 -0500
Message-ID: <c660f217-9bb1-4ba2-8d59-851f69b41042@ti.com>
Date: Tue, 22 Apr 2025 11:15:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: ti: k3-am6*: Add boot phase flag to
 support MMC boot
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-3-jm@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20250417233040.3658761-3-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hey Judith,

On 18/04/25 05:00, Judith Mendez wrote:
> The bootph-all flag was introduced in dt-schema
> (dtschema/schemas/bootph.yaml) to define node usage across
> different boot phases.
>
> For eMMC and SD boot modes, voltage regulator nodes, io-expander
> nodes, gpio nodes, and MMC nodes need to be present in all boot
> stages, so add missing bootph-all phase flag to these nodes to
> support SD boot and eMMC boot.
>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 12 ++++++++++++
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  |  2 ++
>   2 files changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> index 8e9fc00a6b3c7..aafdb90c0eb70 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> @@ -69,6 +69,7 @@ vddshv_sdio: regulator-4 {
>   		gpios = <&main_gpio0 31 GPIO_ACTIVE_HIGH>;
>   		states = <1800000 0x0>,
>   			 <3300000 0x1>;
> +		bootph-all;
>   	};
>   };
>   
> @@ -77,12 +78,14 @@ vddshv_sdio_pins_default: vddshv-sdio-default-pins {
>   		pinctrl-single,pins = <
>   			AM62X_IOPAD(0x07c, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO0_31 */
>   		>;
> +		bootph-all;
>   	};
>   
>   	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
>   		pinctrl-single,pins = <
>   			AM62X_IOPAD(0x01d4, PIN_INPUT, 7) /* (C13) UART0_RTSn.GPIO1_23 */
>   		>;
> +		bootph-all;
>   	};
>   
>   	pmic_irq_pins_default: pmic-irq-default-pins {
> @@ -118,6 +121,7 @@ exp1: gpio@22 {
>   
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
> +		bootph-all;
>   	};
>   
>   	exp2: gpio@23 {
> @@ -229,6 +233,14 @@ &tlv320aic3106 {
>   	DVDD-supply = <&buck2_reg>;
>   };
>   
> +&main_gpio0 {
> +	bootph-all;
> +};
> +
> +&main_gpio1 {
> +	bootph-all;
> +};
> +
>   &gpmc0 {
>   	ranges = <0 0 0x00 0x51000000 0x01000000>; /* CS0 space. Min partition = 16MB */
>   };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 1c9d95696c839..7de4a9f139ad4 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -313,6 +313,7 @@ AM62AX_IOPAD(0x200, PIN_INPUT_PULLUP, 0) /* (AC1) MMC0_DAT5 */
>   			AM62AX_IOPAD(0x1fc, PIN_INPUT_PULLUP, 0) /* (AD2) MMC0_DAT6 */
>   			AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */
>   		>;
> +		bootph-all;
>   	};
>   
>   	main_mmc1_pins_default: main-mmc1-default-pins {
> @@ -615,6 +616,7 @@ &sdhci0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_mmc0_pins_default>;
>   	disable-wp;
> +	bootph-all;
>   };
>   

Do we have the bootph-all flags in *-uboot.dtsi for the board to boot up?
If yes we will have to clean that up after this series gets merged.

Reviewed-by: Moteen Shah <m-shah@ti.com>

Regards,
Moteen Shah

>   &sdhci1 {
