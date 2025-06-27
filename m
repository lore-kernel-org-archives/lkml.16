Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86182F4A;
	Fri, 27 Jun 2025 00:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750983609; cv=none; b=u7EYoorNHJc4p+C5X3S0XLDOhtuLskN83YK1lKUpbOgTplkY7aUebpwhTMniUSqcq5DSNL1JuQuT8fMC07G2CpnumVaxfaRgTu2buiAoYux4O0RKeeD3m5WPmTV8Vi9OjpqlI+TH5SfRZ8lVInGaT2gOqqM/IXjvnD8uxKtWwr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750983609; c=relaxed/simple;
	bh=PKky7IbbIFiq2DgbdU65Z9zZBJsDd8cpZP8lF8C1OOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+V522+dIJCiHb2LSjCfhvDkkpu4/dikSVTc5gpV1Gqo9S/GwC00ma2g5WzWSfp15vQBmicUbatDe8lk3FKNJ2YrDB09q3O3+EqcIkbFbDGFXoFpitueN4EwLQuJzyapwOfJbzNOwoDWkkY47FGIpJTdTIyOWe9bji8NysFco7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+gO6oNl; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+gO6oNl"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7490702fc7cso1145579b3a.1;
        Thu, 26 Jun 2025 17:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750983607; x=1751588407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZQojmcQydldQjb4UI2zP2jf0B6n8+rV1pAko5QeeAY=;
        b=i+gO6oNl6MGR42MtVEUD3IsC91U6SAm0S2nB55nlCW6Zo0L+N9fJmgjTMmPGPrdHs9
         B0uxM1BR1EKEAL7e8M1eJy5NCb2/g2Yym3D0sWO3pqG1mOys/ToxkC75NN6rapcU2Hmd
         jUMc6jQHpO2LnYM1z2MWjU4RdwFsfZpjyXaUPRXu8MXGxq6lg8UV8DLuA+8Z4ZFIYZU3
         lcCg6AvyR4LgqXpPlH8FpyAnK9ef4h+w7KgZjhlM82DfiSuhzHGQdr6koMq5JHe/QYs+
         c2l2Ucja5JsXNXbTj1Ehh0CoZiZbIq3/5NcUtZIuDUzcDEnm5NI0yA4Uilc2Htbke1EE
         Yo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750983607; x=1751588407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZQojmcQydldQjb4UI2zP2jf0B6n8+rV1pAko5QeeAY=;
        b=UjoYXXyZM1lhfn2f/kVM703SNl7YlbarzxmLS+gv9vmfX0fXExJNo8/t344swO/kqP
         3gua9cq1VpvUHRwfFx1l5S5rcOj4FPNVb+dohf8i1SPZFoVDCEiYIoVFRHiWCOLTqeUR
         Rskf1pH+tuvRpk1J0NhrC7eaYbq2OFWGFnAVb9NHDieBEP7mZXcYvNIWs0pFFtaOqJCv
         MlX4xPLlZikMIX9Ms4/yn2AwYCIHT9UKR/f8HB2ugzGDHwBMPfQi7qP6QGVlSAeka/zQ
         Qg/jzT4Otf+g8vOX69PTLt3NA3cIPtKPjPlbtN+X4TPzNaBj8RPSjMFzMogDphLDS3Z8
         TeHw==
X-Forwarded-Encrypted: i=1; AJvYcCUNB7R61cyFWVIb9nRu9tg5y2+qgIJsvzImzzUjvX42IjlKkQs83IaKmDd7PJSu3MTB3+MtTvjR34VDRZXW@vger.kernel.org, AJvYcCWX21qCY45xCH+eJeS14B6VMHrNLCcwN+qBXn/ETsy8GAr+bu+mK4f00rko0SsdIOrpPvwNXHeW6Pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuPnE9OSvB8vdwxthrGuxwhNSLPUnIhKh63SVgtAibBy6TscKh
	W/Btg4a4heIaCTgDhu0sd5vckYUxw74+NQdjw90LcCG3hzu+mo71d9Ge
