Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C017A2F7;
	Tue, 22 Apr 2025 06:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745302121; cv=none; b=mhOvYl589urkXAyob+h7sQJVmO0Cop59R3WSg2N/Ii7jC6ObEonDWbOlf5miLgfkYmWhdUssChna63KiG2U0Fzw7efmvobgb9MZEuiVgse1qmP3QGVUh6+0fEbhOpK9pgMVJ9uW25jEJn8M0TSVQlnFNfFBc6DBLmqTXGGlOjmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745302121; c=relaxed/simple;
	bh=HzOvjB8XO2abUfCAqfGw89h21PCmAox6b3umEE5vDXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nFTk0wUmxXcU0PIL5R5vt11G+qj9BHdPFroT97UV81AQhRBfSCTx7zpNrYqXSs/2pJncjT+ZWP6wWZ4PeLzvBqL2X0YB/uQSy7Kfr8DhCXI/PiSsUkcEffoQriPRJzjZ4oTZ7F/xOIIa0d89U1b7O1S4gohlFqviwTLwTeMY9oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fXFGrW7u; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fXFGrW7u"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M68XfU1129767
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 01:08:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745302113;
	bh=w9qLPUa0pQ7DHVJGyZGL8TIS8cBp+Sv4lk0aGXs4h/M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fXFGrW7usX6CmJZpLZ9IHYl8IOSrrjJuSw5vBNKdn9NP6Eu1DAbkwM5rG17Hx4mzA
	 uuKVJjjNNuThIZEy45i4B72J7t6qPv9UzOICKcCBoghHwe3WYnGIf6hZDgEQvvdPSQ
	 LwJvGPkPVLpDx7NF0/wJU/XtKzfOSpqym68OwSws=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M68X2O066367
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 01:08:33 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 01:08:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 01:08:32 -0500
Received: from [172.24.227.136] (moteen-ubuntu-desk.dhcp.ti.com [172.24.227.136])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M68Trp065458;
	Tue, 22 Apr 2025 01:08:29 -0500
Message-ID: <f28134bc-9994-441b-b901-b65632d7ca6b@ti.com>
Date: Tue, 22 Apr 2025 11:38:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: ti: k3-am6*: Remove disable-wp for
 eMMC
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
 <20250417233040.3658761-6-jm@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20250417233040.3658761-6-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 18/04/25 05:00, Judith Mendez wrote:
> Remove disable-wp flag for eMMC nodes since this flag is
> only applicable to SD according to the binding doc
> (mmc/mmc-controller-common.yaml).
>
> For eMMC, this flag should be ignored but lets remove
> anyways to cleanup sdhci nodes.
>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi               | 1 -
>   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts                | 1 -
>   arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi              | 1 -
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts                       | 1 -
>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                       | 1 -
>   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi                | 1 -
>   arch/arm64/boot/dts/ti/k3-am642-evm.dts                       | 1 -
>   arch/arm64/boot/dts/ti/k3-am654-base-board.dts                | 1 -
>   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-common.dtsi | 1 -
>   arch/arm64/boot/dts/ti/k3-am69-sk.dts                         | 1 -
>   10 files changed, 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> index 55ed418c023bc..e5be92aa12189 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> @@ -381,7 +381,6 @@ serial_flash: flash@0 {
>   &sdhci0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_mmc0_pins_default>;
> -	disable-wp;
>   	non-removable;
>   	bootph-all;
>   	status = "okay";
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> index 1c8b4d13fb491..72b09f9c69d8c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> @@ -835,7 +835,6 @@ &sdhci0 {
>   	non-removable;
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&emmc_pins_default>;
> -	disable-wp;
>   	status = "okay";
>   };
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> index 147d56b879843..0d4115590b9c3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> @@ -338,7 +338,6 @@ serial_flash: flash@0 {
>   &sdhci0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_mmc0_pins_default>;
> -	disable-wp;
>   	non-removable;
>   	bootph-all;
>   	status = "okay";
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 7de4a9f139ad4..625ce8f8958b7 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -615,7 +615,6 @@ &sdhci0 {
>   	non-removable;
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_mmc0_pins_default>;
> -	disable-wp;
>   	bootph-all;
>   };
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index 43fcb57b34ebf..1025062c77d57 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -456,7 +456,6 @@ &sdhci0 {
>   	status = "okay";
>   	non-removable;
>   	ti,driver-strength-ohm = <50>;
> -	disable-wp;
>   	bootph-all;
>   };
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> index 561916c6e151c..9d933e837dd4b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> @@ -437,7 +437,6 @@ &sdhci0 {
>   	non-removable;
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_mmc0_pins_default>;
> -	disable-wp;
>   };
>   
>   &sdhci1 {
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> index f8ec40523254b..5c6197ba842e4 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> @@ -597,7 +597,6 @@ &sdhci0 {
>   	status = "okay";
>   	non-removable;
>   	ti,driver-strength-ohm = <50>;
> -	disable-wp;
>   	bootph-all;
>   };
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> index aa7139cc8a92b..c30425960398e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> @@ -456,7 +456,6 @@ &sdhci0 {
>   	bus-width = <8>;
>   	non-removable;
>   	ti,driver-strength-ohm = <50>;
> -	disable-wp;
>   };
>   
>   /*
> diff --git a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-common.dtsi b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-common.dtsi
> index ae842b85b70de..12af6cb7f65cf 100644
> --- a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-common.dtsi
> @@ -50,5 +50,4 @@ &sdhci0 {
>   	bus-width = <8>;
>   	non-removable;
>   	ti,driver-strength-ohm = <50>;
> -	disable-wp;
>   };
> diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
> index b85227052f97e..f28375629739c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
> @@ -940,7 +940,6 @@ &main_sdhci0 {
>   	status = "okay";
>   	non-removable;
>   	ti,driver-strength-ohm = <50>;
> -	disable-wp;
>   };

Reviewed-by: Moteen Shah <m-shah@ti.com>

Regards,
Moteen Shah

>   
>   &main_sdhci1 {
