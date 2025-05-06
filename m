Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54C126B2BE;
	Tue,  6 May 2025 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525786; cv=none; b=plCSHIQCRL8dD/bQQrKM8Nw5Y9c+kA9XupKEnjiAEQggBvQDaNBGrT0uHPnKrMp9nc2ZjuORqpsgE4JXHzK3sr7V4jjYKgbKif3VNuPYKC4xceBtfJza9bI3DSRNawfPD7j8ROB5NVvqQQ1Q+LYZBHsdK7xGlxhVE/5z+oJt8rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525786; c=relaxed/simple;
	bh=HNvC7chIMUCf+eLtdgJrsw7EYKebD5ZZ7y6+jFNr4bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LmqSm94beh2ueQ/kD8x/OWE+rjXG2DxulCATvXOeYnXqJm0FXxDzgPD7Mc9cM5rJcAqXy0ytOt7bwZPXQ3UBkty26+ijSGqu6zvoDGMwLkDf8jntb/MbRhbozm/1Sq985CNmaQf4tYrumKGALbBI6kzZ6bMnspSUJdkthRfTKHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=M+Q0Dwmr; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M+Q0Dwmr"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546A2V781021792
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 05:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746525751;
	bh=uXd56OTPxUK4c8gyOAWnjcBnDWmR+fNLSHoUdNUfEac=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=M+Q0DwmrXRJVL9eH/7gbY/c7b+MKcJddn3mSAu32V74XDlBQhJZwb06XjIRwneCdq
	 Jg7YDR7XUhJFI9hCKosN9fFDdUelgTZiPk+UoCZMdNUMt7eF6Q0NjtD72uaN8kviWK
	 7ip+OScU6ed6LwFfRZNJscQXyDAgoTgVOJIDTX70=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546A2VAJ022628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 05:02:31 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 05:02:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 05:02:30 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546A2QYp059866;
	Tue, 6 May 2025 05:02:26 -0500
Message-ID: <07611c06-2acf-46ce-b32a-b3a8b28ea227@ti.com>
Date: Tue, 6 May 2025 15:32:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am625-beagleplay: Add required
 voltage supplies for OV5640
To: Rishikesh Donadkar <r-donadkar@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250506045225.1246873-1-r-donadkar@ti.com>
 <20250506045225.1246873-2-r-donadkar@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250506045225.1246873-2-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 06/05/25 10:22, Rishikesh Donadkar wrote:
> The device tree overlay for OV5640 requires following voltage
> supplies:
> 
> AVDD-supply: Analog voltage supply, 2.8 volts
> DOVDD-supply: Digital I/O voltage supply, 1.8 volts
> DVDD-supply: Digital core voltage supply, 1.5 volts
> 
> Add them in the overlay.
> 
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>  .../ti/k3-am625-beagleplay-csi2-ov5640.dtso   | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtso
> index 3b4643b7d19c9..000305c9e3662 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtso
> @@ -15,6 +15,33 @@ clk_ov5640_fixed: ov5640-xclk {
>  		#clock-cells = <0>;
>  		clock-frequency = <12000000>;
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
> +	reg_1p5v: regulator-1p5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P5V";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;
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
> +		DVDD-supply = <&reg_1p5v>;
> +
>  		port {
>  			csi2_cam0: endpoint {
>  				remote-endpoint = <&csi2rx0_in_sensor>;

