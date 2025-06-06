Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D2420102B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 19:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749236968; cv=none; b=s+aVF7hKYmsGL89znuI2UYGrhVi0+OEJOjZggVN6BFGaCj/6vvEK5VrIvBMt43w7H/h8bb+3JZQUlAvpV6l6WO9NEAUL8tHHVhMsCImc+EFFGKzvzLljVI2tTaF2kze+LcsttponHkhQFKOU/WKZLXWUFe8Y8hUTwvVPkZyqIJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749236968; c=relaxed/simple;
	bh=n4pOE8cxjxEv0kasPv8Gkb1netiO/BrEltOsAJdw4s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJcs5tFzJMvi6sQpPLFnXUF1665Bc2vDw321w+9pCCE8laDBHlCQmk2RwTwAqTgFN/sGiNy5+EwWlzapTw5YBRbEvUF094sAG7yqc4rXS26zAmQv641aNVjffOzc6D4OgkViTHDT/EvAcX48/RpX4b6ZqrdH3cDGbqyFUz3nwK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sx/kjeGd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sx/kjeGd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A993C4CEEB;
	Fri,  6 Jun 2025 19:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749236967;
	bh=n4pOE8cxjxEv0kasPv8Gkb1netiO/BrEltOsAJdw4s4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sx/kjeGdBoJddkBKaikytLtGj3/jB8fme3+9nkh1tnAoVQFEl3N/nAxyg9G7HAske
	 nodQ2kk2M1fUe3WEM3VxVvZYuY7yCVjKBQcLpJHZyKR+NZdjGGoWXmz5gq1tfMP1RL
	 Te64sewbCgjR+1Z9CgoBQGWvZYqPZEnCnunUX+GbVE9n6LhMrzZCfKgbNkWxpXM6Qz
	 V+WJO9mbwvK1JBu/pupeKdCfcp7D7WSH043fijW050p8etGVEKOURCyDqgBO6Xecs9
	 liIlJheXAtPh0Njo7kRw9/J7WA/NCIg/qO2bQRgRyIAGEnIkBVNxtxlMnuKUtZ4+e+
	 q8M5U186T+m/A==
Date: Fri, 6 Jun 2025 20:09:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org, wens@kernel.org,
	quentin.schulz@cherry.de
Subject: Re: [PATCH] regulator: fan53555: add enable_time support and
 soft-start times
Message-ID: <03971cd0-c820-41e3-b344-771a5d50a607@sirena.org.uk>
References: <20250606190418.478633-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dhoJWq1kIEykHogS"
Content-Disposition: inline
In-Reply-To: <20250606190418.478633-1-heiko@sntech.de>
X-Cookie: Stay away from flying saucers today.


--dhoJWq1kIEykHogS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 06, 2025 at 09:04:18PM +0200, Heiko Stuebner wrote:

> I've started with just setting regulator-enable-ramp-delay in devicetree,
> but Chen-Yu suggested [0] that these are characteristics of the regulator
> so possibly should be defined in the driver instead.
> And after thinking about it more, I agree.

Yes, that's more what's expected - configuring in the DT is more for
cases where there's either configurability or board specific variation,
or for fixed voltage regulators where we don't have a compatible.

--dhoJWq1kIEykHogS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhDPOMACgkQJNaLcl1U
h9D6KQf+M89NSa7tuZTj2qS9G88iCpqVhnWIqMVi48KLPe0/8eIPnrSecVDN9bpe
/HKNDcl0/QMnwcs4Hy4fUJXU37hXFytELlH9v4cuypCtotS9bJxHBdarJXzUsAOv
aTTUJPizawUZRqSh2PnfqeBn37l2Cq8ShT2v/n/mrxTWaSaG605v6gES+d2m3t/P
DezQc+gkbu6dee6yJebZR6Bd99Kd0gbEnT2pP653nxripVJWR1ZtBzY8TUZ/c9xT
GKt4Jnx4AYb/+A97aZkGiYBxnTra9QvA5uXZX5/fNGG7EpIUGrSBr59rpWb+i+hY
GC8dWOeYSMrJGD7wfh4O+227RZwY8w==
=SmA9
-----END PGP SIGNATURE-----

--dhoJWq1kIEykHogS--
