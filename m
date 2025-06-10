Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BFC78F34;
	Tue, 10 Jun 2025 22:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749596090; cv=none; b=fSBwt7xeeDPnMAYFOrkJH5V7d95UEZ3opjM9eHrIi66zPIX+wFLDHJ9ahP/xVkcyS77TjFCIDdgxnAMLjodBQl6w9oBtNsBypwvnMtW9/GqRKw1h/G2XxkOS3kqCUC4qQp+cytL1QQ1MbF/Gt0MFQQYPe5JgEDLOe9vbtamw8eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749596090; c=relaxed/simple;
	bh=GjJNDRHDSPTY4qbExjVJ1cRYRVbR+Duc+V5hfDwUHSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPUbQEcQrZ6qlpxNxiEw6lgG2VJ+BNJDDdqzMD2pj6MltqiUJSFBfWbVNaeBcpGWUlahHYrCPRFPNcvBtBSjyVdOgDUpHPcoCD+eolquIyR4d8IL5dBJK3+qKEcWUgmytwBWwQ74Y/qWJTc+d9iSFLUyfN3kABZLwunEOecSo/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faoACHy8; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faoACHy8"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31329098ae8so282317a91.1;
        Tue, 10 Jun 2025 15:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749596088; x=1750200888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GjJNDRHDSPTY4qbExjVJ1cRYRVbR+Duc+V5hfDwUHSA=;
        b=faoACHy8nXPmd6kyHwn2WE7QxHyhXHfMFzX42PnpGMoPCTxhWt7jwJJMTaQB5e5MAX
         /BMX3qkGgYEtvDuzZCAyjTRHXQ6Fsh4UHE07x2M+P8AsozRdKp81iJ/yaLGRuaYOig1H
         xY6ZwXZEGacV84nx/Rz8geZ5YDP2DYnmGfncLXxd5Qq8sqaIuToSBVVjALLZRQcoC2u/
         Pe0echX9oGQ027gLelF88AVXfU4b+N8A5AyIKke/FoDG9NMKnl6xJPeCp+3+cp8VuDWJ
         hIGLs6RZOTXLq3Z0uimRRrgCnl3FgVcP4YqeMEpXulpr53GyUni1anWBqx4/qkNepvJS
         o9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749596088; x=1750200888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjJNDRHDSPTY4qbExjVJ1cRYRVbR+Duc+V5hfDwUHSA=;
        b=KkKKNPH4vdpU4UOsNqj2l5+IRjutGQcxrFt8nP9sRVNeG1m2p7oqLDlNi3KmBhpKUz
         fw3fEhepzCBMYs+qWGJk/BEyd9CNQRb7HQlDjZpRqAnpZ3leKWLzuOP9xZB7SVT8jHrP
         zTbFZExagc2tfWLKZcsIkIKTchFNBjKjKxDJQC6Fg21pcZbVI1Cdbka9zFXLdFYmaFXq
         aD1MisAQgbFHkwnTfTiW8A04ECKtAr9TEJdO3pAoLuB/vInp6fkcyQMIve3Hsjz9zpXu
         fqeZ5iT2kaw/EqrtzGntBbkz/TEl8K7j4u9M1ohCRe+Kb5kAlZC5N1kCLnxQ4XieTlZj
         o0TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKtM5u4fQqT3NoQRoO+9nDqYPANXLh1oVbdD2B+3h9byfh1gsXBuDL4G8TS3YLF80KmveM0P6s9ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrBm3N1Fka9GtXfxn3S0il2VdpVupaw8uNenBakKCggRunlYkX
	l7l0c34v/hWZHQbfHvKKs7SY3xHMcXctCmmo93NxDc7oEEGmQR7LTB3n
X-Gm-Gg: ASbGncvvB4wnSTDrSUiwdM9PMS/eQHwK9AWPTL5CAUysdjdmicZDQzIMaFgG5Fbgo7A
	Xcc3zSIk8cMDGZEFYUB8xFCn/IpB7G8JsuTiudIiCrqKG33tQfjk9IU44XO9B8J+MsOMBIEhmsM
	CXYDNE2JoLb7CMO8+kFK1rYRhCy19SqzImeFVy2KrrsX2pZhMKpNHty557yrl92K/KafISeJt7E
	GzjtLhjvV5UCGWJGMyUYvkz0x/0FxM77668yBMPQCHR013dFSJGDUE7y4HU/3+tcObHS8KVVtaQ
	TQOdPpZR7pIoPZ96xK1U/EgXXM2lQSZb6BfDOFjksd/gr6ENh8hPBAXECstowA==
X-Google-Smtp-Source: AGHT+IFYQbzGkMxnLdttdH0C0UEyAC07I8+QKLbmKT/c2gH4xa9ESZ4V8XlwVs4gBqreKC2pV2Zsag==
X-Received: by 2002:a17:90a:d410:b0:312:e73e:cded with SMTP id 98e67ed59e1d1-313af99193bmr1313804a91.16.1749596088256;
        Tue, 10 Jun 2025 15:54:48 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b204ce25sm111309a91.45.2025.06.10.15.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:54:46 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 266CF420AA82; Wed, 11 Jun 2025 05:54:43 +0700 (WIB)
Date: Wed, 11 Jun 2025 05:54:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Feng Tang <feng.tang@intel.com>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] mm: slub: Wrap krealloc() __GFP_ZERO semantics diagram
 in literal code block
Message-ID: <aEi3s7jvyPw9-SP5@archie.me>
References: <20250610092153.55093-1-bagasdotme@gmail.com>
 <aEg_HtGuJ8Q8G_s8@hyeyoo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h4oSwMBGfaZhoS6j"
Content-Disposition: inline
In-Reply-To: <aEg_HtGuJ8Q8G_s8@hyeyoo>


--h4oSwMBGfaZhoS6j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 11:20:14PM +0900, Harry Yoo wrote:
> On Tue, Jun 10, 2025 at 04:21:53PM +0700, Bagas Sanjaya wrote:
> > Sphinx reports htmldocs warnings:
> >=20
> > Documentation/core-api/mm-api:40: ./mm/slub.c:4936: WARNING: Block quot=
e ends without a blank line; unexpected unindent. [docutils]
> > Documentation/core-api/mm-api:40: ./mm/slub.c:4936: ERROR: Undefined su=
bstitution referenced: "--------". [docutils]
> >=20
> > Fix the warning by wrapping krealloc() semantics diagram for __GFP_ZERO
> > in literal code block.
> >=20
> > Fixes: 489a744e5fb1 ("mm: krealloc: clarify valid usage of __GFP_ZERO")
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > ---
>=20
> Hmm not sure what I am missing, but neither `make htmldocs` on my machine
> nor docs.kernel.org [1] list kerneldoc for *_noprof() functions properly
> (which should have been listed), so no errors show up...
>=20
> [1] https://docs.kernel.org/core-api/mm-api.html

I was encountering the warnings on docs-next (see MAINTAINERS), something t=
hat
I forget to mention when posting this patch.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--h4oSwMBGfaZhoS6j
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEi3sgAKCRD2uYlJVVFO
owTRAP0Z2dOdBEmOjXllQJg2vhWjdiMaNOfYVPFJQVFxsLLfmgD/bLWK+ZJhMWNX
IlYe4cP0wPpNHVC0fh8Lh7iBx46MqwE=
=dQAJ
-----END PGP SIGNATURE-----

--h4oSwMBGfaZhoS6j--
