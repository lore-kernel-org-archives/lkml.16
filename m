Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60F828F51B;
	Tue, 22 Apr 2025 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335079; cv=none; b=NYyNazChVyVALsmopuI8kX21dy+xbhLDfRp9xTjhwvXzPQuEc8BbZlcrv5H6wjHnc6gpAGREWcpAh5Zva0uLY+WkmsE0gtC4LTOsVSNGQdKbj5F50ZYf0OHiCVTjUQZtb0IybFaVslj5KRn+C5nofWfLKxPIuE4Bhlhk36CvrJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335079; c=relaxed/simple;
	bh=JkvPZdoTShYa8vDVe82Hn3R7KyYo0c/3vBiaqizB5ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZZIDBGWUjn74gIYcYiqeauakcgH9Z7S/OHt0N6YqomAPTBFOErwIHk2iQv76f/X39LKfUXJez3yU2vm7A1x038ZkurDmdPCA+iI00xeIDH6EbxNY09g3c4HHywV7JUbfP6c7miMNxiE+4Tp/AYVNOF0lhwnP6OeA0F8hvJLDUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hp+qvVRq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hp+qvVRq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75636C4CEE9;
	Tue, 22 Apr 2025 15:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335079;
	bh=JkvPZdoTShYa8vDVe82Hn3R7KyYo0c/3vBiaqizB5ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hp+qvVRqvpQdd3/dLE1zjIapr7/xCp57r+PZJY4J9+xoE8I+C/cVAzdcKa400IG6+
	 5ciI5xalA1XEZevUxaHZHtGtSt6/XuxuZ4Y4ZprEWw7FXltbk+etoTyjUgfvBSooYn
	 5mtTVZOoT5bFfrmdqz595hLnXsX5eR4CyUPfk4cSw5Ef8M0GkH5mJpJMgMdU+IvPAu
	 UjxBUOlVJNcUxIOh9NQHcgCiDXbYA5/4kZel9vVrFMwsKjeM54BVQUClqlQ1ovtJYP
	 QPMzGYLO6KGm/bJFhxVhHju5CNjTY7btBsqxupzk8UqwEwe90Uko2ZU5M4BnXZLJhK
	 L+xZpktfPyLYQ==
Date: Tue, 22 Apr 2025 16:17:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Cyan Yang <cyan.yang@sifive.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: riscv: Add xsfvqmaccdod and
 xsfvqmaccqoq ISA extension description
Message-ID: <20250422-poise-tighten-aed2c0aae830@spud>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
 <20250418053239.4351-2-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hRIk/4PQozJORUcm"
Content-Disposition: inline
In-Reply-To: <20250418053239.4351-2-cyan.yang@sifive.com>


--hRIk/4PQozJORUcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 01:32:28PM +0800, Cyan Yang wrote:
> Add "xsfvqmaccdod" and "xsfvqmaccqoq" ISA extensions which are provided by
> SiFive for int8 matrix multiplication instructions support.
>=20
> Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

If these have some dependencies, please look at how other extensions
have made them required. Otherwise all three dt-binding patches look
fine. I'll leave acks on them all, but with the condition that you
should make dependencies required.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index bcab59e0cc2e..d36e7c68d69a 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -662,6 +662,19 @@ properties:
>              Registers in the AX45MP datasheet.
>              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf
> =20
> +        # SiFive
> +        - const: xsfvqmaccdod
> +          description:
> +            SiFive Int8 Matrix Multiplication Extensions Specification.
> +            See more details in
> +            https://www.sifive.com/document-file/sifive-int8-matrix-mult=
iplication-extensions-specification
> +
> +        - const: xsfvqmaccqoq
> +          description:
> +            SiFive Int8 Matrix Multiplication Extensions Specification.
> +            See more details in
> +            https://www.sifive.com/document-file/sifive-int8-matrix-mult=
iplication-extensions-specification
> +
>          # T-HEAD
>          - const: xtheadvector
>            description:
> --=20
> 2.39.5 (Apple Git-154)
>=20

--hRIk/4PQozJORUcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaAezIQAKCRB4tDGHoIJi
0jfcAQDrhx6DlkgKg6HVs+ukQJSLPErr2MbtDFPVK7i7rMFZXwEA/Y+WWXOz3uhT
2ItvCrOzJaa5cV3cMf5gtgR9G0zRmAY=
=7GKQ
-----END PGP SIGNATURE-----

--hRIk/4PQozJORUcm--
