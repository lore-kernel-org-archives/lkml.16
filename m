Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC81327CCD5;
	Fri, 11 Apr 2025 06:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744354284; cv=none; b=mJXsUAP6D9wambmqGtPfAfZWdSrGeqazhU3F6y7vGTSg/qVDd4X1GmQJCmvkc2mvr2imDZjqQgis3obzqDZCGbRIKy2in/elsQulxx4JiPhrPEI1NOXbD9QiPbX9CaBvQkdESTz3zYPHc2ceBvWrI7epqzxiQ56CwbqCguFijMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744354284; c=relaxed/simple;
	bh=HDXDrlVt+FGDxrjS5VgTAI4hnyLXPAN2IU8yC7FA2pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E42BGF1T4Y4HMEZ4+0wnYbikrPctsjZgT0NfIpiBopXibNWDxYKD87/aCWw/4O2dsZDwcKUlp2kPA7ITaVikcH5ujk7JmeesvltEkJlvE6sn1BSJvyqCtD25BdViDc0SOqH2e2webUrshM9UMsTFQ734tGYj9MODH30ZnBeX97M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=39246 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u38ES-003Yz0-13;
	Fri, 11 Apr 2025 08:51:19 +0200
Message-ID: <cffdcd6c-88c5-43c1-9f00-d1c84af73f4c@norik.com>
Date: Fri, 11 Apr 2025 08:51:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] arm64: dts: freescale: imx93-phycore-som: Add eMMC
 no-1-8-v by default
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-6-primoz.fiser@norik.com>
 <Z/fdR2C0IRUfUv4U@lizhi-Precision-Tower-5810>
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
In-Reply-To: <Z/fdR2C0IRUfUv4U@lizhi-Precision-Tower-5810>
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

On 10. 04. 25 17:01, Frank Li wrote:
> On Thu, Apr 10, 2025 at 11:02:43AM +0200, Primoz Fiser wrote:
>> Add property 'no-1-8-v' by default to usdhc1 (eMMC) node. Bootloader
>> will take care of deleting the property in case SOM supports HS400 mode
>> (1.8V IO voltage feature flag has to be set in the EEPROM).
> 
> what means of EEPROM here?
> 
> Generally eMMC worked fixed voltage, why need 'no-1-8-v' here, even no
> HS400 support.

The phyCORE-i.MX93 SoM comes in two variants, one with 3.3V VDD_IO and
the other one with 1.8V VDD_IO voltage set.

The 3.3V variant can only support DDR52 mode, while 1.8V variant will
support HS400ES eMMC mode.

The information about VDD_IO option is encoded in the SoM's EEPROM. We
read EEPROM in the bootloader and clear "no-1-8-v" flag in case of 1.8V
SOM variant is detected.

In case of EEPROM error (erased or read error) the fall-back option has
to support both SoM variants, hence the "no-1-8-v" flag has to be set by
default.

BR,
Primoz



> 
> Frank
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> index 3d84eed33074..d6589d26c875 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> @@ -172,6 +172,7 @@ &usdhc1 {
>>  	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
>>  	bus-width = <8>;
>>  	non-removable;
>> +	no-1-8-v;
>>  	status = "okay";
>>  };
>>
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
