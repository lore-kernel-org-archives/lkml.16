Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99832204C20;
	Tue,  4 Feb 2025 19:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697972; cv=none; b=lVjh6lLAIrO/TfpWtof867q09Ty9bRg8JUfTfxmYNgVaVg2Qd2BlwgseG/UlTKFkhDPRnZqBYcBtuYnzC4JrRttdn0L337t9ZMWlgFSrFUE1cTZ/LUMMXIOl+2vvmcMMqM4C9rJV8Lh4wOwunOSd8Z7m2VGgB4GFEFkvsQPn2lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697972; c=relaxed/simple;
	bh=0Np7nYbz3nCicHvUP3D9GR6lV8vm/nvO3gDD/5+HKCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RANLZD8PGoXRA3g+EeduhYu5boi2fSi/ILnH9L3adF4vN1qCcJgXJtqWR0qNyZbGXX79GnTr5IuEbKNsF8Kr0tatZ7oYy7LKO03+HsrQbZaRAjz6wqwCYlYzGJwh+mulUEjJvQ4GjE2foYSbYBiNKYPF5WOVnYyz4kjZBwXrirM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boOQs8h2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boOQs8h2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D832C4CEDF;
	Tue,  4 Feb 2025 19:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738697972;
	bh=0Np7nYbz3nCicHvUP3D9GR6lV8vm/nvO3gDD/5+HKCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boOQs8h2XWSoS4iAGBHxakWjY3BHKlRpj/SftZe4xXKWPqkax0yi4ElxGVONmjVbJ
	 uvvKwXqrVQFsfYggCvccH4hZJc1yRtytfzNRXGaoWlocaURVqAC//H+xt1cy4mj8G5
	 heEazKwosS6DsQz3xQruJcx3FI8Fxt0c6OWlcqWoMs/PR5/hB3dZfm4uP+NM47uyM7
	 gr87ghEwi1Co1rY4pgOaF8Cu9KZcdp+oE6Nz8lo28lXmrryWkiRbpI4RoJ14U9RkC2
	 R6e0LgBorReUoxevnGloDbogTxdvY2HSwa8a6HEXAzq8kymvJ5v4tJFDoyCvndgV7Q
	 tDbbNl2syQCsw==
Date: Tue, 4 Feb 2025 19:39:27 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: arasan,nand-controller: Ensure all
 properties are defined
Message-ID: <20250204-remedial-expansion-56cca89037c1@spud>
References: <20250203213042.12657-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XOwSPoDBnQePLHKv"
Content-Disposition: inline
In-Reply-To: <20250203213042.12657-1-robh@kernel.org>


--XOwSPoDBnQePLHKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 03:30:41PM -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'unevaluatedProperties: true' allows. Fix this constraint.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--XOwSPoDBnQePLHKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6Js7wAKCRB4tDGHoIJi
0ofNAQDFmCSDgJmpUf5xFTf8IyUT1tSKqy1zxhN9AYpQTbk9zwD8CB7gM85XGLbc
+0Ypwqd3Eu02o04XFEH+xuwsyWL/Dwc=
=Xye+
-----END PGP SIGNATURE-----

--XOwSPoDBnQePLHKv--
