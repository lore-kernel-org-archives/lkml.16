Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDB1227B88;
	Fri, 23 May 2025 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996001; cv=none; b=bZC1OWsPzdVKp85uGu1VBnsUjMfWEjiFmFlXLoocOILUeC0LpW8qXkhtaEaNth+py5r/WLxOXj7HlGb3gYUYpPl9wCfx0c4GeW6dV1r00JF5e5I6h2jx457hNHYnwdFLbACz5S5Ie8buF5sojk+Wwi7CrrDvxngmLQa78Jb7ZC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996001; c=relaxed/simple;
	bh=yiSZoqdeIwITCSN5Rco37NE/2Tqvw92aaZ1Eyew4JmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pezeeBQnL1nMwt/knZXT9KrVycMpt59fLLzyOAbAfOCMB6rDsoKDfHOCVTh8WtBWOAStcan9/f0f0MMgQTsN/DkIqpP+FVQYpGlDgqL3/iiSw+/eP3v7GEz06DkDygfmqa7pAAiB3g9tVup6iw8nE6q7PCIT7iM4fVwZCNYGZF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cPIOZIXV; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cPIOZIXV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=zI9g/83wQuRlE20xbmtztKEXow3I/W3/zdS8wd9zbR0=; b=cPIOZIXVnZooNycm1nmR+tEub7
	RM7HKAZ1JA9hBl9dxOu2Rbu7Hgj6IC2fc6ubzLf+kBmBOdpmZ1+0JAqeUE8H2ZDbc2NUt5lA7bB81
	ExuIcDfCKNmMaGVKESUdToFJKPddP1PyoRqSoQhEXNS0MfbtniBFZfl4Q9Jy7CE4zvUuMovDu7Tka
	uYbV/lVWBd/drDmB3zE2c6VuufJOOjApaFRv7rQh+vdE1VfpNp58fnUa2pbCHjECrvdYI89ihVQO4
	6unT9SHDFuS3yvN3Q1lU3VYOatDIcIHuxiFw49JDuh67L0dJXu1LYc63JSlXf39az3ssSt8D8WtLY
	WIwiPKcA==;
Received: from i53875b2e.versanet.de ([83.135.91.46] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uIPbb-0007tg-9D; Fri, 23 May 2025 12:26:23 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>, i@chainsx.cn,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject:
 Re: [PATCH v4 2/2] arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
Date: Fri, 23 May 2025 12:26:22 +0200
Message-ID: <5989180.zQ0Gbyo6oJ@diego>
In-Reply-To: <65f95a57-64cb-4815-8ff2-9021ab7b7ae3@linaro.org>
References:
 <20250519075432.2239713-3-i@chainsx.cn>
 <20250523070026.50263-1-amadeus@jmu.edu.cn>
 <65f95a57-64cb-4815-8ff2-9021ab7b7ae3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 23. Mai 2025, 09:12:08 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Krzysztof Kozlowski:
> On 23/05/2025 09:00, Chukun Pan wrote:
> >=20
> >> +&gmac1 {
> >> +	clock_in_out =3D "output";
> >> +	phy-handle =3D <&rgmii_phy1>;
> >> +	phy-mode =3D "rgmii-id";
> >> +	pinctrl-0 =3D ...
> >> +	pinctrl-names =3D "default";
> >=20
> > pinctrl-names should be placed before pinctrl-0
>=20
> That's unusual - not inline with common coding style and with most of
> SoCs. Is this some kind of known rule valid in Rockchip?

nope it isn't any sort of rule :-) .


I _think_ in the past we generally had
pinctrl-names =3D "defaule", "whatever"
pinctrl-0 =3D
pinctrl-1 =3D

but that was more a "looking somewhat nice" thing from before we had the
more generic dts coding style .


So if in doubt nowadays, please follow the general coding style as written
down in
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/dts-coding-style.rst


Heiko


