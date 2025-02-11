Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19AC253B6E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295903; cv=none; b=BBcpBcJmb4Xy6AMJ/Ymf3tW9ZpdW/22jFz97QklZuZCO/c7p156/gH0LbZ2FiGvAzH+TJ09RCAzJYfa15xxnWXg7fZymGpmuKEsQtso1s3cGKEuj4H89aAnkwmTXC8EBS3EqiRBE9eBiXtHRehJ5gFiHkt2cooa5a/Fd6y7ngxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295903; c=relaxed/simple;
	bh=IYEdhM4+0ThJA5HBQ6fog3jXewUj4csh1viDFDkpai0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPVc+gMyjIjuICYp0pjyOAh5anqqUB41LC0YgAugbpA9gxkRLx8474gImgQ+AoW7l6nyXqDNzM83OsjlYoAuL1iwgvGKVS3wKB+9PlJShctTkSKQJ9J8xRd2WyH01Js6lhh9nCjrxx6zEKVvehGXNKOw9CZ+eR7wccp6B4IjhwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9k3qkjg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9k3qkjg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03AA6C4CEDD;
	Tue, 11 Feb 2025 17:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739295902;
	bh=IYEdhM4+0ThJA5HBQ6fog3jXewUj4csh1viDFDkpai0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9k3qkjgL6pH80ogRArHzdsx5uXVtG3u0YUqpr9Ctdj8+/NLeRJVtC5aWh0pv7SvB
	 APDjgEdJa1asJr+n64E1KRS82QrLsBOg7I7gWcqBKST5xUPZTywIQWHpEazNJP+rXP
	 SKyFInhbhBCQAv0NGotAeReU9GsYfF8ehoC7j7gh6mJ9RIfaMJ6qWR0aXnrQUo3VRX
	 OP2yNSSM575zXmwMDf7zWU9HICS1E8X2R1bNrXMiAPrIiyguUQZ1p4Djdojc1Bljwp
	 qvfECtxwWS2LzSLesxKSpzS/kunHUNnQ2trVkqP7xU6ByRY95YsKOT9yGqfvCwCmaD
	 kBDXUVqY2dOlg==
Date: Tue, 11 Feb 2025 17:44:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunny Shen <sunny.shen@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Fei Shao <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	"Paul Chen --cc=devicetree @ vger . kernel . org" <paul-pl.chen@mediatek.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 2/5] dt-bindings: display: mediatek: postmask: Modify
 rules for MT8196
Message-ID: <20250211-darkened-justify-f559a0bf2a81@spud>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-3-sunny.shen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AN5oWCXPj8Gvwucf"
Content-Disposition: inline
In-Reply-To: <20250211025317.399534-3-sunny.shen@mediatek.com>


--AN5oWCXPj8Gvwucf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 10:52:51AM +0800, Sunny Shen wrote:
> Add a compatible string for MediaTek MT8196 SoC

$subject and $body don't match here.

>=20
> Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,postmask.yaml  | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek=
,postmask.yaml
> index fb6fe4742624..29624ac191e1 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> @@ -27,6 +27,7 @@ properties:
>            - enum:
>                - mediatek,mt8186-disp-postmask
>                - mediatek,mt8188-disp-postmask
> +              - mediatek,mt8196-disp-postmask
>            - const: mediatek,mt8192-disp-postmask
> =20
>    reg:
> --=20
> 2.34.1
>=20

--AN5oWCXPj8Gvwucf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uMmAAKCRB4tDGHoIJi
0q/GAQCeCuVWfWkn+7Uog5I98DkIcobNbcbPvlOVI5tiUcEtDAD6Amsq2F0zICow
GXQ53Xxni3csTCSSopUVF4waDJeG3QA=
=UYkB
-----END PGP SIGNATURE-----

--AN5oWCXPj8Gvwucf--
