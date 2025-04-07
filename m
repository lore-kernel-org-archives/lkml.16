Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706E42054EE;
	Mon,  7 Apr 2025 16:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042219; cv=none; b=BYHxypslhCscZI2Mjg+dsYElZqAdWK9dz/oG8zvl9EZgOBx37YsmzDuiP8DSJcW1gwXupQHGRf9bf0HX5P/2CU7uzXO1MqgjA4uyeUOrR1Wkt+z6e2wWxPFrSIXn04Uufiog41StSX0WT7x+DCSSAYUbo/Nq79JhYDAVPaSLRSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042219; c=relaxed/simple;
	bh=T/icUZNKagvrKD/XyMsdV5kUXZvHz0F432ZQ6gD6/bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nf2s2Umm8NwcnQ85qew6MZFAcLAuiKQuoEqIMy995Bw7y788YdbYwtV7GGJHZMLhO4FvwktIeFRLSKbvS9hvpM6J/5da5kIgdQwJp0H2A8ZHmBXR9ACBFig3XkUpB/uNHhRiYeSyQeusH7g3g3gaV25tPfbPAnLWJnJ1IgbG4h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uCSADcsw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uCSADcsw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA86C4CEDD;
	Mon,  7 Apr 2025 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744042219;
	bh=T/icUZNKagvrKD/XyMsdV5kUXZvHz0F432ZQ6gD6/bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCSADcswQIgmHv9oHsLj9h4sGt3gtocSsO3jdUKpd+jKaOH8nQfKzmfm4woAno6NN
	 ymVchZUBmmnbhQhN7zMQl1h1dAo44xBd6sGtcOBjGNqkkSKdNVPB38ZJAqNU4AjjGL
	 MbKC5udI1PomP+E/ZbVSHRCt4sPTm4UWgGMqkZ6St3oRwyOBthcc6DRtqbvfMRSpKt
	 d+wbjuc13tikm6zQvxnVYfiI7CqHsk0+CYdXDIMqzFLrOXjkH2UEUT0RJ6rjFSMdNi
	 gdf1JrW62iBFzpwTZX8WG/lapMNvFFii1nDV6XANfrjE94Umjn5ZUHwYgI9gIfuhxC
	 RGy9BJ5DsapnA==
Date: Mon, 7 Apr 2025 17:10:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Bincai Liu <bincai.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: mediatek: add mipi yaml for MT8196
Message-ID: <20250407-cramp-fidelity-b3a6db245938@spud>
References: <20250407133138.22449-1-bincai.liu@mediatek.com>
 <20250407133138.22449-2-bincai.liu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8xUyRlIlJRn2Mb1P"
Content-Disposition: inline
In-Reply-To: <20250407133138.22449-2-bincai.liu@mediatek.com>


--8xUyRlIlJRn2Mb1P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 09:31:22PM +0800, Bincai Liu wrote:
> Add compatible string to support mipi for MT8196.

You need to point out in your commit message here and in the mipi
binding patch, why a fallback compatible is not suitable.

Cheers,
Conor.

>=20
> Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml =
b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> index f6e494d0d89b..ed99e959bf4b 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -37,6 +37,7 @@ properties:
>        - const: mediatek,mt2701-mipi-tx
>        - const: mediatek,mt8173-mipi-tx
>        - const: mediatek,mt8183-mipi-tx
> +      - const: mediatek,mt8196-mipi-tx
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.45.2
>=20

--8xUyRlIlJRn2Mb1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/P45QAKCRB4tDGHoIJi
0uZ2AQCmQRddIAahlK8Ed+uZbLQZVr9L4zCTUWXg3FZUCLVczwD+KTSQUSVEAcAA
ytubYwzhw6MZqL5MEKTRb+4e+b1dCA0=
=3pKV
-----END PGP SIGNATURE-----

--8xUyRlIlJRn2Mb1P--
