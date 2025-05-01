Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46AC22257F;
	Thu,  1 May 2025 12:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746103119; cv=none; b=SNeXUMdgj/+Nqbf425JJl5p6fE4j8LX44yds5zMpKQ9FWeXwPdFtOxz/XlH82dnKJrWXHd6vm1AhVizhrKgCkfRK+o9ETxOsnJXK6q7hlT5p/Sc0YUqCTdgvYcz/T4MnqfERVjLzaQh8t3Pu/nTGi3z0geyNj/0CA/wkimB+Icw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746103119; c=relaxed/simple;
	bh=DEsKW/FV4oEiQf5g3YhqxqT0LRxti9vcUPcTum7hq1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ik+ncQ//Q2nMeBBtbUweJR5rHKhBCIyzBDluugOty6+JxFpyj3+4/yTchIxC3WeOQ5FZDRbWkE1Xd0XIcO/ar1fAEACcVeBmVt7JT+GdsZAGOcfjrqB0gfps+rZoisw1mxd+74jmu+ZBeDTrDAhncLJEl+jDFf/mfZBy3FAt6t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=zt4dSXgr; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="zt4dSXgr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TMGzIJ6a/SjyP3jq2ylC0v7lVpVlSTcN9VZFPohtskE=; b=zt4dSXgrVISFWJwXdPVT9vChf2
	lz5BPnDLeDaKPUiNU8qeOeCi0QQVViW7CcQHmefHNLggfwmfIreADmL7bMHG9anLK5GnL6+yKufmr
	XmSSHCMPeN5uiUjkXyAM48vyBoq4vhIc9VFYyGtcMMBkvz/aZ3BkkF2aCGciEz/wr6lD6YvFlKeuz
	toQlnSSZ/oMWzmoM9ldc/v38QRd/zsCW0Ln9VAhapQPXI8Cz/v7P4G2k7az+LX1syCwFvEt0A+gfa
	sR68RMdRcWlp7KTyUqCufKQ1WT0MHz8lEOK2a4kx81hJbkYZtwR8N6fIvFBDBcUU26T3I/A6PGRdF
	ZT5qrTpA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uATBL-0001C8-5z; Thu, 01 May 2025 14:38:27 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v2 02/11] clk: rockchip: introduce auxiliary GRFs
Date: Thu, 01 May 2025 14:38:25 +0200
Message-ID: <2240109.Mh6RI2rZIc@diego>
In-Reply-To: <20250410-rk3576-sai-v2-2-c64608346be3@collabora.com>
References:
 <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
 <20250410-rk3576-sai-v2-2-c64608346be3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Nicolas,

Am Donnerstag, 10. April 2025, 21:39:54 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Nicolas Frattaroli:
> The MUXGRF clock branch type depends on having access to some sort of
> GRF as a regmap to be registered. So far, we could easily get away with
> only ever having one GRF stowed away in the context.
>=20
> However, newer Rockchip SoCs, such as the RK3576, have several GRFs
> which are relevant for clock purposes. It already depends on the pmu0
> GRF for MUXGRF reasons, but could get away with not refactoring this
> because it didn't need the sysgrf at all, so could overwrite the pointer
> in the clock provider to the pmu0 grf regmap handle.
>=20
> In preparation for needing to finally access more than one GRF per SoC,
> let's untangle this. Introduce an auxiliary GRF hashmap, and a GRF type
> enum. The hasmap is keyed by the enum, and clock branches now have a
> struct member to store the value of that enum, which defaults to the
> system GRF.
>=20
> The SoC-specific _clk_init function can then insert pointers to GRF
> regmaps into the hashmap based on the grf type.
>=20
> During clock branch registration, we then pick the right GRF for each
> branch from the hashmap if something other than the sys GRF is
> requested.
>=20
> The reason for doing it with this grf type indirection in the clock
> branches is so that we don't need to define the MUXGRF branches in a
> separate step, just to have a direct pointer to a regmap available
> already.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

like the concept and also implementation :-) .

> ---
>  drivers/clk/rockchip/clk-rk3328.c |  6 +++---
>  drivers/clk/rockchip/clk-rk3568.c |  2 +-
>  drivers/clk/rockchip/clk-rk3576.c | 32 ++++++++++++++++++++++----------

the only "hair in the soup" are some missing socs ;-) .

As you're changing the MUXGRF type, you should adapt all socs using it
please. Missing rk3288 and rv1126 it seems - ARM32, which may have helped
these slipping through.


Heiko


