Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831891F181F;
	Fri,  4 Apr 2025 16:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743785743; cv=none; b=tPlBbiLmXeNsOyxGXzmRFpZT1CnYVgRzaVQMPgHBYJvQt0G/LuBQnonlR56WhejIihdKQ3qEqCpZIUsfNy35PpdK7xTm4OYFvoYCcY22MLZDuDPIsx3YszST/Ijgsqo/XtO1q23euf+1DlA1i1TstMzpC2TvyjpvOzbh44ykMWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743785743; c=relaxed/simple;
	bh=ThNXk6gQmRSG91uTwe+RSVnkgKn9o9HMxBFyge/Vpio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkpwfTe1MkUu9GJW9W57rALUFRW7/GHsT8JXMBhN8ZQCKoE8PAuQkC8E3ROh5Pi6TEizHsHbfWut5/bLY6MT1yzKpimuVlIEWgwTzCQsBxuN6chdj4g+LyypjwmLzR5Cwi5jBUZlN+55XrtbPqU2MXsERy/FgNsh3IfZkLg4NIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULRTN/uZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULRTN/uZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC06C4CEDD;
	Fri,  4 Apr 2025 16:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743785743;
	bh=ThNXk6gQmRSG91uTwe+RSVnkgKn9o9HMxBFyge/Vpio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ULRTN/uZrtDIdGK0Npe+J/IFBIzHTvgqz6iAT15uYWKsSOXxe13+WDcf32RPw2DGz
	 2qupFztV7yAlvr4Twq9o+Ibw9PxelQdMhITs714Z0FAhvJDiyYS59oyZZPhFGwSNP6
	 ia8BVA+4hqmPN2rnjJVqPMaloPNr7M02l7BQA2hH0HS7B3UBrX7z4hDy/GY+ez4btn
	 kj10SJ71bWqSkB0k6nlLEhQl/TZeh47PhlqnC1pjCH2anFUwYE1sLDqK6DpD3tztEQ
	 M1cvsZDT9UELKrX5lqDmR3kddMeunMWD0xZDQf3Qz+s7J5qafA0lkHmlGSuRq4A5lk
	 YVJ2IOSiA/tHw==
Date: Fri, 4 Apr 2025 17:55:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: Add Sitronix ST7571 panel
Message-ID: <20250404-railway-croon-288f2943928d@spud>
References: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
 <20250404-st7571-v2-1-4c78aab9cd5a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qzsnKKKTsOCiJ2gz"
Content-Disposition: inline
In-Reply-To: <20250404-st7571-v2-1-4c78aab9cd5a@gmail.com>


--qzsnKKKTsOCiJ2gz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2025 at 03:50:32PM +0200, Marcus Folkesson wrote:
> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  .../bindings/display/sitronix,st7571.yaml          | 73 ++++++++++++++++=
++++++
>  1 file changed, 73 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.ya=
ml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..11575b820c59c5ada427fbb6b=
015c331215c8db6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sitronix,st7571.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sitronix ST7571 Display Panels
> +
> +maintainers:
> +  - Marcus Folkesson <marcus.folkesson@gmail.com>
> +
> +description:
> +  This binding is for display panels using a Sitronix ST7571 controller =
in I2C
> +  mode.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sitronix,st7571
> +
> +  reg: true

You need to constrain this, so maxItems: 1.
Otherwise, seems okay.

--qzsnKKKTsOCiJ2gz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/APCgAKCRB4tDGHoIJi
0jFaAP94txS1od9FB9n4WU+erJN/I8jN9X+7sbHfsWd5TswTLAD/b05lLr3/b6yz
+nYXOZDzWEmbmlxEz43LbhhqbWDX2gA=
=QZbK
-----END PGP SIGNATURE-----

--qzsnKKKTsOCiJ2gz--
