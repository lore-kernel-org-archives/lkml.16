Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11252F5086;
	Wed,  2 Jul 2025 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474291; cv=none; b=LLNUJSe372EIbc4/Ar/aQnWH1vzIveeUDe2FUpWdqrd5PDAOPpzNNyjsmqCwLNYpfBHApca/kNPxOAzYhzd6GBKJOm59TupMGRbJJpBV1T6If8J4IWNudbkekKVovjGcHhVTzx7m5Tj8ZLwdTmiqH3M1A+01h7QXA3axp0v6/Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474291; c=relaxed/simple;
	bh=Qc9qaZjtszTGfIo1ETHEUtNH5a2Y5/f+r7cHk6zLCuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVR0ciropc/GjzsqgNwkrG934o6/maL9N4JiiFbcn2+co5w+jsCyu6lnmQqwLk/XNXa9sTihir53qJRVluurKlU4RB2REMtF8nxHBhDsSPepiOfCa3UAb9yToVsda86TQGt3hb0zLZ5nOJwRSmUff4gnXb8U0qm6exPS1QygOZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMVg3dYL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMVg3dYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A0BC4CEE7;
	Wed,  2 Jul 2025 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751474290;
	bh=Qc9qaZjtszTGfIo1ETHEUtNH5a2Y5/f+r7cHk6zLCuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMVg3dYLUaNyfuSBOfBXNwS3dJMPaU7p8P4tXXQzf/3p1CZXHWxsu+U4+KHbw/8Ep
	 1SmQeG/jqruES5oXpLVu5y3lCHXMI70Md2yNVm6DV0NWeNlkK2mRw+24f5FIVzvAT9
	 odpAX1YvQqK/1hldpCiexN0q2RbOfPNlkzeR2zRymdgXAoDyWhUgfuVNCj+TrnTOGd
	 3QMykmPmHpJIrTW6PiHdTMIFfaErsDejIpKsHyX8SxBPLoSr/DBRB7K1mMc+nWqP1u
	 w+wGkPe3j/WnHFmjcFoyeKmU7LNeV2XJgDzMHkkH226McR033f5zuogRE+LfX/2KNt
	 aCSVhhnkvTATQ==
Date: Wed, 2 Jul 2025 17:38:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: dt: writing-bindings: Express better expectation
 of "specific"
Message-ID: <20250702-dicing-yo-yo-ddccd5ae7d5a@spud>
References: <20250702161700.229458-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ExsRr/5aIlsNDTUR"
Content-Disposition: inline
In-Reply-To: <20250702161700.229458-2-krzysztof.kozlowski@linaro.org>


--ExsRr/5aIlsNDTUR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 06:17:01PM +0200, Krzysztof Kozlowski wrote:
> Devicetree bindings are supposed to be specific in terms of compatibles
> and other properties.  Short "specific" has many implications, so extend
> the description to cover them: no family names, avoid generic SoC
> fallbacks, avoid versioned compatibles, avoid properties implied by
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
IDK if it is intentional, but while you mention this here it doesn't
appear in the text below. Probably as simple as "DON'T use versioned
compatibles, unless documenting a HDL IP core"?

> compatible.
>=20
> Also document desired lack of ABI impact and acceptable solution if such
> needs arises: clearly marking it in commit msg.
>=20
> All above follows established Devicetree bindings maintainers review
> practice, so no new rules are introduced here.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> I have vast (~10-page) document describing DT bindings and DTS rules,
> based on Rob's and other people's reviews (with references...). Let me
> try to funnel it here gradually. Why gradually? The intention of
> writing-bindings document is to be concise, so rephrasing my 10 pages
> covering each little detail into generic, concise rule is not that easy,
> especially for non-native speaker.
>=20
> Optionally I could also post my 10-page guide somewhere, but then it
> would be one more document to ignore. I think we have enough of such.
> Ah, and I would have one less topic for conference. :)
> ---
>  .../devicetree/bindings/writing-bindings.rst  | 25 +++++++++++++++----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/writing-bindings.rst b/Doc=
umentation/devicetree/bindings/writing-bindings.rst
> index 1ad081de2dd0..dc0e4b63984c 100644
> --- a/Documentation/devicetree/bindings/writing-bindings.rst
> +++ b/Documentation/devicetree/bindings/writing-bindings.rst
> @@ -39,10 +39,15 @@ Overall design
>  Properties
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -- DO make 'compatible' properties specific. DON'T use wildcards in compa=
tible
> -  strings. DO use fallback compatibles when devices are the same as or a=
 subset
> -  of prior implementations. DO add new compatibles in case there are new
> -  features or bugs.
> +- DO make 'compatible' properties specific. DON'T use wildcards or
> +  device-family names in compatible strings.

> DO use fallback compatibles when
> +  devices are the same as or a subset of prior implementations.

Isn't this wrong? If you're a subset of a prior implementation, falling
back to the prior implementation's compatible would enable features that
are not present in the new device. That's not something you introduced,
it's the existing wording, but I don't think that's correct. It would have
to be a /superset/ of a prior implementation for this to be correct, no?

> DO add new
> +  compatibles in case there are new features or bugs.

I think it might be best to break each "DO" or "DON'T" into a bullet
point of its own. At least it'd make it more clear what the specific dos
and don'ts are.

> +
> +   - Use SoC-specific compatible for all SoC devices, followed by a fall=
back if

"Use a".

> +     appropriate.
> +
> +   - Specific SoC compatible is also preferred for the fallbacks.

I hate to nitpick language to a non-native speaker, but when you have a
plural "fallbacks", it would be "Specific SoC compatibles are also
preferred". Probably also "SoC-specific" too, to match the wording used
in the bullet prior?

> =20
>  - DO use a vendor prefix on device-specific property names. Consider if
>    properties could be common among devices of the same class. Check other
> @@ -51,12 +56,22 @@ Properties
>  - DON'T redefine common properties. Just reference the definition and de=
fine
>    constraints specific to the device.
> =20
> +- DON'T add properties to avoid a specific compatible.  DON'T add proper=
ties if
> +  they are implied by (deducible from) the compatible.
> +
>  - DO use common property unit suffixes for properties with scientific un=
its.
>    Recommended suffixes are listed at
>    https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas=
/property-units.yaml
> =20
>  - DO define properties in terms of constraints. How many entries? What a=
re
> -  possible values? What is the order?
> +  possible values? What is the order? All these constraints represent th=
e ABI
> +  as well.
> +
> +- DON't change the ABI, but if ever needed to change, then DO explicitly

"DON'T", not "DON't". But this immediately contradicts itself, so maybe
a different wording could be used here. Maybe "DON'T make changes that
break the ABI without explicit and detailed rationale for why the
changes have to be made and their impact."?

> +  document that in the commit msg with rationale WHY ABI has to be broke=
n and
> +  what is the impact. ABI impact is beyond Linux kernel, because it cove=
rs also

I think this should be "ABI impact /goes/ beyond /the/ Linux kernel,
because it /also/ covers other open-source upstream projects.".

Cheers,
Conor.

> +  other open-source upstream projects.
> +
> =20
>  Typical cases and caveats
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> --=20
> 2.43.0
>=20

--ExsRr/5aIlsNDTUR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaGVgbgAKCRB4tDGHoIJi
0v+SAQDiSRz2cEksHUrXKYhuPZfURXHZTVQuM4alHdgIjusWfgEAnsR8HMVKSvzM
bbZv4zC519Chhfd2InIlDy1eUjmG4g0=
=ELdN
-----END PGP SIGNATURE-----

--ExsRr/5aIlsNDTUR--
