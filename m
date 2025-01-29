Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229B419CC33
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 21:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738185585; cv=none; b=ZCKt5Cvbq9jrPCduJDx1CTlKY/fqvP4InEqA0UNEIdDxtgQwGmzvlLZ2HYwiNqwPG7/5rf2zh68c56r/fAgy3eZrKiQy4mroAtNZ2sIjgAbGyNrc5kBEPmxWEE0uUZBtchZTYBMTkDb8EYlp8vKJOTDgmVHax6krDo0gFd9SR7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738185585; c=relaxed/simple;
	bh=+Qsqfuy/ZFdMoLo0F/4FS8dsGspy1qqpACl6yHdM0II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYGzfZH+e8LfWrYfDI8HYd3QSL9itlYtBBgUB+zBv50QkjjTJudHAZo86u34uShARPms4/Om//EVp5PpRReBBCp4ACt2rlAzuyxCmtJcaCpNBrjtBnlEWcXIqYh6hmW7beIuA+/SmGCaGFhdF2tHUlsNPOBwT1TCmGzBHeaT3Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTzxoty0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTzxoty0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3592C4CED1;
	Wed, 29 Jan 2025 21:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738185584;
	bh=+Qsqfuy/ZFdMoLo0F/4FS8dsGspy1qqpACl6yHdM0II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HTzxoty0gaf1FXl9hq0JEUBI23Ch/5WJqiwOnXVnIU15VzQiEE7vSUiGaTY6GGe3T
	 IAwX5C0pi+I+S3sHICbuunhhcGByKJHS3/iVTd9w3d32nHu/2dxzkyixa/UKXbzyHC
	 wyGLHPDTCmlRapRRyWYGwhL2jVlfEvfLrfT/+osxWxIWIFOZnno6mpY6/wNC9iLBy7
	 R+BRrOqJ8xJ1ttX9V6Qj1yBAD/ZMJEYA4TVbjlg/Qj0FWGYVpFeTvUe6Z8b5gsxAHM
	 /D1gB4+zEHrqZ/b8TpmEaDCSmfoUVyTnqBhEOKaGaA1i640u0/IS/iT4bVDSEx7aCv
	 tJFCV7FdnSVRg==
Date: Wed, 29 Jan 2025 21:19:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <cbe0cd60-2057-461c-896b-b637a6b67f83@sirena.org.uk>
References: <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
 <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
 <Z5pESDSekep9ChAN@smile.fi.intel.com>
 <c2c2f613-3b65-4efe-99c2-135f043b2d3b@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WVo/KW6FvNqVLjBm"
Content-Disposition: inline
In-Reply-To: <c2c2f613-3b65-4efe-99c2-135f043b2d3b@samsung.com>
X-Cookie: The world is not octal despite DEC.


--WVo/KW6FvNqVLjBm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 06:50:57PM +0100, Marek Szyprowski wrote:

> Bingo! This patch (on top of current linux-next) fixed the probe issue.=
=20
> Feel free to add:

> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> (although I'm not sure if this is a fix for the generic case or just=20
> this driver)

It's a fix for a broader class of issue, if there's other issues or not
is a separate question.

--WVo/KW6FvNqVLjBm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeam2sACgkQJNaLcl1U
h9BnLAgAhVeRdUPXBY34USDBT60cPgFLNojWItmZ/USMDeDtAZoqExVebCcXfiUD
4iQH/9fkxSgoj27DHzu3ceDYr9r+6BCh3S3n1DJS02JryNnCgLVuxrfhmnMgc2pF
nfqaEsknyjARSkC2DTyl6UwHsTTChHRoaWVVi9pVdK1fGh3RFI01150P41vSSTre
qE/GBfBccrQ6Tl+S4XmfHU2WETBE+NCnlSUuByzuYB0CaDdh5YgzbQtcMJXBKphg
8wq/iSoMkV9vSZHvQt4M+VjyHpbiMrMHJuQ/GSeje0IWHiTHGcHMm1FVJEPLXuMr
PqhnO+gpMMe7/1SsoZgp5fj4TL5lPQ==
=4f3J
-----END PGP SIGNATURE-----

--WVo/KW6FvNqVLjBm--
