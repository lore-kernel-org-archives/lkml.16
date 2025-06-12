Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0F529CB32;
	Thu, 12 Jun 2025 15:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742469; cv=none; b=NfYRyZIWd7zM+StpPMDI45hC7ubOcdxJONJOt10V0nRniSRJPBUVN99ctZxjmIJaMHCd4GpPhQGxwJaEZwYrXOOdos9lmtASPSoh74vig+Dyxv419xcglSxdOe+hjOXYboX8gYdvm/QbKB/INs9L2tjYoskzPjNiwued43ZYVPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742469; c=relaxed/simple;
	bh=WvdhfgNJT5v5cFAw5+htw1gcZlt/xJmT2/R10D/S/u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByQt3ksgSWC7igqBkq+f/bjT/atZxL1u1/EWNpwEaZvTAGkCOH+8tLJXD4SScoshhg4NmvP0BOHwyu1eDM93HCpouCbr//GXzShHuzoMBJpuvyYlvki8AAuu+iMmlDIu5qCD0jR7aWzRLvICc7HFDiVWRXu0y984d2jVCLqFLC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHCXl8OM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHCXl8OM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797ACC4CEEA;
	Thu, 12 Jun 2025 15:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742468;
	bh=WvdhfgNJT5v5cFAw5+htw1gcZlt/xJmT2/R10D/S/u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHCXl8OM0W3Li5mbXc8STHlocqBbXXzomS0PWwgJWbz9cPCa54iJ2BC06tl1CtSSD
	 o9DSbjNJbGQfrRPz7e/uZiNZllbuyP4YtV7NsDuUMzv56drJTilCdRnnEFmTB40vp5
	 lvClEDILxGEBM6Q6n6kMN1sBtbvz6dnslKdPM193Zth8kHhv9XvOINgAdVdjlZ2WPC
	 79K0gR+Lbgh0HEbQYC994/TP0yWkoA/iEr7w9JSQJAFCR6AFiPUYE9l4Z3qHpahe/1
	 RDhCm4kvzNw9ZGUItpYK6VDaTBN04njeKSdtFYA8aNiY9okUmbkSmBEg0OeoKOmvWJ
	 zeJYrFQ3IqPKw==
Date: Thu, 12 Jun 2025 16:34:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: add mt8173-hana rev2
Message-ID: <20250612-scholar-crown-517f28582edf@spud>
References: <20250612135559.2601139-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rBD6QiyAktVQ2uJs"
Content-Disposition: inline
In-Reply-To: <20250612135559.2601139-1-uwu@icenowy.me>


--rBD6QiyAktVQ2uJs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 09:55:58PM +0800, Icenowy Zheng wrote:
> My Lenovo Flex 11 Chromebook contains a board with revision ID 2.
>=20
> Add rev2 to the compatible list of base hana DTB to allow depthcharge to
> match the DTB.
>=20
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 108ae5e0185d9..7d13547ff57ba 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -132,6 +132,7 @@ properties:
>            - const: google,hana-rev5
>            - const: google,hana-rev4
>            - const: google,hana-rev3
> +          - const: google,hana-rev2

Ordinarily I would complain about inserting a compatible like this
being a problem, but these chromebooks are all cocked up so w/e
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>            - const: google,hana
>            - const: mediatek,mt8173
>        - description: Google Hana rev7 (Poin2 Chromebook 11C)
> --=20
> 2.49.0
>=20

--rBD6QiyAktVQ2uJs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaErzgAAKCRB4tDGHoIJi
0q7hAP4+dlT8mJ7UwIKnCYl2qYuKoPNuL652IQfNk/cSnsBByQEAxsWxRVNvWavo
iouK9N1MJK5viXIHp3ANj69LAdfTdwk=
=vB56
-----END PGP SIGNATURE-----

--rBD6QiyAktVQ2uJs--