X-Gm-Gg: ASbGnct42I0o9kT//TTsvrvpGwGhMUd1tmA6PUsd/8NOcmqzN2DMyd8R8ReY6I7aXmI
	BQaA70HxTaXKpw41rRvTQn+bguXo2QXWk2mwObgIhteQUrKZw8/L+To9vVn7pZXHPNqvuE2THAH
	+w9Ha+JIMQzfOnDpEfFtgY5b4KzQiSG+C0CQ89KbBXsklCNnDe241TklwJ2vL5M6wIv9B71FpmT
	GQpe0hKA1/hgcjZxP6rKhJ90Bhu6R06opz9uVjcycPo6Jj1D5eIieBiMABrN7zjRLbJstt9t1QV
	W1U+r+jF7nVSZiJNJrqiB6bVxzferE9T9NSNJDvm77jvwS4kox2oFQsnh+Lu5g==
X-Google-Smtp-Source: AGHT+IFfcKOr44kTaqlIcQVea5gmzizTb5lvMRwigGECKk10wnTLCRW9K8fkWSfPBmdHhXrjm+JdEw==
X-Received: by 2002:a05:6a20:1586:b0:215:e43a:29b9 with SMTP id adf61e73a8af0-220a16db22amr1204311637.33.1750983606796;
        Thu, 26 Jun 2025 17:20:06 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31bea22sm230934a12.38.2025.06.26.17.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 17:20:05 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id EF60C4207D0B; Fri, 27 Jun 2025 07:20:01 +0700 (WIB)
Date: Fri, 27 Jun 2025 07:20:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stanislav Fomichev <sdf@google.com>,
	David Vernet <void@manifault.com>, Miguel Ojeda <ojeda@kernel.org>,
	James Seo <james@equiv.tech>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH RFC] Documentation: typography refresh
Message-ID: <aF3jsR6d2gC_CvoE@archie.me>
References: <20250619042318.17325-2-bagasdotme@gmail.com>
 <87wm8z8xs7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n2Nz9B8Ft9sZeJJ8"
Content-Disposition: inline
In-Reply-To: <87wm8z8xs7.fsf@trenco.lwn.net>


--n2Nz9B8Ft9sZeJJ8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:46:16PM -0600, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>=20
> > At present, kernel documentation uses system serif font for body text.
> > Some people, however, objected to it and instead prefer that the
> > typography choice must be legible, consistent, and accessible (after
> > all, the audience ranges developers peeking into kernel internals to
> > ordinary users that skimmed through Documentation/admin-guide/).
>=20
> So I have not seen the objections from "some people"; can you point to
> them, please?

None really but I feel that sans-serif looks aesthetically more pleasant
(to my eyes) on screen than bare Times New Roman.

>=20
> > To tackle the problem, follow Wikimedia's typography refresh [1].
> > For the font choices, instead of using web fonts as in previous
> > attempt [2], use:
> >
> >   * Linux Libertine, Georgia, Times for serif (used in h1 and h2
> >     headings)
> >   * system font for sans-serif and monospace
> >
> > This allows for more readability and consistency without sacrificing
> > page load times and bandwidth, as the font choices is most likely
> > already available on many platforms.
>=20
> I am open to style changes to make the docs more readable, but I am far
> from convinced that this is it.  Mixing font styles in that way will not
> be universally popular, the claim of "more readability" is
> unsubstantiated, and "consistency" seems out of place when you're making
> the fonts deliberately inconsistent...?

Because I don't have anything else to say in my mind as ideas when writing
this RFC.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--n2Nz9B8Ft9sZeJJ8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaF3jrQAKCRD2uYlJVVFO
o7dOAQCtMP/tRlf6i5sdRHW7Dg8T3Xw1LbXap5cyGYX4DiiMGQD+PcHawpD1JGxQ
a4ISmyWG33/Yrnfg+8pxT4t9CZg1kgM=
=iqx/
-----END PGP SIGNATURE-----

--n2Nz9B8Ft9sZeJJ8--
