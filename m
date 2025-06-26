Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A51237162;
	Thu, 26 Jun 2025 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750934100; cv=none; b=Vm8EtgUHXtXObxW6EFQutH98bERiym+Cl8d8j0VUpJ5eu6RYyQPS6mu/VcrlL3gVUOR+Q8X5285wazX2W9J9/ohHXAi/1rSs0aYc5mqTHS0UREkrm99jDxMZfAnQ3dWUHimF4EONGD2ktjSpGtXh9jcNitppweDx0CTQmo/Ojg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750934100; c=relaxed/simple;
	bh=dQ2Zex+ov2PCncLQ7U1GbKR7W8qycO6k0YuiZMLpeH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qXZ6WG4Yd6pzXjRM0Wu/y+qvii2RqfOagY6Sv18U42lW7hBx1EySh0KiLzqK0oriS6nOZmHzxRW80oq0BvzdZFUWHlvNhhfL6KSWwGPKRdM01zH79EbkIpQhyhqAdbmVKexsXLZMW0O5Jy0evpZyf/x20r5u7gYPRE3+sQwyjQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EZ2oMctZ; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EZ2oMctZ"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QAYql52391124;
	Thu, 26 Jun 2025 05:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750934092;
	bh=pdqJ3/ldB4zuQCaDnWbImn2eySoaM0afbT1+2XUy9J0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EZ2oMctZVZApUtrJijsJRvVhgoS3zGvOLgr3frisLx+HD6anG1y1/JvK8IEsxcJ7q
	 IKwBbW4ZZ0C2Fk//YO80M0uKb22hQc6p09zjtKjJc6g4A36bptnXSOyrcO+qvCRMEe
	 zpE+5rUUJmsvoHNGfnmbifxpfWycSPTsS+L798GE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QAYqan2165138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 05:34:52 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 05:34:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 05:34:51 -0500
Received: from [172.24.31.248] (lt5cd2489kgj.dhcp.ti.com [172.24.31.248])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QAYl0f855804;
	Thu, 26 Jun 2025 05:34:48 -0500
Message-ID: <b37efc4e-0959-47a0-8fae-6cb35899752e@ti.com>
Date: Thu, 26 Jun 2025 16:04:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: ti: k3-j721s2-common-proc-board:
 Enable DisplayPort-1
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
 <20250624082619.324851-7-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250624082619.324851-7-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 6/24/2025 1:56 PM, Jayesh Choudhary wrote:
> Enable DSI display for J721S2 EVM.
>
> Add the endpoint nodes to describe connection from:
> DSS => DSI Bridge => DSI to eDP bridge => DisplayPort-1
>
> Set status for all required nodes for DisplayPort-1 as 'okay'.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 89 +++++++++++++++++++
>   1 file changed, 89 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> index 793d50344fad..efe857a50bb1 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> @@ -93,6 +93,29 @@ vdd_sd_dv: gpio-regulator-TLV71033 {
>   			 <3300000 0x1>;
>   	};
>   
> +	dp1_pwr_3v3: regulator-dp1-prw {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dp1-pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&exp4 1 GPIO_ACTIVE_HIGH>; /* P1 - DP1_PWR_SW_EN */
> +		enable-active-high;
> +		regulator-always-on;

Please check once, if this regulator falls under regulator-always-on case,

I can imagine a case, where DP1 is not used and still regulator is kept on


> +	};
> +
> +	dp1: connector-dp1 {
> +		compatible = "dp-connector";
> +		label = "DP1";
> +		type = "full-size";
> +		dp-pwr-supply = <&dp1_pwr_3v3>;
> +
> +		port {
> +			dp1_connector_in: endpoint {
> +				remote-endpoint = <&dp1_out>;
> +			};
> +		};
> +	};
> +
>   	transceiver1: can-phy1 {
>   		compatible = "ti,tcan1043";
>   		#phy-cells = <0>;
> @@ -563,3 +586,69 @@ &main_mcan5 {
>   	pinctrl-0 = <&main_mcan5_pins_default>;
>   	phys = <&transceiver4>;
>   };
> +
> +&dss {
> +	/*
> +	 * DSS on J721S2-EVM supports DP on VP0 and DSI on VP2.
> +	 * These clock assignments are chosen to enable the following outputs:
> +	 * VP0 - DisplayPort SST
> +	 * VP2 - DSI
> +	 */
> +	status = "okay";
> +	assigned-clocks = <&k3_clks 158 2>,
> +			  <&k3_clks 158 14>;
> +	assigned-clock-parents = <&k3_clks 158 3>,
> +				 <&k3_clks 158 16>;
> +};
> +
> +&dss_ports {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	port@2 {
> +		reg = <2>;
> +		dpi2_out: endpoint {
> +			remote-endpoint = <&dsi0_in>;
> +		};
> +	};
> +};
> +
> +&dsi0_ports {
> +	port@0 {
> +		reg = <0>;
> +		dsi0_out: endpoint {
> +			remote-endpoint = <&dp1_in>;
> +		};
> +	};
> +
> +	port@1 {
> +		reg = <1>;
> +		dsi0_in: endpoint {
> +			remote-endpoint = <&dpi2_out>;
> +		};
> +	};
> +};
> +
> +&dsi_edp_bridge_ports {
> +	port@0 {
> +		reg = <0>;
> +		dp1_in: endpoint {
> +			remote-endpoint = <&dsi0_out>;
> +		};
> +	};
> +
> +	port@1 {
> +		reg = <1>;
> +		dp1_out: endpoint {
> +			remote-endpoint = <&dp1_connector_in>;
> +		};
> +	};
> +};
> +
> +&dphy_tx0 {
> +	status = "okay";
> +};
> +
> +&dsi0 {
> +	status = "okay";
> +};
