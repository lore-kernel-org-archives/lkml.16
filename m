Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB4872615;
	Mon, 26 May 2025 05:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748237557; cv=none; b=fdTROk6t5gfw6oYZwYscF17GYAyb/zN50IzwonU9kqe0JYTJuWEdG2jk18EKdMnqJBR/O9buZr0tvIEJ3V/CDJ1Vy2wcMxk/+IJadjUpwpct1dqFJYAJeQOxuzCZPZQ+eNOHusuUvCVYIYoVUFgZTrLTD6A2IznPIQ1Jk5Vn/Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748237557; c=relaxed/simple;
	bh=85rFq+5p+XU7DPVtNBLCJZao5ByBt1eDsLVgQn8O7n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cl6tZjph8BFvMrGvseFPvcG2qdtIseSSznL/+9+tdC7vcz01TPdAZRfhM04b1odhJauE2IFCMZKoN/Nel3/T1gmJ6cCEtfkdo3DHpigPMONEnh5oqXwpRFlehxgMe+vqhc6cR+d7b2Y1unln6J2qJ3lZTemFqK+U6TFdH1fpnC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RtFiJnYd; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RtFiJnYd"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54Q5W96h2608394;
	Mon, 26 May 2025 00:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748237529;
	bh=DO4UKFcjT1jdMKNGMOOu+sLadecJqRP1bouop32CCm0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RtFiJnYd7nXxwSojuQIrd9mJgtNDVSvW+AGDmXTVJ19vlc3+816bilhY7/7m+vG1f
	 2HD7EMgz8BfN0DLww5VD9VTMSLsjxHU4m/kzMFIVJtcUFxyLlqTRreooPydkElIPVk
	 ZupVL31Wl2OeHaoP8CGE9KC8zHq//Hvn9q3wb+bM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54Q5W9G14007162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 26 May 2025 00:32:09 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 May 2025 00:32:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 May 2025 00:32:08 -0500
Received: from [10.24.69.185] (dhcp-10-24-69-185.dhcp.ti.com [10.24.69.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54Q5W5HQ116398;
	Mon, 26 May 2025 00:32:06 -0500
Message-ID: <4f660adb-1cb4-4bcf-9d1c-c13e62818f07@ti.com>
Date: Mon, 26 May 2025 11:02:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-phyboard-electra: Fix PRU-ICSSG
 Ethernet ports
To: Wadim Egorov <w.egorov@phytec.de>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
References: <20250521053339.1751844-1-w.egorov@phytec.de>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250521053339.1751844-1-w.egorov@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 21/05/25 11:03, Wadim Egorov wrote:
> For the ICSSG PHYs to operate correctly, a 25 MHz reference clock must
> be supplied on CLKOUT0. Previously, our bootloader configured this
> clock, which is why the PRU Ethernet ports appeared to work, but the
> change never made it into the device tree.
> 

Should this patch have a Fixes tag then?

> Add clock properties to make EXT_REFCLK1.CLKOUT0 output a 25MHz clock.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
> index f63c101b7d61..129524eb5b91 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
> @@ -322,6 +322,8 @@ AM64X_IOPAD(0x0040, PIN_OUTPUT, 7)	/* (U21) GPMC0_AD1.GPIO0_16 */
>  &icssg0_mdio {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&icssg0_mdio_pins_default &clkout0_pins_default>;
> +	assigned-clocks = <&k3_clks 157 123>;
> +	assigned-clock-parents = <&k3_clks 157 125>;
>  	status = "okay";
>  
>  	icssg0_phy1: ethernet-phy@1 {

-- 
Regards
Vignesh
https://ti.com/opensource

