Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8655C202C23;
	Mon,  3 Feb 2025 12:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585391; cv=none; b=rTOw0enui7ABtgMx+fy6BHi+BBIZjN8KPsnUvwLjEsu+8452IJMX8eRt75gByanUGzwMdSFtx0RMl2vRgntgD6rX+OUpBMZ0c8DG3D1M36AhDU0Ysu3X9mXCFdlLhFQj7jvT8YLrx25fBEO832T9ZAvHkEcfQQv9FnxUCiyGodQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585391; c=relaxed/simple;
	bh=SdWgouXp1Hm7BjTUAt8us/ROaVpElDZrJSNqtiKCMg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eilxqORcGlpGvn4NaHeIf1pN0OFGS0lDlK0Yom2k1W4tb+x+KBLhtme8IXSKzjfZWUeF5JNF3/fhKrYjs+CBJOniFs4L0eir/1//A5dNTVZMsKxVPAA2bKZI/hnl1TKJe2pq5HLGq+tcYwVvWQJ/JSmcR+g4nqiLA3BIbsIjzE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJPzM5r+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJPzM5r+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38663C4CED2;
	Mon,  3 Feb 2025 12:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738585390;
	bh=SdWgouXp1Hm7BjTUAt8us/ROaVpElDZrJSNqtiKCMg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJPzM5r+pG0qIBrW4/lXJ9Zt0mo+F8FS66DsCjOakw1SpInMZrrlA5VrYGz/5CqOS
	 cMoYYK+XuksHKeVLRKcwaEE+w451iFreN3TMVyYEha/8AASpyP2KW55xeJnxuMmP6Q
	 V+1I72BSJK1yMTJr3M0PNQumr+MUs85zrwgVoETEd1QTGGPtivQmz/ul3xZu2TQ1Ag
	 jF9YQbeslFbtYgERJv0hOXdJg6Jsm1W/3ejFsNm+QscWdMB93a6cDSXCUn9/Kn4Yas
	 qdGHjbrCO3qi3qvbygtLVkOBULUefNmV7qG/Si+u+VfzPU6ahM363Ndt/jHT0sCrWZ
	 KfbotykI2JXuA==
Date: Mon, 3 Feb 2025 12:23:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Fred Treven <ftreven@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 6/7] ASoC: cs40l26: Support I2S streaming to CS40L26
Message-ID: <a8a9fb40-ec8e-4e65-8de7-b9f3c708a45e@sirena.org.uk>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
 <20250131195639.1784933-7-ftreven@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iIBcTjb3QK1JqzJv"
Content-Disposition: inline
In-Reply-To: <20250131195639.1784933-7-ftreven@opensource.cirrus.com>
X-Cookie: May your camel be as swift as the wind.


--iIBcTjb3QK1JqzJv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 01:56:37PM -0600, Fred Treven wrote:
> Introduce codec support for Cirrus Logic Device CS40L26.
>=20
> The ASoC driver enables I2S streaming to the device.

You've not copied me on the rest of the series so I don't know what's
going on with dependencies.  When sending a patch series it is important
to ensure that all the various maintainers understand what the
relationship between the patches as the expecation is that there will be
interdependencies.  Either copy everyone on the whole series or at least
copy them on the cover letter and explain what's going on.  If there are
no strong interdependencies then it's generally simplest to just send
the patches separately to avoid any possible confusion.

--iIBcTjb3QK1JqzJv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmegtSQACgkQJNaLcl1U
h9BgMwf+M7gSoJ6aqmturL/HPVy14B5OOiu4Z/HBgK37zk4DNMd3VwBqs73Js8qg
x0a+aM7hc5eiVADy8PJtOg0DHN4KGqspvxGysly0b2UDSZIgqV3jwdUBnYMicdSh
pSOOkp7HAnBTyYCTgbtCWqzUR4ChiEwJY/6BAeybK87GfLPdpxTX34k7oG9EEm7G
5ByT9jH5aW2pDjxgDavQjohnRePUXrVWtALPgtaOSJ93TTqTXm+0iqwiC6nu1bng
00YGlfilRza9q/knRZvqj3ujy+bB7O+EJWLn6TXLD41c8UD/0YqMF6pgHAJVq/Rl
IfFnDmNVFmClf1W6VKV2FvIspzGiiA==
=awPO
-----END PGP SIGNATURE-----

--iIBcTjb3QK1JqzJv--
