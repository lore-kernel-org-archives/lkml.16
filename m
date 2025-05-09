Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FBA23D2AE;
	Fri,  9 May 2025 07:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776724; cv=none; b=tjmqIrUK6lCidcLsSMOtprfmjG2gZufzYLm5UuRYGKod6Zzr+d/xtJjY/AMmA0qPseV33VTIFwxrWde4ujIXTNENZz55a9a2f0AbHJvT1eZ9fT5FVU5HPLZCTICZMEgWRq3cPPNT7qkyV/35v9g4zjdUtC6It6kDnfSNqQzYM+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776724; c=relaxed/simple;
	bh=z4C4WONX3TOnzmmaH8eHlIFN6WS75ODbCTdWA15mScE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qwdM13PGvZfOyaI3FETZLhtqtupPkRQP/TTwIlrBQkpQJNzhbLkB/EZo3OImAUBcdy4gwpiuHp6vzkv8gmY4tjqGjkzQWqIvZ/ulIOeWZIwHEW1E2KAQ1idR7VziTUJ5Nej8AsXiDDDZ4kBkfQ6ObE1Bp7zdjcbAxdzFHzmyOFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xZmqCO9B; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xZmqCO9B"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5497j1ha1337449
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 02:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746776701;
	bh=7pJtxLJJ+miQ++NXFqYy8TUdT11UyzqqW+ZW0cRbZWw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xZmqCO9Bk3Mc0tdHYa9F5AFIfSVolMsBr3yLguxR+oYpB0LxvOVVBiOL2sGIBiZA8
	 bvc4seLQazHXLpoqpNTpb4OI2fjrGX4/rj38g/FwtGTF+ym6o8dAJyw8hBBMPWeNFN
	 mLftfT8VlhsF5TzVbVpp8kzG2yuEMhTA/M05DVU8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5497j1AU126579
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 02:45:01 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 02:45:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 02:45:00 -0500
Received: from [172.24.19.187] (lt5cd2489kgj.dhcp.ti.com [172.24.19.187])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5497itUM115553;
	Fri, 9 May 2025 02:44:56 -0500
Message-ID: <e4fc72ea-ae36-457f-b1a6-0305e06022af@ti.com>
Date: Fri, 9 May 2025 13:14:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: ti: j722s-evm: Add DT nodes for power
 regulators
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
 <20250508155134.2026300-2-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250508155134.2026300-2-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 5/8/2025 9:21 PM, Yemike Abhilash Chandra wrote:
> Add device tree nodes for two regulators on the J722S-EVM. VSYS_3V3 is the
> output of LM5141-Q1, and it serves as an input to TPS22990 which produces
> VSYS_3V3_EXP [1]. VSYS_3V3_EXP serves as vin-supply to CSI RPI Connectors.
>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>
> [1]: https://www.ti.com/lit/zip/sprr495
> ---
>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> index 34b9d190800e..0f18fe710929 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> @@ -141,6 +141,17 @@ vsys_5v0: regulator-vsys5v0 {
>   		regulator-boot-on;
>   	};
>   
> +	vsys_3v3: regulator-vsys3v3 {
> +		/* output of LM5141-Q1 */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vsys_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vmain_pd>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>   	vdd_mmc1: regulator-mmc1 {
>   		/* TPS22918DBVR */
>   		compatible = "regulator-fixed";
> @@ -153,6 +164,17 @@ vdd_mmc1: regulator-mmc1 {
>   		bootph-all;
>   	};
>   
> +	vcc_3v3_exp: regulator-TPS22990 {

Please align this name with commit message

with change of vcc_3v3_exp to vsys_3v3_exp

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


> +		/* output of TPS22990 */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_exp";

This name as well, please to vss_3v3_exp


> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vsys_3v3>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>   	vdd_sd_dv: regulator-TLV71033 {
>   		compatible = "regulator-gpio";
>   		regulator-name = "tlv71033";
