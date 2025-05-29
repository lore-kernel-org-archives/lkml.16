Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C267228E61C;
	Thu, 29 May 2025 11:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517533; cv=none; b=cqQHEATLAMqqT65/cvUx4M7u84ZurAb9AONHQ6upM2z9moq9+4OBlFRdI/uhc09+Ft7KHpwnekmqRP+IHKgirL4x2urJlyYpkwpoYF39nZX40iqzVMGGKAm0vLfDUgoVy2NNlbzODRSf8xWgSqSVSRlP6rFO6rCnzUzW6B167fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517533; c=relaxed/simple;
	bh=uNcc0yt8CwgDtsvblWz8zZesWtOUyf8d83z/m5piwIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCvedMdbMxAgxQVXCHeLDxvH9aqjgkRecRJ64ByevCCb+OZWbxm2H1XqXYgMP/Raif54gquLuYVy1bUiL6zEjOcnqbGRX/rO5X3MVsVfoQFp9Xc9+zYonKumZkPFxAUIIRsDuhvnzN30ytMR/uXJskiKbfI2IVpCPtyYiXxhQ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VnNbBrrn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnNbBrrn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDFEC4CEEF;
	Thu, 29 May 2025 11:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748517533;
	bh=uNcc0yt8CwgDtsvblWz8zZesWtOUyf8d83z/m5piwIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VnNbBrrnBl2OFtnMkMSvwPLpGThyHxjRgyDKS8Pc+SFVOp2mHIbko393AG1+NqrBM
	 0RnVn7/C24UP6uxSdsdWYxvJAVAtj6taNIWRIyZaDdZQgkWaz+nhk+7nOCL5DmlbJn
	 +E1R6olj9wTUVGg127w5iaRzL9GeSPed/hFRQcdiRkk21JhUP6Ch5B9uSbk2RwPcv3
	 CNZzWHZ8gYxAX0H3HkKwmynbrbXm3XgA1xZyZBnQwoLvKFB5d3y6ZIa+BonxJ8qNN3
	 tDWlyGezDw/hxX5e4GtwXmv+PFnoren4R4EJ26zDY57CgPvUmXohm9YGbQM1xRrZLP
	 31o1uLNBzGt5A==
Date: Thu, 29 May 2025 12:18:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Gabriel Santese <santesegabriel@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	mario.limonciello@amd.com, venkataprasad.potturu@amd.com,
	talhah.peerbhai@gmail.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: Add quirk for MSI Bravo 17 D7VF internal mic
Message-ID: <2bca9eea-d75e-4e2b-a32c-25b2e7fcaa2e@sirena.org.uk>
References: <20250528235331.67800-1-santesegabriel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HYVnUAYfwwdkD014"
Content-Disposition: inline
In-Reply-To: <20250528235331.67800-1-santesegabriel@gmail.com>
X-Cookie: Must be under 48 inches in height.


--HYVnUAYfwwdkD014
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 29, 2025 at 01:53:31AM +0200, Gabriel Santese wrote:
> MSI Bravo 17 (D7VF), like other laptops from the family,
> has broken ACPI tables and needs a quirk for internal mic
> to work properly.
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--HYVnUAYfwwdkD014
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg4QpYACgkQJNaLcl1U
h9DDzgf/f9QRjZ7hCdprRU+cH4TozWfl9A4RYx8W3tJMY/3tFlqizBgZ980VkFGP
m8KAft3FV0sNgisfNRBUbZkDz+ogKoNOYSaVWmiV/uLBmiYCCvp51Pm5D9jgOI4n
hc0Rpb7ElrxFyjrlCtGEjn4bVE005zFSHbKSW1iBBiGq9Ckv8wE17OUpuIXBGl8d
vStJ78OuhyeqGa1cRkooFtnaqS3zJ+JPn5Zr+wU7eW76o1ClrAOpTG+dJIRtsFJD
DYJyDFnaIJX2y3YBawPimfw4o3oeWqoR/LD4SzXWQY7jxbAWQ/ISP21ek04Nm3Yr
sNcyWQ//VFVQ5cARRuzO1YYs/H8KQw==
=75Gl
-----END PGP SIGNATURE-----

--HYVnUAYfwwdkD014--
