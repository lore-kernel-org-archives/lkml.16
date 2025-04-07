Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61C8155300;
	Mon,  7 Apr 2025 13:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033543; cv=none; b=ubY5/FogeXKnj3GOoXFkBaO89RFjdDBP+D2SBGBe8SkJUb/OMMPGSWNXlK6SNszfYXQe0u1lJyXkb/uIme5WUx+dkBAKE4+dNXVve9jWEqGH3ljsNOhtNgp9jVK5Ruhip432ia8A5D4Wwzxg79RtvhhdSQiqBR9nb9IGrHzhruI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033543; c=relaxed/simple;
	bh=C1MRPkayNHZSxKUpmDmlE2pYdFoYQzh2BmeC3d8tEmM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaYyPf+evjFmIB8soEwKOZm9a8drzujxXU5pKZU7UM/raF51Lwt3/Cu87TMQkuUtAMQMbj83PUW1ipoPYHfM/QTzUowqqlk1ndjhXg8vFsRrJfZD/fiNPKBBfzef8Ppbmaz+bQA/nKyBwgBI2KxgFrl/n6lQnKbhTp5ijtN4ZjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ENLxtRZ9; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ENLxtRZ9"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537DjOcN876172
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744033524;
	bh=2GQwEgiAttJX3GwlNjWhEsbQtnapbNdqmpn8qGs7ss4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ENLxtRZ94j61maAHe48uROtOKdjM4x1ieddeC2aDqAL+COIKjV7HGW02z6orjyN8f
	 TSGSCvDlbgWmIJ8YY9g6H9I2peqh00VmGwJvs9PVSqQ8F2p1BERiNs5XjPMArhHojJ
	 nZ9sa+8jQXcpXIDy+42rQm/n9vnHvVpw8yZlSFfE=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537DjN1c028869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 08:45:23 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 08:45:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 08:45:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537DjNfZ091617;
	Mon, 7 Apr 2025 08:45:23 -0500
Date: Mon, 7 Apr 2025 08:45:23 -0500
From: Nishanth Menon <nm@ti.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <jai.luthra@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH 3/5] arm64: dts: ti: k3-j721e-sk: Fix dtbs_check warnings
 in IMX219 overlay
Message-ID: <20250407134523.d56rjpydflmkw2ze@privatize>
References: <20250401114053.229534-1-y-abhilashchandra@ti.com>
 <20250401114053.229534-4-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250401114053.229534-4-y-abhilashchandra@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

$subject - the patch adds description for the supplies for the sensor.
Please fix the description.

On 17:10-20250401, Yemike Abhilash Chandra wrote:
> The device tree bindings mandate three regulator nodes for the IMX219
> sensor: VANA (analog), VDIG (digital core), and VDDL (digital I/O). Add the
> necessary regulator nodes in the device tree overlay and also the device
> tree bindings do not include a clock-names property. Remove the incorrectly
> added clock-names entry to avoid dtbs_check warnings.
> 
> Fixes: f767eb918096 ("arm64: dts: ti: k3-j721e-sk: Add overlay for IMX219")
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  .../dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso  | 35 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
> index 47bb5480b5b0..4eb3cffab032 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
> @@ -19,6 +19,33 @@ clk_imx219_fixed: imx219-xclk {
>  		#clock-cells = <0>;
>  		clock-frequency = <24000000>;
>  	};
> +
> +	reg_2p8v: regulator-2p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2P8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vdd_sd_dv>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vdd_sd_dv>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p2v: regulator-1p2v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P2V";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		vin-supply = <&vdd_sd_dv>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &csi_mux {
> @@ -34,7 +61,9 @@ imx219_0: imx219-0@10 {
>  		reg = <0x10>;
>  
>  		clocks = <&clk_imx219_fixed>;
> -		clock-names = "xclk";
> +		VANA-supply = <&reg_2p8v>;
> +		VDIG-supply = <&reg_1p8v>;
> +		VDDL-supply = <&reg_1p2v>;
>  
>  		port {
>  			csi2_cam0: endpoint {
> @@ -56,7 +85,9 @@ imx219_1: imx219-1@10 {
>  		reg = <0x10>;
>  
>  		clocks = <&clk_imx219_fixed>;
> -		clock-names = "xclk";
> +		VANA-supply = <&reg_2p8v>;
> +		VDIG-supply = <&reg_1p8v>;
> +		VDDL-supply = <&reg_1p2v>;
>  
>  		port {
>  			csi2_cam1: endpoint {
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
