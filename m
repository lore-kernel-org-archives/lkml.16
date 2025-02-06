Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4275A1624C2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849478; cv=none; b=CBPBLmycQrOnkN+DT9/HyG/cGyc2zuo8vXz/9GEtkqh2236VI0qDuFtR+qQ+P0A+FmoJUkPmnLIJ0qmpUfH2hzwUv/fcuW85fgMpTQMLqfr74n1zgB+S71WgV+3pK2wfiS1V+ugiSbJU8kue4nPU65hNUkd6mtpp3vzfpyQYWa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849478; c=relaxed/simple;
	bh=r2IggwQjUoQ0Z+clwyBtOBFZQ8z0oERJdaFJ0Ptt5Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABeQ23VfTyBJt3J/f5mGQjQl8TXv+qw0pyMp1US2op25Ka5V0/miGLWDhFOHwpciyFDS93HfwCic7ubsgss2FZ13C+IggBtZBEtImzO19tAxwm0g1dix1UDLnijEY0LBk87krUxANXy/VaJDn1OLqtkF99ywvL5A3VnBb8zqzXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpL5rhLx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpL5rhLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D21C4CEDD;
	Thu,  6 Feb 2025 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738849477;
	bh=r2IggwQjUoQ0Z+clwyBtOBFZQ8z0oERJdaFJ0Ptt5Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpL5rhLxlGBWUcm7/VOH675e4UCBZVZZ9VEHuPgwRFG1E2x2d4D+EJ2zrFwMXVh38
	 Hmi1TTTxduyAIoLBxrSaGVdsZ1LoReLsKQ2rtzSFA0g31MErAgJg9Rw6c1TqXSwUdD
	 Q6ZLgbBmWAPapjewDDra6Pkwa8MVurQ0Du2sm+vvc1+6uEgfzQRlFCAn1Pp4wz+n0K
	 Ixh6YMNB/ya9G+aB9xh+mJYPqJXdwMtQV7YDTGA8devoqCdDFVoj0Pga9MfFlqTNQz
	 CRdZws00kepPLacsX6Hoz8Gs/b0wiv+tofEBOWlFLF2X+w3kcRyYRCd7X6k0eYz3lv
	 r0dbLmbI0+QBA==
Date: Thu, 6 Feb 2025 13:44:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: michael.hennerich@analog.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] regulator: ad5398: Correct the SW_POWER_DOWN bit
 number
Message-ID: <28767ef9-0909-4d74-99fa-514c9bc99afc@sirena.org.uk>
References: <20250206122459.197985-1-isaac.scott@ideasonboard.com>
 <20250206122459.197985-2-isaac.scott@ideasonboard.com>
 <c29affda-e769-4658-bb74-3b8c273e8262@sirena.org.uk>
 <2a0f24c61de73f7bd2bb495d697dcedd8462f4c0.camel@ideasonboard.com>
 <f81d5101-1dd2-4ff4-9a23-403b6efbcdf3@sirena.org.uk>
 <1afa0cd19e48014f3a59bfeaae58f85c9db92c1d.camel@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ABLaHBGVdySAwJso"
Content-Disposition: inline
In-Reply-To: <1afa0cd19e48014f3a59bfeaae58f85c9db92c1d.camel@ideasonboard.com>
X-Cookie: With your bare hands?!?


--ABLaHBGVdySAwJso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2025 at 01:28:15PM +0000, Isaac Scott wrote:
> On Thu, 2025-02-06 at 12:58 +0000, Mark Brown wrote:

> > You didn't include a Fixes tag or otherwise mention that this was a
> > fix
> > for a recent change so I was applying this as a fix for Linus' tree.

> To be clear, would you like me to resend the patch with the fixes tag?

Yes, like the message said please resend.  Though isn't this the same as
the fix that Dheeraj already sent:

   https://lore.kernel.org/r/20250206103153.59114-1-dheeraj.linuxdev@gmail.com

--ABLaHBGVdySAwJso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmekvMEACgkQJNaLcl1U
h9AH5Af/eeCw9phep9Y5SWuGTTzHT6VCsrUqtdMpGUcuWNdGZ3DWdGeTnre21Y93
jQAB97tBYpZrxWS2L/QfF33Sy1y6OfjykzME0ny8VDya/PulqAzM8kM4CVnK5/7C
YJbqpxrrxqCcvmLAmDBFs3NnEPKr5NHUOtu0RRr8+oZaOFiunqTKxh4L0X5+cZyL
1+x3XIaFLWf9mg3PplQoVce/vY6s7lLxg1U7mz+KRswR657J7halZFFWuYpfkki3
HXJQchcoehoQF1x4908Pk1Hgh7I0Q+NfuRU/fhAYfwmqBhQWfIq6JzEBXFrbuqS0
ITONuOlHbO7EQP0zwqWeckP/cbWeeg==
=OtnM
-----END PGP SIGNATURE-----

--ABLaHBGVdySAwJso--
