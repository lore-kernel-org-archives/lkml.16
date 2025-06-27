Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C7521C16D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751016277; cv=none; b=KMo4J4dqZw9rr1mdc+31QyqrcM6V3fWE/Zv4Y18zT/heOwYZQbtETfaGlOuEeCV7jGz5LgUOc+BcZvv1SltVEbO1AAdNcCIXW0uXnzz0cja5KaFj68lulHUXsHnfcVPAQF4vUjf5/ylGJD8Iinn5IOuu+SLlXmm6ZZcHltnnIjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751016277; c=relaxed/simple;
	bh=RTKwzPM6lesauXZU7R3+oVNk0/n5J2iK/snjSi0tsQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTj5i+TIi5YngR/PEwkRqJ8qAqnpNWt72Sj1IZz0+xFG3tSFqDEghpCTH9SA07EK5c8LqICK6EXIZL5/IzxngFkNGyZB0ZUK1VzOpH8TaENWm9Bbz+IgB2nB1mvk98vzQps/EVikmEailQYkFhJAMtxlILSxRhg3YwydJNZKpb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1WuRnH+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1WuRnH+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380F9C4CEE3;
	Fri, 27 Jun 2025 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751016277;
	bh=RTKwzPM6lesauXZU7R3+oVNk0/n5J2iK/snjSi0tsQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1WuRnH+XcNAo7Ngg2G+U/r9+Cr8AWK9aF2jmYf9wV9rhTMmiTTH3ybWnE5j8tVUf
	 jcqk1Ikm03ED65y4kgWu3FN4M1KEC9+BiC9J1BYUzFYcnmd0S6TD9dYOMZmxjmZe4o
	 MPzqpWjO2K/NQf4s64CtQxrGusKEpTthUwdYtpYEpB3TgBCf/DbgWZfwTuMp/YDMAT
	 ZbDWzolNyaNEqa8DGZoBUF8MQ/QcQOx1yxzHef1FcEpiyRitsnAKzqsvdV1NHKbyXB
	 IJV4KoobJJB59+fj+4rggyoxJWDdu7RgjxDbYk4UOqLwB2DKtsrkpsrneEh1uycetS
	 pjXwDaaM8prvA==
Date: Fri, 27 Jun 2025 11:24:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Message-ID: <20250627-crafty-taupe-hoatzin-ffd456@houat>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <aF0fKHQywtoG63wT@gaggiata.pivistrello.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bf3dbobd655mefge"
Content-Disposition: inline
In-Reply-To: <aF0fKHQywtoG63wT@gaggiata.pivistrello.it>


--bf3dbobd655mefge
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
MIME-Version: 1.0

Hi,

On Thu, Jun 26, 2025 at 12:21:28PM +0200, Francesco Dolcini wrote:
> Hello Maxime,
> it works for me, thanks!
>=20
> On Thu, Jun 26, 2025 at 12:04:58PM +0200, Maxime Ripard wrote:
> > Here's a series fixing (hopefully) the panel-simple regression for
> > panels with a panel-dpi compatible.
> >=20
> > It's only build tested, so if you could give that series a try
> > Francesco, I'd really appreciate it.
> >=20
> > Thanks!
> > Maxime=20
> >=20
> > Link: https://lore.kernel.org/dri-devel/20250612081834.GA248237@frances=
co-nb/
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> For the whole series,
>=20
> Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com> # Toradex Co=
libri iMX6

Thanks again for testing, and sorry for the regression

Maxime

--bf3dbobd655mefge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaF5jUgAKCRAnX84Zoj2+
dj4cAXkBZ9mAxRPFYp48ud3HArgZVTHAid8L6IlGVu3HKUVTCEh1Sf9luhFwO77g
LEXZZ/sBgLlEmCDyeSROl49mzc+CL1c1KA8sDj5ARnnDWdq2RCiBioTCT8xRDjEN
pTYgmSW9HQ==
=FKFr
-----END PGP SIGNATURE-----

--bf3dbobd655mefge--
