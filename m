Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B1187858;
	Wed, 11 Jun 2025 11:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642361; cv=none; b=DonAe0odcE4V3jPgUX2v4cbz3I3w3C+dDdVqegFsM2FPWbyGMmoK4ZkGo6XEbocK4ltz1EQMID2r2Bnkjo1EPd/RFZnZzXMf65YIwvOWG5D+kUiQT6hs98M/q3M9CEvooYJSQ716vaaw3VzwQbXN7I9T0OCsyaVcIbopbs0qcg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642361; c=relaxed/simple;
	bh=yfoFFUPD76jO2mIqlfhWfyL0YTbTDFdkOtfTP4u7ehc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFgbVm64nYWakcAgh6oc2JA7YitbSqTHBBQHZR8859qEiy5T9GOrfCuFu4icXtcbkmhNicRp3Exmz/8jPA9AYNQDqj+ab/tws/sXR5UfgQe62BmSkHFedu9DjVXp/k/cY/7P3dy6KrhWD3GK07sBkNr4ysES1hl5XSwI7xSRiiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWDk/iSB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWDk/iSB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85076C4CEEE;
	Wed, 11 Jun 2025 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749642361;
	bh=yfoFFUPD76jO2mIqlfhWfyL0YTbTDFdkOtfTP4u7ehc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWDk/iSBgx58xukMpduc0JP0LDeiOXrIlwWACHX3KwW/fsFoIa7//sB/RD3tbDFxG
	 5D6VhdG6p2R5W9cEnl6hcMmgb0dlCJ/kQZFVLqMNTQm5Wj7Y7DHfIuXlIah/wm8j21
	 itsU0bR9tgtIHo7WK5sneuerZarIlONoe3iJgdMiplPvjtQWBVZhlY9EGohZA7C3pq
	 s3l395vlZFckFzcRjAK01kBkFs8rrGwKilOYSkGiux91cHBl8NyOLdDKfBxHPH+BuH
	 XFjwd0KqO1NhJ9crlBcgNttQWvt25QNZnPvslZb1TekEI/nyR/jWVaJpYGYC+mMiD/
	 v5sXaQCvQPYlQ==
Date: Wed, 11 Jun 2025 12:45:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 4/9] kselftest/arm64/mte: register mte signal handler
 with SA_EXPOSE_TAGBITS
Message-ID: <6fb3a9f2-23ba-41f2-83dd-3c6cf3db1d4d@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-5-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0SZYrttKAASFEr/1"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-5-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--0SZYrttKAASFEr/1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:41:02AM +0100, Yeoreum Yun wrote:
> To test address tag[63:60] and memory tag[59:56] is preserved
> when memory tag fault happen, Let mte_register_signal() to register
> signal handler with SA_EXPOSE_TAGBITS.

Reviewed-by: Mark Brown <broonie@kernel.org>

--0SZYrttKAASFEr/1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJbHMACgkQJNaLcl1U
h9BZFgf9Gz+zAyeJ/at/lIKaVjYaKkMIQa7idQxUCTDHdHScft4bmLoz85osmCTj
vnIBDhUv2yhtweZio481iiQoejuVnEvNiD9luZNBzeDo0NpMtd3zSDrGDHFb0rTi
xHrFZsbVpeuUaf5I1QkPQk0kP+wOa8UNLwO05wxu4ZiNBlUcVS0kP+D3DRa+viWd
moqnlUrUPRgRIg4ZFE+vSEJ3D+IdM/Ku2Gz6A9FITZDtq3Iz8LMLK1FqN3wwsz7G
37fzSlPw/i/j8ArcfmnDqXu31UpsXevEybQHvaE3ZhNsStB/kVe0nrFNJC3xiF8p
HbL/4jW9KJF57647vuvE4eNSzLWNCg==
=V7iI
-----END PGP SIGNATURE-----

--0SZYrttKAASFEr/1--
