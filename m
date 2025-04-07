Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E047C227BB5;
	Mon,  7 Apr 2025 12:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029384; cv=none; b=Kac50nt3lkBfszMe+VlT0XPOUGBT0YuB6s6yT/MmO3wMNtn0Elf+hhRErAfoTBq7dX/mYlWUERxCtSrDc3vSux9vj/90NbMSaOVF7iFdRps+5sPDXhacc3U2s68ONIZ/iLXgv4qU5yCS9ATTLC6L/64QYjFZGdE2MIm+zLemhGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029384; c=relaxed/simple;
	bh=1su1RVr9WJ58wLxVjeeErnWvxQCpntRQJD3KfQYta8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qMYKuRq4BiFDb3Fw9I1qTGvZmSyHXskg/ksYyzdnPO7Fsat2DzBJanBRQTkIsmfCOUuxJSiRQI7zi0vuTouVXIg3uhtEZ5/PLKwtWly7grpWsPneST3iM1NYHZjJEbff6UhuyATvFDpGMd7T4UA3AVhWfHKC4rM1uFwnSLbVL1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wPhcHSfk; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wPhcHSfk"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537CZwPw915930
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 07:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744029358;
	bh=ZIqra39FwyGHX2IBVRB5giqoWceascBFIqyv6tet87s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wPhcHSfkvXDW05Uv+Wg56S8G1rDINJtfYXmbcnaxa1Oi8f+UyxXNbiJmRvSpAzxAO
	 7gp7cepdfvoGd1X3Zx71ysgd4sCOv+R40T0ciAhqs99x4CffV6iwmpDMiB5C40khlQ
	 57Hz4oBrRIWyPOviRdoBA+MiGgf0dyYV0PCVaBX0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537CZwqV113614
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 07:35:58 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 07:35:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 07:35:57 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537CZvmS006892;
	Mon, 7 Apr 2025 07:35:57 -0500
Message-ID: <956c0598-9934-4295-87af-ef86f4eabd94@ti.com>
Date: Mon, 7 Apr 2025 07:35:57 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] arm64: dts: ti: k3-am64: Reserve timers used by
 MCU FW
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Padhi <b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>
References: <20250405001518.1315273-1-jm@ti.com>
 <20250405001518.1315273-12-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250405001518.1315273-12-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/4/25 7:15 PM, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> AM64x device has 4 R5F cores in the main domain. TI MCU firmware uses
> main domain timers as tick timers in these firmwares. Hence keep them
> as reserved in the Linux device tree.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am642-evm.dts | 17 +++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 17 +++++++++++++++++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> index f8ec40523254b..68bd6b806f8f0 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> @@ -796,6 +796,23 @@ &mcu_m4fss {
>   	status = "okay";
>   };
>   
> +/* main_timers 8-11 are used by TI MCU FW */

Can you make this comment per-core and explain which core
each timer is reserved for? Makes it easier on me in Zephyr
to point out why we use the timers that we do, something
like:

/* main_timer8 is reserved for mcu_r5fss0_core0 */

Andrew

> +&main_timer8 {
> +	status = "reserved";
> +};
> +
> +&main_timer9 {
> +	status = "reserved";
> +};
> +
> +&main_timer10 {
> +	status = "reserved";
> +};
> +
> +&main_timer11 {
> +	status = "reserved";
> +};
> +
>   &serdes_ln_ctrl {
>   	idle-states = <AM64_SERDES0_LANE0_PCIE0>;
>   };
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> index 33e421ec18abb..07fbdf2400d23 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> @@ -710,6 +710,23 @@ &mcu_m4fss {
>   	status = "okay";
>   };
>   
> +/* main_timers 8-11 are used by TI MCU FW */
> +&main_timer8 {
> +	status = "reserved";
> +};
> +
> +&main_timer9 {
> +	status = "reserved";
> +};
> +
> +&main_timer10 {
> +	status = "reserved";
> +};
> +
> +&main_timer11 {
> +	status = "reserved";
> +};
> +
>   &ecap0 {
>   	status = "okay";
>   	/* PWM is available on Pin 1 of header J3 */
