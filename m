Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4934B214221;
	Mon, 31 Mar 2025 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436374; cv=none; b=PfDwrxulnazlpYl9+nAmoF0SOhbZZrFOcnA/v2QCe7TUontRn+DnyQSCv1cTjKuXXoCLRGDqyq3333bP3nV/u6Abwiz5huXIfJpHGwAvM8xIYvs6hfEFnRmzdsCfA6OMEWz+g83SycdkJwYXs4InDc+9HUmK+Ero017b/qcWSs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436374; c=relaxed/simple;
	bh=bIiTm4DphYPViVfFckbE7tkE5al/qD4fQjiVJuL8ZEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HV/tyA1L0mqJwQY3q8E1v9bnOIji7oXiGvsmB4ZoI+YOv+d2Hwfprna7SepSSpB2e36+n/p7KoLGvm42J3+Mt7LL7LQwEiqbZ4qX9aJY3kpYfUqooAa9XrqHA7Itgf31Cq20irtFYUQrYRelDqTN7mwQkwVOfbdrf/SpWRAoV2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ph2iR5KX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ph2iR5KX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAC6C4CEE3;
	Mon, 31 Mar 2025 15:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743436373;
	bh=bIiTm4DphYPViVfFckbE7tkE5al/qD4fQjiVJuL8ZEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ph2iR5KXbjsBCHhoNbgb7kBoln3erwb8LOwllLtl2Z4JSy3EpUqvhqb/cZKVDkNUf
	 6LLQ95a8MeHwBeztCVs46ZRqHSUaaa1pAJmL0wEdPh+Ql0Lz6SFxrdl7+/9/5lYo8H
	 1TwOwUGp1sWCoKtwZWFchUUG0eBUT3ThDBf1ipbMD5MZc2ODK6eEkfzSQ4WPrb3zvD
	 LdpkBKJrDbnhmmgL7pwKH1AO8chD3d9sM95V5vnK5Se+3MFOq+cRVgc2I6NoP7h2nh
	 +7neJWoJCqUZWeeiX7Sy/8MCwB3pgSH03csWiIUYYC1kXh0tdRw68SDHCQUMXf0Crq
	 HiNkGGOXHzxSg==
Date: Mon, 31 Mar 2025 16:52:49 +0100
From: Conor Dooley <conor@kernel.org>
To: david@ixit.cz
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: extcon: linux,extcon-usb-gpio: GPIO must be
 provided
Message-ID: <20250331-heading-automaker-8c2d28fb4206@spud>
References: <20250329-yaml-extcon-usb-gpio-v1-1-190696e53a0b@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BwVI9heJHr45oKwA"
Content-Disposition: inline
In-Reply-To: <20250329-yaml-extcon-usb-gpio-v1-1-190696e53a0b@ixit.cz>


--BwVI9heJHr45oKwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 01:09:47PM +0100, David Heidelberg via B4 Relay wro=
te:
> From: David Heidelberg <david@ixit.cz>
>=20
> Without providing either ID or VBUS GPIO the driver is not able to operat=
e.
> Original text binding says:
>   "Either one of id-gpio or vbus-gpio must be present."

The next sentence in the old binding reads something like "both can be
present as well", so the anyOf below is correct.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Fixes: 79a31ce03f41 ("dt-bindings: extcon: convert extcon-usb-gpio.txt to=
 yaml format")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/extcon/linux,extcon-usb-gpio.yaml | 6 =
++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/extcon/linux,extcon-usb-gp=
io.yaml b/Documentation/devicetree/bindings/extcon/linux,extcon-usb-gpio.ya=
ml
> index 8856107bdd33b8654812ab9c97e85e23dc2ef75a..8f29d333602b95fe5ccd8464a=
a64e2d1f0c1c781 100644
> --- a/Documentation/devicetree/bindings/extcon/linux,extcon-usb-gpio.yaml
> +++ b/Documentation/devicetree/bindings/extcon/linux,extcon-usb-gpio.yaml
> @@ -25,6 +25,12 @@ properties:
>  required:
>    - compatible
> =20
> +anyOf:
> +  - required:
> +      - id-gpios
> +  - required:
> +      - vbus-gpios
> +
>  additionalProperties: false
> =20
>  examples:
>=20
> ---
> base-commit: e21edb1638e82460f126a6e49bcdd958d452929c
> change-id: 20250329-yaml-extcon-usb-gpio-251b66522287
>=20
> Best regards,
> --=20
> David Heidelberg <david@ixit.cz>
>=20
>=20

--BwVI9heJHr45oKwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+q6UQAKCRB4tDGHoIJi
0s9dAQDu8DO9sGJwX0DhNLYq2qYdAWHeFgw9Q7Xe4huRk7B7xQD+KLHuGLfuJX6P
WIlp8B7tAkf3OzDKCZ733ruhuvBxvgU=
=mlKd
-----END PGP SIGNATURE-----

--BwVI9heJHr45oKwA--
