Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8685D51C5A;
	Fri,  4 Apr 2025 11:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767490; cv=none; b=C2zQ2br4jtxJhgNPI14gK39lZZpgqLVBq7FxKwqSMgib30aqY39M9VCQ+mA9jtAUk0iteguc5qoO+6FobQLJzWVI5mwr9x6ErBxBv74ijIs9mZITx0lkUVa0a8Mvtvxd+D//FKiQIY+fy79q2F8FcITI/IubClj880M636KRXsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767490; c=relaxed/simple;
	bh=mPF9dNqIO0IVwlNHVDTJ/mOCbUxdzAJZwR3p/NziPHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ec0jxIgM96GSOA8q0RzFsDJPcz34QUyP6LKAenWXxqdJhq2G0vc34Z6R3zu7CZYqUsb1Z5dW9QVy9fT8HEj7watrZPaMa+2NpEr6YIW9ECM94YCfiB+ivjC5lf6icfU2ty+4/zDeBMqXpUjZP2c1fRYTrW5sPB0PEhyXDyECUjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iljuvQh5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iljuvQh5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B522C4CEDD;
	Fri,  4 Apr 2025 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743767489;
	bh=mPF9dNqIO0IVwlNHVDTJ/mOCbUxdzAJZwR3p/NziPHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iljuvQh5K1ESqANxabdCrgUqmU1PuS2khRE2CNkXIks4yPW5XYrx9C/loJKzMVA/T
	 qv2Sk1bm9f1sx3nUCKteHI0Gthn9SDJrQht5YzBDFFwBB/3VCGC6oXinTnZ0xO9tK6
	 Y87+fQ38ZHd+Iko+m8oRIOjHN4NbPj1w+AHio2XQu//gJc337/i7N9NAIrQKs8x1ue
	 Y2uxXWnRn98RaVVKYMvt+LHoChT5ILbViSSAIVWUd5zpYazXPL2MLRL8mEZecHtn+T
	 ys3Q51WCk1mSOhSFVqYPUD/TX0clFZJiDRo07dbN02AwA6ODOMmgPfMK3aQX+n+4bz
	 1FjRdH1VNqYOg==
Date: Fri, 4 Apr 2025 12:51:25 +0100
From: Mark Brown <broonie@kernel.org>
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] regulator: adp5055: Add driver for adp5055
Message-ID: <b01583e1-dc95-49ef-99fe-1eedbe48cadd@sirena.org.uk>
References: <20250403-upstream-adp5055-v3-0-8eb170f4f94e@analog.com>
 <20250403-upstream-adp5055-v3-2-8eb170f4f94e@analog.com>
 <360c60a4-d1ba-47bf-b65d-c6889801703f@sirena.org.uk>
 <PH0PR03MB63517B73D2E5F9B46FAA6D41F1A92@PH0PR03MB6351.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NtdN+vd/FtMOcBIh"
Content-Disposition: inline
In-Reply-To: <PH0PR03MB63517B73D2E5F9B46FAA6D41F1A92@PH0PR03MB6351.namprd03.prod.outlook.com>
X-Cookie: You will soon forget this.


--NtdN+vd/FtMOcBIh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 02:33:27AM +0000, Torreno, Alexis Czezar wrote:

> > This is absolutely standard enable GPIO support, just let the core handle
> > everything.  Otherwise this looks fine.

> May I ask which core function is the suggested to use here?

> I assume I need to change the line in ops:
> -> .is_enabled = adp5055_is_enabled,

> Not sure which function handles both GPIO and registers since as far as I
> understand 'regulator_is_enabled_regmap()' only handles software/registers and
> 'regulator_is_enabled()' only checks the gpio?

The core handles GPIOs separately to the enable function, this is a very
standard feature even things that actually need custom enable functions
can make use of it.

--NtdN+vd/FtMOcBIh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfvx7wACgkQJNaLcl1U
h9DSTAf+PSVWwSnav1WgAb+SgTPLt/DLQCSH+e+wzfkq7K+B1PByoh1xres04Yk2
TwaV/z9/N1SpJHgebQdticw0uKfZtz6lpbUpa8lJpjTJe0aKKkS+cGNTq96RPzsY
NxzhuEcXwejwjsHTsAIpE5XwlqEf4FeAZ1ea911YatCGGKWs6VIIPo3OSvzwOAp5
9cy6qbm/XSRlku0U6JnqdU/vp2FBrEV0mNarW9cyIAG4iPQ/EDyxF3aSFkWFyY3e
CxH/N2iedoGh8T5DEy958mMZPwR1sM/L7ZvXh09B1EYP1I65MuYBIv4RmXRnFHFb
JLRumw5iO5u7UsVHGnmwlyIsZq6B/w==
=LPyq
-----END PGP SIGNATURE-----

--NtdN+vd/FtMOcBIh--
