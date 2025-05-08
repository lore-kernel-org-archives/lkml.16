Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086E2253953
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714248; cv=none; b=ZYThjVMUAHLS+pLd5zsydz2cBvT1AfwyNYXuoWUYx90PFADbbwfT2PZ29uuNRFU4mjPeUsEAm0eyrj0t2m06MulzSQGVgbgcx9fR0hCkeZNB0DnFZzwzQq+tBFp3Sy/LFnK2PY50SiAoxbuqe/PXsOUfSRkXYrpI5OInXqyGFa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714248; c=relaxed/simple;
	bh=hs7kf43kgJgGhkPDb3YEryLJjl7hpWdhZ2J0A5gnOaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdRbgYQQdHeMsyS6Mmc7qBtyj1i/l0KwN1TEDkwNpZ1IlSdPmSsSHY5nwcbtlhFDBlfJ5oL1pHYSSmh5ROme/iEzhFN2z//KQEYqJfD9lIzqMjGmwUSSjR0gUxJDREROuhH8BNrw4t3ZVrdhWBbifToE1DgDq3sQYSBc1tFtfTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swGD1fVr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swGD1fVr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB5FC4CEED;
	Thu,  8 May 2025 14:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746714246;
	bh=hs7kf43kgJgGhkPDb3YEryLJjl7hpWdhZ2J0A5gnOaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=swGD1fVrjIOA88oPXwaBBDwCwyezYItH+173qKxwxQN7PYeC1Bo85BIJILt+XZ5iI
	 4vF2ZyyxaYbo9ccHLYQUzEUc0NhVCVIKGl0hm2X2HBxNCHddagIFTUPCwvPx1RZ4nH
	 Sayc58uHTc8X60Aj2ikJZoCzEbKH34rGf0xYQui6C/g74RakbwA7D63xrk2NgMX9Lw
	 9ZbJc8fOW/pPGKb4jIFsnoqaL2exByWNxjsWWsWdlFDaqB6cuA0G87g1wia27Crcoi
	 gSM+pvZJ04WJj8m5sTCnwLAvJdgEZ2Te1CSdn06aptn24kBi0q3zvqlqqFxzwHjWKK
	 7503fPkZZ7ohw==
Date: Thu, 8 May 2025 23:24:03 +0900
From: Mark Brown <broonie@kernel.org>
To: Florent Revest <revest@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, catalin.marinas@arm.com, will@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, thiago.bauermann@linaro.org,
	jackmanb@google.com
Subject: Re: [PATCH 0/4] mm: Avoid sharing high VMA flag bits
Message-ID: <aBy-gy_fK8ohNUKx@finisterre.sirena.org.uk>
References: <20250506095224.176085-1-revest@chromium.org>
 <aBoP9ILEv-z4bRAQ@finisterre.sirena.org.uk>
 <CABRcYmKqCVn7NbrXocyzmYif_ihkeOCvPHZ+jxMi3OPWs6EiTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3G+aMXgLa2YFDWGN"
Content-Disposition: inline
In-Reply-To: <CABRcYmKqCVn7NbrXocyzmYif_ihkeOCvPHZ+jxMi3OPWs6EiTg@mail.gmail.com>
X-Cookie: Well begun is half done.


--3G+aMXgLa2YFDWGN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 07, 2025 at 03:09:50PM +0200, Florent Revest wrote:

> I just want to make sure I fully understand the point you're making
> here, it seems that you are suggesting that 7677f7fd8be7
> ("userfaultfd: add minor fault registration mode") and ae80e1629aea
> ("mm: Define VM_SHADOW_STACK for arm64 when we support GCS") came in
> from two different trees and independently chose to use the same bit
> around the ~same time, is that right ? And that a conflict would have
> appeared when they'd eventually get merged into a shared tree ?

> I don't think that's what happened in this specific case though. As
> far as I can tell, the former was merged in 2021 and the latter was
> merged in late 2024. Also, since the hunks got added in very different

Yes, indeed - I wrote that initial reply before I saw the actual change.
I wasn't expecting a conflict but rather that what'd happened was that
the bit was allocated independently in two different trees and then due
to the way the allocations are scattered everywhere no conflict had
flagged the issue.

> parts of include/linux/mm.h, I don't think they caused a noticeable
> merge conflict. But I agree it would probably be preferable if these
> cases would cause some sort of noticeable merge conflict in the future

Putting all the flags somewhere in the vicinity of each other would make
the whole thing much more robust, or having some build assert for
uniqueness.

> I'll quickly respin this series to address my typos on patch 4 (sigh)
> and add your Reviewed-by tag but just to be clear, my refactorings in
> patches 2/3/4 currently focus on using VM_HIGH_ARCH macros
> consistently, to make it a bit more obvious to a reader if two
> features choose the same bit. But maybe what we would really need
> instead is a more obvious way for these bits to be mutually exclusive
> and to cause merge conflicts if they get added through independent
> trees ? For example, my colleague Brendan Jackman suggested using an
> enum for VMA flags bit offsets but I'm not sure what the sentiment is
> around that.

I think we need something here, although it wasn't what actually
happened here the potential for the scenario I mentioned above to occur
remains.

--3G+aMXgLa2YFDWGN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgcvoAACgkQJNaLcl1U
h9BY0gf/dFflr/U3vGpugb7MR90AC1d+1+r2r6ToKtp08WD7Q+Dqe0+tiWFwAwXm
5CbrPisJAZxEGWoKrTS2QI/q4fwBcKKaMZj897g7XqB3703bieY69nkScl1ibZkj
TxffPqbETz3wMdIxmhwAoryJqUFza4Vr/DjqG7gHbHRRgOb/rZebckwXnym6xR8A
8hP4fzSkF9Soti1v1djWf0Ni/R+B4JhNalBPWdoF3gbagH+Ev82IF/RVhL6SCeLe
s2HhMNN1iYXvDsCXpkL7Gu95jFhFtcKSVfxqzBRXLG1HOT9o64xna4mze3AitMIl
+XsRPhevIWCvICeM0z8SnfscVzgb9A==
=+kmo
-----END PGP SIGNATURE-----

--3G+aMXgLa2YFDWGN--
