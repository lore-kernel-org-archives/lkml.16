Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8D722A1F1;
	Thu,  8 May 2025 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716244; cv=none; b=u6TJbgGNihl8VUZZRDN3O18Gca9dIck6X69M+H2LyE4stQr9TFims3IS0eOhswDKQ/ndkn/7AwA1kGIF11QZKXbkKfk2SwLWAh+fMfRZG0pW1FwsYR3YIyvdb8voZghq8728gwDjpIGUkOvRAH1j1IaYJrGpBbLJFjnzEBABnmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716244; c=relaxed/simple;
	bh=9ar8QWK+6HF5F4izWOQj3DNDEiLV3HwPtOjT2Z51yv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqTm1mfx53QLY3llxBkyYszSOmQM35DhiMgmj3l1Y5jEbUkkcl/vMyeW860aN1mEWxKLzeiuFXXwlYlA4cPoF+ukT4GpU3KU8LnFH7fuz7z0W2Bw38dQZctErQ6jUHv4b1Ptm3BQHUh0Tyjym/bgKUWek6yOXSFJyL/I1BHoyGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIlT50GW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIlT50GW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932FCC4CEE7;
	Thu,  8 May 2025 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716244;
	bh=9ar8QWK+6HF5F4izWOQj3DNDEiLV3HwPtOjT2Z51yv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIlT50GWBoJI3mnGqjyogC67R8vDxXxo5QD9Hey3kuPw2J1mg/o0BgVW8IFOGk6S7
	 I/5njV5SUiyKkXWe2+BCOwM4tycbiHHyUS3MEIk2TmNhPJyIcirBYQ7J7zbRSbQrDh
	 216P6kLlSXMqbmx1osR97GnbKQOlY9qs8yPTtGR4c2tf9IQeKjQWe7/NJIELFE9ms/
	 rgWzpXJ+mZiigdN4fs1N6Ase7ywBylQLi4vOu18Gm59hJBISiguTicV/h5TRwCMrGq
	 gGiKYGN9imc8fMdLJP2SLV6IPj1KD4V3NNYemGuIxvTXpBYjVXnOOA1yeO1xB6QLYM
	 A5AtIaoEzmGBQ==
Date: Thu, 8 May 2025 15:57:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, upstream@lists.phytec.de,
	Benjamin Hahn <b.hahn@phytec.de>,
	Teresa Remmet <t.remmet@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>,
	Jan Remmet <j.remmet@phytec.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: add imx95-libra-rdk-fpsc
Message-ID: <20250508-statistic-creation-ba17442921de@spud>
References: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de>
 <20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uGPUkIg0ljVqE3bF"
Content-Disposition: inline
In-Reply-To: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de>


--uGPUkIg0ljVqE3bF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 03:13:12PM +0200, Yannic Moog wrote:
> imx95-libra-rdk-fpsc is a development board based on the phyCORE-i.MX 95
> Plus FPSC SoM. Add its description and binding.
>=20
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 447054b52ea391f69d11409d51751a88bb8b539a..783550c61cd7e9aa12ffe78bf=
aa74478c19e0797 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1366,6 +1366,13 @@ properties:
>                - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
>            - const: fsl,imx95
> =20
> +      - description: PHYTEC i.MX 95 FPSC based Boards
> +        items:
> +          - enum:
> +            - phytec,imx95-libra-rdk-fpsc     # Libra-i.MX 95 FPSC
> +          - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
> +          - const: fsl,imx95

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uGPUkIg0ljVqE3bF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzGTgAKCRB4tDGHoIJi
0mIpAQDFZ7pwZBVIyTySKTZEy3Y13FwVLzSbzc+p71Y977kHbgEA8UuMBpqQg6DY
l00dUGbvIZiCgpxFiB6rSMZ+Z+o2LQ8=
=o519
-----END PGP SIGNATURE-----

--uGPUkIg0ljVqE3bF--
