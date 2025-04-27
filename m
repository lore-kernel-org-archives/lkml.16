Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BC61A26B;
	Sun, 27 Apr 2025 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745764476; cv=none; b=Y8WJPilrvck5bdoQho2gQBpZ5ITyE47lGJQu959wSqetKxGXH70NsAIDbF221t00YNchwyW8Q4FvvkXrl+SOC4JEsI9wIYMGdLn6W1x3uVVwnXCgGvjl0ZyjjAFliLNRArBW2d6bI/0MtJF7uKiLu7Kyc0Kf9Y2x6M4bj5mY91o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745764476; c=relaxed/simple;
	bh=NbPi7v2fcHtvZgqUTQ1dl6O9dGxetp7gtyiRFqKI/+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNjPYtZz/Alp5DgdTJRqVOof00nB53nS5msbQkb3RJsTkPYFMhHa4gl+XJQtUuqRaMZeXxQ/1X1k2ULpK5U/EH/XPZ+W+pQ9H4uLbI9ZtlbHF+CQQxSCn63VkBaZYlGXMMBdn459bPafqyyMNm5jxTpzXR43+svbTHDgYMySDDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FA+sNILf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FA+sNILf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107B6C4CEE3;
	Sun, 27 Apr 2025 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745764475;
	bh=NbPi7v2fcHtvZgqUTQ1dl6O9dGxetp7gtyiRFqKI/+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FA+sNILf5rtEzqRuG/+03Ybs5wwmNo/p2rUOWp21NuC5yUzQ4XTTbqqspTvbM90m/
	 h8Mvyma0PJGGoTk4TgRE08gjOIlt8Fwz72O5Z/kF92Hq6oKbBAznRL+aKQQdrcG1QA
	 AEQ+znnHKk69xJGaWiFxHtRlZtrVhwkQgM9CaXsBlXmxFGPmH27QlMCToSAwuTo9X2
	 lfSdZPC0jOyzk85ECGMKdlTx1YcoJX3mUHTu2F7r+rBLcxWNbkgZrvUiIS2rQ6Iqq4
	 jk3T9NVhCP4SH1EfMludDAoNcBlbFNmPSq6V6TxMuYxpIIQL5JWCstbLLLJrKdUTXg
	 nuONruk+y+QJA==
Date: Sun, 27 Apr 2025 15:34:31 +0100
From: Mark Brown <broonie@kernel.org>
To: linux@treblig.org
Cc: lgirdwood@gmail.com, linux-doc@vger.kernel.org, corbet@lwn.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Regulator deadcode cleanups
Message-ID: <aA5Ad6bXfH5jPiss@finisterre.sirena.org.uk>
References: <20250426175143.128086-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hLGYvnp8vxUYw5Od"
Content-Disposition: inline
In-Reply-To: <20250426175143.128086-1-linux@treblig.org>
X-Cookie: Well begun is half done.


--hLGYvnp8vxUYw5Od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 26, 2025 at 06:51:38PM +0100, linux@treblig.org wrote:

>   This is a bunch of deadcode cleanups for functions
> that are unused (for quite some time).
>   The first patch was originally sent in October last
> year but didn't get any traction; the rest are new.

Please do some analysis as to why the functions are there, don't just
blindly delete things.

--hLGYvnp8vxUYw5Od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgOQHQACgkQJNaLcl1U
h9BrbAf8CNJD2aWkJQCkVrQY74vLkoJAIC7IqC9BYZ6yTeJXXsuGPY4WydwrRfU2
+rw1i80YRhYx3HbVW4hwpYVPde/IItrbxT0E5kyBQOA/U68RyXfLm/oSNL3mHM/e
kaZHC4uXU1uwrauQVw9aivgrTcydPGEaAuMZhEKGLOfG4Kg1ACnRsnPx4l3ui1GH
fSnhdhyFNDHQWRxnXPjBmaXrw6K7DcDjNL7wx3GY9G9JlItKfL5lRey8c6QdQava
nVNVWZcJIsPa9ZbZcF9Ppf/VjK80r7e8LuAF+Dw473xtvaVx0l+nI4nSTYTK8cZF
iG0ArlAXdZTVkmgA91mgBrPwbcqQKA==
=P8oF
-----END PGP SIGNATURE-----

--hLGYvnp8vxUYw5Od--
