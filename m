Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3A81EFFB4;
	Fri,  4 Apr 2025 15:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743782257; cv=none; b=sMHnZ7fXeFXh25YO9e51ftJLkupEGDWfwqiV8ZUvsYqnDGiXk6w0LgVYFJqc42V93zHwgnopWBFlcJ7ooTLy3C+eksJPruTd4ynMC397k16bdEw6CpkWM7N1zgxfzhYvWDMz+DLdvpvubHG+JMhYEbAYvw10H5rni9o0MeECxak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743782257; c=relaxed/simple;
	bh=COkpL8fQE5l7P6GCduMEpuUwx2Y747Dacd8yAPOq3cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+ixQaq05DlmsPduPzYG/FjrN9ltlAfqvobX42yzas5Q/IsqGFStrsAmx0miphYmlWS1U4kKzPM6PLQ38VkGs6lIMuoH6nyDi/inZrzFgDi1rLCZeXbTflsvT/Qq1VNRzb7MDwJ8uLsox2WO0MMU0PDXSWODY58N4PO+aMlq55c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaAzCsNV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaAzCsNV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4588DC4CEDD;
	Fri,  4 Apr 2025 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743782257;
	bh=COkpL8fQE5l7P6GCduMEpuUwx2Y747Dacd8yAPOq3cM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jaAzCsNV9bb7/b/DCVXJZMr8AOzHbm8sYUd/1in+O4L19O/jri9ohRKONwQ1bZM2t
	 rW/ee0rYCpf9zSDqgTTqFj7Xvi0RChS7KbJQHZTDx0+JMxTsdVzFoRJVXGY8IUSq3Z
	 yCf6eK+jheBHf7pewipOGfbiP5bY32e/7TeWgSRt31E0zrPSLqwrbE9Fh9wwVDGST/
	 yShbbacq/1+FoSOQyQOYZrEop2tWPys2YwAIdye4y20R/kNcTtYaYMVusd1Yqp9zTF
	 oPngEc8ZWI+jCyUZvTfjgIKJNED6rAeHak5Nfwhk0ER8boKAEEAy7m6hFiOZKT9alW
	 bcO1YfhcVYYsQ==
Date: Fri, 4 Apr 2025 16:57:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v2 3/3] tools/kselftest: add MTE_FAR hwcap test
Message-ID: <0803d010-9e71-423b-9ee3-931a976e4670@sirena.org.uk>
References: <20250403172758.67106-1-yeoreum.yun@arm.com>
 <20250403172758.67106-4-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fbQ9cK3yItVK93le"
Content-Disposition: inline
In-Reply-To: <20250403172758.67106-4-yeoreum.yun@arm.com>
X-Cookie: You will soon forget this.


--fbQ9cK3yItVK93le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 03, 2025 at 06:27:58PM +0100, Yeoreum Yun wrote:
> add MTE_FAR hwcap test on kselftest.

Reviewed-by: Mark Brown <broonie@kernel.org>

--fbQ9cK3yItVK93le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwAWkACgkQJNaLcl1U
h9Cv8Af+OaSzBEMLiXHx8k7AGPbYlF+tWFCoZqeNuTxThXBEVt5tG5MUGTJodjTs
6NtewEVZolnUSqZdsZEW2K6LH69L2s8ZhHn8jixuPz/k/wbWUwm3ZF5ugjg2DqTT
huL0ZyoizumKfT+lt8D7s6Ja8jIQIOs4KpPNQKPfQ0mXMDfYr2nOqfbO77gkOTm7
Q+vIsUg+eud3yt6uMVl3cLXLIHsf/P3vWFuyGj4Ct0Nij5XfhQF8HZQfv4stSkTZ
cGNls83Gr/Oim4vLXWbVrHtE4uBmRxlXinKqBLNZnA0N7RbUQLW/DX3uRIBETmc+
Ldf8YcDngw69rzEGdeAN60CsdmxP+A==
=J8O6
-----END PGP SIGNATURE-----

--fbQ9cK3yItVK93le--
