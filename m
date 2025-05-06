Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B9427FD52;
	Tue,  6 May 2025 16:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548608; cv=none; b=SevpL6veS+FPS41xS01bBJMXVcDqQrZu5d7eVDsDLWKA8WWKD7xYqMyng9qszsQEtgFRQf4cAk5MX+b0GZBGFD0eLhOITq5IsMaHsdV19x0swpqSvwQhNXBxlkD6wSkntQqYg9ZZjoldESeHLiHfRbqaICCT3a/P1iJfWgCjPBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548608; c=relaxed/simple;
	bh=dq9ErICKWqQf/JE8a2nlljpBO2Y+xrl7KL21aVj/qC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nj70dJGA30eZWugm4Saisy/OGUUh+/LXsPlHWG+Ofi1aipq8hqSAisqEzgq0+ejVr5J/6mnJEeYVnm2LK226TAbjh8pi0htnmPPTMn8cKUiph2Vn9h+9D9AVKLEMWBrlvKt1Z6JjX+UybbyUyYFjDB5gdn6+k+GwVn1KgHkMEPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUREuewa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUREuewa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884F4C4CEE4;
	Tue,  6 May 2025 16:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548606;
	bh=dq9ErICKWqQf/JE8a2nlljpBO2Y+xrl7KL21aVj/qC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUREuewadKW9lDi6wOx2CWKLa3EhWk2XQynw6eI2YnuLDJ9UkxSVBqm+VqGd2Y/TN
	 Ohu9WOnn9sw+i1AXY5VTb47VqQO9OEh3oftDfCwuHce117K563LMCwnwWKman3cXNv
	 it92xpu6KyeoVHk9jwomQjbh+edCHMbsJMXGaFKzVW9CWQ/sRXaJJV/DBnLgpjxWDS
	 Uo8kKKXsrfSYtr6bOuAVsdLXk2LxXjqEcKIMmMvcb59DmAcIlUC5za0NCQw7SVnw/C
	 lT9gWGCrzFA9nZrio0GWZs3iJhLDJaCMMKcHmRIW4Q1I8AVLuA8qxvDuOAcXHledF4
	 m0tmJxWbMxCzA==
Date: Tue, 6 May 2025 17:23:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
Subject: Re: [PATCH v2 6/9] dt-bindings: cache: ax45mp-cache: allow variable
 cache-sets for Andes L2 cache
Message-ID: <20250506-clammy-punctuate-6cb07dd0e81e@spud>
References: <20250503151829.605006-1-ben717@andestech.com>
 <20250503151829.605006-7-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5IEHagUulufTAK40"
Content-Disposition: inline
In-Reply-To: <20250503151829.605006-7-ben717@andestech.com>


--5IEHagUulufTAK40
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 11:18:26PM +0800, Ben Zong-You Xie wrote:
> The current device tree binding for the Andes AX45MP L2 cache enforces
> a fixed number of cache-sets (1024). However, there are 2048 cache-sets in
> the QiLai SoC. This change allows both 1024 and 2048 as valid values for
> "cache-sets".
>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thanks.

--5IEHagUulufTAK40
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo3eQAKCRB4tDGHoIJi
0vNRAP9KmSdGwei5bWarXurTygTvCcNE5W3uyNAoqvI15vlJ8QD/TDxmc+ZcEQnG
Vecgy8nqGVt4RibG2dtkq2a4zI07pQg=
=FvUY
-----END PGP SIGNATURE-----

--5IEHagUulufTAK40--
