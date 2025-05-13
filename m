Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC812BF991
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154150; cv=none; b=FKCPujLKFNukt43DAyAnvRtkCBv3UUNeZNOlor09MsL0W+N7Gcx632YGw6GJMWn5fq0p1ep6SC4bB5jm2FtqDn2a+/1ShTAWIx7S37SCk1JlzmfgD+vOg99AZb6Kxnt1YEiQ/z50ivFmza0uUbWMqahkAxyRigON+UBUvRKuvFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154150; c=relaxed/simple;
	bh=EQnX7N7VffNVrUEjAuBT7cDtlGHqEXDs7ycwfatEYsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g30qFcnD6cIv30kmaD2iQnk9Pl6bw8z+ohKPF4rMtvOao21U6mZNvnw5qSAvKOq8O9jVVNnvdtX45A9LyrasX9lHqCTWhoitT5J5TPUixMkPMLlSOwSxIk4saZ4gCRrawtjVFyGsZbz/Dhot9WYA8ViLZO1E1JD/kyw/rxYKZXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5QW4Iwe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5QW4Iwe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493A4C4CEE4;
	Tue, 13 May 2025 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747154149;
	bh=EQnX7N7VffNVrUEjAuBT7cDtlGHqEXDs7ycwfatEYsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5QW4IweRoXU3By//jssPj1I9br8RsDVzjl1KAPydZEkcWuTmqUbwqzloRY9mT2Tt
	 3AiYP824KQp/NsB67+cmmifNMNh6gauByfAnzeIwyoyQuIITpTwK+XhJOH2ENFpj7i
	 FZBWpRxYH68rfnurhgY/uUHkzvlIlepSIPMQXr8dK+VyhM7BG3ok49gFJRsiU0+gRp
	 nLmwi2SOcZSuWjkOI8z6ZBA6AdVu+6C+omgqIpzp5D/HdvuOX6GF1j/af4dhq5paZf
	 x18INHXg6eVfmH6Sk97bVsl+IuzurD90G5EVGYRuPx9H3Fg3acHt9BWjqGi56b/pWb
	 JaPq0CepZgrKg==
Date: Tue, 13 May 2025 18:35:46 +0200
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13564923607@139.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	jesse-ji@ti.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4] ALSA: hda/tas2781: Fix the ld issue reported by
 kernel test robot
Message-ID: <aCN04pvw7-lzKosb@finisterre.sirena.org.uk>
References: <20250513085947.1121-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YDPNt9eOVWN6WI6E"
Content-Disposition: inline
In-Reply-To: <20250513085947.1121-1-shenghao-ding@ti.com>
X-Cookie: Well begun is half done.


--YDPNt9eOVWN6WI6E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 13, 2025 at 04:59:47PM +0800, Shenghao Ding wrote:
> After commit 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c
> and leverage SND_SOC_TAS2781_FMWLIB")created a separated lib for i2c,
> However, tasdevice_remove() used for not only for I2C but for SPI being
> still in that lib caused ld issue.

Acked-by: Mark Brown <broonie@kernel.org>

Even though this is an ASoC patch the fixed commit is in Takashi's
tree so it needs to go via there.

--YDPNt9eOVWN6WI6E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgjdN8ACgkQJNaLcl1U
h9Aqcgf9GjMJs7qvO6//reow/cMgcAv28XBCykx6EvIeTGKl0rSf5aJdwO23jrMP
oBhg/VYwqSBTESrjhpIPhrewKpnbs5fr7peuAxz1TNYvwNeiI7BMgyEOopZcZvDV
62q8smhvPWzLe8p71eTOHD3XxOekmnqgxPjfEHRaJp0DcncekWSyy73Cp+z81KFz
RqTzDA06KFuflu5e/Ao+QieWdkyWlHjZqVqrYvkxiRMsJtZy2UNZaJ0jM94r0mWC
eN2c3lRgoRuroSUXDXI7zks6WA6YFGGe9ihzpZUX04DPlqmmM7OxrA5CcsCJu7fx
LZVekGXVzTc9goOsdVZ7LAd+U9CJEQ==
=hMy0
-----END PGP SIGNATURE-----

--YDPNt9eOVWN6WI6E--
