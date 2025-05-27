Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B341E1E12;
	Tue, 27 May 2025 12:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347657; cv=none; b=AmaPOhckEGbL+CqaUefKV5LYQQv2cRjy7R047DSfoLmUpXYg+eO5teEjeurlLHiMIwZoiV3AgC7+WBJY8AYGWWX73H95YblqUd6babpnj9VP57NzQNL2E1xDoFQ593rERawg6uAzesA49nbm7ZIzftxknNs9huuDrsuIeVwSHdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347657; c=relaxed/simple;
	bh=ZL/a3bd/0ZO2ScdgaFrwGKmmPlq5BuaEj9Hggj5i8Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9T+1ziHD+ml6FVmFkx3ZIIaj6JI1i4G5efr1R0NCteljIsc4a5chpjZDwLkRjl+MH03zvxVZb3Y5yxlvVEn+K05o6Ts+9jCesvOlAVr8/MfvLGPj5Lyo1OO++MPrlCcmAlldYPub+hMEgPbzbN5nPuavs7Jg1t4EsU/xW0YbmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=nNrms/hI; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="nNrms/hI"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 2043A1C01D9; Tue, 27 May 2025 14:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1748347646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rprgVCY3NLIzRmbfB6sV/TCt32WOMLnAO+zsNzi+NTc=;
	b=nNrms/hIyAPip35Q1lFmYCx+tQBgiETk13INnErSAvy4IW9ky8S59kFA77gmATqOGvHMaz
	HCYLb7U68OCh+m/4pQO/SCmLIbBom3fcsJCQHSOmdPrtml9+O63fiK0nojG6PYKnQ4ZvNk
	Etr64LoiOVWsigz6RcvRrOGdV+04pms=
Date: Tue, 27 May 2025 14:07:25 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	PDx86 <platform-driver-x86@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.16-1
Message-ID: <aDWq/U57DO7fMu4K@duo.ucw.cz>
References: <pdx86-pr-20250527124435-2181824944@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vc7SMlDOXL7Az1xJ"
Content-Disposition: inline
In-Reply-To: <pdx86-pr-20250527124435-2181824944@linux.intel.com>


--vc7SMlDOXL7Az1xJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> warning to hid-asus. I'm expecting Pavel might want object the approach
> used in the tuxedo driver, I largely relied on my co-maintainer Hans'
> opinion on what to do with that change as he was much more familiar with
> that discussion, and the pros and cons of each approach.


>  drivers/platform/x86/tuxedo/nb04/wmi_ab.c          |  923 +++++
>  drivers/platform/x86/tuxedo/nb04/wmi_util.c        |   91 +
>  drivers/platform/x86/tuxedo/nb04/wmi_util.h        |  109 +

Yes, I'd preffer this not to go in.

Reasons:

1) Normally, keyboard backlight is handled by LED subsystem. This was
not even Cc-ed to LED list.

2) It introduces new kernel API. Unfortunately, that API is not
documented in the kernel and is very much unlike anything else we have
in the kernel.

3) The code is not modular in any way, so the crazy API code is mixed
with real driver code, making reuse hard.

4) We don't have reasonable support for the new API in the userland.

Please take a look.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--vc7SMlDOXL7Az1xJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaDWq/QAKCRAw5/Bqldv6
8snOAJ0YZeUEUxwMiwlYyCALXTeeBHc1UwCgo7JrlEIHhXRxySk8H0O14qT3HgI=
=TkmU
-----END PGP SIGNATURE-----

--vc7SMlDOXL7Az1xJ--
