Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518F31EF36C;
	Mon, 26 May 2025 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251468; cv=none; b=eFeaQp9K3ULhcg3qOVw+pc5OZfylA+qeE7G60/J3h+NLo1JQDEdBoTBGSYINoN3gcX9uSOIl00UiHWRU1AwKqMfgqYvsZszBIUu3XA4JEUMxFCKcZYr1Z1T20Ms9TfXyLvF8cDkG3Qfwx3jRqLAsxjpyrJmItPS/gojvlVPGK2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251468; c=relaxed/simple;
	bh=4JxGc4zLJ01b3yH7eTdFw5QT8vjzTI/e7iMVqU8qg/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XEM2j9If6cnT6/QfllRw+BbrAVtWqfCwijzxyUp2E/PqHECAoLUJI65Sk3gjzaWS2waFvifnEP0fG0H+VVHJjc+yQKrp3qeQQTM/qT74f1lvD7fshiS3cBlpOeHB+uZUpmVPhPiW1nHpnimeDa5HG8L8fBDD23yxBcJQytW9EF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=obYWoSYa; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="obYWoSYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1748251449; x=1748856249; i=wahrenst@gmx.net;
	bh=yCg6d3ai45oT8m/nEPSdO++snGi9MLhj5lOFq4KJ7so=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=obYWoSYaUa146vLgvmzxYAjeuy5Wh/C9ccUf0YOKYtfaw8aNyVAXqMNIhd7jn53E
	 tGtZTrP5BM1Gsz7zvgKmt5H/7gKGmS4I90M6Kdn1wK6F/1rvuqqc2d/IB5+kgK+UI
	 rCg/10Gi/eEi3aNb9wmILR+0dA8ftqPknR3X3109l1tsWIRmqTFLEan3EeEoTNBke
	 tcFwkjfiFDXsJXXv1sdOesiwnOKdrjsriB4fPL7SB6XdWdDjLxcyZXnWdyBguG8TB
	 8FAYZjzPTle1dIHDl8ouQ7qOX1hWXu0zara3EfVo6wET4/QKipGgGQxspJZmoH9Es
	 +paa/f1IvBhV/RHBSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fmq-1v3rVY3Ldw-00qpNq; Mon, 26
 May 2025 11:24:08 +0200
Message-ID: <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
Date: Mon, 26 May 2025 11:24:06 +0200
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
In-Reply-To: <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:j7q0lhQ0aySRq/U/bsaoG9w41iUYKsDm39Kja4EOvuJtWZCRfLo
 +2LSeOFX9VG/fUgYMj53SHgfLCYEDoKCYEfA33E12ZfiugLZPeROby7eEMTtc9MBlUPhmjs
 mcOCl177WBPaCC4OOVETXKJ7DHSc1hLq/bUJANOIHXnXMz57WtU0lgRr4lRvjFyVc8EnMJX
 6fM+oJT9xvz6kUVDxT3+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dSVyBR3f1R0=;PoVBs7v/whf90ft9TG4C3UFjjyT
 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

Am 26.05.25 um 11:09 schrieb Christoph Stoidner:
> Hi Stefan,
>
> On Mo, 2025-05-26 at 08:44 +0200, Stefan Wahren wrote:
>> Hi Andrew,
>> hi Christoph
>>
>> Am 24.05.25 um 19:44 schrieb Andrew Lunn:
>>>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>>>> b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>>>> index 88c2657b50e6..b481097f08a4 100644
>>>> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>>>> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>>>> @@ -68,6 +68,8 @@ mdio: mdio {
>>>>  =C2=A0=C2=A0 ethphy1: ethernet-phy@1 {
>>>>  =C2=A0=C2=A0 compatible =3D "ethernet-phy-ieee802.3-c22";
>>>>  =C2=A0=C2=A0 reg =3D <1>;
>>>> + reset-gpios =3D <&gpio4 23 GPIO_ACTIVE_HIGH>;
>>>> + reset-assert-us =3D <30>;
>>> Is there anything in the datasheet about needing a delay after the
>>> reset? There is a DT property for this:
>>>
>>>  =C2=A0=C2=A0 reset-deassert-us:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 description:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Delay after the reset was deasse=
rted in microseconds. If
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this property is missing the del=
ay will be skipped.
>> is it the time until the PHY finished its post reset stabilization
>> (datasheet to call it T2 "reset to SMI ready")?
> The T2 ("Post reset stabilization time") in the datasheet is the time
> "prior to MDC preamble for register access", that is defined with 2ms.
> I did not use reset-deassert-us for it, because the first register
> access does anyway occur much later (I measured 4000ms).
>
> And we have the same for T4, the "Post power-up stabilization time".
> It is defined with a time of 50ms as "prior to MDC preamble for
> register access". But also here we just know, the register access
> happens much=C2=A0later - and treated it as enough.
>
> Formally, this may be valid to specify the 2ms as reset-deassert-us.
> But since the first register access is so much later, I thought we can
> save those 2ms.
>
> Are you fine with that?
I don't insist on an additional "reset-deassert-us". The question was=20
more about understanding.
>
> Regards,
> Christoph
>
>
>>> Anyway:
>>>
>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 Andrew
>>>

