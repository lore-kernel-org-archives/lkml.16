Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAD3328B15;
	Fri,  4 Jul 2025 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619005; cv=none; b=ohgyXXtjuP/RhMmkr/HJUa3xA/+DpbYy32S3+BpRUvfuYQqs88+EWjB5gVt+Afui6ZI7ihRnXqYe8gPI0aSzmK9Txt2lQ6DnQnS/vZ/I7FWLyQcwOKsDDo91vsBmxUfni+Ft4SpTgE/Coq34yXWyEfVx5N5j00BIvr5DI6e27DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619005; c=relaxed/simple;
	bh=DmWmWnG0xzD5jR64/AXRzwV45mL5Jd9K9YLXjjpIGjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AtEe9/g2WfQFo8IZUT5A15Cer3eNTfPPuF0yVRdB9ZxGY/Zw/ZNaWw+rAAVCwaSIlBF9U54j1AwKoqTv/Kut9NpnhbC6br9Pg1gY6tVb3nG3cCQhkgowoZD6bnfcxAP9VmOa1H3OquU/gzh9kvnn9wq5YdxVvARdf8hHLA3Jk40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sHMAVZhy; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sHMAVZhy"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5648nvv84137013;
	Fri, 4 Jul 2025 03:49:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751618997;
	bh=MNcJEOQZ0+j6Wxt3y+Bn5OQsOtsRMAuYq1Yrns6q6q8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sHMAVZhyCYyA28916ZVQshWt6/7jLlzmoSmyanqO/OR7VIhp2dObKaqzLZ2OneWdW
	 7kMIGjjBEN3aY/Y+GryVgtUh5oz992/gMRgRDen44hs/i3SJgZ2/x7DwDmdekigBI7
	 /AwV15DCRuPRq8buvUQ+rv3BzeFkixpbt4tIEEZM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5648nv392659128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 03:49:57 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 03:49:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 03:49:56 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5648np2f2413577;
	Fri, 4 Jul 2025 03:49:52 -0500
Message-ID: <3d766967-a562-4b91-bafb-0d6688f72636@ti.com>
Date: Fri, 4 Jul 2025 14:19:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: Add support for AM62D2-EVM
To: Vignesh Raghavendra <vigneshr@ti.com>, <nm@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-5-p-bhagat@ti.com>
 <c9e0c113-f663-426b-8a23-d82300987b98@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <c9e0c113-f663-426b-8a23-d82300987b98@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Vignesh,


On 04/07/25 10:20, Vignesh Raghavendra wrote:
>
> On 27/06/25 17:27, Paresh Bhagat wrote:
>> +&main_pmx0 {
>> +	main_uart0_pins_default: main-uart0-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x01c8, PIN_INPUT, 0) /* (E14) UART0_RXD */
>> +			AM62DX_IOPAD(0x01cc, PIN_OUTPUT, 0) /* (D15) UART0_TXD */
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>> +	main_i2c0_pins_default: main-i2c0-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D17) I2C0_SCL */
>> +			AM62DX_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (E16) I2C0_SDA */
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>> +	main_i2c1_pins_default: main-i2c1-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0) /* (C17) I2C1_SCL */
>> +			AM62DX_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (E17) I2C1_SDA */
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>> +	main_i2c2_pins_default: main-i2c2-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (M22) GPMC0_CSn2.I2C2_SCL */
>> +			AM62DX_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (M20) GPMC0_CSn3.I2C2_SDA */
>> +		>;
>> +	};
>> +
>> +	main_mmc0_pins_default: main-mmc0-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x0220, PIN_INPUT_PULLUP, 0) /* (Y6) MMC0_CMD */
>> +			AM62DX_IOPAD(0x0218, PIN_OUTPUT, 0) /* (AB7) MMC0_CLK */
>> +			AM62DX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (AA6) MMC0_DAT0 */
>> +			AM62DX_IOPAD(0x0210, PIN_INPUT_PULLUP, 0) /* (AB6) MMC0_DAT1 */
>> +			AM62DX_IOPAD(0x020c, PIN_INPUT_PULLUP, 0) /* (Y7) MMC0_DAT2 */
>> +			AM62DX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (AA7) MMC0_DAT3 */
>> +			AM62DX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (Y8) MMC0_DAT4 */
>> +			AM62DX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (W7) MMC0_DAT5 */
>> +			AM62DX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (W9) MMC0_DAT6 */
>> +			AM62DX_IOPAD(0x01f8, PIN_INPUT_PULLUP, 0) /* (AB8) MMC0_DAT7 */
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>> +	main_mmc1_pins_default: main-mmc1-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x023c, PIN_INPUT, 0) /* (C21) MMC1_CMD */
>> +			AM62DX_IOPAD(0x0234, PIN_OUTPUT, 0) /* (E22) MMC1_CLK */
>> +			AM62DX_IOPAD(0x0230, PIN_INPUT, 0) /* (B22) MMC1_DAT0 */
>> +			AM62DX_IOPAD(0x022c, PIN_INPUT_PULLUP, 0) /* (D21) MMC1_DAT1 */
>> +			AM62DX_IOPAD(0x0228, PIN_INPUT_PULLUP, 0) /* (C22) MMC1_DAT2 */
>> +			AM62DX_IOPAD(0x0224, PIN_INPUT_PULLUP, 0) /* (D22) MMC1_DAT3 */
> Double check PULLUP here.. There seems to be external PULLUPs on the
> board. Do you still need internal pulls?


