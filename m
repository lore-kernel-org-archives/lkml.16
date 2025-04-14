Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BF3269AF8;
	Mon, 14 Apr 2025 10:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744627149; cv=none; b=IPGpkEwpAB5hhTJEjJe4NBKpGJWOz3AgwilC2vNvIlvLKtvPMEvgYZT1OI/3Xx088cDAJLUZivH5JppU0jLnIoyiV2sCubrUMvDW9FH2EXfo4+lIVCMuESSvnxVznXkbFE0nSJiSZRpX/5QDqHVwnB/VMvuDxOELGvshFX4GCqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744627149; c=relaxed/simple;
	bh=3BSPRW9jz/E3iNNoZi54sVfpQpmzvqtMnqdlBCHCKoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8SQRNnP0XRCEPMTf3p8iNFJd07O3px4X6HtkIu58cdw9nc95Rp8ZsjohGvbKHTr5B/KqUxpPEfwTZ97mOuMxjZQFZnuaYX7U5W/yz3gm8SRA7CM86GgNLQUSc7gBqzMQo9fe+Z34FS0oyDlv6/UKCGpjvWLjTfMaZMw13W3szw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=irPMeEc0; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="irPMeEc0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GJ15JUHCXfYbdtaJeMwKFzeg6ws2+tweG0+4stR4TQI=; b=irPMeEc0lLDwmLPSFjfwDUUpPK
	Y3tKexLT3gUSq6zpx6zjfEKxfyDDcgLgAj/xb7GDhG/6UMDENF4sHSZybs1e1RcY5dqXF2epEeihG
	LDfZ5UzhN/EAxviBZHqTtUd21a1Wqlm9jalJdAnFUytadOFppuLJb0/hffmR7Cba2aAxJS3aIE4bP
	jZVMMpibz1NgWteF1WFBQAyrmyUonBqjkGQ2Z2jGegxqjwZ3Z4wTfhpP/4/fakrHfanjgCa3eZWK4
	UyjsppPH4atzpmA2QAiCOPE+6NpLWk0J1mrQ4QnhrZkiE0I8hlcyyExnBeDIsOxZ2wSqO9hM4zpO/
	4jJMxIGQ==;
Received: from [89.212.21.243] (port=36324 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4HDU-00DwF3-2f;
	Mon, 14 Apr 2025 12:39:04 +0200
Message-ID: <ff6320e5-1c83-4cab-9cfe-4df6877952b8@norik.com>
Date: Mon, 14 Apr 2025 12:39:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] arm64: dts: freescale: imx93-phyboard-segin: Drop
 eMMC no-1-8-v flag
To: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-7-primoz.fiser@norik.com>
 <254efe04-09c6-4225-a869-126026642091@gmx.net>
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
In-Reply-To: <254efe04-09c6-4225-a869-126026642091@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Stefan,

On 12. 04. 25 18:23, Stefan Wahren wrote:
> Hi Primoz,
> 
> Am 10.04.25 um 11:02 schrieb Primoz Fiser:
>> Drop redundant 'no-1-8-v' flag from usdhc1 (eMMC) node. Flag is now set
>> by default in the SOM include file (imx93-phycore-som.dtsi).
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> i think, Patch 5 and this one should be squashed together.

I intentionally split these series into SoM and board related patches.

I see no benefit in squashing #5 and #6.

Also, I already got Frank's Reviewed-by tag on this patch.

Thus I would like to keep them separate as is.

Thanks,
BR,
Primoz

> 
> Regards
>> ---
>>   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> index 85fb188b057f..902b523fc92c 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> @@ -40,11 +40,6 @@ &lpuart1 {
>>       status = "okay";
>>   };
>>
>> -/* eMMC */
>> -&usdhc1 {
>> -    no-1-8-v;
>> -};
>> -
>>   /* SD-Card */
>>   &usdhc2 {
>>       pinctrl-names = "default", "state_100mhz", "state_200mhz";
> 

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
