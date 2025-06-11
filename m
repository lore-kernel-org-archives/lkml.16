Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7531201000;
	Wed, 11 Jun 2025 16:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658662; cv=none; b=FnzHX/Ofsj4Cy79EjDb8U59awKCJ4S5CPXBIMfBwjXLQycyi4pASY+3p7e8r37IvrD5OaOvakfXqFRgZlvu/ra1y/MJGjfH79S2b/RwjOFufC0CjmpcoVPnAMrGaLGkXdHq00XiUpH7JOjlS4OG6N9Mn36dOYzIRy5Pvme/m6hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658662; c=relaxed/simple;
	bh=FraoX4V3TAqQuBkvIAxSNPXL4fMoaDR64I9fTU/5cwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8vRKZb0xTJvq1AGwEkMb4c5HKOJXJfkmwMxMkpXj54hrvbCVnUa5lKcjt1eOqrdatywHmCFbvyVoZsxmLMpTdXN4UQUjSRF2owqywNJbxoUjdFPyJ8OD6j0c3wWgBnvP3vz0wnGYnFlEu2sbn7JLNGUlMMBF5eCcKc7mgnQzbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TiCb9CKK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TiCb9CKK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0DFC4CEE3;
	Wed, 11 Jun 2025 16:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658661;
	bh=FraoX4V3TAqQuBkvIAxSNPXL4fMoaDR64I9fTU/5cwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiCb9CKKjnJWcrc+xA/1bEw5YOdWPb2cv1RC46vyQy/X9cUVZXYVrcZqBB7R08Ntc
	 Q6ohhw6Ulx+0D3GMsjRQX0xJL1DHPu595b5Azao9iu6h2Sv6wrS4Sa/62oVyDdMygm
	 WCN4bnJrZ9BOQkakZ+GxBA6ciFmpMWUcdZeubY6F5TObW3w27gXoljQxMzdT0oiFqb
	 KPycUteZSos5uewBlje973p3ib74oIRVG5w+x/pE64NSZqXOrgp4RSbGzl47uZKEtP
	 4uwE+EkT/GM20qgkL3bvG2/9YE9HXBksfPQfqTzXEPEUkMyhIqxzNHj/hAJrGwKpWF
	 0OD9N2Zeaal2Q==
Date: Wed, 11 Jun 2025 17:17:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 2/9] arm64: report address tag when
 FEAT_MTE_TAGGED_FAR is supported
Message-ID: <d93452bf-7296-47fc-9d48-44c390cb5080@sirena.org.uk>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
 <20250611135818.31070-3-yeoreum.yun@arm.com>
 <9a78c058-2aeb-43d8-94f8-987507a1a9a3@sirena.org.uk>
 <aEmg9cNGAzqsrTd1@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AcPDYuBXDOqguWX5"
Content-Disposition: inline
In-Reply-To: <aEmg9cNGAzqsrTd1@e129823.arm.com>
X-Cookie: No skis take rocks like rental skis!


--AcPDYuBXDOqguWX5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 04:29:57PM +0100, Yeoreum Yun wrote:
> Hi Mark.
> > On Wed, Jun 11, 2025 at 02:58:11PM +0100, Yeoreum Yun wrote:

> > >  	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
> > >  	 * for tag check faults. Set them to corresponding bits in the untagged
> > > -	 * address.
> > > +	 * address if ARM64_MTE_FAR isn't supported.
> > > +	 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.

> > Should that be "are UNKNOWN"?

> Otherwise in here mentions the case when ARM64_MTE_FAR is supported,
> So the bits 63:60 of FAR_EL1 are "not UNKNOWN" but I write it with
> KNOWN.

Ah, I see - KNOWN looks like one of the specially defined architectural
terms from the glossary of the ARM since it's all caps but KNOWN isn't
one of those words which was confusing me.

> Do you want to change this to "not UNKNOWN"?
> or Am I missing something?

DDI0487L.a D24.2.43 does use the term "not UNKNOWN" for that case so
that'd work like you suggest, or some other rewrite to use less formal
terms.  Like I say it was specifically the use of caps.

--AcPDYuBXDOqguWX5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJrB4ACgkQJNaLcl1U
h9BYHgf+Iit2rwd3yHK5WEV9aQ3ItTDeP7YyFQrmZUxPDi9M1hxYKXvHUsLtyaWf
WYnwjrzkM8ykmhzQonLE+ecQDd1wEk5Z08CBZHH0ut4EmVt6hjf333uXFF/s7jKY
YPxMmtGvzK3hoeqXUvKKnaRZ/3ZDYOjFTUGLDCf6SuZDCF5/J2KlXNkM4WgNn+T6
dDXllbnC/+SU5PBk9fEYG43hyEjsnkT/qAAdgomLTyzg/eddrXWSX3E0xEHOU/Hk
fGSSBTKZB/uKky6wHF+pVF6Gs65UyZ5NFj1bnJAN+AoOIU6GHrifwPvknwinIiUv
GKv0mQwOeqGrzaLeRineWNxPckGr3A==
=QnsX
-----END PGP SIGNATURE-----

--AcPDYuBXDOqguWX5--
