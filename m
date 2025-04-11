Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6281EFF9C;
	Fri, 11 Apr 2025 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744352951; cv=none; b=LMli9tGRDZFKdr6UH4BQubp39hj5scO2eI7zB/BmhypjoGbAlDavEhn97ffulcTP4L3cWJ1wAmUJ8l/1HnPU0Ps0JTXwDCVNIxS+mqbdyF5fCFQBNBiH4JS3Cw1xXzHTzuBqzOtBwLntnWqEvgSBjMpHQ7VX1lh/umiGB8E6FUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744352951; c=relaxed/simple;
	bh=RNF67hXYbIj7AuiBeY9z8+U88Il7RL5JK188qv9/XdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ft9vMZCZRZqy4G+hlXNgbnJVypxAIW2rreHTqkG6heXJQM/0sxU6+O8kmuag2E1KAcdEw3KPn2UfkMMtMfhse1Yl8Uo4MqQL9cTF9bHAg2OvxobxlB11aJXpIo8c8kDm+MglvpPrhdZwc70HVy3yj22iV5yKPnLV87xjZvmJYLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=57560 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u37sx-003VJz-29;
	Fri, 11 Apr 2025 08:29:07 +0200
Message-ID: <d68df49c-222a-445d-b29c-f9ad962b87aa@norik.com>
Date: Fri, 11 Apr 2025 08:29:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] arm64: dts: freescale: imx93-phycore-som: Enhance
 eMMC pinctrl
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-5-primoz.fiser@norik.com>
 <Z/fcFPrHdI8/IBRC@lizhi-Precision-Tower-5810>
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
In-Reply-To: <Z/fcFPrHdI8/IBRC@lizhi-Precision-Tower-5810>
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

On 10. 04. 25 16:56, Frank Li wrote:
> On Thu, Apr 10, 2025 at 11:02:42AM +0200, Primoz Fiser wrote:
>> Improve eMMC on phyCORE-i.MX93 SOM by adding 100MHz and 200MHz pinctrl
>> modes. This enables to use eMMC at enhanced data rates (e.g. HS400).
>>
>> While at it, apply a workaround for the i.MX93 chip errata ERR052021.
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  .../boot/dts/freescale/imx93-phycore-som.dtsi | 57 +++++++++++++++----
>>  1 file changed, 47 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> index 82f680d891c2..3d84eed33074 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> @@ -166,8 +166,10 @@ eeprom@50 {
>>
>>  /* eMMC */
>>  &usdhc1 {
>> -	pinctrl-names = "default";
>> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>>  	pinctrl-0 = <&pinctrl_usdhc1>;
>> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
>> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
>>  	bus-width = <8>;
>>  	non-removable;
>>  	status = "okay";
>> @@ -213,18 +215,53 @@ MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e
>>  		>;
>>  	};
>>
>> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>>  	pinctrl_usdhc1: usdhc1grp {
>>  		fsl,pins = <
>>  			MX93_PAD_SD1_CLK__USDHC1_CLK		0x179e
>> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x1386
>> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
>> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x1386
>> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
>> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x1386
>> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x1386
>> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x1386
>> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x1386
>> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x1386
>> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001386
>> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
>> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001386
>> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
>> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001386
>> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001386
>> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001386
>> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001386
>> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001386
>> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
>> +		>;
>> +	};
>> +
>> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
>> +		fsl,pins = <
>> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
>> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
>> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
> 
> any reason why DATA0 is difference with other one?
> 
>> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
>> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013be
>> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000139e
>> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
>> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
>> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
>> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
>> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
>> +		>;
>> +	};
>> +
>> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
>> +		fsl,pins = <
>> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
>> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
>> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
> 
> any reason why DATA0/DATA1 is difference with other one

Bus signal integrity envelope was measured and drive-strengths adjusted
accordingly by the PHYTEC hardware department to conform to the specs.

Values were thus determined empirically to adjust for differences in
signal impedance due to PCB layout.

BR,
Primoz

> 
> Frank
>> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013be
>> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013be
>> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013be
>> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013be
>> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013be
>> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013be
>> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013be
>>  			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
>>  		>;
>>  	};
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