Will check this and update in next version. Thanks.
>
>> +			AM62DX_IOPAD(0x0240, PIN_INPUT, 0) /* (E18) MMC1_SDCD */
>> +			AM62DX_IOPAD(0x0244, PIN_INPUT, 0) /* (D18) MMC1_SDWP */
> This pin isn't needed/connected right?


Yep. i am planning to enable heartbeat led using the pin in next version.
>
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>> +	main_mdio0_pins_default: main-mdio0-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x160, PIN_OUTPUT, 0) /* (V12) MDIO0_MDC */
>> +			AM62DX_IOPAD(0x15c, PIN_INPUT, 0) /* (V13) MDIO0_MDIO */
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>> +	main_rgmii1_pins_default: main-rgmii1-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x14c, PIN_INPUT, 0) /* (AB16) RGMII1_RD0 */
>> +			AM62DX_IOPAD(0x150, PIN_INPUT, 0) /* (V15) RGMII1_RD1 */
>> +			AM62DX_IOPAD(0x154, PIN_INPUT, 0) /* (W15) RGMII1_RD2 */
>> +			AM62DX_IOPAD(0x158, PIN_INPUT, 0) /* (V14) RGMII1_RD3 */
>> +			AM62DX_IOPAD(0x148, PIN_INPUT, 0) /* (AA16) RGMII1_RXC */
>> +			AM62DX_IOPAD(0x144, PIN_INPUT, 0) /* (AA15) RGMII1_RX_CTL */
>> +			AM62DX_IOPAD(0x134, PIN_INPUT, 0) /* (Y17) RGMII1_TD0 */
>> +			AM62DX_IOPAD(0x138, PIN_INPUT, 0) /* (V16) RGMII1_TD1 */
>> +			AM62DX_IOPAD(0x13c, PIN_INPUT, 0) /* (Y16) RGMII1_TD2 */
>> +			AM62DX_IOPAD(0x140, PIN_INPUT, 0) /* (AA17) RGMII1_TD3 */
>> +			AM62DX_IOPAD(0x0130, PIN_OUTPUT, 0) /* (AB17) RGMII1_TXC */
>> +			AM62DX_IOPAD(0x012c, PIN_OUTPUT, 0) /* (W16) RGMII1_TX_CTL */
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>> +	main_rgmii2_pins_default: main-rgmii2-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x0184, PIN_INPUT, 0) /* (AA21) RGMII2_RD0 */
>> +			AM62DX_IOPAD(0x0188, PIN_INPUT, 0) /* (Y20) RGMII2_RD1 */
>> +			AM62DX_IOPAD(0x018c, PIN_INPUT, 0) /* (AB21) RGMII2_RD2 */
>> +			AM62DX_IOPAD(0x0190, PIN_INPUT, 0) /* (AB20) RGMII2_RD3 */
>> +			AM62DX_IOPAD(0x0180, PIN_INPUT, 0) /* (AA20) RGMII2_RXC */
>> +			AM62DX_IOPAD(0x017c, PIN_INPUT, 0) /* (W18) RGMII2_RX_CTL */
>> +			AM62DX_IOPAD(0x016c, PIN_INPUT, 0) /* (AA19) RGMII2_TD0 */
>> +			AM62DX_IOPAD(0x0170, PIN_INPUT, 0) /* (Y18) RGMII2_TD1 */
>> +			AM62DX_IOPAD(0x0174, PIN_INPUT, 0) /* (AA18) RGMII2_TD2 */
>> +			AM62DX_IOPAD(0x0178, PIN_INPUT, 0) /* (W17) RGMII2_TD3 */
>> +			AM62DX_IOPAD(0x0168, PIN_OUTPUT, 0) /* (AB19) RGMII2_TXC */
>> +			AM62DX_IOPAD(0x0164, PIN_OUTPUT, 0) /* (Y19) RGMII2_TX_CTL */
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>> +	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x01d4, PIN_INPUT, 7) /* (C15) UART0_RTSn.GPIO1_23 */
>> +		>;
>> +	};
>> +
>> +	vddshv_sdio_pins_default: vddshv-sdio-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x1F4, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO1_31 */
> 					^^^ use lower case hexadecimals


Will fix this
>
>> +		>;
>> +		bootph-all;
>> +	};
>> +};
>> +
