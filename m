Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03A023815D;
	Thu, 26 Jun 2025 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750933594; cv=none; b=qECox5xJkL+Bp2a/O0fIMzdfwKkeqB66uRP4PPdYrLD9WZyYXKsFJKpa0FvqPo5RiP/7McvTJ+WnjQCT6uivwSs7uXfSYR5bRmeJQu+3kOj3aQM53YTBlmD13f5cYf1uwx7eL8VxlnTU5iAjTBOhN27JZ9IS7088sCYycxZDsSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750933594; c=relaxed/simple;
	bh=f4iGf7Q64J4LhrP3NYzSeEC4LwixPUQ+3cb4kLHOtGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p+IhrDNYlIt1Enmlr8Gzt4CjFAtHl1rUIwPLk//y6AG8YrfxpUwfdISooEnrgAxIj7Nn0WplFSf5suq86jrLy0v7gqI4IU0yI3K/FeunIjJQxhn/enRj5a7wdkHlgSGLU1S6M8+FdJWdXtO19zMwl0kh0ELi4e1twm/z7vUqgK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Dqr/FcpZ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Dqr/FcpZ"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QAQKgr1717299;
	Thu, 26 Jun 2025 05:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750933580;
	bh=kRolmEIKli9p4hwGQbbTqvQScgVEcFqSWTOIe6ZE1zk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Dqr/FcpZtcob14n36+suv1WrtLyCFM7my+SoTgaYneC/rWMNHD0nx4t74xxVlCBBG
	 Yi4lAvl/CXg4E3v1FMPLCOJFlccduD9LdmFLkHm1td6mVCaZW9IhhPIo26z2QT6a2H
	 h1TNPpXsYCyB+c5YjclgVOdMfaQZuzuSPjN3ckuw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QAQKaf1892556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 05:26:20 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 05:26:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 05:26:19 -0500
Received: from [172.24.31.248] (lt5cd2489kgj.dhcp.ti.com [172.24.31.248])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QAQFXk1106020;
	Thu, 26 Jun 2025 05:26:16 -0500
Message-ID: <a5b61958-98fa-48a7-9499-b6e238c5945a@ti.com>
Date: Thu, 26 Jun 2025 15:56:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: ti: k3-j721s2-common-proc-board: Add
 main_i2c4 instance
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
 <20250624082619.324851-5-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250624082619.324851-5-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 6/24/2025 1:56 PM, Jayesh Choudhary wrote:
> Add dt node for main_i2c4 instance along with required pinmuxing.
> Also add the gpio expander 'exp4' required by display connector.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 24 +++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> index e2fc1288ed07..793d50344fad 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> @@ -148,6 +148,13 @@ J721S2_IOPAD(0x060, PIN_INPUT_PULLUP, 13) /* (AC27) MCASP2_AXR1.I2C3_SDA */
>   		>;
>   	};
>   
> +	main_i2c4_pins_default: main-i2c4-default-pins {
> +		pinctrl-single,pins = <
> +			J721S2_IOPAD(0x014, PIN_INPUT_PULLUP, 8) /* (AD25) I2C4_SCL */

Please check once for i2c clock, pin should be in input or output pull 
up mode.


> +			J721S2_IOPAD(0x010, PIN_INPUT_PULLUP, 8) /* (AF28) I2C4_SDA */
> +		>;
> +	};
> +
>   	main_i2c5_pins_default: main-i2c5-default-pins {
>   		pinctrl-single,pins = <
>   			J721S2_IOPAD(0x01c, PIN_INPUT, 8) /* (Y24) MCAN15_TX.I2C5_SCL */
> @@ -370,6 +377,23 @@ exp2: gpio@22 {
>   	};
>   };
>   
> +&main_i2c4 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c4_pins_default>;
> +	clock-frequency = <400000>;
> +
> +	exp4: gpio@20 {
> +		compatible = "ti,tca6408";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-line-names = "DP0_PWR_SW_EN", "DP1_PWR_SW_EN", "UB981_PDB",
> +				  "UB981_GPIO0", "UB981_GPIO1", "UB981_GPIO2",
> +				  "UB981_GPIO3", "PWR_SW_CNTL_DSI0#";
> +	};
> +};
> +
>   &main_i2c5 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_i2c5_pins_default>;
