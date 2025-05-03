Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1411B46B8;
	Sat,  3 May 2025 07:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256139; cv=none; b=msLkGNRa+xXM6VsVBmeQxig/zRjUVITt6OZMGp1Pi2JI4gcUaceOz7lI+rGk0xzi+vcI/I+nD44BzAqEWHRNDYA5HZXnNPKyoh1KnpByH80SC0yvoJnSHubv5VHUCm527/YtfkYOqejratfv9QNYvVydS2qDRuSnb8VEuef4ocM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256139; c=relaxed/simple;
	bh=R+jlvZbQdmwqm7NcjK+G61LADjyjLd0GDC0mzrUbkgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JZjZSnUsA61AtyHbDoWY/WlJOuGIVBUZMUlAeweFIw0DyXk7Bafx1/k+4j5MCEt6DAZVYriJ2l9Fc3SbrUkty15d+/w+me3PjcVebRsWFsxSHc2SdiDN/kumE6wootDpywRCYkVJv1DXHYU0w5pkTYvdUwIjXqwNJbw68sAkJwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OeCEDfAq; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OeCEDfAq"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54378fCq561383
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 3 May 2025 02:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746256121;
	bh=4C9uWrdzZEQtSKzpMWCgzRsLbl9Gws62PCwkwfRtUSg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OeCEDfAq+l7Buxl4bhC7UqUQ7PjSdT79zInnVDnlbgsmAT9uYbFCfOg6J2k5QUIxS
	 sJVDiW4JPHbp7go+YTxb4qooWKMThHDJj691ntzYZ+OWyRmD33AJuIT+O8cIJwDZ4v
	 zje4r7ywEBY3jkdNVQn4E0PaIIH7Y3SYqgsVtD8M=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54378fJn018399
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 3 May 2025 02:08:41 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 3
 May 2025 02:08:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 3 May 2025 02:08:40 -0500
Received: from [10.249.136.145] ([10.249.136.145])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54378X05032476;
	Sat, 3 May 2025 02:08:34 -0500
Message-ID: <02a84099-7dfa-4901-bef5-29a06f3c747a@ti.com>
Date: Sat, 3 May 2025 12:38:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 4/4] arm64: dts: ti: k3-am62x: Add required voltage
 supplies for TEVI-OV5640
To: Rishikesh Donadkar <r-donadkar@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>
References: <20250502162539.322091-1-r-donadkar@ti.com>
 <20250502162539.322091-5-r-donadkar@ti.com>
Content-Language: en-US
From: "Thakkar, Devarsh" <devarsht@ti.com>
In-Reply-To: <20250502162539.322091-5-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 5/2/2025 9:55 PM, Rishikesh Donadkar wrote:
> The device tree overlay for TEVI-OV5640 requires following voltage
> supplies as mentioned in the power section [1]
> 
> AVDD-supply: Analog voltage supply, 2.8 volts
> DOVDD-supply: Digital I/O voltage supply, 1.8 volts
> DVDD-supply: Digital core voltage supply, 3.3 volts
> 
> Add them in the DT overlay.
> 
> Link: https://www.technexion.com/wp-content/uploads/2023/09/product-brief_tevi-ov5640.pdf
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh

> ---
>  .../dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso  | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> index b6bfdfbbdd984..fe3bc29632fa9 100644
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
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
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
> +				DVDD-supply = <&reg_3p3v>;
> +
>  				powerdown-gpios = <&exp1 13 GPIO_ACTIVE_LOW>;
>  
>  				port {

