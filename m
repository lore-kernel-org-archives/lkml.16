Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970C327450;
	Wed, 28 May 2025 18:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456172; cv=none; b=LdPR0hJHsSQpdy4qwb5lrcTf0NLMMlJH5lQAe7keSjpPJNUq/gCHzxd18TSJyb2vdfsGq985OxRNOgplXWlShvZ8fIFbpunFAZiRPmpv9f4z04fLyed0FpQqI7ELZWB095mQnLRn4JB7OyOTtY2iqb4lW5qIJdZ6B0nlTlnFOZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456172; c=relaxed/simple;
	bh=06Kkx5fpHL8G7g8fwV5lNs2DBz108eD4awwjeVfVyvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWXlPvRKo+Uu8lPFLdT8pdxcsMwW7BZz6Vj0kMuUt33bil4pWBzwcpb1pIFGj0PE0yTKc1n06sWZIefd9e3imzOZIU4GhJL/sOpMQL5dvAlKiZ2eB+r+J323/beVqXRkbRIqjjTssUIqKCcYYQ3R/OqJxwcmRTshQMiLETu8PrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkWpQ1DL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkWpQ1DL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5A8C4CEE3;
	Wed, 28 May 2025 18:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748456172;
	bh=06Kkx5fpHL8G7g8fwV5lNs2DBz108eD4awwjeVfVyvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkWpQ1DLhunF70Di8HrYsEA5RMqJIldApxKDcf23sYfw4VxPUl8/WwU2VFzwBogNF
	 HvlXlX3l93ACoy16d+pUXba4k6O6RsKEF4ku8EYu0GeMQEvaFAobNoom9Moli7HLBW
	 z2mI4XXfrgZdc6HHxRFd3kxwhAcbdvKpRjDnJU1HH3F77jki9wptCiRpo8J6R9CuDC
	 Qras3IRa5pRwnbT3q4LZSpsSUNL+EgjLRCtWQ45856Yj3HypezaydCwql2UlCghX6I
	 cWfEyy9YzMstPioPd8/c7kp6fMAQJ20vRiEzuNUIL/V7S0Ga0ThdeBmO5EKqafpqS6
	 SgyY5G92HF8wQ==
Date: Wed, 28 May 2025 19:16:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Okazaki <dtokazaki@google.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zev Weiss <zev@bewilderbeest.net>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 0/2] userspace-consumer: adding is_shared flag
Message-ID: <a0bf24c6-58da-42e7-b686-03a893b38ecb@sirena.org.uk>
References: <20250528174426.3318110-1-dtokazaki@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yf9j6Ew/8eSP7Prm"
Content-Disposition: inline
In-Reply-To: <20250528174426.3318110-1-dtokazaki@google.com>
X-Cookie: Keep away from edge.


--yf9j6Ew/8eSP7Prm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 28, 2025 at 05:44:23PM +0000, Daniel Okazaki wrote:

> Currently this userspace regulator driver requires exclusive control
> of the regulator to operate. This patch adds an optional flag to
> remove that constraint, and allow the regulator to be shared by other
> modules. This allows for userspace to share control over a regulator
> with kernel space.

What is the use case here?  This is a debug tool intended mainly for
when you're developing a regulator driver and have something like a
development board with no consumers at all.

--yf9j6Ew/8eSP7Prm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg3UuQACgkQJNaLcl1U
h9Cligf/eRNSCfhAuPHM4/ocG3R+mI+WoS9FgYm7yddNGEdWxY40EnlQkfluFWLj
JESPxrpHpdVYeou8nzB8P6pSTwidv/wgDBJcIcxnIz3/eiY7Tm7g2EjhMY3jrbxH
Fj+rt6GbCzbC5XVEzh+XUAh1jOlefXJa0GPt6qgbg9q+6Jsi4YgPygzqGuxpjxqp
K8zw1JYvB79g2xUsU3OGBc9TBvN6ZVgGVqGP/HFtvnMF4Nh7CaMu+eii7wxqcE9O
GL7Y1Uvws23ckdJQ2CMgFFrJ48TAYWuS0aCv4oJ/HZtmpdKOb5ecBeGzSIso3tC1
dvUg/BshSNrt5iGIDUI5b+jxOntskw==
=X7d1
-----END PGP SIGNATURE-----

--yf9j6Ew/8eSP7Prm--
