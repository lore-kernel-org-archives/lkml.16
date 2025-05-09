Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ADD5223;
	Fri,  9 May 2025 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804352; cv=none; b=U3SCBs5wihADRzJHdIbfDepxMjxssCpsPyLZVoJG2LEol6gfnLFuPuiueBK89k/dqypxqZkpa9L0j8B7rcGEz130XArwo1oBEcfJVhHAHbiYRTzuBIkNDBCwYwUWb7nkNFGBK/AeFQlRnZd/2Zs9i3l3vb3yAo6jLf859i2BmZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804352; c=relaxed/simple;
	bh=GSEKO7ONcS7sEUMc6GZF8gupBojNjlZ7JhmtxlT8pso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oPLfwPeWRlBPa1guN18xKnZ7hEXGEcE32IjPxPh+/qN7u2A+pu58hApGxU7qG2fWTZVh2NruCgcMY2GwKlGud3SlFNf+44saMWZu8CXZ4PNdEUP/CMrLJTZpnBjgbhZmGcaqLbE3ifOV/OPUusLQ3N0feG910YbUILvHuGTNA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=QQOy5EUQ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="QQOy5EUQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1u/9AHjxuF+fL9JbBpUA4QHUKtPHQadXuBIe95ASyiM=; b=QQOy5EUQ6mrW4Y7NTOI6eWoBZW
	IUrjR9PqGw7X/GJFgcjIYFP+xX1rG8LtZShgCsq93xF9eB00VSxzrgdvhPda2/s2MWlMvuSDKikGE
	8x+zH4WWBdkCzISTDGavK0qJ3ENnpFeGvd8I4HTz7Qm8Ln5Y++0gn509TNNHWtTlu3KKAcRNqnb93
	5GkFDOl0oFfMhBtUkPBye/n2CF+i/ICZ0VG6TrfsXWz08NFiDZqs3lFiv0/9iMRLAbPsWiuMgG3/h
	DMTaXJDguzHf6J2cgwiY0uU0rfDoyovICZLN0iRQu0YaLfxRx0oMedCjjfjAhlxLIRTO006rKRwTa
	byJNEomA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDPba-0007vv-RI; Fri, 09 May 2025 17:25:42 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@collabora.com,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] Add RADXA ROCK 5T support
Date: Fri, 09 May 2025 17:25:41 +0200
Message-ID: <116456515.nniJfEyVGO@diego>
In-Reply-To: <174679985488.3369444.8126092781297328766.robh@kernel.org>
References:
 <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
 <174679985488.3369444.8126092781297328766.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 9. Mai 2025, 16:17:07 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Rob Herring (Arm):
>=20
> On Fri, 09 May 2025 14:31:40 +0200, Nicolas Frattaroli wrote:
> > This is a small series, depending on Sebastian Reichel's ROCK 5B+
> > series[1], to also add support for the ROCK 5T.
> >=20
> > The ROCK 5T is quite similar to the ROCK 5B+ and the ROCK 5B, so to
> > share as much DT boilerplate between them as we can, this series
> > reorganises things a bit and then adds the ROCK 5T .dts.
> >=20
> > Link: https://lore.kernel.org/linux-rockchip/20250508-rock5bp-for-upstr=
eam-v2-0-677033cc1ac2@kernel.org/T/ [1]
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> > Nicolas Frattaroli (3):
> >       dt-bindings: arm: rockchip: add RADXA ROCK 5T
> >       arm64: dts: rockchip: reorganise common rock5* nodes
> >       arm64: dts: rockchip: add ROCK 5T device tree
> >=20
> >  .../devicetree/bindings/arm/rockchip.yaml          |    5 +
> >  arch/arm64/boot/dts/rockchip/Makefile              |    1 +
> >  .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 1012 ++++++++++++=
++++++++
> >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 1012 +-----------=
=2D-------
> >  arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    |  105 ++
> >  5 files changed, 1131 insertions(+), 1004 deletions(-)
> > ---
> > base-commit: 19c541fe872387798a25df947f56a26212aa9a97
> > change-id: 20250509-add-rock5t-fde5927de36b
> > prerequisite-message-id: <20250508-rock5bp-for-upstream-v2-0-677033cc1a=
c2@kernel.org>
> > prerequisite-patch-id: 02bf159533bb53d2cb1b6c8c7caf1d3fcfbfa4ea
> > prerequisite-patch-id: fc153d1d48f19d63520086a6eaadfec2db960470
> > prerequisite-patch-id: f445b893edf31ccf3311e146a53e5d24861c2475
> > prerequisite-patch-id: 5dc410a438ad5a7aa8962e380d2733782f5d7d18
> > prerequisite-patch-id: c70ae0e30be2a3385d2f2a09f474ff2b76293843
> >=20
> > Best regards,
> > --
> > Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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
>  Base: using specified base-commit 19c541fe872387798a25df947f56a26212aa9a=
97
>  Deps: looking for dependencies matching 5 patch-ids
>  Deps: Applying prerequisite patch: [PATCH v2 1/5] arm64: dts: rockchip: =
move rock 5b to include file
>  Deps: Applying prerequisite patch: [PATCH v2 2/5] arm64: dts: rockchip: =
move rock 5b to include file
>  Deps: Applying prerequisite patch: [PATCH v2 3/5] dt-bindings: arm: rock=
chip: Add Radxa ROCK 5B+
>  Deps: Applying prerequisite patch: [PATCH v2 4/5] arm64: dts: rockchip: =
add Rock 5B+
>  Deps: Applying prerequisite patch: [PATCH v2 5/5] arm64: dts: rockchip: =
add USB-C support for ROCK 5B+
>=20
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250509-add-rock5t-v1-0-cff1de74eced@collabora.com:
>=20
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: edp@fded0000 (rockc=
hip,rk3588-edp): clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip=
,analogix-dp.yaml#
> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: edp@fded0000 (rockchip,r=
k3588-edp): clock-names:2: 'grf' was expected
> 	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip=
,analogix-dp.yaml#

=46ixed that in
https://lore.kernel.org/all/20250509152329.2004073-1-heiko@sntech.de/

(edp0 node was correct, edp1 node contained a clock named spdif, that
probably came from the vendor-tree)





