Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA57C35971;
	Wed, 16 Apr 2025 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807325; cv=none; b=LJAvo0YGgQ9f0EUGLkir7Zg2d6u+6RtSwDGJ28M3zX3zJ9Il3edKvTdTG9S1elAxjqDTlSNwOeYnUl9nOkX/U+VwKx/tsVzMsN7q/Jsz8hN5bovYXWmsw8s7XtpM4jIeUSnN7VSm8L1duZCm8iYeEh8IgoVjAdh5hhCoogoDua0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807325; c=relaxed/simple;
	bh=l6BkU0WG/PDwwSUx64TnlRvo3wX1D1V2xBkUjIb0FY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYhaOwI3Ej5RAoaIxsdvRzKqR86bKaUER+iDHHWXQR0w2TwsLxWbwJCsANCVBppNxQ7Imhk/n1Ze8Lnd8+O7h0WDfGIG1FJ7SToopp5ApA5GVdKLi0wZ9U0MVad6uZki3r2DTaZ9SnN2+xhAFaT9C/ENlwVTQRCjIsytsOa4Qwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=YWqeyxmQ; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="YWqeyxmQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=amxK6ouKB1rCSLCDLbv8LpDaz47zy5qHLGTrbw+VYdM=; b=YWqeyxmQyXyzhLd5L6kJlOPOJO
	LBLBeFqKfRCodOVY+s2EwPOLpw+hKBsVnpNRDDMJXI0Zh2Rn5NShXZVnIYZaaGwMz1tkOK7cadfWb
	hPx/1ifWOzYIrFhZNNTsrFJ9SfuZb28w32qhyx0CBnLbrsZTk5DHN1gGnFRePEhkBUimySejHXuwf
	2qoMOu4q/jYA0ocQMICZGs4gvBmZkI9HAuCCjqCN/3lfddL/wxJXKdunfnpwwIxvgD5jjntylytzZ
	5NoLQ1j4oZ4PD1PieUyrToTMmn0EG9bDnwffFPj4alPrq9q6bh6yhyWkWN4F2zK8xor2R+nVGFbgH
	kDDGi6ow==;
Received: from [89.212.21.243] (port=41686 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u525Z-003ze3-2Z;
	Wed, 16 Apr 2025 14:42:01 +0200
Message-ID: <6839cdfa-3086-459f-b318-4f3f2bbf0a4e@norik.com>
Date: Wed, 16 Apr 2025 14:42:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] arm64: dts: freescale: imx93-phyboard-segin: Add
 RTC support
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
 <20250415043311.3385835-11-primoz.fiser@norik.com>
 <Z/6pkVPh5Rn9oOPY@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <Z/6pkVPh5Rn9oOPY@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Frank,

On 15. 04. 25 20:46, Frank Li wrote:
> On Tue, Apr 15, 2025 at 06:33:06AM +0200, Primoz Fiser wrote:
>> Add support for RTC connected via I2C on phyBOARD-Segin-i.MX93. Set
>> default RTC by configuring the aliases.
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>> Changes in v2:
>> - reword commit message
>>
>>  .../dts/freescale/imx93-phyboard-segin.dts    | 36 +++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> index 525f52789f8b..38b89398e646 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> @@ -17,6 +17,11 @@ /{
>>  	compatible = "phytec,imx93-phyboard-segin", "phytec,imx93-phycore-som",
>>  		     "fsl,imx93";
>>
>> +	aliases {
>> +		rtc0 = &i2c_rtc;
>> +		rtc1 = &bbnsm_rtc;
>> +	};
>> +
>>  	chosen {
>>  		stdout-path = &lpuart1;
>>  	};
>> @@ -33,6 +38,24 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>>  	};
>>  };
>>
>> +/* I2C2 */
> 
> nit: needn't it
> 
>> +&lpi2c2 {
>> +	clock-frequency = <400000>;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_lpi2c2>;
>> +	status = "okay";
>> +
>> +	/* RTC */
> 
> the same here, not name is rtc.
> 

I would like to keep the above comments.

This is just helpful for customers using this board as reference when
designing their own carrier boards.

Thank you for understanding,

BR,
Primoz


> Frank
> 
>> +	i2c_rtc: rtc@68 {
>> +		compatible = "microcrystal,rv4162";
>> +		reg = <0x68>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_rtc>;
>> +		interrupt-parent = <&gpio4>;
>> +		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
>> +	};
>> +};
>> +
>>  /* Console */
>>  &lpuart1 {
>>  	pinctrl-names = "default";
>> @@ -56,6 +79,13 @@ &usdhc2 {
>>  };
>>
>>  &iomuxc {
>> +	pinctrl_lpi2c2: lpi2c2grp {
>> +		fsl,pins = <
>> +			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
>> +			MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
>> +		>;
>> +	};
>> +
>>  	pinctrl_uart1: uart1grp {
>>  		fsl,pins = <
>>  			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
>> @@ -69,6 +99,12 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
>>  		>;
>>  	};
>>
>> +	pinctrl_rtc: rtcgrp {
>> +		fsl,pins = <
>> +			MX93_PAD_ENET2_RD2__GPIO4_IO26		0x31e
>> +		>;
>> +	};
>> +
>>  	pinctrl_usdhc2_cd: usdhc2cdgrp {
>>  		fsl,pins = <
>>  			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
>> --
>> 2.34.1
>>

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com
