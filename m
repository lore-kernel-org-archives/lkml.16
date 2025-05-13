Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B055B1A3A8D;
	Tue, 13 May 2025 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151597; cv=none; b=niCPQhKl3hR5BQL8+R0qrSyHH0fkyuMBeTaScdmqeS6jiyJ4iKKdBuUGUiRuvYU+4NGFeV6l+UGwKkDqYN6bBA6vCBifWbWMlHLtd0b5PGIb5qW/NX/TR5OnvPMK0qCc/ntaUv2GQF8X3emjRIvpK06F68idZ0h97Yp/+ffzxSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151597; c=relaxed/simple;
	bh=bGea28BdYlH0En91j3DBfSyfXO+62W84BSnvaKbiFxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMrJ+adcWquDgT3wVgRiPjwL0b0iqfWBaGwip1oOOeW9cLOEKAIxcW17pVSO06XvtUjxOK26X2aTR64tdLrHQc+wiLOQhNPuIuBSaXfb3zDZ07IszLeQnkHFv8ootyaLc4r7g5q4dYkB+CghfJ4erMWhgprPh5eMNUJ8hDR0f/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1RPcaND; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1RPcaND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574E9C4CEE4;
	Tue, 13 May 2025 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747151595;
	bh=bGea28BdYlH0En91j3DBfSyfXO+62W84BSnvaKbiFxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I1RPcaNDM3rlbUb38uz4rTUDyU8Zvjtj4QQuJoRnicTgyNv/o9KxENj8B4NL6bF3s
	 z5uZdD89UKe+zD6/14St1KZ3Lo6eQ8W7CGIi4pxI+GANzuhzTv/ojw+aR4p5rkuuQK
	 YN5Dqeyhygf9OTPdgFN2K0tgxIdBMirZ1Jf/U+ZK8Pl5asl5pTb82g9fJFECjCUyat
	 gT61jnQ1VVlqRvZwb6CmSnlpZI6yjDfCGYJFGD/4/vKYDASyNtbVsGLlGZKq+vgCcY
	 x4UKqR3ckkW0kYuWJBFKSfBxkxsfWBFM4KUNO28EvpnPzYTm0YSl2zc3CEw7l0EBKn
	 STSJUxz4nkRYg==
Date: Tue, 13 May 2025 16:53:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com
Subject: Re: [PATCH v3 6/9] dt-bindings: cache: add QiLai compatible to ax45mp
Message-ID: <20250513-duplex-collage-5a52f50b74bb@spud>
References: <20250513094933.1631493-1-ben717@andestech.com>
 <20250513094933.1631493-7-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hn+PSynL2KApRliI"
Content-Disposition: inline
In-Reply-To: <20250513094933.1631493-7-ben717@andestech.com>


--Hn+PSynL2KApRliI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 05:49:30PM +0800, Ben Zong-You Xie wrote:
> Add a new compatible string for ax45mp-cache on QiLai SoC.
>=20
> Also, add allOf constraints to enforce specific cache-sets and cache-size
> values for each compatible string.

"Also" is a massive hint that this should be two patches. I think the
Renesas part (if it can only do 1024/262144, and is not configurable)
should be a patch of its own, since it is valid independent of this
being added.

>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../cache/andestech,ax45mp-cache.yaml         | 52 +++++++++++++++++--
>  1 file changed, 47 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cac=
he.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.ya=
ml
> index df8bba14f758..dc03ffae6c9f 100644
> --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> @@ -28,7 +28,9 @@ select:
>  properties:
>    compatible:
>      items:
> -      - const: renesas,r9a07g043f-ax45mp-cache
> +      - enum:
> +          - andestech,qilai-ax45mp-cache
> +          - renesas,r9a07g043f-ax45mp-cache
>        - const: andestech,ax45mp-cache
>        - const: cache
> =20
> @@ -44,11 +46,9 @@ properties:
>    cache-level:
>      const: 2
> =20
> -  cache-sets:
> -    enum: [1024, 2048]

^^ this and...

> +  cache-sets: true
> =20
> -  cache-size:
> -    enum: [131072, 262144, 524288, 1048576, 2097152]

=2E.. ^^ this should remain at the top level...

> +  cache-size: true
> =20
>    cache-unified: true
> =20
> @@ -66,7 +66,49 @@ required:
>    - cache-size
>    - cache-unified
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: andestech,qilai-ax45mp-cache
> +
> +    then:
> +      properties:
> +        cache-sets:
> +          const: 2048
> +        cache-size:
> +          const: 2097152

=2E..and you just constrain things here. Effectively this means just
restore the enum outside the if/then/else.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g043f-ax45mp-cache
> +
> +    then:
> +      properties:
> +        cache-sets:
> +          const: 1024
> +        cache-size:
> +          const: 262144
> +
>  examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>

Honestly, just delete this whole example, it doesn't do anything
meaningfully different from the existing one.

> +    l2_cache: cache-controller@200000 {

But if you don't delete the example, remove the "l2_cache" label cos it
is unused.


Cheers,
Conor.

> +        compatible =3D "andestech,qilai-ax45mp-cache", "andestech,ax45mp=
-cache",
> +                     "cache";
> +        reg =3D <0x00200000 0x100000>;
> +        interrupts =3D <16 IRQ_TYPE_LEVEL_HIGH>;
> +        cache-line-size =3D <64>;
> +        cache-level =3D <2>;
> +        cache-sets =3D <2048>;
> +        cache-size =3D <2097152>;
> +        cache-unified;
> +    };
> +
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> =20
> --=20
> 2.34.1
>=20

--Hn+PSynL2KApRliI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCNq5QAKCRB4tDGHoIJi
0v7rAPsFhJbHaCPBhRimiE9I+FLuciA6lcf8JDnxppQLNLe1swEA+quUTT+7Ll1N
7ZUvKDF4vkqbcGzirfTwqsdYCnwJIgM=
=L0Zu
-----END PGP SIGNATURE-----

--Hn+PSynL2KApRliI--
