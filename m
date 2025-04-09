Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00843228CA5;
	Wed,  9 Apr 2025 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201922; cv=none; b=Zwk83gak7OZlCTYHZlIeo22D1ikVTKK84GKjjO0t2ZNqaVoWcSLzwE8RAcFUJBkyCkD8sSQUbC5bq6/B2fNbpUuxROZ55APbwvGyP3vuE5qynlB3jONgfuajw7R2fa0DnowsQIY7HNNOvqvCxZIvlav55iqthYmw2OfnHq4XGr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201922; c=relaxed/simple;
	bh=wYH+dIKRtV0QuXAJy9OkkdSU7lLwpR/VNhtvrIQHmo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWywmDteQze+uxeWnFo7pjER3MdTr7O4BU61AbqqI7deUPtHytGbL1k9rwpSkyK/02u/CZZE8vD1cqihCoylaF3OS9ZZ3jEWBWUPNvY9UBg06mQH4GZdDj8y5VuvDC4Qb/jo2r2si3ehUXPMsh6WZ4ON6PGTVTgcxrqC4UV30F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFvA3QM1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFvA3QM1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D19C4CEE3;
	Wed,  9 Apr 2025 12:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201921;
	bh=wYH+dIKRtV0QuXAJy9OkkdSU7lLwpR/VNhtvrIQHmo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFvA3QM1eAHWcOJu1GwHdgqivwNs42wZG5sUraVPXTek6Umc1JfViiuo3UyHozwtY
	 Q/OO7z5sV/7w5EsW2TftMX4ihgnw8C408ch93YSbd32BJC8zXUhi8XGmpj6ltytwRp
	 1Sk/jkRSSuQA0uMX+DBZy01mtiOzCiBd693A5e/vvxvoHkyZAoi5wpJ5P6nJiK+Xsz
	 SUOT9ULZAkbB/2Haw117kCD5Gk425m6TqweZU4VGu7d31XRek1nfqbG9qP7xqOhkX4
	 AWThVEcJu/zyFFr20HoIFez3asKJaF447vPtszX8xb228qgH9Pyt0eid1YWvMgAdO1
	 mLMjui3qH5GTw==
Date: Wed, 9 Apr 2025 13:31:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 2/5] ASoC: cs35l56: Add struct to index firmware
 registers
Message-ID: <6d11e2a7-3eb4-4504-8bdb-16682136d748@sirena.org.uk>
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
 <20250407151842.143393-3-sbinding@opensource.cirrus.com>
 <c1043fc8-40e3-4ff9-bade-bedfe7a19a18@sirena.org.uk>
 <e3447ca4-ea19-4c84-802e-dc3832ea2dd6@opensource.cirrus.com>
 <f9fcff2f-34b6-4291-82d1-3b40c0f7e8e6@sirena.org.uk>
 <4b00f887-143c-415d-a464-dc847b7d84d5@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RW4mq+rTmKbyulgI"
Content-Disposition: inline
In-Reply-To: <4b00f887-143c-415d-a464-dc847b7d84d5@opensource.cirrus.com>
X-Cookie: Words must be weighed, not counted.


--RW4mq+rTmKbyulgI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 09, 2025 at 12:33:50PM +0100, Richard Fitzgerald wrote:
> On 08/04/2025 5:00 pm, Mark Brown wrote:

> > Yeah, like I say it's a taste thing.

> If you would prefer us to use it we'll make the changes.
> If not, then we'd like to keep the code as it is for now and in
> future we'll have a look at regmap_field.

It's fine either way.

--RW4mq+rTmKbyulgI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf2aLwACgkQJNaLcl1U
h9B4FAf/bQH5ZEUbYeLFGXytwdCDJxLeJB2vxoezkGt44ZdO4JnK8A0Q4NYfaJpm
wTyZy7yn0tPGn8tLnmHJ4WQQcijaS9/c+QE9hq8kfMABVW9P+E9Pq3+hdLBnjq0s
vdeUqxegPdWJtw5l3sDA9H9cscGZEkg5CQ5p+zWkFq0ndJ5Sh4ILYheBCH4za3PA
ecjsovTw/xXkob24YkARKIN/w58UEKm7U7FiZMze3CtX/mbopKOPw5sMuQQmVJDm
cbNxeV7XyOh9KX5aejO/NJ7HDE/FJ9SNbcL+DXiPNj/KkYGtWuwWpW3H4YngJe8O
UaPL9914XjtDQF3u8vwYpMc2pwuUgw==
=4LIw
-----END PGP SIGNATURE-----

--RW4mq+rTmKbyulgI--
