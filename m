Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9891D1D90DF;
	Mon, 26 May 2025 06:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748241905; cv=none; b=oihuH0WSAfmtXtw/EvP+EpwP953FtQKc5rQB6Azjq3OJB8RbujWrAkB6lLocEqnyam63bWlfn8AV5X5eYA1NbR/yc0H0z1FxELQWiOM60hTDYyOVvQ18ak7+H+RtP461+y4vony04Gyi7bHTmqmxvhifB5DTBLQ5w0p4HT7SQBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748241905; c=relaxed/simple;
	bh=D2YAD4z4FAAQI1xaLvUcWAdnhPutm4v51ZaI19IXR34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bKqslpzPdmuJ+Xx0D6kR/g+zdB3NprHn3r2CnPQ4+rTO6MTmWbYtyKQ4YgmcmUZ0keBXbRPrrLbYiyV5YxrVezuG7sfXWaOhBFJs3HMkWPL3alkpzQFMw/6NC0Ckvh4nc4MUK9xifoD8qjZO2yRLI9V7Q2Dk7n8ebOuCPGpyjCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=BSwwCZ4A; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="BSwwCZ4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1748241881; x=1748846681; i=wahrenst@gmx.net;
	bh=bXLBbRXb9JjyhEWZwNFKMW2jVBUOhwFOuXiY7E3i2cs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BSwwCZ4AyWMShrQcY8p9qbW1mJ9tWwzAYiyfDbW95pioE9oElatTbabXVEs9uZfy
	 hH80/TASN7N+ysfNxz28xXrq5w067XiSQpDiVfMJHCt79374ScM2Gk1AyVjfRwNNi
	 YgyeuJ7hY7CiltKGx3oNCQKrgYKbfSYQO+4E1cs7xGSnOSz4KGEinRuHK9LFlBcei
	 8wqzcnuLjx/xxKvD3fPmwFeL8EXcvqjaz9d1+s7lvYY96w3yzBVVTZrL+qzIeionx
	 DfBOhoeUnpRI7VWVNtGif1G9jsS7xTKGetPCA/AUYEf642ZPA4J2SpJ7W74XVTipo
	 44iHId3YMhV+cUhXEA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnJlc-1uiuRJ1sii-00caSY; Mon, 26
 May 2025 08:44:41 +0200
