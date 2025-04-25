Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9E384E1C;
	Fri, 25 Apr 2025 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745592693; cv=none; b=CD8J8QbB1cT8R1rE/chfJwEsvz2ZeDUm6uwQRJ0e2lMhkqn/wjtnpOdPCLZxlameLAKL5UlqxrC5BwpaqlrKkkeaakch4aHgo89xpOX7lDbsidG/yruYLyaG8IpmlUnSWabThG+biQ5fBNAzIlrxOQf8vH70uVibgeSasK478vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745592693; c=relaxed/simple;
	bh=ORYV3pufFLavCcfuKAouL0/gfIikxzXt+cww9KaOuvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bt5EX2tWTcFx/WYMNMUqmVHg07QISEgafypsO/4DDmBHgEC7XI2T51v9J/mn0UvSQaomnw1zHrsDyia1RRRRZuKOI8cqQ1B/n+MVacBHqUFG8zwnpQm1kmW4il3SMU4l83C2vJJJcnDV2ictLrT/GVdL+xNtjHCO1Uf6siatcFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQopFPBf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQopFPBf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1461C4CEE4;
	Fri, 25 Apr 2025 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745592692;
	bh=ORYV3pufFLavCcfuKAouL0/gfIikxzXt+cww9KaOuvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQopFPBfz4eaeHmTPdrBo20CUmVLaXX17oeKkMx5wNWr07sYNxRl95/penpfh4I0D
	 S20g7mvMty4Rz1xhCU7Ou0NEfGuMKntJ4asSGf6jRm9v+lvo6mzIO3AtyZv9taNdgb
	 c55scPrq8fogOVJ0Vmg7hF7OPoq4qNMqNaGFEh+F2sZaRNvABI29FAb3kAFimI0Uzh
	 65E0LXc17gk1J39kjClZZqgYv/Xe3XusbWY9Ei883mHuM//cB3wN7Clp67qAurYBUk
	 Hrq52ZmAGCoQP1oA3p4FKmyd7IMXLEg00L2NOPmp+fw3VpdZm2lPl2eB3Ztozl0VWs
	 K5VYfGaqfl5Ww==
Date: Fri, 25 Apr 2025 15:51:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
Message-ID: <20250425-prewar-ranging-161ccd2b2468@spud>
References: <20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com>
 <20250425-apc_paper_binding-v4-1-0ec2d0febe21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GjP52dV+jImYt1qm"
Content-Disposition: inline
In-Reply-To: <20250425-apc_paper_binding-v4-1-0ec2d0febe21@gmail.com>


--GjP52dV+jImYt1qm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 06:34:13PM +0400, Alexey Charkov wrote:
> APC Rock is a development board based on WonderMedia WM8950 SoC
> released around 2013. Paper is the same as Rock but lacking a
> VGA port and shipped with a recycled cardboard case.
>=20
> While at that, put myself as the maintainer, given that Tony is
> unavailable as of lately.
>=20
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/vt8500.yaml | 23 ++++++++++++++---=
------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Document=
ation/devicetree/bindings/arm/vt8500.yaml
> index 5d5ad5a60451f569e6ef30c924a1964d02e1aa82..f2164144a7af29ca77761bc58=
fe7f4558e7d101c 100644
> --- a/Documentation/devicetree/bindings/arm/vt8500.yaml
> +++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
> @@ -7,19 +7,24 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: VIA/Wondermedia VT8500 Platforms
> =20
>  maintainers:
> -  - Tony Prisk <linux@prisktech.co.nz>
> -description: test
> +  - Alexey Charkov <alchark@gmail.com>
> =20
>  properties:
>    $nodename:
>      const: '/'
>    compatible:
> -    items:
> -      - enum:
> -          - via,vt8500
> -          - wm,wm8505
> -          - wm,wm8650
> -          - wm,wm8750
> -          - wm,wm8850
> +    oneOf:
> +      - items:
> +          - enum:

This should just simplify from "items: - enum:" to "enum:".
With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +              - via,vt8500
> +              - wm,wm8505
> +              - wm,wm8650
> +              - wm,wm8750
> +              - wm,wm8850
> +
> +      - description: VIA APC Rock and Paper boards
> +        items:
> +          - const: via,apc-rock
> +          - const: wm,wm8950
> =20
>  additionalProperties: true
>=20
> --=20
> 2.49.0
>=20

--GjP52dV+jImYt1qm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaAuhcAAKCRB4tDGHoIJi
0r+sAP9JVeKQ/4V3BSOMKHnQtJFsApmrTtpl1BBIw/1jAgjY8QEAymv8fvG7Ih53
kJEnD+pUrAVAeGtEOj3WVga4MaXX/QY=
=0wOS
-----END PGP SIGNATURE-----

--GjP52dV+jImYt1qm--
