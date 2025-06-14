Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6E8156677;
	Sat, 14 Jun 2025 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749899008; cv=none; b=Aq5P5uTFA4PcFVC+A6OxxcpmQFTDAEFdg3FBqWHdCmmttqbXGXgF67P0lA/h08ofnzLcLBSbOaFYh+OyAMy07ln74VEdWmRNnsHet4NUo/dhl9M0MoplB9+seDSBIpYZK7vglcIzpULwRvv0TFI1nPTROWMuqOwNmOjjlhzf3I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749899008; c=relaxed/simple;
	bh=18IwSRhnqZmKBa7nklK7g3Eh68Nn59c5ZTIG5pz9m1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLrTGw4oJ/yAeNMLJD/cZ4ku2c4VV/l0Uw692XNAyBZQLmkwOz2S8qd9MW3ulo9KmkDqNgbeQYXtSAKItUCYnoXM6BBwyCBymKvB6cbXBdcs/S1bb/we2hC1YXmgfEU4ME3MtId4LkKtm+245/RHnzjUwy7liEwBzRnn7cenR7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVsgEuDq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVsgEuDq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB71C4CEEB;
	Sat, 14 Jun 2025 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749899007;
	bh=18IwSRhnqZmKBa7nklK7g3Eh68Nn59c5ZTIG5pz9m1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVsgEuDqGyeGk7BOFi4un22Jvhx4ccDdH2sf7JvodleM3pjLgauFvrYWWmQklm/Ql
	 vOwQTm6VcIxqYA+R+uwsu3VKdOfpr3I65WUvdcvqHpOC2sy7McJVNEmDatsVSTXeiT
	 SZwxBrbzt3y/BbdSSSbWsu0gT7yPIfxlBhWI7Ti+alZU+PKKdpPDRYJBrKrEDYX7pG
	 /gtFZieo+uEX/I3o0Ianggap9LYITmm4BHRXIEbgWt4gMpm++gJ2WRLWVNkBBgtEA5
	 q5pLzR5IGg3gyhUspRpuXY+j3QVmj4ikluqXlXP95oOKjTFhNakT/6b84ByVzrnavV
	 jIFRp7xLl+5XA==
Date: Sat, 14 Jun 2025 12:03:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] regulator: spacemit: support SpacemiT P1 regulators
Message-ID: <5f5fa2ae-71fc-47ba-92df-55527a205852@sirena.org.uk>
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-4-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FPu5nkAwTEiJx2uI"
Content-Disposition: inline
In-Reply-To: <20250613210150.1468845-4-elder@riscstar.com>
X-Cookie: No shirt, no shoes, no service.


--FPu5nkAwTEiJx2uI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 13, 2025 at 04:01:46PM -0500, Alex Elder wrote:
> Add support for the regulators found in the SpacemiT P1 PMIC.  This
> PMIC provides six buck converters and 12 LDO regulators.

Reviewed-by: Mark Brown <broonie@kernel.org>

--FPu5nkAwTEiJx2uI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhNVvcACgkQJNaLcl1U
h9D9tAf/Q/qleDrKAxcEMJ4rfXBXkcMfaDK+fhlhkjlAxajFjSo701EEi9YR7oas
x9Js/LoTN5IvcDRfiEw9OYRVTTOlvT2EA0pg7i5LGc3CsWRNL0lJYaUu6Z7pXxDd
youdV7deDCb2ljz3D/tHtRNqGTqKvMQ7Nuu5s175LFoKcaRn/ATl34Py1Go7yxay
+CR+e3eXVeVePEuTJGk0kiTUiBJXUVpxKDucNrEK1QHSjO+aUvrQpbZPPm3NBb5M
huwMAGNqIYXljQ5T52V0NmWK9CatoW2JuO/F5kyK2n609qpN6Mauh/quV/l3uUNj
hd79yHgaelMLgAmraTLa3gGwUwQVdA==
=QoFc
-----END PGP SIGNATURE-----

--FPu5nkAwTEiJx2uI--
