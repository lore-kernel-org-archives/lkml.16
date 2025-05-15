Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D40E18B47D;
	Thu, 15 May 2025 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321404; cv=none; b=IuEarNNs/85QGv+JuMyacGWcQ5fLOmsvlpRmuBahY+nGjjUVxmAiLbxt7nzIuCCULlT+ZpF2eX7egOv7noJUZ0qDLQoT6KUXdm1F3T+WOR1/M3Sc6hqzbM42SR/CddFTdj8hPf2nX09qA2iplGOJQhH1U7KZkRYR0YJdhZ+3EX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321404; c=relaxed/simple;
	bh=f33gqLjldDDdRW4vOxXs11kVH65ekxxGAWcPGMLu7f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9+SHCzeC8y+ygC+JbBqnuX7hg3a5vs2UKEiF1888YTe2IMSLvvdR3RtrxFTbQzEtPSZL+lMYyYS6IGz/wIApToshhS8j5oBAROlSaiBEnBv2ieFTU3jIBFckcMENYg3WkVU3wDg/OHOebSxiKvPkpKZay0IUd/ZQwuQhjE9Y14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcbrkI0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcbrkI0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA68C4CEE7;
	Thu, 15 May 2025 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747321403;
	bh=f33gqLjldDDdRW4vOxXs11kVH65ekxxGAWcPGMLu7f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AcbrkI0xhqMduqtOMGllH5ntAsObN/OLbfB/G31UnYU10u7LJNFjfauJHLemsvZTd
	 HAr7RFeurbh6Q/9X6pYDIIYkZ9cXeoZOD2sihlH75AD7hoUz0sPiPEMVog5b2FwhKi
	 Ll+TWmdpR3fx4gqhweYGnEWY9ZHB16vzxnhiL3FO77CXwGSIFYTMlON6jqEzFYvse5
	 NCr3YOvHsy6juqvPfGC5VFgmbOIOxAIb1iUYnZpVyDuMKQf8/VvaYIRfPrz5qNGvSq
	 wdmAlZz5EHdsF3w7DBqd9xiwmj5nIMZ1GTwQKy7Wb0ROrKHQmFxo2dCXyqS2u8a3SW
	 vvpYrpXkby+2Q==
Date: Thu, 15 May 2025 16:03:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Garmin Chang <garmin.chang@mediatek.com>,
	Friday Yang <friday.yang@mediatek.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
Message-ID: <20250515-playpen-dislodge-80245fb8b7a9@spud>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
 <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oMx8Qhq8OmFBcl/n"
Content-Disposition: inline
In-Reply-To: <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>


--oMx8Qhq8OmFBcl/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 03:31:43PM +0200, Julien Massot wrote:
> The '#reset-cells' property is required for some of the MT8188
> clock controllers, but not listed as a valid property.

"required for some" but not marked required on those platforms.
Why not?

>=20
> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset f=
or MT8188")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml | 3 +=
++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> index 2985c8c717d72888dd49f1f6249a9e2594d8a38d..5403242545ab12a7736ed4fba=
c26008aa955c724 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> @@ -52,6 +52,9 @@ properties:
>    '#clock-cells':
>      const: 1
> =20
> +  '#reset-cells':
> +    const: 1
> +
>  required:
>    - compatible
>    - reg
>=20
> --=20
> 2.49.0
>=20

--oMx8Qhq8OmFBcl/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCYCNgAKCRB4tDGHoIJi
0qykAP4jwOwRNbjISghj42hTicuByhnQbNDJe/Q2kvlQkNMG9gEAhJbm+LJ5HFzy
6WQO5VV1fAzocZfklpykpuhviJASSgo=
=5N6U
-----END PGP SIGNATURE-----

--oMx8Qhq8OmFBcl/n--
