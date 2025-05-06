Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA9026B95D;
	Tue,  6 May 2025 10:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525815; cv=none; b=iOWTY7lvObNj5KZy02/wnqWYKhRvHlhhMPho5mecHtm0N1w6LHzHEZU5z+Kl1qzIZlVTYmJYdMjDG7NHRZi257HM1RzKnf2SC3vhgdHjI9SK9iP6G3FjISzOwZVik/ivPM9BXm1IQr5+a3g+MYZNLGqgMarrSa9iuPYQpeMQCqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525815; c=relaxed/simple;
	bh=MxnViS69kuYRBZqmiBVGvz9US82SL6FSaAqDmq8DgCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BiGEap8tsZ4GQtZn7kDHZVSDZ0VoYGPeQ7szsxlKSxw5ihC00qF/TU/PIWC6C9PgY+88MePZglnExuHttYT/WEqzFGE7Qljx9Wgoqx/puh3hpd5lQu+Se4HeA6dfOf6ba5BunSYtZDLmscxiNcnsTB5qyQXrcOQGteeCRsEfTI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Be55V0rD; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Be55V0rD"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546A3ClT476718
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 05:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746525792;
	bh=H0XzuvKr2H3izEYnq/eQQn05fht77syXyK4//sspygU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Be55V0rDPHXa2bT6htWlKcICO4EnqPapDcm4Tpg50HWcwBJXB3FxXiXAlcaFddQCs
	 lZYXU8XMESkw2LYm3cHjfaaaEQPRJJjkS9FR7WIgQTTs/NKiFrWzWl5J+f9qUqxWwh
	 AxIjiXqaVWSAU3UX9rHqrr4Pqae3vJfZfQ1IC/LM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546A3CnD020417
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 05:03:12 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 05:03:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 05:03:12 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546A37dW120035;
	Tue, 6 May 2025 05:03:08 -0500
Message-ID: <575fdd99-a7a9-430b-bc94-5809edd42fa4@ti.com>
Date: Tue, 6 May 2025 15:33:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am625-beagleplay: Add required
 voltage supplies for TEVI-OV5640
To: Rishikesh Donadkar <r-donadkar@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250506045225.1246873-1-r-donadkar@ti.com>
 <20250506045225.1246873-3-r-donadkar@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250506045225.1246873-3-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 06/05/25 10:22, Rishikesh Donadkar wrote:
> The device tree overlay for TEVI-OV5640 requires following voltage
> supplies:
> 
> AVDD-supply: Analog voltage supply, 2.8 volts
> DOVDD-supply: Digital I/O voltage supply, 1.8 volts
> DVDD-supply: Digital core voltage supply, 3.3 volts
> 
> Add them in the overlay.
> 
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>  .../k3-am625-beagleplay-csi2-tevi-ov5640.dtso | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso
> index 81a2763d43c65..8a7a9ece08af6 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso
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
> +		vin-supply = <&vdd_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vdd_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vdd_3v3>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &main_gpio0 {
> @@ -39,6 +66,10 @@ ov5640: camera@3c {
>  		clocks = <&clk_ov5640_fixed>;
>  		clock-names = "xclk";
>  
> +		AVDD-supply = <&reg_2p8v>;
> +		DOVDD-supply = <&reg_1p8v>;
> +		DVDD-supply = <&reg_3p3v>;
> +
>  		port {
>  			csi2_cam0: endpoint {
>  				remote-endpoint = <&csi2rx0_in_sensor>;

