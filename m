Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0B81ACEDE;
	Mon, 26 May 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748261681; cv=none; b=K6uu/cKK82HA9w36rKrd2/YZHKmYG2wPtF9FOUYyruxVMaYjfbNjPe00UI7w7NIONaCsuVkqFLTrQOW7sctBdGX41kciFG4xmp722CqmhTjVRElJglca30d5j14FTQmwDaSesZUHg/dZMNHcKGONxNeNSRcEDeTusA1pvUy0oNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748261681; c=relaxed/simple;
	bh=5bgylINne1rVsqCXIpF2TmGDW2gRMoZDyg7bf+2YBuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrVwEjAuBx/8YRAxf+GH7VuynuQHcFkE7CvRvANrtsTsE/JwhrJSgsNibYXlGctpGdpdasDSoRm+kmv0dgbaRoKFU7ukFBLj18GORmeVwZ8a/VNDkvx017fbFI268LzQyK10xaqJYDITcFFpuuDUHIZI63dTv4llYbuBE4jVwAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=KQ4tZqtV; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="KQ4tZqtV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1748261667; x=1748866467; i=wahrenst@gmx.net;
	bh=1YdTh8j/tfIvIdbyMd/V7jnmW7T+J6RQ12jIzyL4mEY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KQ4tZqtV6xaWqAF1q9Izvddm7BKDKX3z88ZKKOAlRBdBN27V3HHlevcirge0pY1P
	 Ja9JPnvP4x1/6CxIp+5wtiSq8s8Keg6jectqqXmPHZWBGGc6nvNxQ86lGeTW0TXgK
	 FIQxzB73U5sz7XOQimJ9H2GxiFcC6QSCRhOcA0pFvHL9L4pvIpF4+Z/hDeDBx7G1H
	 VDQ2NlOnX+DNS9ejzzeD78AZOQGiPLU30WYSIAF5YHf85+stdQw6UZMFPzfh5wPlv
	 gVmi7xlK5l1cKf5gArO5OokwxHRepYJ78CNvGPb/frYbdblC06f/3AwO2D2spKq/B
	 f4ANZr6DA9br0p2AZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbox-1uZeZM00Hz-00IGnE; Mon, 26
 May 2025 14:14:27 +0200
Message-ID: <967484d9-4165-4b75-bbb7-a203c36e8beb@gmx.net>
Date: Mon, 26 May 2025 14:14:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
To: Christoph Stoidner <C.Stoidner@phytec.de>, Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "upstream@lists.phytec.de" <upstream@lists.phytec.de>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
 <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
 <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
 <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
 <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
 <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bl5CvDV3hsDCQzp9FMHDhgKzdifJWyUFT3ExjSQp9lIb79INB1W
 2gmu6gpiaPaNE6eJHJrdOQqRgB5yIeZS8/Ebyu8hT07oUW45Sfaac1uUmVGUTQYbBq6kJT0
 leFs999SJydnCIWmjYnpsI7azbunXXDzoH4fZse03HJQnaYkxZQAQXZ7qs//PATodHANI+q
 /y+lgeRJylaYfxd6WhWIQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZU3hlBcxVMg=;v939yXKR+lmfs5FPZM548BwIyj9
 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

Am 26.05.25 um 12:04 schrieb Christoph Stoidner:
> On Mo, 2025-05-26 at 11:24 +0200, Stefan Wahren wrote:
>> Am 26.05.25 um 11:09 schrieb Christoph Stoidner:
>>> Hi Stefan,
>>>
>>> On Mo, 2025-05-26 at 08:44 +0200, Stefan Wahren wrote:
>>>> Hi Andrew,
>>>> hi Christoph
>>>>
>>>> Am 24.05.25 um 19:44 schrieb Andrew Lunn:
>>>>>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-
>>>>>> som.dtsi
>>>>>> b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>>>>>> index 88c2657b50e6..b481097f08a4 100644
>>>>>> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>>>>>> @@ -68,6 +68,8 @@ mdio: mdio {
>>>>>>  =C2=A0=C2=A0=C2=A0 ethphy1: ethernet-phy@1 {
>>>>>>  =C2=A0=C2=A0=C2=A0 compatible =3D "ethernet-phy-ieee802.3-c22";
>>>>>>  =C2=A0=C2=A0=C2=A0 reg =3D <1>;
>>>>>> + reset-gpios =3D <&gpio4 23 GPIO_ACTIVE_HIGH>;
>>>>>> + reset-assert-us =3D <30>;
>>>>> Is there anything in the datasheet about needing a delay after
>>>>> the
>>>>> reset? There is a DT property for this:
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0 reset-deassert-us:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Delay after the reset wa=
s deasserted in microseconds.
>>>>> If
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this property is missing=
 the delay will be skipped.
>>>> is it the time until the PHY finished its post reset
>>>> stabilization
>>>> (datasheet to call it T2 "reset to SMI ready")?
>>> The T2 ("Post reset stabilization time") in the datasheet is the
>>> time
>>> "prior to MDC preamble for register access", that is defined with
>>> 2ms.
>>> I did not use reset-deassert-us for it, because the first register
>>> access does anyway occur much later (I measured 4000ms).
Just to be sure, do you really mean 4000 milliseconds ?
>>>
>>> And we have the same for T4, the "Post power-up stabilization
>>> time".
>>> It is defined with a time of 50ms as "prior to MDC preamble for
>>> register access". But also here we just know, the register access
>>> happens much=C2=A0later - and treated it as enough.
>>>
>>> Formally, this may be valid to specify the 2ms as reset-deassert-
>>> us.
>>> But since the first register access is so much later, I thought we
>>> can
>>> save those 2ms.
>>>
>>> Are you fine with that?
>> I don't insist on an additional "reset-deassert-us". The question was
>> more about understanding.
> Great, thanks for thr feedback.
>
>>> Regards,
>>> Christoph
>>>
>>>
>>>>> Anyway:
>>>>>
>>>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Andrew
>>>>>

