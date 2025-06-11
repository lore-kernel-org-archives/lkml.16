Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE50283FC4;
	Wed, 11 Jun 2025 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642730; cv=none; b=Uv03F6ZUBT2Wpe1DLcvjQaZhj8Vjov7MetHsL6CKDDn/drvkPXeBcN9j0yaanVFlTcQJAtq9wDNovrplh50kZikx7FxZE2daNAmNnP/jUvfpkyjnPh1IF/3hIVQyJMqaZL76nlJ4N98uAfaPfcAsi8WCAN/xwViscpFDfnhiWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642730; c=relaxed/simple;
	bh=yRUOxSzAEsyPznAdZauQ9KUp0U+dAFLZRw5w7dRb1dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjGDRaG9C78Tfd/D8aaJJJ0NswSOpWMdA+4DS5JRnwo2o2akz/cGQET0VcivH4pyPV57TxTikSfeUwjJkMflGhlCLUXlVGmZOUmLtWlIBELyskea7ByU1E/swEiIR/2y6rDLd9/cteL7XVuZqwHsiSk9KXhNiTOJ39vW/yIgwhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/SNwwcB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/SNwwcB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2839CC4CEF1;
	Wed, 11 Jun 2025 11:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749642730;
	bh=yRUOxSzAEsyPznAdZauQ9KUp0U+dAFLZRw5w7dRb1dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/SNwwcBNVy9WtNXlS+ukaNk4kvWMnm+0H2icsJm2l8op+95XwndnLLAAdaGIHSDs
	 y/TY/N+jwL35zg3VLajcV81s46l4LtnR0wOAy06FSGB0YU/pzWYq7j3rFnm6C83bsb
	 RJadRfuSGrqtsWccFPDmg7mmc6NGV6c10ToYL9HY6AZIZ0ERpfISEz+YKHS3zGuf0V
	 +kroL4LlvCBXC8yB8BkvhVoiHpJxBaejoyeAmGmVognLbg3EWqBvTCBQYuRN0c8x6b
	 KUNQ8lH25jzqLtAnXacwSb+WAY+UfWV8oxKC3GEfOUvLsFXwv0sil1+VfUTSKFpwoT
	 xVgS5LKryILQg==
Date: Wed, 11 Jun 2025 12:52:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 5/9] kselftest/arm64/mte: check MTE_FAR feature is
 supported
Message-ID: <916e2064-efa9-4b69-b561-51b0378158c0@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-6-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="akue2bSXBTy4Umo7"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-6-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--akue2bSXBTy4Umo7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:41:03AM +0100, Yeoreum Yun wrote:
> --- a/tools/testing/selftests/arm64/mte/mte_common_util.c
> +++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
> @@ -6,6 +6,7 @@
>  #include <signal.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> +#include <time.h>
>  #include <unistd.h>

Not sure why we'd be including time.h here?

> =20
>  #include <linux/auxvec.h>
> @@ -26,6 +27,7 @@
>  #define INIT_BUFFER_SIZE       256
> =20
>  struct mte_fault_cxt cur_mte_cxt;
> +bool mtefar_support;

This is a non-static variable so won't have a defined default value...

> @@ -273,6 +275,7 @@ void mte_initialize_current_context(int mode, uintptr=
_t ptr, ssize_t range)
>  	cur_mte_cxt.fault_valid =3D false;
>  	cur_mte_cxt.trig_addr =3D ptr;
>  	cur_mte_cxt.trig_range =3D range;
> +
>  	if (mode =3D=3D MTE_SYNC_ERR)
>  		cur_mte_cxt.trig_si_code =3D SEGV_MTESERR;
>  	else if (mode =3D=3D MTE_ASYNC_ERR)

Unrelated whitespace change.

>  	if (!(hwcaps2 & HWCAP2_MTE))
>  		ksft_exit_skip("MTE features unavailable\n");
> =20
> +	if (hwcaps3 & HWCAP3_MTE_FAR)
> +		mtefar_support =3D true;
> +

=2E..this will only set mtefar_support if the hwcap is present, leaving it
undefined if not.  If you just make this

	mtefar_support =3D hwcap3 & HWCAP3_MTE_FAR

that should avoid the issue.

--akue2bSXBTy4Umo7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJbeMACgkQJNaLcl1U
h9AQegf9GTZEtRZRq4VmKPmCvxZbca11FXmJiCJXXo6fBei39grcVd813PQRHtP0
4T87elMNY80ujcy8ezzOV84yn0gKXeVGxIdKXAgKoZJj3xtQvKOs8Nvpa3l7XRjX
N9dGiKEoHwLAWWUGcyyzWIq6mUDVdXpqbV42FH934pnPfSlqv87fQUcP2bO72NB4
3NvtdC34CgDvoE2VhftMgBw0tLXo3qX55Vg4otBsrb8xjNzMbPDQzj2EenzdndIG
fIbbH1BRUjox+zP8fCXiHT/z2h5XV0b3sA+qudODfkZa3SPr89R4kDI5+sY5Bia1
b3cPtWg1yqrTMk393FYfLdS3kL93fg==
=THva
-----END PGP SIGNATURE-----

--akue2bSXBTy4Umo7--
