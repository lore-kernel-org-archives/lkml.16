Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C6228F939;
	Fri, 11 Apr 2025 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357897; cv=none; b=geHW3ZLoVg5qFLMpC174EHywei4IN3aJ/tYLm2QlD4+u7OQziCkfCY2gjX2KWzRAusPlmW/yciZnyO+n3cxtYL7FZOhmFfJ/zvvpljPg218x6uPCgP0VnyOacnYlD9oaCZaduQj9NzDm4+7LieufJEemVS5WPcA3t6Esl02+CJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357897; c=relaxed/simple;
	bh=LpyY1HmKB5P1TZETFUc27hEubUH+I0U3rTI0Tnjwluk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3m6aEnm3yTg2j8ZAT7wvkfrN741cdVagQIjiZd/T1UA8bwKvGpjk2+6gHlOrmMIhev9J+SzQ05YT9F67bM03VW7bCXfb2KwuFNWWhw3vk0YRaDBDrzHebwBGTBl4R7ruxNpw78gGGYsIEtQsX9ecA34ZAEiAZ2HF4fsL2c9JnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=53044 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u39Ai-003jxP-2O;
	Fri, 11 Apr 2025 09:51:32 +0200
Message-ID: <8c41e55a-1fcd-4bac-9e1b-3dfdcc7d3e9d@norik.com>
Date: Fri, 11 Apr 2025 09:51:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 RTC support
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-10-primoz.fiser@norik.com>
 <Z/ff8rQ7wGzKiX+d@lizhi-Precision-Tower-5810>
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
In-Reply-To: <Z/ff8rQ7wGzKiX+d@lizhi-Precision-Tower-5810>
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

On 10. 04. 25 17:12, Frank Li wrote:
> On Thu, Apr 10, 2025 at 11:02:47AM +0200, Primoz Fiser wrote:
>> Add support for RTC clock connected via I2C on phyBOARD-Segin-i.MX93.
>> Make I2C RTC the default clock by configuring the aliases.
> 
> "Add support for RTC connected via I2C on phyBOARD-Segin-i.MX93. Set
> default RTC by configuring the aliases."
> 
> Frank
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
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
>> +&lpi2c2 {
>> +	clock-frequency = <400000>;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_lpi2c2>;
>> +	status = "okay";
>> +
>> +	/* RTC */
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
> 
> keep order by node name.
> 

pinctrl_uart1 was out of order since beginning.

I will create a separate patch to this series ordering nodes
alphabetically as a last step.

OK?


> Frank
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
