Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5E5282F5;
	Tue, 27 May 2025 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748369799; cv=none; b=TBrnc+6L2/cIiWwBcEcurtW96YrnGSW/U/wg4OKc1YiU/tNLRsFeJAVxbTrTevnOhpXI6ssydDBakgrzk0adFhDfifYZtMIzYPUqzzTgtelZa2PR+kg00lNqLOeT6W6YWzJcxqHthi8aN3+wsvnW1x98sEuUrgtVR8TUZ4bVP4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748369799; c=relaxed/simple;
	bh=z/1nierZUFrBDz8dXNTKygJZRWilTfTDCz5cVzuxn+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HO+FmQy7AJGo9sVQ2+9713i8QZ9P8fFORlciPN3BNn+A34d1McITo+ZQ/MNaBiFJYkvFfUQW4QO7/Uk2mHR/JdeAOUSsAwjG5/oPtmva32/KeD5ZJDD/4adn9I8LMUrzZsjlOJWz88pa2ZQ4xfGTwsEvnNkXOhznTsXFAXs9TKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=H/ZsJ7qW; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="H/ZsJ7qW"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id AA0291C01D9; Tue, 27 May 2025 20:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1748369793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=caktQKPVz8v/q+eBzEBEoCG4CufONU3ehSaGJ6uLTNk=;
	b=H/ZsJ7qWYsIVUdOCNlNd2FcqrmWpv4P1vP5+4DGzksP+ZdynCq6rEU5jOuGI1SUPy5K0JI
	IrDJXXX55W7PJRgHHVWuKKh+2mQyuI2Rhl5VV+W20/kYBwSAdQInFXR0JdrrTp/lYCCuHe
	B+PYPLByXtQQPOeXi7/AORBBz0jua2s=
Date: Tue, 27 May 2025 20:16:33 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	PDx86 <platform-driver-x86@vger.kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.16-1
Message-ID: <aDYBgcSbVQriCyhO@duo.ucw.cz>
References: <pdx86-pr-20250527124435-2181824944@linux.intel.com>
 <aDWq/U57DO7fMu4K@duo.ucw.cz>
 <4cac7f91-608b-4362-99ed-4d8cd5935900@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SAhQsDNdRiRNEyv5"
Content-Disposition: inline
In-Reply-To: <4cac7f91-608b-4362-99ed-4d8cd5935900@kernel.org>


--SAhQsDNdRiRNEyv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > 4) We don't have reasonable support for the new API in the userland.
>=20
> This is simply not true. Openrgb's next release is planning to
> include HID lamparray support.

I said "reasonable", and openrgb is not reasonable. It is the same
mess "gpm" was. Remember gpm for mouse handling? Except that... it is
bigger mess. Few megabytes bigger, IIRC, links against QT.

I have debian 11 here. That does not even have openrgb.

Device drivers in userland ... never worked too well. Openrgb is a
hardware driver that happens to link QT gui into the binary. That's
=2E.. not reasonable.

Best regards,
							Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--SAhQsDNdRiRNEyv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaDYBgQAKCRAw5/Bqldv6
8pxlAJ0bkaJARLOFiPmEOPRe8wQQujjj1QCdEy5czXdwfz9hDDnYtSid78sAw20=
=vODu
-----END PGP SIGNATURE-----

--SAhQsDNdRiRNEyv5--
