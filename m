Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2147F27E1CB;
	Fri, 11 Apr 2025 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744358905; cv=none; b=QeRSh7VHOE1ruOpbakvPJEB3/lapCM71qr3P08BNZEH9qxF1ZEVj3OrqN+uI6zevKvbsIq1qHCQWEZ+bHQdb29m/lhMuvRQi+O/0+77yx9qxLrBgEPeic+aMbbUjtoje/B0U2dFIAFHZMBKLK+sv32vvzKmreRTaXk8VKSkfb3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744358905; c=relaxed/simple;
	bh=eV3bP+q0vvjkWsAWiAx37XV+yljcdTUB8mBUVr/qcqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kezxq2IKqpt/TNL0rJb8ORWf6EMkbozXqRdjowFOwf7pyJRV1WqbJwSX2xiTxSR4JYo5856FIQXvuiPpUlRcOestIfz3nXCTbNCCxC9Ms1ip8pl/m4P3zVBAV1TeaQi9i8PTugvZ+I5D0zX8irrAMQPJG0xgcuWkHcfX2Fjmh1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=57494 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u39R0-003nq0-1x;
	Fri, 11 Apr 2025 10:08:22 +0200
Message-ID: <ef74e49d-c413-4719-a174-42df91384469@norik.com>
Date: Fri, 11 Apr 2025 10:08:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 CAN support
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-11-primoz.fiser@norik.com>
 <Z/fifUQ4M2doQbHx@lizhi-Precision-Tower-5810>
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
In-Reply-To: <Z/fifUQ4M2doQbHx@lizhi-Precision-Tower-5810>
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

On 10. 04. 25 17:23, Frank Li wrote:
> On Thu, Apr 10, 2025 at 11:02:48AM +0200, Primoz Fiser wrote:
>> Add support for CAN networking on phyBOARD-Segin-i.MX93 via the flexcan1
>> interface. The CAN1_EN regulator enables the SN65HVD234 CAN transceiver
>> chip.
> 
> Can you use drivers/phy/phy-can-transceiver.c to enable CAN phy instead
> of use hacked regulator-flexcan1-en.

Sorry can't do.

This doesn't align with other i.MX PHYTEC products using flexcan such as
imx8mp-phyboard-pollux-rdk.dts.

Even the i.MX93 EVK uses the same mechanism.

BR,
Primoz


> 
> Frank
> 
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  .../dts/freescale/imx93-phyboard-segin.dts    | 32 +++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> index 38b89398e646..027a34dbaf04 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> @@ -26,6 +26,17 @@ chosen {
>>  		stdout-path = &lpuart1;
>>  	};
>>
>> +	reg_flexcan1_en: regulator-flexcan1-en {
>> +		compatible = "regulator-fixed";
>> +		enable-active-high;
>> +		gpio = <&gpio4 16 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_reg_flexcan1_en>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-name = "CAN1_EN";
>> +	};
>> +
>>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>>  		compatible = "regulator-fixed";
>>  		enable-active-high;
>> @@ -38,6 +49,14 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>>  	};
>>  };
>>
>> +/* CAN */
>> +&flexcan1 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_flexcan1>;
>> +	xceiver-supply = <&reg_flexcan1_en>;
>> +	status = "okay";
>> +};
>> +
>>  /* I2C2 */
>>  &lpi2c2 {
>>  	clock-frequency = <400000>;
>> @@ -79,6 +98,19 @@ &usdhc2 {
>>  };
>>
>>  &iomuxc {
>> +	pinctrl_flexcan1: flexcan1grp {
>> +		fsl,pins = <
>> +			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
>> +			MX93_PAD_PDM_CLK__CAN1_TX		0x139e
>> +		>;
>> +	};
>> +
>> +	pinctrl_reg_flexcan1_en: regflexcan1engrp {
>> +		fsl,pins = <
>> +			MX93_PAD_ENET2_TD3__GPIO4_IO16		0x31e
>> +		>;
>> +	};
>> +
>>  	pinctrl_lpi2c2: lpi2c2grp {
>>  		fsl,pins = <
>>  			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
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
