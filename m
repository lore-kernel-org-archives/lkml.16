Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0962CCC0;
	Thu, 26 Jun 2025 16:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955740; cv=none; b=LVfc6XujxdrBjoMI26baCbTDL6wH3V87oF/yuljnzXSVSqC6iDiWcOzy0seUuzWCRZoPdkkMpkNE9noI+UvrcFju7AXh3vkyS5gHKyhcQ0MLMjHIUfeVJs2zaLV+FcvHpR09SwZNpEzcjbxfHG2tvnFC3yO1zDm8Cybtxtrh9qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955740; c=relaxed/simple;
	bh=wCbmMUfYuBUun3CeeJIDrLKEeED82fEYjdia+QOR/Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdlxf5aX8gOMmwuWaQ1AwKXj9FZxrDTXKj2GI+mUYEDIp+PlEUVpMGJUYMob1aX+opiFY3snsSntensr7hQnN3PaXSm0wtRv2N5mQWBH14qHstrMknbNvCSw1YoEpkAkUo2XlcHh9nVnP2qb1g4/hajZGbn19dlHh2C/sOn2HTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpRnWyUs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpRnWyUs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA350C4CEEB;
	Thu, 26 Jun 2025 16:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750955739;
	bh=wCbmMUfYuBUun3CeeJIDrLKEeED82fEYjdia+QOR/Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UpRnWyUsDt/6Bm1WS2q7jSb3hxiZostCdoFgPSZc4/EejwiOrpdxVQojHspcOM1pA
	 LMBJibUqxJz/eRwGVXF7Cbr/KPrUiQjrjqNlikXa6haTBS/QtEKkxIqztTDpoTMgka
	 OUTJ/eT2qKgSSUXSsb25uSqpAWTA2Cknp30256T8I9ByJykqWMW6EjoKBkkhEsrznd
	 d6UeWtxnL4wx+mCxsjCj4oywjbaX3ESm2W3sW0w8UKWUoy8hQ3sq/CPfjcI5O+OjCm
	 CrSK3FH7cjFL82QPtZvSc1pBWVdluOwz+gHbfhq4244dC912uIa5xx+xFahfFrnVAz
	 ZQXfLD2oLW8XQ==
Date: Thu, 26 Jun 2025 17:35:34 +0100
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: riscv: Add xmipsexectl ISA extension
 description
Message-ID: <20250626-scratch-numbness-cbf36f77d296@spud>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
 <20250625-p8700-pause-v4-1-6c7dd7f85756@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5ZI8rYN+BJWGMnAI"
Content-Disposition: inline
In-Reply-To: <20250625-p8700-pause-v4-1-6c7dd7f85756@htecgroup.com>


--5ZI8rYN+BJWGMnAI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 04:20:56PM +0200, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> The xmipsexectl extension is described in the MIPS RV64 P8700/P8700-F
> Multiprocessing System Programmer=E2=80=99s Guide linked at [1].
>=20
> Link: https://mips.com/wp-content/uploads/2025/06/P8700_Programmers_Refer=
ence_Manual_Rev1.84_5-31-2025.pdf
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index ede6a58ccf5347d92785dc085a011052c1aade14..de41a6f074d3af2ceaf5293df=
e75d16f43d416d6 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -662,6 +662,12 @@ properties:
>              Registers in the AX45MP datasheet.
>              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf
> =20
> +        # MIPS
> +        - const: xmipsexectl
> +          description:
> +            The MIPS extension for execution control as documented in
> +            https://mips.com/wp-content/uploads/2025/06/P8700_Programmer=
s_Reference_Manual_Rev1.84_5-31-2025.pdf

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +
>          # SiFive
>          - const: xsfvqmaccdod
>            description:
>=20
> --=20
> 2.34.1
>=20
>=20
>=20

--5ZI8rYN+BJWGMnAI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaF121gAKCRB4tDGHoIJi
0qDXAP9lFJBJpCas9VE4K4zGjowGNe7GTpkhDOuvy/r+gT3FdwEAtdQbwRROiODf
HVzgWtWY4uzVByx9neOWS/Wu2utllAI=
=8x/c
-----END PGP SIGNATURE-----

--5ZI8rYN+BJWGMnAI--
