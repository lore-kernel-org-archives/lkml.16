Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D4722DF90
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 12:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844909; cv=none; b=ITZqDk6v/L5bAxKs6lSsAb14D0bEjz77Wcy/TWiTDiJtUbqEFTaZeTWoYlcdx5G8hM8l39OnKnacKHDpeQFNS8EqWepwWV0cKM96713OQfVVOhFGHu+YeAnHhbuNOSD8WGFN+/EhwFD9g7eCpZXVZ8uXuPPYp33zuJDtjwIwQZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844909; c=relaxed/simple;
	bh=otnpRN7Hj9LUG/dQ66fpepjdqNckX7GLFCg7ufcmYgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aik0S45etbkom0JE5fdPY2fu8lPGPhu6c59ZP+S2k3Cgc03Han+dtR7tozQZ5kMYByA5yOm4CWMtZtEFUbw8lOsiyMXFmsuPDUUBo9FxQlakStVTBlCK8SQy1lGtZeK5uWf577pwQAOqwnjBBUVBqVVR1SzbvkBrN4o6nKJv7qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3yNyPJ0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3yNyPJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A814BC4CEE2;
	Thu,  6 Feb 2025 12:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738844908;
	bh=otnpRN7Hj9LUG/dQ66fpepjdqNckX7GLFCg7ufcmYgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3yNyPJ0HpZYuF58gf2h0CG5e537tX8Z1elslgkkQRHHgxb5Zo68h4v3sfn2WOPUW
	 /yz7CDaAucGj5/ELqqzhuhzCUAonEPNm6AHyyeomhryeA2KiddMI51eM7HPRqMe3Za
	 QTDswf2BWixF6fs6DiKMqofhK+bJYKhtMHruWj5YIoFn4CgJ7J/ngPiOReZviqAaLv
	 Oyu2/mY87nfsL5IBgPh6CVhAmOgkiDigKaOkYlHQ54y8VwloNQCT4O9tponAnB2Joi
	 oVwhP5mbenOKC/ulhyAMkNf0kX97G9PkKmwr2n3tI4sLac0utKybnP2faCYIis88LB
	 B3MnodutSRRag==
Date: Thu, 6 Feb 2025 12:28:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: michael.hennerich@analog.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] regulator: ad5398: Correct the SW_POWER_DOWN bit
 number
Message-ID: <c29affda-e769-4658-bb74-3b8c273e8262@sirena.org.uk>
References: <20250206122459.197985-1-isaac.scott@ideasonboard.com>
 <20250206122459.197985-2-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SSH6uufySM7tVbb8"
Content-Disposition: inline
In-Reply-To: <20250206122459.197985-2-isaac.scott@ideasonboard.com>
X-Cookie: With your bare hands?!?


--SSH6uufySM7tVbb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2025 at 12:24:59PM +0000, Isaac Scott wrote:
> The datasheet for the AD5398 regulator indicates that the Soft power
> down bit is bit 15, not 16 as represented in the driver. Correct this to
> ensure the functionality is implemented correctly.

This doesn't apply against current code, please check and resend.

--SSH6uufySM7tVbb8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmekqugACgkQJNaLcl1U
h9CbTwf+LemUsstppcHf6XQ7elYkpxpKd8HORhkLNnBxblVboKZv8wF61gRp6YmO
A2Sf6wPEx3FuA+eNHiPOZyrjfEnQdND1/dd8bcJF+36p52QWtulIywztccBounS1
SDH+vndjSLmZevizNftlDimKDvxPvXfP8ovMd4HSZ4MJ8bLpusH6NG3PSFlt0qsa
zX4wIMGkn0B/wYCHqlFvu/R2cYtaiI6gQBSxYt97u8hHPjEAAZgfbHfEiKUqwLm0
pWslvWicejRxPqsNeeeKiNlb66zO+dzuhON6sIY3zySIK33bJf/WAKmygTD4ykcE
rNkeQH8mvFrn73cGcjQrL6JHT6G03A==
=si1R
-----END PGP SIGNATURE-----

--SSH6uufySM7tVbb8--
