Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABD31C7009;
	Sat, 12 Apr 2025 16:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744475034; cv=none; b=TxTcaTmkTsRRtCpLIzpVyLo0qgXhd2l1NMNarhJ4Fbd0SlTCUnrEd0mavlI4J62y4ceswK63oSYDJs+zXGE1rd3ZBuH56EdrtLhfQIHjwWhVvHSGiJd/4uMbN8UYucMYz7BzLLzjHkXQqGQG5uYtJmQ8SPOoP8S7qmbhrdaV904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744475034; c=relaxed/simple;
	bh=PvUE6GMdBjQKSB34c1XhQ5rGBFyvBxnz0x3KiY/8Q1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aU7AKPJz2mxg/81ZQ8iEb13BojKbe88/V2MiD/fM83o0dnKwJ7EwG+gDsfNiPnqobixOML7uG3FYcqgoYao7VPAJhybkmFCucHGTZ2cZQSMIpAi9zjqSm+byqys3WQ0qruYNTLepXijZ236ocTG7xfpVwa1A0Cgtx/s+QSdgb5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=AlQNiOjH; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="AlQNiOjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744475003; x=1745079803; i=wahrenst@gmx.net;
	bh=5Pz1KeHSutEHo6ZeIRclN0+VHj4FuPcwU7j5yxRlr/o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AlQNiOjH0jrUAjAgnxpnQYFY+lyutrptPsAUZQsD6oeZ/qnv+kPxPHBNDtwjli/X
	 H8BBbMm0sP1bwHdcHqdMUyBR/Y+yi6QYxpwNCikiIIlwvSc5lE1cRR9SMeNATfA7A
	 uG88A2S9doiB5xBVKiwRdXEEGTHJVqq7RLTQw5XV9ouxVGAeIoWIIirEMxEiiwukS
	 s0NpWtXZhXbwzWJy3GQijmsqQqMaHjUaa4dv4K16TSYosEYMvNYRzD/3BaUo/5sX3
	 2pfBSRSRiQkXpaBd7TmAhk/wDCRwNeSojMVEsG8O12D7ePMHBnsx+Gt7O5Oh43cLj
	 h4N57QAxtUkjkyjoSQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbzuH-1tSwEu24Mx-00iqvQ; Sat, 12
 Apr 2025 18:23:23 +0200
Message-ID: <254efe04-09c6-4225-a869-126026642091@gmx.net>
Date: Sat, 12 Apr 2025 18:23:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] arm64: dts: freescale: imx93-phyboard-segin: Drop
 eMMC no-1-8-v flag
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
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
In-Reply-To: <20250410090251.1103979-7-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:60Fc69wF0pl4ADtd5hbuaSXONJ6EtEVuk/I2husPfDJp1ZWkvmq
 FVhQnzb/8PSyq498sWSzfKzHgjmbtzvwkECNMeqG2Lp0e+0E7qGWVmA7S1DlZBhT+0ikjsL
 1EvdLKBQIHdbx9J5mup25S3q6QSnfC23usLjOlCihy1qZSbUaSFN/ZTpec6YWgnLgZakpDR
 XIhoDjYC6uXDs/6nJNDBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y1Kwbl/C9bI=;WqRPJ7SgX478p///iWuzZ2LbRFG
 uYMvgmID6RWhDbk2ha/WRaOCcv2Yoeq6LLKFOekgWcrN2ESB2Myv8WJhN7X2Nw47eYTDfA1RT
 9NgEyDHGju9BqhmNiIZhdjBbS7uIJCIC2sy6ZqQcMzYgwJVQNmkAA4UTcH30JJf1uydhE3EMI
 06E/LKh7XUOCAnvCNMCHe90PgJVoHClLqOaSUs6JIkJCRXjLSNILHQAzkCsJD2Ozdr7RV+f5J
 oTqwR89EYDUcmmLDKnhuW8DKZQW3A8H7CwRPdH/izsgo4wmQOBE/dvWk15vt+Dqznv2njqvsc
 +rOLSv1HDNcVs9Xi4htyPC0u90m0R2ELwkJD973f3p3TckpO7ifGG8Vu5u9w/02153m0xFiWx
 8hNzl7Q7xi1HUFin7IjGPI8methbbITcvR9rMCYseDiADC/prqCSmg8q+hnWmxQsBHy82h7Pw
 jRoeGXtlOKPDP/CaCvymrsGsnimjJXoVCvuAGzMSQg1kjigxE4WGAvqI3ri7EeFCkkpyUJaur
 EcW07fk+PaaDzqXB9Ln7azr81FlO1P8/eWJ76O+Nc4ZbxUyRRcfAXMUmz5d2rJemeUmoiHtFd
 ++MUWCKDMKMFY3yo1HAZkQFR8EFerQ6L7CXm5KF3GgfKcy9erpXvQ6A/vfMh9GWE2Me/8SDYw
 Kne4dm+BI4xWPVEzRRYZOzbekxIffXdmcgvLzMt95MPTFJ37m+6KxMU+P9zRdHNrXuTJlcyda
 FEPTLI7Omh7PiNnfc3JV6gXwjr9b2Qwp1GlRExWLcZvePRjtNpqUkfiljZqAxFqpq6ft7o0BY
 s3yQEQWuS0RJzMiqJuGBVuKYkfGwymUFw9DQC5lNJT5mvmriwEPyh2qXBKXp8UUlMzKWB1s+/
 McLzDEqlr+MG/+Qf/f+ph3BTAQfCWpGt30Djrx06KggN/AmQ6yn0Ek0KvDhLOGGZL5Z4XcgMN
 MeatLS65jDX/R3mglPRwHOUUOrzzpnf57gGHZDRudCO85HeL2Hki1M/y2c8Jy0AqSAdZ7F0tq
 h1jjrsUtmNDeSqWiJPnDyvtcQ7FLhCXrEdLrKl6zQDQHvqlpKnuW7u1zV+kQkezWqs028OWcZ
 Gb2CCFU/H7CzKxcVNrv6fe/Z6iFMpVfLo9ioIkSutl9yGqIjZPx6iDQpWORISegW6hs2F77jX
 6k7YYJGsazOAEwo+sKiIwJp/TKiUaHHb+VlfBnPXz0BFKwPXlFHp7Ubk2ayXN+A62ptBVNwZs
 003eQOq3JdRXEKyrYDjt+B2bwi9bwsezZ8KAQ6yx+P1TX//+A7Nla9s2CC7zLcxhsnbL9wOUf
 wASf5vZNHmX3mOVurK2mcqvY5uom/c6Fe2ThAX+2lGIlCs7SM54eg4cj+jtYHXlMY4dE2prjl
 eYJWmPsM8z/hJt5+XglZugzp0na5aD4BCLVzdc65H15ZFKuY9zhExT40/tmzVAhqLv8VCkBZF
 DXUYP1mXu46wabf6+LQyqwzBUGSE=

Hi Primoz,

Am 10.04.25 um 11:02 schrieb Primoz Fiser:
> Drop redundant 'no-1-8-v' flag from usdhc1 (eMMC) node. Flag is now set
> by default in the SOM include file (imx93-phycore-som.dtsi).
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
i think, Patch 5 and this one should be squashed together.

Regards
> ---
>   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/ar=
ch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 85fb188b057f..902b523fc92c 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -40,11 +40,6 @@ &lpuart1 {
>   	status =3D "okay";
>   };
>
> -/* eMMC */
> -&usdhc1 {
> -	no-1-8-v;
> -};
> -
>   /* SD-Card */
>   &usdhc2 {
>   	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";

