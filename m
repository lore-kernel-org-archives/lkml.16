Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEFC13AA2A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743962241; cv=none; b=HIVOTajjd+gWI4jUkSwQXhDd7cIMZXGRKacqjSecj+GHXzRyjhgIO4fK32onROk03pc+yN+cJ8t7kGV8Dv/OHux5wFkLvpyN7zhH8T4MKNCsTkPQpqR5l9WI/gZm2bp17XOBEbl0vBRHxbF0XWSf3jl3HO3ce17N3w1d1S3PWAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743962241; c=relaxed/simple;
	bh=OqE+oQNqqW/uo/l6rUY1mrBoQW+pjWSU5EnkizFcvIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwDPtI5CNUrHnJ0p3YPxw5hVKMeoBDdDXLkKhlXIIA05TWxzFqxajNkV5jqy70RcK/WzL61iR8BgnTxtv95LcAFWL+LCOiIyMWSjstcpjQs6fIafJGFw6U+kRLkWcIpOXB0/Wei3EYTiOrWoTpyVIS+8XQAZFNA7VJyyXSe6du8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYtRO7Jq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYtRO7Jq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936A5C4CEE3;
	Sun,  6 Apr 2025 17:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743962240;
	bh=OqE+oQNqqW/uo/l6rUY1mrBoQW+pjWSU5EnkizFcvIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYtRO7JqCKERGxz8lFhQ2h8eJJUYEU4Bnm7uoRuXvsqLdWzuC9Cp/cL6XmU3CG5Nm
	 k9/7zGq0xs8UzilFSJGRwpaNuSSOpbqBOHqSeB8zm3X48jdLwUUDpYT1dNqlLYSilQ
	 ivD2tfHKoUowF7NcYaayLlFEYx80NgSLJtCv959GTuMmGuNkI/DkxpP1HmWYbyo4q/
	 Ksfn1t9xhtnBB+TCjU8JpdWcAsRpGXkM6mbH+E8J3GBM4ESmQuhroNCh8hFOcBkWVo
	 XUZUJQPFIAypGS6LXHMNXafaY+s2M3wtPS5UrdmwZPFzi0EdPRS9uQDFyiax0oCFa3
	 W7A3SHB161VuA==
Date: Sun, 6 Apr 2025 18:57:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/include: make uapi/linux/types.h usable from
 assembly
Message-ID: <Z_LAfEbDWjo3rTgo@finisterre.sirena.org.uk>
References: <20250402-kselftest-vdso-fix-v1-1-71b68f1c27e3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Zo6fVCo17ebhilh"
Content-Disposition: inline
In-Reply-To: <20250402-kselftest-vdso-fix-v1-1-71b68f1c27e3@kernel.org>
X-Cookie: Well begun is half done.


--/Zo6fVCo17ebhilh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 02, 2025 at 09:21:57PM +0100, Mark Brown wrote:
> From: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
>=20
> The "real" linux/types.h UAPI header gracefully degrades to a NOOP when
> included from assembly code.
>=20
> Mirror this behaviour in the tools/ variant.
>=20
> Test for __ASSEMBLER__ over __ASSEMBLY__ as the former is provided by the
> toolchain automatically.

The issue the vDSO tests not building on at least arm64 that is fixed by
this patch is still present in mainline, it would be great if we could
get it fixed for -rc1.

> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/lkml/af553c62-ca2f-4956-932c-dd6e3a126f58=
@sirena.org.uk/
> Fixes: c9fbaa879508 ("selftests: vDSO: parse_vdso: Use UAPI headers inste=
ad of libc headers")
> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> Link: https://patch.msgid.link/20250321-uapi-consistency-v1-1-439070118dc=
0@linutronix.de
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> This is a fix for a build break in the vDSO selftests which was
> introduced some time ago in the tip tree, Thomas posted the fix on 21st
> March the day after I reported it but it's not been picked up and the
> issue is now in mainline.  I'm sending it directly to try to avoid -rc1
> being broken.
> ---
>  tools/include/uapi/linux/types.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tools/include/uapi/linux/types.h b/tools/include/uapi/linux/=
types.h
> index 91fa51a9c31d..85aa327245c6 100644
> --- a/tools/include/uapi/linux/types.h
> +++ b/tools/include/uapi/linux/types.h
> @@ -4,6 +4,8 @@
> =20
>  #include <asm-generic/int-ll64.h>
> =20
> +#ifndef __ASSEMBLER__
> +
>  /* copied from linux:include/uapi/linux/types.h */
>  #define __bitwise
>  typedef __u16 __bitwise __le16;
> @@ -20,4 +22,5 @@ typedef __u32 __bitwise __wsum;
>  #define __aligned_be64 __be64 __attribute__((aligned(8)))
>  #define __aligned_le64 __le64 __attribute__((aligned(8)))
> =20
> +#endif /* __ASSEMBLER__ */
>  #endif /* _UAPI_LINUX_TYPES_H */
>=20
> ---
> base-commit: acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
> change-id: 20250402-kselftest-vdso-fix-d97fb8b09020
>=20
> Best regards,
> --=20
> Mark Brown <broonie@kernel.org>
>=20

--/Zo6fVCo17ebhilh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfywHkACgkQJNaLcl1U
h9DjHggAg7YIgVkt5+VE8ImdhV1RfQVE9jRO/a6WFkFZCMt7BS0mKepCHtBJTMSa
jjPLC6FoI8t/xIUctrqJucydEErrC1KJ4C+ok/emelfhiZmNPvJTpzNs10mtaC+g
goY9uzkQrzwJqvya2+RJbUyGOuYYn9ms9BV9FxrA+E+CPMBNky5f0z3+bQfM3bSt
jPIyXa3PeQX5X7BhBt+w8DEB53BNTbHYSKmTiDtOgcumw533fzT7YxBl1wRDMLS9
bGTT3w5elVlEIohQ/rj7O2ZLiWK3cJWD9ZATOvdiCtp+u2v72/2APEVNbcl23l8E
5H96rVnWaDmrhRbKI0PC+pzNVFTNKA==
=v2QR
-----END PGP SIGNATURE-----

--/Zo6fVCo17ebhilh--
