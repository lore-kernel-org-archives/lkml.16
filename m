Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D381325F961;
	Fri,  9 May 2025 21:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826869; cv=none; b=C6KoyLtscVBtiKlD6FMfkkLsgcvSvYXiW2wCPdYRvj5CIlo67z8LSSdBtj4NOk+AIvDaZ0XS8iXWWC1iXmeWfFleIxKN9pminp8fuzILYgftiesgJC4bnEeff2+D/qtSQgj0OgvxcLan+lrGRipFnBjhpiKgOZHnLlnKw5GZ/RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826869; c=relaxed/simple;
	bh=CeptbMj8Es7NbetOd37wgFr6qLJPRhceR8D9rh79e5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KsFi/LOukVcmfLyMMkr7UAENOTYw3bH3y8qArtvBL5FhvbX2WAVt/FA7kCJzzATbc3BWdXhq0++whYMMW7k/tei3P0wk7Cin3zpgkVzSxH2bZ0TiTb7wPJlo3rZh5fDifzSxjCAcnCTnLeEbevHP5SA8zz9CcyIQTUWf41hwV1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Rzyaa8sQ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Rzyaa8sQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4NnvhEy7eKpv6yWsDNTdTDOS3gwfxi78lgDlzZL6Ozw=; b=Rzyaa8sQrkA51gLAga5MF6OA6C
	QOyGED9EqCuzTyEvYER4V7TSxNtPA5sBxfNFJhytT6GuGwLJ/cS9/TCsXxMZ9hC/KkZl1+MSuy1RD
	FNgeAraozsudfuwXEz6m7bVKnBXN2GsBW1tBQ77FseLXglNfzqCcKPe6pnP4zuQiL/uYulYW2sR1E
	N4d72gCl8sUhivv2Grw2NiQFAaYc1AxJ/aJuEpOfZqKi0AENAygPpbzTX0Mxe3Ik0kHo5RAVog1iz
	Z8syAbwzL9LnDxSkWl6/C6UKZ2gz4wA8LxZIkfdrlHhrkXJQ8DeSvPXoO7QzsyG9RrVnpQpNk8qxQ
	8OhbNE3g==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDVSj-0006A9-LB; Fri, 09 May 2025 23:40:57 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v3 0/2] rockchip: Enable Ethernet controller on Radxa E20C
Date: Fri, 09 May 2025 23:40:56 +0200
Message-ID: <2728051.BddDVKsqQX@diego>
In-Reply-To: <20250509202402.260038-1-jonas@kwiboo.se>
References: <20250509202402.260038-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 9. Mai 2025, 22:23:56 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Jonas Karlman:
> The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
> used with the integrated PHY and a second 1000/100/10 MAC to be used
> with an external Ethernet PHY.
>=20
> This series add device tree nodes for the Ethernet controllers found in
> RK3528 and enable the LAN interface on Radxa E20C.
>=20
> This include a gmac0 node for the 100/10 MAC and its related integrated
> PHY node that only have recived limited testing. I have no board that
> expose an Ethernet port for the gmac0 and the integrated PHY. However,
> the PHY can be identified on addr 0x2 as 0044.1400 and in vendor kernel
> this relate to the Rockchip RK630 PHY. A proper PHY driver will be
> needed to support any real use of gmac0.
>=20
> Changes in v3:
> - Rebase on top of latest mmind/for-next
>=20
> Changes in v2:
> - Split from the "Add GMAC support for RK3528" driver series [1]

split from ... was that series merged already?

The linked lore-thread only talks about the series needing to be reposted.


Heiko

> - Add ethernet-phy@2 for the integrated PHY
> - Rebase on top of the "Support I2C controllers in RK3528" series [2]
>=20
> [1] https://lore.kernel.org/r/20250309232622.1498084-1-jonas@kwiboo.se
> [2] https://lore.kernel.org/r/20250309070603.35254-1-ziyao@disroot.org
>=20
> Jonas Karlman (2):
>   arm64: dts: rockchip: Add GMAC nodes for RK3528
>   arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C
>=20
>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  30 +++++
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 105 ++++++++++++++++++
>  2 files changed, 135 insertions(+)
>=20
>=20




