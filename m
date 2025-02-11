Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641F1261564
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739296471; cv=none; b=Uq5X+YdAQUWWyMa51YaC36Z8Zab5knt1VLVcbUUHGHeVc28oQqtTsrBwYBdx/Q2xrNI7de5d3GyqCG6HlwHYqneFSZtKGEafOJD8xPke74S0PcZgp0Y646swyYpu7vnkwsgDUpckAsWXQ+QrWV0DsrknF2E0TbpHi4gCeeJNnXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739296471; c=relaxed/simple;
	bh=5rmXpuduF/u7vqhQmmIvfQ9KEO3o9/3YAw2HM+4dEfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWWIq5UEu3Pd/zcZwPA4z85SH9ORMI6mXQmgZKhLA86l/D69yeUjZp+OT3nsJFhCMdgGZ/nqz8Vas4Fib4FUbRIIAOLFE8JEU2Oafs/PBhKGqqgQ/w1fTCN8mJPbw+FES4oy9DD8iE7JwRTOI+YWoF3bkO1PFQh2cieTc/ntY1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORhJUFZu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORhJUFZu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9EFC4CEDD;
	Tue, 11 Feb 2025 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739296470;
	bh=5rmXpuduF/u7vqhQmmIvfQ9KEO3o9/3YAw2HM+4dEfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORhJUFZuBi0N/fPSErbN9tgZDcMqiiMEWc8jMASSf5bjnb+MMeuds7a6jGNEcLpk1
	 4ZZy56likvWzUXQrRuDm7xfiDnlgPPPjlMe5H/2/3j0bUv5Jtkjbg1Fa9MS/JSPKEj
	 C+hjYgi5+su6mDQ2CYkSJesdNFN6voFWjzB2g/aIeRE+OfNyoKIR+i/ott4QcWqv+6
	 izjSSQsj3zf7GkboFlt9TAvozOz28BCmvnNtzQkOO06V2yBxy67pEhHLpYdGl9mrMP
	 hAOF3m/bjUY/FprmIAWE9ca/FCFORT7c7UDSqnjsmEygzMwl685ICS+pnFvLRdiM2N
	 aPBYMjgXHTRxg==
Date: Tue, 11 Feb 2025 17:54:25 +0000
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
Subject: Re: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Message-ID: <20250211-feed-shed-4b32f146cc54@spud>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-2-sunny.shen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TeColmbo9d48spU6"
Content-Disposition: inline
In-Reply-To: <20250211025317.399534-2-sunny.shen@mediatek.com>


--TeColmbo9d48spU6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 10:52:50AM +0800, Sunny Shen wrote:
> Add MDP-RSZ hardware description for MediaTek MT8196 SoC
>=20
> Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,mdp-rsz.yaml    | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,mdp-rsz.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mdp-rsz.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mdp-rsz.yaml
> new file mode 100644
> index 000000000000..6642b9aa651a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz=
=2Eyaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rsz.yam=
l#

Filename matching compatible please

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek display multimedia data path resizer
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  MediaTek display multimedia data path resizer, namely MDP-RSZ,
> +  can do scaling up/down to the picture.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-disp-mdp-rsz
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: MDP-RSZ Clock

This can just be "maxItems: 1"

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        disp_mdp_rsz0: disp-mdp-rsz0@321a0000 {

And "disp-mdp-rsz0" isn't anything close to a generic node name.

> +            compatible =3D "mediatek,mt8196-disp-mdp-rsz";
> +            reg =3D <0 0x321a0000 0 0x1000>;
> +            clocks =3D <&dispsys_config_clk 101>;

Surprised there are so few properties, no ports link or anything like
that?

> +        };
> +    };
> --=20
> 2.34.1
>=20

--TeColmbo9d48spU6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uO0AAKCRB4tDGHoIJi
0sY+AQC0Vco77whZIp3/tgk1bNN+9gXooiLJUhwGAHf4Gg/oTwD+OPXyvK0GT0dj
g+jzc91WFWTOwC/l9B6XKr8nX2rgSQI=
=EAWO
-----END PGP SIGNATURE-----

--TeColmbo9d48spU6--
