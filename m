Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A245D3C3C;
	Sun, 22 Jun 2025 18:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750615577; cv=none; b=ktzMMI8sOMGDJAHEtjsIG0xPfJhAdtrluLPpPyplDmzeLf5ywRlfkuC5AS0/Rd1+zVULTlyXGzP0o2L0OUS0UB8CjbVVIMWBy1WPE+a7GCeTbf4m4VDvoejkJAtUljtABmzFcyuc1tgt/Xz06Q+exeQKAqBrDZ74lbiAT5DWCLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750615577; c=relaxed/simple;
	bh=G+1VV+8Dv8WE4EtqdZO2Q5kzqJq8urctAMEctkTRWpw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eqg73JmNlTwmGbiVvr+k2ftZqU2QMbCdqUl02s0EaVZ30eUPv1uFDSwPwQfTgsQqVCbXLWn1EC0q6Up/dfCC1Y+Y+2fBgKdz+daHjtXpnPwQ4yYn1RnXe+CdqO2JdBWTqSb+ChdZkCLL0+f01+apnDy4rfDz4cBMrUKrbFvfhr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCFhi6Kq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCFhi6Kq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050E8C4CEE3;
	Sun, 22 Jun 2025 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750615577;
	bh=G+1VV+8Dv8WE4EtqdZO2Q5kzqJq8urctAMEctkTRWpw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XCFhi6Kq496aOfHR+0tWDo3R9Ag9+NNYzjTdZDpWhUoYaWlJzTRr4cYTj0AeRcDjY
	 lUCO3tkB/PqEMtVVHAFk/miBPbM+jUgxmhdqQxGJAkJ+scVhw8x3R0zs6VL3J6e1un
	 X/YP0lwqL9EznIaPTe33fScZTosK2FppZl9/Z3ds0lfdrByz6O2PPm96Pw70MTiYrw
	 JTv/78J4nKGCXd8bjnHAP2dPDui2r/JHE55sRajd3IvPBhGMp5/FOm22oXDgzxYaL0
	 fYgQdW3qBFTF7rlOhyXgIMDb61POye2Bh0I/VYNKqM1tmI+UpcS1NpBdTLMv6WKzF0
	 1QTj2zMw2kJDA==
Date: Sun, 22 Jun 2025 20:06:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Linux
 Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 15/15] docs: conf.py: Check Sphinx and docutils
 version
Message-ID: <20250622200613.5ad18093@foz.lan>
In-Reply-To: <c05dd5dc-1e30-4a2c-80dc-70e8b62cc681@gmail.com>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
	<972673b0a5bf5537d47780d6f8e70ae45456e751.1750571906.git.mchehab+huawei@kernel.org>
	<c05dd5dc-1e30-4a2c-80dc-70e8b62cc681@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Sun, 22 Jun 2025 20:19:52 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> > After check Sphinx release notes, it seems that the
> > version compatibility is given by:
> >=20
> >         =3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >         Sphinx   Min Docutils   Max Docutils
> >         Version  Version        Version
> >         -------  ------------   ------------
> >         3.4.3    >=3D 0.12.0      < 0.18.0
> >         4.0.0    >=3D 0.12.0      < 0.19.0
> >         6.0.0    >=3D 0.18.0      < 0.20.0
> >         7.0.0    >=3D 0.18.1      < 0.21.0
> >         7.2.0    >=3D 0.18.1      < 0.20.0
> >         7.4.0    >=3D 0.18.1      < 0.21.0
> >         8.0.0    >=3D 0.20.0      < 0.22.0
> >         8.2.3    >=3D 0.20.0      < 0.22.0
> >         =3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  =20
>=20
> <nitpick>
> So this is what I see in the changelog (not looked into < 6.0.0):
>=20
>          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>           Sphinx version     docutils version
>           (since)              min       max
>          ----------------- ------------ -------
>          6.0.0             >=3D 0.18      < 0.20
>          6.2.0             >=3D 0.18.1    < 0.20
> 	 7.0.1             >=3D 0.18.1    < 0.21
>          7.3.0             >=3D 0.18.1    < 0.22
> 	 7.4.0             >=3D 0.20      < 0.22
> 	 (up to 8.2.3)
>          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This Looks quite different from yours ...
> </nitpick>

Thanks for your feedback!

Getting this right is not too easy, specially since not all
changelog mentions docutil version. Btw, one of the factors I=20
used when building my table were to check the release dates=20
of Sphinx and docutils. So, I manually adjusted some entries,
as changelog usually say something like:

	Release 5.0.0 (released May 30, 2022)=C2=B6
	Dependencies

	5.0.0 b1

	    #10164: Support Docutils 0.18. Patch by Adam Turner.

But doesn't mention minimal supported version.

I'll re-check and adjust it as needed, if Jon decides to pick it.

Thanks,
Mauro
