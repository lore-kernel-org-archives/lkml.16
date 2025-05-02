Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D30922FF33;
	Fri,  2 May 2025 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176855; cv=none; b=tC9vXep9G+969X/pYZMHqSQfyEUPvM9GpjfF9VUImRbBia4lSfJmSzXqTFMG/EUZXQjor368mjW+msco1HgYAuEY+mnlLt7dZTkmzS4f2cZNJjf6ueS+zvLXCrsq6Vw9kDoeOT63kG5Hwv1o8frVS3D1Pesqx4Jcp0znbb1Bz4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176855; c=relaxed/simple;
	bh=jxZ8cO+CJSfaVwHlVn803pBzpaBTTvk7KQa/P9xcHDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lJ03KEl1BN1a0MqyYHBKHqydUI1F7zPEhS/UBZCAGQw6XKc1lGQwD7C1QA2MKEUO19L8UlIZHa7HTfDFmFzAg5MH989SWy9Sl/W+cO98cO6kjzeqlS4782XJ2ZorQS6Vxmf7NwDQd2vdwlWKiaYRfz00VTFA8bAVL0AwQOIOwUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Wk53frdp; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Wk53frdp"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54297Mj03827006
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 04:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746176842;
	bh=XhYCISopNOwB8EooELWfSyKr1OQU1R0XEY/I8CEqY70=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Wk53frdpOGsul8Uxo1G8WZU1GdwCGTzubUEXLuYheUl5zIY78E3f65U0LakQRXi3C
	 szGTLwv/K8vUMxYH9Bn8Ii1TbrqBGBdb73w+5OxGyW6qnXkW6xuNzEsmmz14JbZTuC
	 ZNSQNkZfAW9l5NjU/pNFUYmmb/phVCGDp0OtGTvY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54297Mwm129971
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 04:07:22 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 04:07:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 04:07:22 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54297HF2052163;
	Fri, 2 May 2025 04:07:18 -0500
Message-ID: <f73d24a6-7da6-4bcc-95ba-9d84b865a7a7@ti.com>
Date: Fri, 2 May 2025 14:37:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v1 4/4] arm64: dts: ti: k3-am62x: Add required voltage
 supplies for TEVI-OV5640
To: Rishikesh Donadkar <r-donadkar@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>
References: <20250429154133.3377962-1-r-donadkar@ti.com>
 <20250429154133.3377962-5-r-donadkar@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250429154133.3377962-5-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 29/04/25 21:11, Rishikesh Donadkar wrote:
> The device tree overlay for TEVI-OV5640 requires following voltage
> supplies:
> 
> AVDD-supply: Analog voltage supply, 2.8 volts
> DOVDD-supply: Digital I/O voltage supply, 1.8 volts
> DVDD-supply: Digital core voltage supply, 1.5 volts
> 

I think this contradicts the voltage mentioned in TEVI-OV56540 doc [1]
which mention digital voltage as 3.3 volts ?

> Add them in the DT overlay.
> 

[1]:
https://www.technexion.com/wp-content/uploads/2023/09/product-brief_tevi-ov5640.pdf

Regards
Devarsh
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso  | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> index b6bfdfbbdd984..123ab0e5e8dfa 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> @@ -15,6 +15,33 @@ clk_ov5640_fixed: ov5640-xclk {
>  		#clock-cells = <0>;
>  		clock-frequency = <24000000>;
>  	};
> +
> +	reg_2p8v: regulator-2p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2P8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vcc_3v3_sys>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_3v3_sys>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p5v: regulator-1p5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P5V";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;
> +		vin-supply = <&vcc_3v3_sys>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &main_i2c2 {
> @@ -40,6 +67,11 @@ ov5640: camera@3c {
>  
>  				clocks = <&clk_ov5640_fixed>;
>  				clock-names = "xclk";
> +
> +				AVDD-supply = <&reg_2p8v>;
> +				DOVDD-supply = <&reg_1p8v>;
> +				DVDD-supply = <&reg_1p5v>;
> +
>  				powerdown-gpios = <&exp1 13 GPIO_ACTIVE_LOW>;
>  
>  				port {

