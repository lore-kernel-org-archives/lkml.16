Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082B7D07D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409789; cv=none; b=fSH6A8QDQ08176NwrP2fJHQIMUMchmrVBma3TaLlkzrVcbyHs3pnEBBs6bITghFoXXeNI1Q5d9+MKBKP/KUB1D8055i8c6OKsUlIlmC4O+qgZjIX2sdDrZQ1DJlpPN5KdxRR5mROWtbplQh1T4WfoXdnz2YDsjaGKlQQcsC1gYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409789; c=relaxed/simple;
	bh=P1NBSj1eq39QecxLoJyeHu/kz5IOGEhwerhf2QzfY+Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Um0eZXJywryucpT1QgACiBkZM4zJLmm5JPEtmDOrHSfpzLkwo6VX7dFeZ7BrghJAdC1oljCFZt0XBgYHxTyuylR7CEQ+oKg54Ua4X5qCN6S/8k3UxY3Wj4TcgyhGBioBCVaz1ornH97NOnTL89w4qdj81R+3e85sFw5Rziy4E7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=Ugkppw6R; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="Ugkppw6R"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1747409781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xLpzXLDxZFznf7ZK/2dQevdcoaxfl4Bbl5Mnla1OJ8=;
	b=Ugkppw6RmCnoJd2DKDWZzPVEZEjDn/9hCK4qnI0TpOLPLUuvfQNCHHUdOvuh6kFs4vv+t9
	Ves3EJ0SVqZLKsCS6kMDn1YDUZN7zQKNUk1wDbh6tHYmAwsZfdfUNXG3Hr48coYp3Vghq2
	GvbVYhA6VrZb88xTK9AMA8hygyIXfgu7SCZn7JgrQTHISZ4CztzgUEBZEfv5MXLAoik5yG
	OYYkvMfl/avknVDq7qSom2skyBUSW64yMxYmANF54aZsX99Kl4KDcKzz7i7oTzyY1wfhdT
	BKdP3RqlXn77sPVIeukYM9dKk+Oh3Tf4LbsjHfogqvf38DcbjZs1PIxn3o5Lvw==
Content-Type: multipart/signed;
 boundary=e3f6915d507f3921306840e72f19538d4bf9137df94a047009cab4a1be07;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 16 May 2025 17:36:03 +0200
Message-Id: <D9XP2BH2CU02.1R9E1GSXQD9JB@cknow.org>
Cc: <linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output
 50.25MHz error
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Algea Cao" <algea.cao@rock-chips.com>, <vkoul@kernel.org>,
 <kishon@kernel.org>, <heiko@sntech.de>, <cristian.ciocaltea@collabora.com>,
 <andy.yan@rock-chips.com>
References: <20250427095124.3354439-1-algea.cao@rock-chips.com>
In-Reply-To: <20250427095124.3354439-1-algea.cao@rock-chips.com>
X-Migadu-Flow: FLOW_OUT

--e3f6915d507f3921306840e72f19538d4bf9137df94a047009cab4a1be07
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sun Apr 27, 2025 at 11:51 AM CEST, Algea Cao wrote:
> When using HDMI PLL frequency division coefficient at 50.25MHz
> that is calculated by rk_hdptx_phy_clk_pll_calc(), it fails to
> get PHY LANE lock. Although the calculated values are within the
> allowable range of PHY PLL configuration.
>
> In order to fix the PHY LANE lock error and provide the expected
> 50.25MHz output, manually compute the required PHY PLL frequency
> division coefficient and add it to ropll_tmds_cfg configuration
> table.
>
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-hdptx.c
> index fe7c05748356..77236f012a1f 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -476,6 +476,8 @@ static const struct ropll_config ropll_tmds_cfg[] =3D=
 {
>  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>  	{ 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
>  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> +	{ 502500, 84, 84, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 11, 1, 4, 5,
> +	  4, 11, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>  	{ 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
>  	  1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>  	{ 400000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,

I found this patch in the 'fixes' branch in linux-phy:
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?h=
=3Dfixes&id=3Df9475055b11c0c70979bd1667a76b2ebae638eb7

In the 'next' branch in linux-phy, I found this commit:
0edf9d2bb9b4 ("phy: rockchip: samsung-hdptx: Avoid Hz<->hHz unit conversion=
 overhead")
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?h=
=3Dnext&id=3D0edf9d2bb9b4ba7566dfdc7605883e04575129d9

Where the values in ropll_tmds_cfg are converted from hHz to Hz and the
data type changes from u32 to unsigned long long.
But AFAICT it does NOT convert this '502500' value, which IIUC means
most values are in Hz, while this one is in hHz.

Am I missing something or should this new value also be converted?

Cheers,
  Diederik

--e3f6915d507f3921306840e72f19538d4bf9137df94a047009cab4a1be07
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaCdbbgAKCRDXblvOeH7b
bpKdAP9nbGhd2ZklAuFhWkPyfq1E751VrBYpaG2s6vej3MuJ/AEA+2ctn4xQ8Sql
3eLb23byWcZ+57mBEnn1lCzKXoFTrAg=
=A/lr
-----END PGP SIGNATURE-----

--e3f6915d507f3921306840e72f19538d4bf9137df94a047009cab4a1be07--
