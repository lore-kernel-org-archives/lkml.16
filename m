Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3005815B102;
	Wed,  7 May 2025 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619290; cv=none; b=OedT9pKpKrpniXRlsFrgaAqJvS41U9RuOBEz0tTDWkLKyLNIjYa0Ffayj5/ky9Su0euK7l+WbzxByn6xcmdPFNY5TQ2OCF6m7yIT4ywmlaKW5cxi8tbm44QUKVNmZ/kREpBc63LoOXc1088KPnfLKcSyYeeP6FBJwMHMmRLPEa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619290; c=relaxed/simple;
	bh=j95DCo9ba6JiWzHePPa599cGvr5ywMoKdts5CWpSZRE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5/gcSQa96cKtbmEUC1OOoXMaA8353mGaCOPyZWUcof0RxU6cnToqsnYj99Up5gj0ng++QaqXw9eKAPprzkU1npMjXOKOlKPXX/EyWKgYXpPXInL99g+zojSi3apGI5VQG4LPhUpYPFQVknjqg87rZ9hrSkmhnFd++osWQ5L8tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rOdT6gPR; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rOdT6gPR"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 547C15V21501229
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 07:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746619265;
	bh=c6C4oOxGjBlu5W/aodx9doW+zfgNMm+PVJPx4R0Gj5A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rOdT6gPRt6s2LZ3uBjsGQtHGW/+rIRkOLRFHmFGnUqj8n6M9c2y/C3h8bdP/Q3tH9
	 9CzO/9lNJCCWhpC86JrEOAmYr4VG3vnGLO2X1cRKiK/wtq1ziiJQmmpwaCRnlcsylJ
	 61/1UtpX7mGlg/ICWUVzU6RLbkkAfu4adHlxL1aI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 547C14me064429
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 07:01:05 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 07:01:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 07:01:04 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 547C14Vm019074;
	Wed, 7 May 2025 07:01:04 -0500
Date: Wed, 7 May 2025 07:01:04 -0500
From: Nishanth Menon <nm@ti.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-sk: Add power/temperature
 sensors
Message-ID: <20250507120104.4mhuaabe5auukarn@banter>
References: <20250505-am625-sk-sensors-v1-1-688fb928b390@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250505-am625-sk-sensors-v1-1-688fb928b390@pengutronix.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 15:24-20250505, Sascha Hauer wrote:
> The AM625-SK has six power sensors and two temperature sensors connected
> to I2C. Add them to the device tree.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> The AM625-SK has six power sensors and two temperature sensors connected
> to I2C. Add them to the device tree.

Sascha,

I suggest making this as overlay. The reason is as follows: AM625-SK
among other TI evms do have automated power measurement capability from
XDS110 (accessible via USB port for jtag - appears as a rudimentary
menu option). The way this works is that it uses TM4C1294NCPDT to use
I2C commands to control the INA226/231 depending on the evm.

This firmware should be flashed by default on production boards (if
not, starting up CCS[1], autodetects older firmware and updates - at
least to my understanding) - by the way, this firmware also does test
automation, such as boot mode switch control, reset control etc.

This is the primary framework meant to be used by test automation and
indeed it is the default inside TI.

Challenge here is this: if we make this default in Linux, the test
automation system configures the INA226/231 in a different sampling
mode depending on usecase etc Vs what Linux does (even though the
shunt and the bus voltage for a given INA is the same). And just like
Linux, the firmware power measurement logic has changed over the
years.

Anyways, while I know that the SoC and TM4C can both handle
multi-master, the challenge is the same INA controlled and
mix-configured by two masters (and there is no synchronization between
the two).

To avoid this entire conflict and headache, I suggest adding it as
overlay that can be applied depending on the preference of measurement
desired.

[1] https://www.ti.com/tool/CCSTUDIO

> ---
>  arch/arm64/boot/dts/ti/k3-am625-sk.dts | 68 ++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> index 2fbfa371934575efc4e9118a705f062bdea55f4f..e900d3134c72dc2616e3820b273d84b0db64bed5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> @@ -193,6 +193,74 @@ exp1: gpio@22 {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
>  	};
> +
> +	power-sensor@40 {
> +		compatible = "ti,ina231";
> +		reg = <0x40>;
> +		#io-channel-cells = <1>;
> +		label = "vdd_core";
> +		shunt-resistor = <10000>;
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	power-sensor@41 {
> +		compatible = "ti,ina231";
> +		reg = <0x41>;
> +		#io-channel-cells = <1>;
> +		label = "vddr_core";
> +		shunt-resistor = <10000>;
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	power-sensor@45 {
> +		compatible = "ti,ina231";
> +		reg = <0x45>;
> +		#io-channel-cells = <1>;
> +		label = "dvdd_1v8";
> +		shunt-resistor = <10000>;
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	power-sensor@47 {
> +		compatible = "ti,ina231";
> +		reg = <0x47>;
> +		#io-channel-cells = <1>;
> +		label = "vdd_ddr";
> +		shunt-resistor = <10000>;
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	temperature-sensor@48 {
> +		compatible = "ti,tmp100";
> +		reg = <0x48>;
> +		label = "soc";
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	temperature-sensor@49 {
> +		compatible = "ti,tmp100";
> +		reg = <0x49>;
> +		label = "ddr";
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	power-sensor@4c {
> +		compatible = "ti,ina231";
> +		reg = <0x4c>;
> +		#io-channel-cells = <1>;
> +		label = "dvdd_3v3";
> +		shunt-resistor = <10000>;
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
> +
> +	power-sensor@4d {
> +		compatible = "ti,ina231";
> +		reg = <0x4d>;
> +		#io-channel-cells = <1>;
> +		label = "vdda_1v8";
> +		shunt-resistor = <10000>;
> +		vs-supply = <&vcc_3v3_sys>;
> +	};
>  };
>  
>  &sdhci1 {
> 
> ---
> base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
> change-id: 20250505-am625-sk-sensors-bb255e2baa47
> 
> Best regards,
> -- 
> Sascha Hauer <s.hauer@pengutronix.de>
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
