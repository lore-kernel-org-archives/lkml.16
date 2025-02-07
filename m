Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7EC4EB51;
	Fri,  7 Feb 2025 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934992; cv=none; b=t74nLydfutTaUkYm98DGMxSCf65O3HzN+VYpBPfTEcywOUnULOmNSeazdxP5S+1PNpt0OnWIce6VlBS8CwpUzzceFNjE488TkZ3cVg3dc6aRAzI5w6YhIyoeeadZTvDGBkhfrZJFKwHwmq0b6ngt/6ZNtE/Ui6Z/qqk0gdg1yfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934992; c=relaxed/simple;
	bh=Jw0xiNjIZwfQFr7Xplb6iq9bWHtOcy+7+dwBPdFDyj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mYyIUlftb81uQl3K/EuT+e8pj76T2kA5dfZyl+9Y0qiTUS03G/ws1VqFyXjyAbE6AGYmP2TTyZcS4OpgdjYAAyhZl8tJ9QIddS19nJA5nO+vt9z1RRN9Yl36k9/XNY93i5u/ukCjfS772GzFIUVEZSkgrONTDacv+Q0hb9Tz8iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=c1tr/tnr; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="c1tr/tnr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vR4zx2oagS+efqUKCMvK1ATS53EuOoZopH8YM7RNxZc=; b=c1tr/tnr9J63Np3nDQff6K5sYk
	lDzbECFZwUg9b2y0xew+9b3UrLzYEOO6oXoearPTxuMmY1OP7l8As5gHXUojvp9a6rhPXqBVGR7pX
	ItkLub/6K8cCaeF9t4nwbXN6vTk9HGT0yptexL9sgYCsTnO4HV9sxocFmXogbZ3wWX1nblcEi9rZ/
	u5LwAPny7Dza9oe5m4VYVvQlU+asCdfF/wP91b+PYazWHb7sVL52a3XG9LpuEZKCz5LRWSplBUaK3
	cBN/P0ffld06H6AQwE0MAMJl9U7rOLG8XbrF/LGIJ+QMFTBC04qalsHbhaVctUr/VlFlmvLXGsv2n
	685ABR7Q==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tgOQE-0005vs-AZ; Fri, 07 Feb 2025 14:29:30 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Dragan Simic <dsimic@manjaro.org>,
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH v4 3/4] arm64: dts: rockchip: add overlay tests for Rock 5B PCIe
 overlays
Date: Fri, 07 Feb 2025 14:29:29 +0100
Message-ID: <4044639.44csPzL39Z@diego>
In-Reply-To: <110a35c5-9450-47fb-9d5f-0ba73e290bf5@cherry.de>
References:
 <20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de>
 <cb8f370474df88d1194d9ee92d3ca4e0@manjaro.org>
 <110a35c5-9450-47fb-9d5f-0ba73e290bf5@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 6. Februar 2025, 12:07:21 MEZ schrieb Quentin Schulz:
> Hi Dragan,
>=20
> On 2/4/25 2:35 PM, Dragan Simic wrote:
> > Hello Quentin,
> >=20
> > On 2025-02-04 13:20, Quentin Schulz wrote:
> >> On 2/4/25 12:22 PM, Dragan Simic wrote:
> >>> > On 2025-01-31 11:40, Quentin Schulz wrote:
>=20
> Not discussing CONFIG_OF_ALL_DTBS relevancy wrt hiding overlay tests=20
> behind, unrelated to this series I believe :)
>=20
> [...]
>=20
> >>> With the above-proposed changes in place, and with CONFIG_OF_ALL_DTBS
> >>> selected, the relevant part of the "make dtbs" output looks like this:
> >>>
> >>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb
> >>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtbo
> >>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtbo
> >>>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb
> >>>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb
> >>>
> >>> No more "phony targets" in the produced output. :)
> >>
> >> Funnily enough, I would prefer to see OVL for overlays rather than
> >> DTC, but I guess it's just one more occurrence of developers
> >> disagreeing on how to name things :)
> >=20
> > I actually agree with that, just like I prefer to see .dtbo files
> > as additions to dtb-$(CONFIG_ARCH_XYZ).  It's all about the overlays,
> > so they should be both specified and echoed back.
> >=20
> > Moreover, we currently also have additional .dtb files with applied
> > overlays left after the build and installed afterwards, which doesn't
> > make much sense to me.  To me, those additional .dtb files should be
> > deleted as build artefacts and not installed.
> >=20
>=20
> I **think** it could be useful for systems without overlay support. Then=
=20
> you have a dtb which is the result of an overlay applied on top of the=20
> base dtb and you can replace your previous dtb with that one, and voil=C3=
=A0.
>=20
> What I don't like is that it's difficult to differentiate them from the=20
> "normal" base DTB or even from the DTBO (simple base DTB + overlay test=20
> is usually named after the overlay, and in the case of the Rock 5B test:=
=20
> rk3588-rock-5b-pcie-srns.dtbo and=20
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb), easy to pick=
=20
> the wrong one. Though that is on **me** as I could pick another name for=
=20
> the overlay test and e.g. prepend "test-ovl_" to the filename for example.
>=20
> [...]
>=20
> >> I won't be too difficult to convince here, just want some "authority"
> >> or a piece of history about CONFIG_OF_ALL_DTBS that would go your
> >> direction, before doing the change. I believe automated build tests
> >> without needing to enable a symbol, and that taking DTB and DTBO from
> >> the build output and apply DTBO on top of DTB works without having to
> >> go through some length to get the symbols, are good reasons to keep it
> >> the way it is in this patch series.
> >=20
> > I'd like the most to perform the above-proposed "divorcing" of the DT
> > overlay tests from CONFIG_OF_ALL_DTBS, so we don't have to enable any
> > additional options to have the overlay tests run automatically, but
> > to keep .dtbo filenames in dtb-$(CONFIG_ARCH_XYZ).  I think that would
> > bring the best of both worlds, so to speak.
> >=20
>=20
> So, just to recap:
>=20
> dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-wolfvision-pf5.dtb
> dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-wolfvision-pf5-display-vz.dtbo
> dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-wolfvision-pf5-io-expander.dtbo
>=20
> stays and I add:
>=20
> dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-wolfvision-pf5-vz-2-uhd.dtb
> rk3568-wolfvision-pf5-vz-2-uhd-dtbs :=3D rk3568-wolfvision-pf5.dtb \
> 	rk3568-wolfvision-pf5-display-vz.dtbo \
> 	rk3568-wolfvision-pf5-io-expander.dtbo
>=20
> at the bottom of the Makefile. I specifically do NOT want to make this=20
> depend on CONFIG_OF_ALL_DTBS (by using dtb- like in ti/), so that the=20
> base DTB will always have the symbols in, regardless of CONFIG_OF_ALL_DTB=
S.
>=20
> I think the redundancy is unnecessary but I guess it's worth getting=20
> away from implicit rules.
>=20
> I can compromise on that :)
>=20
> @Heiko does this work for you?

Yes, I do like the variant of _not_ limiting these builds to
CONFIG_OF_ALL_DTBS. From reading up on it, it's supposed to build all
dtbs - even from non-selected architectures?

So on a rockchip-only-build I'd still want to build the dtb+dtbo
combination nevertheless.

zynq, renesas, qcom and more are doing this like Quentin proposed, where
only ti is not.


