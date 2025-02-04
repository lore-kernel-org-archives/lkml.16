Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5037B4A00
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 23:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738711892; cv=none; b=CvOv8LY8Gskob5APxF7Ezgwa9GqpxACrBC3mq65TIQEIApKASJZF/pRKmkPWVu7kUjQ76bIjTP+xRQAxtRmL/Jj0M2AkxH2hP3Gt1+sJ0UXyw1CmqecCNlbQn5mmww10TsVvONRKr0veVqcIUUhTOJP9yXW0T2hG/mYAjkiPOWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738711892; c=relaxed/simple;
	bh=ssdWvG/AFYhoAwSEBluCH0CKbVRI0INkog1PqwbG+i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=camP8i2EL3DxWOtFyR2T1fgJ8KlOgmFmzMB+Rjo+qGy8wRj//OrmuWmpabs24Fyvhjfi774ZnX+lAHAy9quoeFIckBCzrLbBgK5jno2PMayg5lYi1nIQPdOR3ua+VD7MM3I2irmgcN70LSlkOFdc6Ckb8DsRQjtMmWHAH821hY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiIaix8t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiIaix8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61B5C4CEDF;
	Tue,  4 Feb 2025 23:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738711891;
	bh=ssdWvG/AFYhoAwSEBluCH0CKbVRI0INkog1PqwbG+i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiIaix8t8Cs2XQhzKukHWqmac/PV1nQ+M+uHgcuGGziuzfxpfi88nl5mW94Uv15SM
	 d6hNcd6gdHQBKTdrtBR4nSJfeE6x4Elyv1cCnM6ixDRB1vbK7m1+djL4LJWTKFUohI
	 ZesZcMuwGq34NkFI9kb9Jb2jpQmeu+qXyQx6S50yzsaywA8pkwQrZOXseIJClYg+CZ
	 dYnJCjQCttN04ZkY1l2jE0U/jNC2b2ZvRp1uHDBb3qkdU8vdHhnxgTgdFqvOgpXrZr
	 ZLWOf0qlj9l47qXe7FXWDstBlWcQti+iRY2Aa8PUb2XHEcfZ8Zs3g4HOg524ILKxkf
	 fQjSOwGSnNlgA==
Date: Tue, 4 Feb 2025 23:31:28 +0000
From: Conor Dooley <conor@kernel.org>
To: daniel.lezcano@linaro.org, tglx@linutronix.de,
	linux-kernel@vger.kernel.org, etienne.buira@free.fr
Cc: florian.fainelli@broadcom.com
Subject: Re: Kconfig condition on BCM2835_TIMER (and others)
Message-ID: <20250204-papaya-grudge-2b7dd5c73917@spud>
References: <Z6C5BegftEGzwkN_@Z926fQmE5jqhFMgp6>
 <Z6C6FQxsyX_D4jhY@Z926fQmE5jqhFMgp6>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s1c1F3TJ/4o5Hn8p"
Content-Disposition: inline
In-Reply-To: <Z6C6FQxsyX_D4jhY@Z926fQmE5jqhFMgp6>


--s1c1F3TJ/4o5Hn8p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 01:44:05PM +0100, Etienne Buira wrote:
> Resend with corrected email address.
>=20
> On Mon, Feb 03, 2025 at 01:39:33PM +0100, Etienne Buira wrote:
> > Hi all,
> >=20
> > I want to build a kernel for Raspberry pi 4B, which, according to the
> > dtb, has a bc2835-system-timer. This device is handled by
> > drivers/clocksource/bcm2835_timer.c, which is built depending on
> > CONFIG_BCM2835_TIMER.
> >=20
> > However, the config option is guarded by "if COMPILE_TEST" condition.
> >=20
> > Shouldn't that condition be ARM64 || COMPILE_TEST (ie be selectable on
> > arm64 builds)?

Perhaps, but I'd wonder why arm64 and arm32 are being treated differently.
Florian, why's there no select on arm64 when the BCM2835 family option
is enabled?

--s1c1F3TJ/4o5Hn8p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6KjUAAKCRB4tDGHoIJi
0n+wAP9d8CPONamCjleKLa2drLg1k0RhSEtpTHLWu02j6++5sQD/TENpiWhPgYYi
eu3ikgQrCIqHsgXk+SaLdg6iTlMAfAw=
=sbh4
-----END PGP SIGNATURE-----

--s1c1F3TJ/4o5Hn8p--
