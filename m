Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AE72BE0F5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154090; cv=none; b=iKeWtHruOM8rvGJa0t9beusPudzhucwWdAxjTlrnzw1C6wIB0DQIcrT6T62xogaZkN+oDmWpdo3nOQK6sGE0ELXfI23yrEdQWD+IrCTe8cIATlj3axAwViERlSZzrz889LUSj210hcxmPHPfuaLz8KRDcH7z1pjjP1vsDodN584=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154090; c=relaxed/simple;
	bh=bBZBSFJF4WAGnbmxg/7z5+9uficJqF0PWrAmZr3Il8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8T0092FaPVuzLk4tyEIhxdfu6J0J3bWzsmU9bWrUPEcQ66J/ShCJi5Gn5LG/Kxf2AcoJVSByUCYQrCpPNR3zCxWcKDcH8Lehlbuspd2li2adz2+A5jBD1FZpdihEBV2tSA4hxT9DcS3bb9tHI1Zs5QPttGIftu7Ui8O4D9Waxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdzA5GFz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdzA5GFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3852DC4CEF3;
	Tue, 13 May 2025 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747154089;
	bh=bBZBSFJF4WAGnbmxg/7z5+9uficJqF0PWrAmZr3Il8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sdzA5GFzkz9Os/uBkgDPCYZlhJ5AW5cB8/1MHsFbe974X7XMD/B2CaPeyj89uWGf4
	 GGjNMldBwDEf3j+Dl6DKKiQLvK6qI1L/x8CJV58oT+S0+kOQb7QeJZCMQXYIFnxtxy
	 9K3ciRef51bexhu0PTnGp/HCCgJ8vjywdGX5fzUkU7OeYBPYASttml3zcaxf7ebw0O
	 P+gov+G2u7ezITWb2HTffpSexbcrgs61K4fY/r9l4HK9k1WWmdoW2jyt7LnulUVBnf
	 iIYnDKeVrpW8XtSfOWOWCP/8xfeN59B4vl1PvD3YQ9JOsePOckg71NGVfCu4saMqxn
	 gboRf/7u0CetQ==
Date: Tue, 13 May 2025 18:34:40 +0200
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13564923607@139.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	jesse-ji@ti.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4] ALSA: hda/tas2781: Fix the ld issue reported by
 kernel test robot
Message-ID: <aCN0oEM4t3fnGuId@finisterre.sirena.org.uk>
References: <20250513085947.1121-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q4eOyN+JEz99T971"
Content-Disposition: inline
In-Reply-To: <20250513085947.1121-1-shenghao-ding@ti.com>
X-Cookie: Well begun is half done.


--Q4eOyN+JEz99T971
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 13, 2025 at 04:59:47PM +0800, Shenghao Ding wrote:
> After commit 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c
> and leverage SND_SOC_TAS2781_FMWLIB")created a separated lib for i2c,
> However, tasdevice_remove() used for not only for I2C but for SPI being
> still in that lib caused ld issue.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Q4eOyN+JEz99T971
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgjdJ8ACgkQJNaLcl1U
h9CfMAf7Bchpz60sOG8Qi50ZcMrM303UhubrlAjelbu3JcylKmEEgqCZdMBgoPPk
4DLWbap/7j5RUNJ4P0VzizuYF1EijZdSQqZ0ONPzGwPwBXbKn3/LZNlOn0Rf9XfO
PomljcbQtnjMGILyW61jgCmmb39kt+1U5RV9lGvwynuLelU1TDwDd/xVsX++xdTB
cfLn+rv0J9H4LgIcJEt1ktG/gxEpydG8zL5042rVRfOvgS1GkFNhWfTt6sJf3Oak
wbx868wXuFZdhst55ZPaoCsjHC0H+VEMvelAb2hm3avj0Am5onvwTOJGZei1eoAO
O8hjoGywmO+kHbk1mmfcBV8XoBhIZw==
=z2MI
-----END PGP SIGNATURE-----

--Q4eOyN+JEz99T971--
