Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA51DE2CF;
	Sat, 17 May 2025 18:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747505324; cv=none; b=uYlL2vkJuy+DMJ1s9DMHhBm8eEYYAFtUBsWRuxU68Pkiv7HjqPxnbp8QpHKnDrx9j8y35YAZb5BXb6O0hDVY3pu2Ef7Iliv3TJWrnoyNY+ej0V1WDDZTAgChVAxZ4WbK/YUMQQZLuVE2ldOjUVZuQA2hIXLylj3R/BBJKAoTZik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747505324; c=relaxed/simple;
	bh=kFSepTez66Epwk41GMY1CXu5El6xFJVzr5bKVaGFRWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SZsrCMVy3EyYxRuNhpp2k+JR8V13Idt5Bwh8bYICGqd+3vRZIpzlyPuVEuCQEkh+CL2ir1CJ5+6IgIlzDYRTHszMmKebN3JhjBTOn6u7SuOrqEx2YOekMD8+8KF5fkX2gM1MRnj2atc2dN9EIROdG7ltjJeCZN8RZyZhLZlgvVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ydTmVKUt; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ydTmVKUt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=clQokNJtmi74kyyjM0dDcY90JFkHQrZucHRG0JnAxzI=; b=ydTmVKUtw8kYkYaMbX+uCYBZ6T
	SvkkdROW4nKHAKcCUJZqacEIl8v+7eQECZnb6Spy5ii850evHw0GCBedGooeMmivLb0/EhMvxG7k/
	1jdfyGv5SOnD3g7pJq7hy0M74NfOQO0INnn/tCTNGq2iGQC4s5qeOHCdGxSLcdNJg9dgg7lxcafCj
	NcW/AAx9hSX/8xvq4H5xkhBxsb7xzMqvZrMN1eZwmhnZQ63kpOK6YeQpa2nD9XcpoNn9FCiVWZVol
	lura3vySsznWjJtg+Y4FiGAtZ6CpRQgefeX3wM5wh26MVXxMPgCYOtQbglDNRh/s6vCoq7xzRvIyo
	Rmk14AzA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGLxO-0003Jn-Bd; Sat, 17 May 2025 20:08:22 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Hsun Lai <i@chainsx.cn>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: sfr@canb.auug.org.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Sat, 17 May 2025 20:08:21 +0200
Message-ID: <2030161.CrzyxZ31qj@diego>
In-Reply-To: <174748776864.930436.6066844378633879191.robh@kernel.org>
References:
 <20250516012402.580468-1-i@chainsx.cn>
 <174748776864.930436.6066844378633879191.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 17. Mai 2025, 15:18:25 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Rob Herring (Arm):
>=20
> On Fri, 16 May 2025 09:24:00 +0800, Hsun Lai wrote:
> > This series add support for Firefly Station-M3/ROC-RK3588S-PC.
> >=20
> > Info of device can be found at:
> > https://wiki.t-firefly.com/en/Station-M3/index.html
> >=20
> > Changes in v3:
> > - Update the name of leds
> > - Add more cpu nodes
> > - Update mdio compatible
> > - Fix the order in the node
> > - Add the default serial port(uart2)
> >=20
> > Changes in v2:
> > - Fix rgmii delays
> >=20
> > Changes in v1:
> > - Add support for Firefly ROC-RK3588S-PC
> >=20
> > Hsun Lai (2):
> >   dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
> >   arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
> >=20
> >  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 926 ++++++++++++++++++
> >  3 files changed, 932 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
> >=20
> > --
> > 2.34.1
> >=20
> >=20
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: remotes/arm-soc/rockchip/dt64-31-ge463625af7f9 (exact match)
>=20
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250516012402.580468-1-i@chainsx.cn:
>=20
> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /edp@fdec0000: failed to=
 match any schema with compatible: ['rockchip,rk3588-edp']

hmm, the binding for rockchip,rk3588-edp is in linux-next though [0]



[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3Df855146263b14abadd8d5bd0e280e54fbab3bd18


