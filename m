Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C771C8620;
	Wed, 30 Apr 2025 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027043; cv=none; b=SrireMJAeXWVk7XTGYiN9Vvq4Df5IQIR73PtR7/4EmtoBzeJkdqs1Lr+nknVsxmW6Sk4OBeOCLlLO1TulK4AJfZ4U+dgJMilWtCqgOJJz0RlxdDZTRta+aj30NGdsvUIcToEqf8oIrSUSq1HuB73hU9GEV5yk1lbmsSdkILPDKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027043; c=relaxed/simple;
	bh=opdeUvkVojRGTuPuV8xclDhdJWVmOXLGZEZAoQNAZ9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JN/gIzJbe9Cu4XEJyviVeA+xtMLP0LwxuDMS/uKFo/+T2eYVqOyM+wA2vkrGdARsf/DFDcflvM4tzXpayh4o/nDFea3SAt3qp17zwefX9CRnWiCoSmo9uSheUbCgk0s2oE8KKgIsdHQ/wbDE01sRlabsHT9DvmAYq3pLIZM62cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=El8iv2ma; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="El8iv2ma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2366EC4CEE7;
	Wed, 30 Apr 2025 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027042;
	bh=opdeUvkVojRGTuPuV8xclDhdJWVmOXLGZEZAoQNAZ9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=El8iv2mafHvxjq4tRarbAiANk1Rhn09dQGIrTMMWuW9SOf1JTp2kKf/zYgmNdXFzC
	 yosNmtDTs/so4la7muAJ4puJcAQYxzAfwYIYMIwN3ujlQNvygiVkL6LEeaafCdgg1h
	 u9VZBBpjQ2AkXqgcafE4Ok1jvHODQG5AFNzvtQkcff421or2l1KPW1wk3RJyWHgkY/
	 f0PimYV43c8xE6Aba2/IhyZ0IEM4+jDdOFl5nSKuZaoq6J9o0mSQXjZXWWB+e178i6
	 twv3iLKf2v90MbvrHSQq2pRBTRNhhK0Uq4Oid0t6N8FmpQ9l4HKNFtLMra67Sbu4KX
	 JUVzcgnawUssA==
Date: Wed, 30 Apr 2025 16:30:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/6] dt-bindings: arm: ti: Add Toradex Verdin AM62P
Message-ID: <20250430-stylus-reversion-a439538b6fc1@spud>
References: <20250430102815.149162-1-francesco@dolcini.it>
 <20250430102815.149162-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KMHDuPG9qmxNjZvN"
Content-Disposition: inline
In-Reply-To: <20250430102815.149162-2-francesco@dolcini.it>


--KMHDuPG9qmxNjZvN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 12:28:10PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> Add toradex,verdin-am62p for Toradex Verdin AM62 SoM, its nonwifi and
> wifi variants, and the Toradex carrier board they may be mated in.
>=20
> Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am=
62p
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/arm/ti/k3.yaml        | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documenta=
tion/devicetree/bindings/arm/ti/k3.yaml
> index a6d9fd0bcaba..bf6003d8fb76 100644
> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> @@ -76,6 +76,30 @@ properties:
>            - const: toradex,verdin-am62          # Verdin AM62 Module
>            - const: ti,am625
> =20
> +      - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Bo=
ards
> +        items:
> +          - enum:
> +              - toradex,verdin-am62p-nonwifi-dahlia # Verdin AM62P Modul=
e on Dahlia
> +              - toradex,verdin-am62p-nonwifi-dev    # Verdin AM62P Modul=
e on Verdin Development Board
> +              - toradex,verdin-am62p-nonwifi-ivy    # Verdin AM62P Modul=
e on Ivy
> +              - toradex,verdin-am62p-nonwifi-mallow # Verdin AM62P Modul=
e on Mallow
> +              - toradex,verdin-am62p-nonwifi-yavia  # Verdin AM62P Modul=
e on Yavia
> +          - const: toradex,verdin-am62p-nonwifi     # Verdin AM62P Modul=
e without Wi-Fi / BT
> +          - const: toradex,verdin-am62p             # Verdin AM62P Module
> +          - const: ti,am62p5
> +
> +      - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Bo=
ards with Wi-Fi / BT
> +        items:
> +          - enum:
> +              - toradex,verdin-am62p-wifi-dahlia # Verdin AM62P Wi-Fi / =
BT Module on Dahlia
> +              - toradex,verdin-am62p-wifi-dev    # Verdin AM62P Wi-Fi / =
BT M. on Verdin Development B.
> +              - toradex,verdin-am62p-wifi-ivy    # Verdin AM62P Wi-Fi / =
BT Module on Ivy
> +              - toradex,verdin-am62p-wifi-mallow # Verdin AM62P Wi-Fi / =
BT Module on Mallow
> +              - toradex,verdin-am62p-wifi-yavia  # Verdin AM62P Wi-Fi / =
BT Module on Yavia
> +          - const: toradex,verdin-am62p-wifi     # Verdin AM62P Wi-Fi / =
BT Module
> +          - const: toradex,verdin-am62p          # Verdin AM62P Module
> +          - const: ti,am62p5
> +
>        - description: K3 AM642 SoC
>          items:
>            - enum:
> --=20
> 2.39.5
>=20

--KMHDuPG9qmxNjZvN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBJCHQAKCRB4tDGHoIJi
0hFcAQDEbZ+iAmM7XPpfRyDtPTb9EQwMDttv6HFl1IfeSyudqQEA6v/ANrKiaOD1
ss42apT4hN+ggDMZdFM/hW8W9bCYwQg=
=Q1sp
-----END PGP SIGNATURE-----

--KMHDuPG9qmxNjZvN--
