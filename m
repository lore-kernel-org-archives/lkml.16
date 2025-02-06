Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE01122DF88
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 12:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844856; cv=none; b=tQJRj1bClfK8KOuF+JGuuD0IqWC0rLRwxyZdwZIHrQozWks9i4q3arHkN+AJmR6ccWM+ZUDtzj5zbFuH6O3g8xgzc8mSFcmdw6syPV1Xcfngfn60vepxzOAzTA87uovHwVKROTuNlCkgXrxj5wH9ZheVZkJKhINLibDW0AcHxfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844856; c=relaxed/simple;
	bh=0q30mgreE1Zc/aNUbmixYwPLLp7F415VsnLdB+2c3R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDnu2r12kmSswt65QiypqBbLChRvj0CUygis3b7TZMrpUCpguv3Yxuo7Ve9M3SZLWY4SyrkQO4/kjluHPH2WEHusnvPPc4VeQqfadD2EsUc8RhwxvJcuj4iuMNpxTHhvqm1zKs157SMQJhzAcx92771/QT4iCjImNpDrlpDn9tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7G/dk3N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7G/dk3N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5F5C4CEDD;
	Thu,  6 Feb 2025 12:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738844855;
	bh=0q30mgreE1Zc/aNUbmixYwPLLp7F415VsnLdB+2c3R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q7G/dk3Nm/E3XY55oN3qI8G+2/Pg2yUrkW5qyZuypir2mg7g4stDOyz6ictzl8+h1
	 tNG+TFZ5Z4GufIQBe4QmkAj/OWpSTpMom3HXE9wlouMoZ8M9coQbMK9dMIRKEORgXd
	 A9weFevMkL3YyndNNxphnu2FkSia0uswAD0m3jfJ9KiHb5znstLHWsK48qDdl6ketW
	 XOEhIhUkc0Va1z0XWALPkYuta64AlBAPAf3ZHoIznJOULTof9kYdmsuyqs/ebu8qJ5
	 M3WiesRC/Rj5X+5NtJ3i2UNeA7KtS9sepOe2Rxhw7YmxT7KNoX/K2oWQ7eQHKFYyNN
	 MPf7kP9IM4udA==
Date: Thu, 6 Feb 2025 12:27:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: michael.hennerich@analog.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] regulator: ad5398: Correct SW_POWER_DOWN bit number
Message-ID: <ff59bb81-3bbb-4dc0-b39d-85a1d5dab4c4@sirena.org.uk>
References: <20250206122459.197985-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4rkD6ISi/p5SJbsm"
Content-Disposition: inline
In-Reply-To: <20250206122459.197985-1-isaac.scott@ideasonboard.com>
X-Cookie: With your bare hands?!?


--4rkD6ISi/p5SJbsm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 12:24:58PM +0000, Isaac Scott wrote:
> This patch corrects the bit number that represents the soft power down
> bit of the AD5398. This was overlooked during testing as in my use case,
> the regulator was enabled and disabled via multiple methods, such as
> using the power down pin on the chip itself through a different driver.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--4rkD6ISi/p5SJbsm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmekqrIACgkQJNaLcl1U
h9BQdwf/W/lV5EVZ6BeftOqQEB9BgLKNV56pOEdF18nzvqO9eDr6fUUmvYbHGrq2
0dQ+6CczEzKkVNA08T9U9W2E+wxZo892E25obxTujwZfy3MtRGiF/hG0lhwQgeJ1
MvY6SIlZ33jBPjHZvW47Ia3HxEcIyeIm7OyPs3Y7l5mag5JpMDKNvY3ou3hX6svs
ACkmskQpktX6Xli3aOGljBX+SUy6h6pQOu58+s5TN+w02nNwUBrK1Xe3gqJT2NLX
qcwLpA/Oqyod//9xEorbZCmOLW5vWt/Lq/boKVwxIkr2+5CGi+cD4WBGAgRw7JXI
docS39/iXB/2+6KWKS9+f7SWesogiw==
=1KpB
-----END PGP SIGNATURE-----

--4rkD6ISi/p5SJbsm--
