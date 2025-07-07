Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EC4286412
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880367; cv=none; b=FQfhzErBQYFB3X1EVkZs/MgeWfkL8gJcTbDiN5nkegmBv+0/xr55RNk9NkVlQmHrEel6YrQV0jnOc3mXnrZXtVIlCBMf2HlLtjH/hegYtpzmdYvFxQCFaJtiBgR+AC3RAWwBxwoHU+fiNmylsK5PiANA6DTifPRyKsF3sHEQj68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880367; c=relaxed/simple;
	bh=YZ6y7mjQqZQhiC0IZCoLch8rBcV7N//8ZHYFV4Txe3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tj5+Ii8GHv4K3DC45BzTZzXz7iaIDCSqCnXCsIpv/sK3S08okFmLyO6hFw+rxa5ZS2lKkftQ6fuZfcIjqy41Wrvu3VFmoXZGPEFYUygYWq7IOxNKxOvGbMexmg2Ep1QY20vVM3REPLagZZkHayJ3GiVZXdJhWcr6V44p8sD7E7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIzv65fQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIzv65fQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2752C4CEE3;
	Mon,  7 Jul 2025 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751880366;
	bh=YZ6y7mjQqZQhiC0IZCoLch8rBcV7N//8ZHYFV4Txe3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RIzv65fQSrDpaQUtBqhEUubxpImSSwF8lv7Am6sXK1yg66wWPyuBnN+KZjnhcbvou
	 A8jVtiOvCdtDmeYo0VuE7Y7Tn9eWPTeTMYc8go+Ujs1hXwkuAOrcSVKjsNOdUlYSuD
	 svPNFX/6mSzK9E7VWx721/ek2i0zn5X2/lswxapiMVtDyL1teeFkdfi/9ffeDdgC8a
	 OLzR2COdCRCs8NlMYrB3hQJ2K5f+3nfjUZR+x44DQ+DgxPXz+byUSkW58X2hztjEzG
	 Bat8LjZYjLvhKUUeL7HSNv59JdkR+wIAcAdo88fg7NXht4viDA7Wh0upa8QzYEk8UK
	 2O051xGs9s0OQ==
Date: Mon, 7 Jul 2025 10:26:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: tps6286x-regulator: Enable REGCACHE_MAPLE
Message-ID: <e8041636-70fa-468a-bb14-1a88c272810b@sirena.org.uk>
References: <20250629095107.804-1-jszhang@kernel.org>
 <aGj1hAAg3nM4zV70@xhacker>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bM6nivHvuJeT5wyH"
Content-Disposition: inline
In-Reply-To: <aGj1hAAg3nM4zV70@xhacker>
X-Cookie: We are what we are.


--bM6nivHvuJeT5wyH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 05, 2025 at 05:51:00PM +0800, Jisheng Zhang wrote:

> I made a copy and paste error here: should be tps6286x_volatile_reg
> I have seen v1 has been merged, so how to cope with this? Do I need
> to send a v2?

> Sorry for catching this a bit late.

As covered in the mail you got when the patch was applied:

| If any updates are required or you are submitting further changes they
| should be sent as incremental updates against current git, existing
| patches will not be replaced.

--bM6nivHvuJeT5wyH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhrkqkACgkQJNaLcl1U
h9Du5Af/a4KuyiV/Yl7i4HdbB3yp/pSVoOR0u0chqDC+BSfthocOLsh36jGDVxEP
kK5hmIlMKuS3UrQ0OvbrBOiR9TCZGWY4dy64Q9XXmrzkgGzBtzCNQ6DPLv5o9DE7
KZTPGBDw1//s7LRwIZHX3M7PGdOICVzj0PQVwy6M/NNu2WU+xzeJyJ8eNUbe53es
ZYhdN30DuEKhs12epXdmXvRZh4SSflGtdwn5NcfSnRs8LFLGv8J/T78YXELXhaWf
QdJMl1rRIZMOuJl70nDNCr1KIHP1Vv2Fp/nbiGrN2u436vicbeepbCneSgIPhb9j
dGLmnGRyKwywll+jV2p8WEgiB8hkPg==
=xtfO
-----END PGP SIGNATURE-----

--bM6nivHvuJeT5wyH--
