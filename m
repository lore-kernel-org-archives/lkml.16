Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A13E13A3F7;
	Thu, 26 Jun 2025 06:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750919662; cv=none; b=VDzeiuEYfF1j4I5hFnU6NqGxug8ZTAlq03/6SyfLTAyfrH84dI8y7No0Sicfk+ToyViVJX+GUglKkcD2ExHAsL8y+Pz7KIcOYBwbVUCvQTjtYL47/B6tSWr7vD/hk3mABfzlnmzuY6O/MISlRYEpAXTz1dL2blFEf7gP2wKmY0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750919662; c=relaxed/simple;
	bh=h9xTRIpmxk6RffAgcVzfrjeaGDAnBp8G3HY8XzUvDp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YKI3wNJDFMXnw/i9222UVP/i9QEO92YJpNbHholaX5Rn14ygaSnHyjHvTfbhjh56fuffkNmFBGCGWC9iS/iIolkSs8IDE7QRAR5if+uHSIY3hetHEzAg1mBJaoFBFTLwwwozBc7rtgUwFrcIIMERz9aZvTgQ0bWdBvMhuKkBOuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RMnOvH2T; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RMnOvH2T"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q6YDaV2376660;
	Thu, 26 Jun 2025 01:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750919653;
	bh=Mth4wXANQfN7CfdhwyXVkM+yuM1L4hdreVBkMvSqM44=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RMnOvH2TNUGZKM7SreBG7TgsMpMfuS7BIFjsAB4qoTYO39QN9ReVI7WQsZNqYpCA4
	 pn3K1j8TxF0f1NAJ7JyKfpsfeBw7gE/JgjfI60VkZ1iHdYUf3BaDjCBMCIaucDpxuu
	 asEXwo8cPiv+EXq0DSiM35SWeM4MMDDrbF0uFccM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q6YDNv1726431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 01:34:13 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 01:34:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 01:34:13 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q6Y81i530502;
	Thu, 26 Jun 2025 01:34:09 -0500
Message-ID: <4765b426-e625-4563-a748-7edb40e3b260@ti.com>
Date: Thu, 26 Jun 2025 12:04:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: ti: k3-am68-sk: Enable DSI on
 DisplayPort-0
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
 <20250624082619.324851-8-j-choudhary@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250624082619.324851-8-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 24/06/25 13:56, Jayesh Choudhary wrote:
> Enable DSI support for AM68-SK platform.
> 
> Add DT node for DSI2eDP bridge. The DSI to eDP bridge is sn65dsi86
> on the board.
> 
> Add the endpoint nodes to describe connection from:
> DSS => DSI => SN65DSI86 bridge => DisplayPort-0
> 
> Set status for all required nodes for DisplayPort-0 as 'okay'.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../boot/dts/ti/k3-am68-sk-base-board.dts     | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> index 5fa70a874d7b..aef63ae2994c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> @@ -135,6 +135,35 @@ transceiver4: can-phy3 {
>  		max-bitrate = <5000000>;
>  	};
>  
> +	edp0_refclk: clock-edp0-refclk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <19200000>;
> +	};
> +
> +	dp0_pwr_3v3: fixedregulator-dp0-pwr {

use std node name: regulator-...

> +		compatible = "regulator-fixed";
> +		regulator-name = "dp0-pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&exp2 2 GPIO_ACTIVE_HIGH>;     /*P0 - DP0_3V3 _EN */
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	dp0: dp0-connector {
> +		compatible = "dp-connector";
> +		label = "DP0";
> +		type = "full-size";
> +		dp-pwr-supply = <&dp0_pwr_3v3>;
> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&dp0_out>;
> +			};
> +		};
> +	};
> +
>  	connector-hdmi {
>  		compatible = "hdmi-connector";
>  		label = "hdmi";
> @@ -605,6 +634,39 @@ exp2: gpio@20 {
>  		gpio-line-names = "HDMI_PDn","HDMI_LS_OE",
>  				  "DP0_3V3_EN","eDP_ENABLE";
>  	};
> +
> +	dsi_edp_bridge: dsi-edp-bridge@2c {
> +		compatible = "ti,sn65dsi86";
> +		reg = <0x2c>;
> +		clock-names = "refclk";
> +		clocks = <&edp0_refclk>;
> +		enable-gpios = <&exp2 3 GPIO_ACTIVE_HIGH>;
> +		vpll-supply = <&vsys_io_1v8>;
> +		vccio-supply = <&vsys_io_1v8>;
> +		vcca-supply = <&vsys_io_1v2>;
> +		vcc-supply = <&vsys_io_1v2>;
> +
> +		dsi_edp_bridge_ports: ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				dp0_in: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				dp0_out: endpoint {
> +					remote-endpoint = <&dp0_connector_in>;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &main_sdhci1 {
> @@ -699,6 +761,15 @@ dpi_out0: endpoint {
>  			remote-endpoint = <&tfp410_in>;
>  		};
>  	};
> +
> +	/* DSI */
> +	port@2 {
> +		reg = <2>;
> +
> +		dpi0_out: endpoint {
> +			remote-endpoint = <&dsi0_in>;
> +		};
> +	};
>  };
>  
>  &serdes_ln_ctrl {
> @@ -756,3 +827,28 @@ &usb0 {
>  	phys = <&serdes0_usb_link>;
>  	phy-names = "cdns3,usb3-phy";
>  };
> +
> +&dphy_tx0 {
> +	status = "okay";
> +};
> +
> +&dsi0 {
> +	status = "okay";
> +};
> +
> +&dsi0_ports {
> +
> +	port@0 {
> +		reg = <0>;
> +		dsi0_out: endpoint {
> +			remote-endpoint = <&dp0_in>;
> +		};
> +	};
> +
> +	port@1 {
> +		reg = <1>;
> +		dsi0_in: endpoint {
> +			remote-endpoint = <&dpi0_out>;
> +		};
> +	};
> +};

-- 
Regards
Vignesh
https://ti.com/opensource

