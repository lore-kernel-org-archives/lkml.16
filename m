Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F7C1A23AD
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750632605; cv=none; b=Ud5urrwZnuLpkgNyDciKjTyY3k/14zo619Jih3DwSLdLNuZM5o+J/GvUUoaIMSu94qLh1SJrP6FDeKMKNCAaKNdhobSTdXQKR/m0yu/SoV8yFYCcj2bB9mUxc/wcWzhJJb6Jj+jy0kq3y4gZdvuPjg41JCdHiEQb/vzS/EPcCSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750632605; c=relaxed/simple;
	bh=cvu6N19m8uS8iIw0DRHDACPtPlwOiPbUKoUbm0G3FgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lK33NHCVwBl9bY/a5VihTuI/7HlnSh3uv3CEMagA79rBQAnvkVZ+bz/34ydha0AjfY+z6PVMPh1MeO83DvsOpra22F4GDvB5Yd/TehB3DmbnVXuX72w3ydK45aINS0c4EIkv/hiKqqVrhE6aAj6dXRHDeedia2Xd3KIUI9cT0zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9QTKvS6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9QTKvS6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD594C4CEE3;
	Sun, 22 Jun 2025 22:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750632604;
	bh=cvu6N19m8uS8iIw0DRHDACPtPlwOiPbUKoUbm0G3FgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y9QTKvS6IGmHSQCltwqRcKsogSJER1B15sBFiNo1UJZec7SLvxF0IBkMglu4BNYcr
	 IcZ5VknT1nattXxHSK+zpVxfoeEm9PeMwCB3bqH6hjpT1KzJngkUbsr+SlawhXqueo
	 30nh9v+AjsSyItjXEebqk+KVcIn2hRka2KXumU6W5ihRFlTF+un/kaXS5INVMqAU8y
	 TWDKly9asTC+u0c+44KdgisljD2OpcpGoZVV2uZKQJx5QoQOe+1q5PwOGv6g9qaV2/
	 TNEjp2TmSz2/z62FaKgYqIlpf3nPxTO2sTzqE1037a1ZSrRIKLfkYlXwQhOcHgK5Xe
	 Gv9t8z5lHmecA==
Date: Sun, 22 Jun 2025 23:49:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Yuzuru10 <yuzuru_10@proton.me>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: add quirk for Acer Nitro ANV15-41
 internal mic
Message-ID: <4721358b-d2bf-4846-b338-9e2d25ed25e2@sirena.org.uk>
References: <20250621180223.14677-1-yuzuru_10@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6UAVJj4U4opW4FS2"
Content-Disposition: inline
In-Reply-To: <20250621180223.14677-1-yuzuru_10@proton.me>
X-Cookie: Yow!  Am I having fun yet?


--6UAVJj4U4opW4FS2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 21, 2025 at 06:02:28PM +0000, Yuzuru10 wrote:
> This patch adds DMI-based quirk for the Acer Nitro ANV15-41,
> allowing the internal microphone to be detected correctly on
> machines with "RB" as board vendor.
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--6UAVJj4U4opW4FS2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhYiJUACgkQJNaLcl1U
h9CS5Qf+LtqvH/9/ZnksoVBl4LYBscyDElTVfJgVSNJII/h1VJBwPHkfL9stm10t
LW/sxQD+/KbxZTlkAjrwbwX5m6563ki0iSPbumaaHs8WoC57ZExNIH1/mAqVwZEF
zuhZZroN2HjT3FUFHa38BKE8VrodiwRCSTgPKmEYFEUrf4PRRcUsxOGLeBO4QdwF
UY38kcnfS4VyX43T90jV1EuQ+dLoaQ1M2+EivIuvbIrEWI7xitCPMMaVgezueiGE
/dtnXW2mLITGo8ohUDv/Xwnf9pp3fsRTa6u4NTmr6D1FH+1w+v4C2f1cU1ETG0cP
AhlfH/3nYYaIz7dS5MbP7TI6qEEx4Q==
=eGN/
-----END PGP SIGNATURE-----

--6UAVJj4U4opW4FS2--