Message-ID: <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
Date: Mon, 26 May 2025 08:44:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
To: Andrew Lunn <andrew@lunn.ch>, Christoph Stoidner <c.stoidner@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250524112315.695376-1-c.stoidner@phytec.de>
 <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
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
In-Reply-To: <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d3SViVT6UuD8sACbcKXL3zBeEF4rxfGJnzrZMMPpEW9ZXSe6eOF
 5GeBk3c/4PdlPLjATAHrB27ytUMLTffZzerpfT6bAw5Ke1vTdZCUIA+xrT9p/uS9oeAeKhd
 ehucj2IAlY0wVnJTpBzXAYYTEEtSOsrfvnP7FsGnYfAjXjCOAQM67Xt4ZCGXGB2jguYPEIz
 +3B+2sN8eCHOh/rlTGhMw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b2r4lkKUbQI=;8Re9IFuguwVF2R67lDE6iNYKuLA
 D9vBYrKBB+hiM8tycVGy4JIV30ozIP9QC2yHiMX/yy6tGHDSu5ghzFODU2qH1iSHi0jKdaJpV
 ND/T/Wp9Jm0ZQAlF9slVTAh7T5B+gApn+BzeGFM7SqlL49fZZVWREH0cTXHhLMSKkI+mCSZLQ
 SRflpR/yNI7mDdnXyYXmlEU1A+L1EvzP9Wgd4WTk6rFBf02yBtWQqakpbNpOBeA4D5AzArQcz
 8fVZBeQr+BHLNOSj4CZMnxLoEeJRcEg9E94FB61J/tgOO+AMVGjeobiL1e0yt3AGL0LkU9dNb
 ya2j6E7hIKQyu8kcApbNLrRhMuNIGiMldU5yDN+G9mKBH5Bt+STZweSgQt2xH7Jbjp7Fv/P6F
 YoveI/FD74Pahto+1FrJLf42ePTgsJ2QBoX81QesSIAeRLu3kt0a/Cub3yLgNBr2w11TGjhHn
 bmVGjmgL9adrDTM/v4ccDAtA6UgCKBvqhbOBI3xMqN4/U4vrr5LSTYtWSDlqwDKhQFx+o9YUH
 4XOo3A50taxZQekBsSC7EtrdCtqhsDMfN+2Uv+GYo35SogcH+Okm5Vj08p9UWyUizGnj+wfSI
 +VWAZrBBhuXu3N2sX+4RrwSUTA8FzaUNA6C8GXs/smln9b/eHoWG8GorpsykkWT7oI9cpaMat
 Od5fSxf7siup8tlpAifLmy9PA3huGGJgtrEkB3+ZWHMePt6NFdnuWMvLqSPpV8XTqV0+Q/vXW
 AUimH8VxglDQfAAYOWy19DZRtC9zEebQVpvcIqLjE/WLQ8CdwQLtDRB1UfgENjw+Ov60iTunc
 fFCG4YLiZMqAGee6G0uKFvncicoDnhNcMmFK3G4uE5hGbxNumEVL7TSomv++WtNGXGd3xwEwE
 Nxj4bAxwLspaO7vBlW3al5xo/cQR7z38JV3pRjay0vAwt4fOmb8slOat+yODSAdN89OCefDC0
 pM8UoDP4FVxQbSj76KNnPM9rb9tyi8fn/rMDR4L0Zq8PyqjFa2zbC1AWlhUqjYUxwTNL6HbCI
 gDTkxWQ/bmqi2YyJOQRMQqOduLE8jM2SNoyD7okHmcPozFnsvTAsH68gr5LH2ANPLT40yN17D
 zoA/cpZYc2KN0l9QZd4otdCqkM7v0vIsdI0m3AVGH54R8YnTTSIZ5V7m8R7+AjuWi77VoiZkR
 4fIgPL7Kb/Aex94Ub0sNdoUy0N6el7KR450BKQ7kKcfbiu0uAvXosMoq377O0T1BJNrXA0yHs
 L3+WxnGfBzBFS1DVEy7PEnJPVGzc7q4fUj7/I89X8b069Csf4ybJoJ94iStmEUGW13kd6s7R4
 6PjyEYK0DHpGMg9QW3YZX1HU8o7UEuTtxnXyyjSDDHmVqQCPaZ/di79EwXVSAFADv22sZfKT1
 I50sXxw9ohyVvksQD0G7waqL9HVw7YLeABRPPdxRkZ5ghtv5tUIXOXQphtdQ1JwrsT6ZnGODd
 AzXICHA==

Hi Andrew,
hi Christoph

Am 24.05.25 um 19:44 schrieb Andrew Lunn:
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arc=
h/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> index 88c2657b50e6..b481097f08a4 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> @@ -68,6 +68,8 @@ mdio: mdio {
>>   		ethphy1: ethernet-phy@1 {
>>   			compatible =3D "ethernet-phy-ieee802.3-c22";
>>   			reg =3D <1>;
>> +			reset-gpios =3D <&gpio4 23 GPIO_ACTIVE_HIGH>;
>> +			reset-assert-us =3D <30>;
> Is there anything in the datasheet about needing a delay after the
> reset? There is a DT property for this:
>
>    reset-deassert-us:
>      description:
>        Delay after the reset was deasserted in microseconds. If
>        this property is missing the delay will be skipped.
is it the time until the PHY finished its post reset stabilization=20
(datasheet to call it T2 "reset to SMI ready")?
>
> Anyway:
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
>      Andrew
>

