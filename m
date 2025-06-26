Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F52025BF1F;
	Thu, 26 Jun 2025 08:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926028; cv=none; b=ilRLLQTyqGfnWIC9V0bro5UgPBEgWQcWE7xMGWAwFEyJz8u1fBwjetWDQwjiobq+29xsQdSvVoUMOxr6DNMW54JtdpKTcvIA11tEKLhhyi0tH7dkgZlh2krmwzLtE6Crj0eR80yZ9j+2iAmbdTkFtSdAV4CA/VPopJZ0Df70EA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926028; c=relaxed/simple;
	bh=ALIZ1pJr5k/RzBFhUWBQWpSyvKsVrE4l4KazGh9wArI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEiKSHhxZo/Vr0hYmAPw+IsJOwrA6INMsVN7fQ1TuYPDw3sEx94U1/YQUv9NhbO4E/Lph70FZnM7xjwGqvdl1hVAkokAMbSHSMbkotdwkAE1pBjL4EMkv41EMoapWTCwmI3oNRPvXOUQzaoW5gtu7BfdrBOhMG+AKiU8HmqQM1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMkCf+DE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMkCf+DE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C508CC4CEEB;
	Thu, 26 Jun 2025 08:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750926027;
	bh=ALIZ1pJr5k/RzBFhUWBQWpSyvKsVrE4l4KazGh9wArI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMkCf+DE09SfeoFseP/++MSgoDjHAMDKK8294mJN5gBkMc7yGuBlkU0Le+E8NyAFP
	 i7JpadX729QXtkPS7klBphIorXF38qjX2RDQD6wq6k3uV+dsiQoATQgk7NmWm5M6Ks
	 aQpHIOXx5ggqME5vJFZv8P3jAzBw/aLs/rJcyTgmUk2i1SD/cssA3BqWraxniNzqsx
	 Yd65FZ5AkH+ea3kngqDuluC5H6aLfLCtGLMwqopj3dZ2fPs4hEUI5K22sFJ9REAmX/
	 eKjZpJXOf46uRMzH4Q4Enl3ftzCe28PrTKZia3abFUvvqVEZRMVjcVw5dYLJbOSmCg
	 MNnMMgwXmpILQ==
Date: Thu, 26 Jun 2025 09:20:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	DOC ML <linux-doc@vger.kernel.org>,
	KERNEL ML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: standardize git.kernel.org URLs
Message-ID: <20250626-badland-carefully-f0b5f285c93f@spud>
References: <20250625142017.237949-1-xose.vazquez@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vekMi3Ef6bOeFUHu"
Content-Disposition: inline
In-Reply-To: <20250625142017.237949-1-xose.vazquez@gmail.com>


--vekMi3Ef6bOeFUHu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 04:20:16PM +0200, Xose Vazquez Perez wrote:
> replace https: with git:, delete trailing /, and identify repos as "git"
>=20
> Cc: Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: DOC ML <linux-doc@vger.kernel.org> (open list:DOCUMENTATION)
> Cc: KERNEL ML <linux-kernel@vger.kernel.org> (open list)
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>

>  MICROCHIP SOC DRIVERS
>  M:	Conor Dooley <conor@kernel.org>
>  S:	Supported
> -T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
>  F:	Documentation/devicetree/bindings/soc/microchip/
>  F:	drivers/soc/microchip/

> @@ -21360,7 +21360,7 @@ M:	Conor Dooley <conor@kernel.org>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  Q:	https://patchwork.kernel.org/project/linux-riscv/list/
> -T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
>  F:	arch/riscv/boot/dts/canaan/
>  F:	arch/riscv/boot/dts/microchip/
>  F:	arch/riscv/boot/dts/sifive/

>  STANDALONE CACHE CONTROLLER DRIVERS
>  M:	Conor Dooley <conor@kernel.org>
>  S:	Maintained
> -T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
>  F:	Documentation/devicetree/bindings/cache/
>  F:	drivers/cache
> =20
>  STARFIVE SOC DRIVERS
>  M:	Conor Dooley <conor@kernel.org>
>  S:	Maintained
> -T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
>  F:	Documentation/devicetree/bindings/soc/starfive/

No rationale provided, NAK.
On the other hand, https links are clickable on docs.kernel.org's copy
of the maintainers file.
I'd appreciate being CCed if/when you touch my entries here again.

Cheers,
Conor.

--vekMi3Ef6bOeFUHu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaF0CqwAKCRB4tDGHoIJi
0jlsAQCHlSlyfw6RZS0OuHi/PIEJAPewe1LMKCoYjRuiBHa13QEAn//Yqcqm1jUz
aCcQlQTSwTkcCdUD9WLIJnuw6fYRkA4=
=Id93
-----END PGP SIGNATURE-----

--vekMi3Ef6bOeFUHu--
