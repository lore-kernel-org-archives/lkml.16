Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6881E14B959;
	Mon,  9 Jun 2025 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482570; cv=none; b=Tnp7fn1mb8x+ojAwBLzQW+3nZplwh9VYTKEV9WQq9WGTClPFvDs6wrUFqIDH0NpNQb83L7Rj55FLKoyYF3UU3gi+ywv5n9f1bI/S+9a+PO6IRM1ChIj7najr3pBg9OrROOP4UedtIZ+FTNUEFAdqvUQJFWHn4vjE61TxgHpxoWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482570; c=relaxed/simple;
	bh=jh7x6p3DYphNzVfNtqxjHPYF2H1kiP2lApiVSn+gMac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRpW/yVrKhm6BWdZzPqrgIrHvVZlXhOaTloOqjys4fPBLdZCMmK1Wzim/xFrGUP2LT35V1smOmanvQTA1jgdhfjSu4cIDWvxDWnBG4SNm7+O33f0hmJVAit0xXct4H5iIkgXtIDRw+TwsEGSO51nkDvmR6zhHN8H2KHlKnelWtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqUFnGVn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqUFnGVn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393F1C4CEEB;
	Mon,  9 Jun 2025 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749482570;
	bh=jh7x6p3DYphNzVfNtqxjHPYF2H1kiP2lApiVSn+gMac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqUFnGVnTa3iQNOf9B/uNDLHqCUJNMVrD46R3jsu7o6fFxuTu537ysgu08geIxnHK
	 M40StvD0zwqT1mGzxRLSXZVKMEwCvOCou6SdyG50o8Kvi7yUKirR99ihuQVPY3eDAo
	 auesRo9mNrV9I7QZn3hf34tB05r2FMBM86yBQUbwZV4aIMQjrTThHpjSU6Dn3uMxXF
	 sdKGifRs6Qitf9OnzKYxWOHUtZOzLlc7z6o8h7Lk1b/GV36uAYQydkBcsY87jzkRQx
	 ZV4P3bVus6S3Mm5ROPn/5/F+EGz9pjUDaOvrXwWjzWqxCau5G2PX74UyLTn5eDi7tm
	 OjcYxb1GrptwQ==
Date: Mon, 9 Jun 2025 16:22:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: cs42l43: Remove unnecessary work functions
Message-ID: <93e7841e-3c21-4e2a-bdb7-44d8ea5a5493@sirena.org.uk>
References: <20250609143041.495049-1-ckeepax@opensource.cirrus.com>
 <20250609143041.495049-4-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+NiZRx2BqVwnE3JT"
Content-Disposition: inline
In-Reply-To: <20250609143041.495049-4-ckeepax@opensource.cirrus.com>
X-Cookie: Restaurant package, not for resale.


--+NiZRx2BqVwnE3JT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 09, 2025 at 03:30:41PM +0100, Charles Keepax wrote:
> Now the SoundWire IRQ lock has been changed in the core, it is no longer
> necessary to use a bunch of work functions to dodge mutex inversions.

Acked-by: Mark Brown <broonie@kernel.org>

--+NiZRx2BqVwnE3JT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhG/EQACgkQJNaLcl1U
h9DDEQf/f/ASyYYEUwhRFVZQB2V5FgiDwiYJ/DYJx/6D+I4XBW6CA5CflvN7bCoo
4lgbigWx7fFcs4Re8hVzrfZ9YBM5duRWXsJS1Ejjx0DJ7yOgwOwkNjRvmeuajqdR
CjoHJ0f7LR9UuuQ9m4UoDWpNI7npT39S0iVsYeXMIIK9u2DAR6igLMRn6115lGv3
rCm+riZJkSzKKcyy232PZupYke4on+l7zxa6V7nzySUSxY54omC0ah0Y8NM0BJT3
y9SPV/H/T3N8qORnsF0F/uQtXb9Oqy3hYpME3aTw6+yX7jOMHUUNYoQXzvSGsHpi
GO6no7OVJX10blknvv6w0jKmFQD63w==
=mOSb
-----END PGP SIGNATURE-----

--+NiZRx2BqVwnE3JT--
