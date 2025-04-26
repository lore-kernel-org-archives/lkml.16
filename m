Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAAA15574E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745656016; cv=none; b=r+SRYE9tI3LO9I7eUZbIvK491u22kc2a0JhYldgSXpmWD5f/vLWFom8mXGaooiveLOuV1jUq03+f3e5UIFjB7DT/cfUwgCehJ+1q386Xbq36l1Qt0XFQHIegL/A0qRlE8iTOpBRsO+vXlZOW6a+zemPTdAz64Zk8Y6ccU+nTgNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745656016; c=relaxed/simple;
	bh=RVnCcmr9Mg20S5n5EjDVOuVDBVithBL364argSJiVzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBWMwoGajf+Quq/M8LDZJIx8DjeK2aL8yOiEi4Icyt5o0Gaj8agm4miGFqyviiQ3KeLz5vERFp0Ru2ki2nHbAibs8atJLauvvV2d4fZxLPOPHC5snvRlNlfNoykqFftUxrgsxLchKMOByci5td4N1aCyuzQTQV7kLFe/RE2GPuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=fcvnb6O/; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="fcvnb6O/"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 2614F1C00B2; Sat, 26 Apr 2025 10:26:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745656012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rW9DlELSO6TPvA/H/EzsqAQbCqHifzUnKm3Zx+TxQL8=;
	b=fcvnb6O/FwQJ5ZAKjMW/i24Yrx6lp6s17vnC6XIUWvxOYGa7Xk8awab6Yw/b6Qs4eRIaIS
	kScwM9SJsQfFWsAoPRvXS05xk1Bf1LFbWBKcW+YtUWlj5JOpkVHbGqCwDdd8uyWBzjXA9j
	imS3jRwtMx4JYlMy0nr43Se5jjjgzPc=
Date: Sat, 26 Apr 2025 10:26:51 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
Message-ID: <aAyYyyiTY02DW8pH@duo.ucw.cz>
References: <20250425084216.3913608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DAA9AA4+Jf1+l8Nf"
Content-Disposition: inline
In-Reply-To: <20250425084216.3913608-1-mingo@kernel.org>


--DAA9AA4+Jf1+l8Nf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> In the x86 architecture we have various complicated hardware emulation
> facilities on x86-32 to support ancient 32-bit CPUs that very very few
> people are using with modern kernels. This compatibility glue is sometimes
> even causing problems that people spend time to resolve, which time could
> be spent on other things.

We have open-source 486 cores, such as
https://github.com/MiSTer-devel/ao486_MiSTer . I'm not aware of
open-source 586 cores... so this is a bit sad.

Best regards,
									Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--DAA9AA4+Jf1+l8Nf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaAyYywAKCRAw5/Bqldv6
8nQjAJ9edIbnnFWtpFI49h5SD5q0vMeWHgCdFT3vVO7KreRtuhJHJj+66/6AFtw=
=dT61
-----END PGP SIGNATURE-----

--DAA9AA4+Jf1+l8Nf--
