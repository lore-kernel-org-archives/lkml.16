Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2CC211261
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747682783; cv=none; b=MkZMg6GiBo6RGAP/sE+oShp8j1+a3qxONdfdzii7FhxeInr7USxwvYfgLgL55TFxMpzlY74dg/Z9t/IVpi1CCebrOpuHPYMQzhRz05rcowG1/aV3411AiQiip3CPU649DEcP2gIldYdEfewZsXJNb8hfqoGOH0GIANCTyB7kQYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747682783; c=relaxed/simple;
	bh=C5T4b1k3H5rbr+2eGeVUoOvxND5I27HHIBLwRj1/YKI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=aneW9vAye0RGFFC+PuMphVUqveJgQKg7cmXqqcYywVSd56ocWdykVC1KOPdk+oMm3KW5w/4TwjYiCghMNp/tFDw6wWhXURakJLvX7HSXwl6Djv2uXnt8Bn6bWAIbGQNtw4wXmMPJ7sqzFAm/RsAlCG4IeMco7XXaZfm5ufyzLU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=XrELmC+U; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="XrELmC+U"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1747682776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vuUlAmDRBSytvhFm2XclkPaQ94NRtAHmwr3/FFfPJoQ=;
	b=XrELmC+UJ8mUJBgVn0/L59hyEE6WUEIdLlJxAukaMJa36AQvXRVSfJQ7tyTFe++Iht1kL2
	KOuGzDSmObVEt+rA+0upu16kzyZRNyJN1O4KDKHCmtuv87o3Bngik7yxnLg92wzFTqMLoC
	pZEOnQwapEzKE9JxWoDbgWcjnZsgsajxo0dJzQ3yacnHrmtyJuY0o2dTRNZMZw8tD7edZ5
	KWM160jF+B1MClkc/2Ez3hxEOSAJ8EqJVwfJamyId1B+69gYH+NiVKPLredqA3WZepO/Z6
	D5upKgSejAa6cnobzl2VE08ZgKpF6IMmjemySaZ409OTNiXJ/psP8ppZUbWkQw==
Content-Type: multipart/signed;
 boundary=8dd83334b58b8d38d65870f3433f5a85df4823174746e18d7e6cf5265eed;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 19 May 2025 21:26:05 +0200
Message-Id: <DA0DU2P8UWSV.3U07EFFLKBPXQ@cknow.org>
To: "Yao Zi" <ziyao@disroot.org>, "Vinod Koul" <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Frank Wang"
 <frank.wang@rock-chips.com>, "Andy Yan" <andy.yan@rock-chips.com>,
 "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Shresth Prasad"
 <shresthprasad7@gmail.com>, "Chukun Pan" <amadeus@jmu.edu.cn>, "Jonas
 Karlman" <jonas@kwiboo.se>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] phy: rockchip: naneng-combphy: Add SoC prefix to
 register definitions
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-4-ziyao@disroot.org>
In-Reply-To: <20250519161612.14261-4-ziyao@disroot.org>
X-Migadu-Flow: FLOW_OUT

--8dd83334b58b8d38d65870f3433f5a85df4823174746e18d7e6cf5265eed
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon May 19, 2025 at 6:16 PM CEST, Yao Zi wrote:
> All supported variants of naneng-combphy follow a register layout
> similar to the RK3568 variant with some exceptions of SoC-specific
> registers.
>
> Add RK3568 prefix for the common set of registers and the corresponding
> SoC prefix for SoC-specific registers, making usage of definitions clear
> and preparing for future COMBPHY variants with a different register
> layout.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../rockchip/phy-rockchip-naneng-combphy.c    | 560 +++++++++---------
>  1 file changed, 288 insertions(+), 272 deletions(-)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers=
/phy/rockchip/phy-rockchip-naneng-combphy.c
> index ce91fb1d5167..1d1c7723584b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -21,78 +21,80 @@
>  #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
> =20
>  /* COMBO PHY REG */
> <snip>
> -#define PHYREG33_PLL_KVCO_VALUE_RK3576	4
> +#define RK3568_PHYREG6				0x14
> +#define RK3568_PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
> +#define RK3568_PHYREG6_PLL_DIV_SHIFT		6
> +#define RK3568_PHYREG6_PLL_DIV_2		1
> +
> +#define RK3568_PHYREG7				0x18
> +#define RK3568_PHYREG7_TX_RTERM_MASK		GENMASK(7, 4)
> +#define RK3568_PHYREG7_TX_RTERM_SHIFT		4
> +#define RK3568_PHYREG7_TX_RTERM_50OHM		8
> +#define RK3568_PHYREG7_RX_RTERM_MASK		GENMASK(3, 0)
> +#define RK3568_PHYREG7_RX_RTERM_SHIFT		0
> +#define RK3568_PHYREG7_RX_RTERM_44OHM		15
> +
> +#define RK3568_PHYREG8				0x1C
> +#define RK3568_PHYREG8_SSC_EN			BIT(4)
> +
> +#define RK3568_PHYREG11				0x28
> +#define RK3568_PHYREG11_SU_TRIM_0_7		0xF0
> +
> +#define RK3568_PHYREG12				0x2C
> +#define RK3568_PHYREG12_PLL_LPF_ADJ_VALUE	4
> +
> +#define RK3568_PHYREG13				0x30
> +#define RK3568_PHYREG13_RESISTER_MASK		GENMASK(5, 4)
> +#define RK3568_PHYREG13_RESISTER_SHIFT		0x4
> +#define RK3568_PHYREG13_RESISTER_HIGH_Z		3
> +#define RK3568_PHYREG13_CKRCV_AMP0		BIT(7)
> +
> +#define RK3568_PHYREG14				0x34
> +#define RK3568_PHYREG14_CKRCV_AMP1		BIT(0)
> +
> +#define RK3568_PHYREG15				0x38
> +#define RK3568_PHYREG15_CTLE_EN			BIT(0)
> +#define RK3568_PHYREG15_SSC_CNT_MASK		GENMASK(7, 6)
> +#define RK3568_PHYREG15_SSC_CNT_SHIFT		6
> +#define RK3568_PHYREG15_SSC_CNT_VALUE		1
> +
> +#define RK3568_PHYREG16				0x3C
> +#define RK3568_PHYREG16_SSC_CNT_VALUE		0x5f
> +
> +#define RK3568_PHYREG18				0x44
> +#define RK3568_PHYREG18_PLL_LOOP		0x32
> +
> +#define RK3568_PHYREG32				0x7C
> +#define RK3568_PHYREG32_SSC_MASK		GENMASK(7, 4)
> +#define RK3568_PHYREG32_SSC_DIR_MASK		GENMASK(5, 4)
> +#define RK3568_PHYREG32_SSC_DIR_SHIFT		4
> +#define RK3568_PHYREG32_SSC_UPWARD		0
> +#define RK3568_PHYREG32_SSC_DOWNWARD		1
> +#define RK3568_PHYREG32_SSC_OFFSET_MASK	GENMASK(7, 6)
> +#define RK3568_PHYREG32_SSC_OFFSET_SHIFT	6
> +#define RK3568_PHYREG32_SSC_OFFSET_500PPM	1
> +
> +#define RK3568_PHYREG33				0x80
> +#define RK3568_PHYREG33_PLL_KVCO_MASK		GENMASK(4, 2)
> +#define RK3568_PHYREG33_PLL_KVCO_SHIFT		2
> +#define RK3568_PHYREG33_PLL_KVCO_VALUE		2
> +#define RK3576_PHYREG33_PLL_KVCO_VALUE		4
> +
> +/* RK3588 COMBO PHY registers */
> +#define RK3588_PHYREG27				0x6C
> +#define RK3588_PHYREG27_RX_TRIM			0x4C

Would it be better if RK3588_PHYREG* comes after RK3576_PHYREG*?

Cheers,
  Diederik

> +
> +/* RK3576 COMBO PHY registers */
> +#define RK3576_PHYREG10				0x24
> +#define RK3576_PHYREG10_SSC_PCM_MASK		GENMASK(3, 0)
> +#define RK3576_PHYREG10_SSC_PCM_3500PPM		7
> +
> +#define RK3576_PHYREG17				0x40
> +
> +#define RK3576_PHYREG21				0x50
> +#define RK3576_PHYREG21_RX_SQUELCH_VAL		0x0D
> +
> +#define RK3576_PHYREG30				0x74
> =20
>  struct rockchip_combphy_priv;
> <snip>

--8dd83334b58b8d38d65870f3433f5a85df4823174746e18d7e6cf5265eed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaCuF0QAKCRDXblvOeH7b
bj5XAP4jFaF15+nLInr2xXsIkAJvJHReF7T6Z5VecsqAGvvQnAEAj3LoVwch8QJx
Nav7s88qF+lAQivzYzh8QtxQeo+kKA0=
=HcuL
-----END PGP SIGNATURE-----

--8dd83334b58b8d38d65870f3433f5a85df4823174746e18d7e6cf5265eed--
