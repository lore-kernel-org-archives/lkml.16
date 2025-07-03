Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC5A29B789
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540056; cv=none; b=nq5EqTP5KW5xlpEktHHrHZBWHguAy/0H30iVhe0EzVvuRQb3r8pVNqJ5/1JtkNJhfxbOBq4QynR8/MToVT3S1YevUZkQeEC2r0EfPLrZ5I/vZSAkrg/t8pxAn89dWaFjJ/ptk7ngFVqp0e6+8pkyV+yq7A48D6bvmgmfzs7uqUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540056; c=relaxed/simple;
	bh=yhqf778x7evxWkPy2PResuLXFNoLXkJKA+P6kr0dXgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nw1tVh6jElYkBZnJYl4jpeU+ntQnUS23+ZPPJP5eBIyC4zPVtb22YpxStzYIFnrDD8dBHKa+LG+BthfOAxLSl0VPSQrbCIHw5gmSmo9hvzfqGZS+4HMZdNsq2gDxJqcPLPWO7aIg+FDBSfmZ24uwT4+hL9s7RHCVHmQHNP+3qpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o+m9Buwr; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o+m9Buwr"
Date: Thu, 3 Jul 2025 12:53:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751540042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zn3SDbZKLdlpO1kUg+yPtTSXi0UwiOsun42rGES+Wtw=;
	b=o+m9BuwrLFxFAS7r3WLX4Q07bsmcGsRgcsEsLz+64Wj7hS7vGCq1MdqeiKNz1XZNeB1yAX
	fwxWp7NYC1PSemezw14FG4snkIUHxgdRSyYA4db1syYyV2qDFeTztuQT/md0TGYvxvl2QU
	V7aRbczXsRrW14zILaa6sr8NPCl8uwk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Building Debian from source spit out some warnings...please shed
 some light
Message-ID: <20250703-offbeat-hound-of-tenacity-ceb047@l-nschier-aarch64>
References: <aF8f_3xbnXy4Vibi@debian>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HzGfVSfzp6TgoaAt"
Content-Disposition: inline
In-Reply-To: <aF8f_3xbnXy4Vibi@debian>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT


--HzGfVSfzp6TgoaAt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 04:19:35AM +0530, Bhaskar Chowdhury wrote:
>=20
> Alright, I was doing customary kernel building via upstream source and co=
me
> across these warnings .....
>=20
> dpkg-genbuildinfo --build=3Dfull -O../linux-upstream_6.15.4-00002-g484450=
2d6635-1_amd64.buildinfo
>  dpkg-genchanges --build=3Dfull -O../linux-upstream_6.15.4-00002-g4844502=
d6635-1_amd64.changes
> using Dpkg::Control::Fields::field_transfer_single() with an an implicit =
field argument is deprecated at /usr/bin/dpkg-genchanges line 245.
> using Dpkg::Control::Fields::field_transfer_single() with an an implicit =
field argument is deprecated at /usr/bin/dpkg-genchanges line 245.
[...]

I cannot reproduce the output you forwarded.  I tried it with this:

     sudo apt install build-essential git flex bison lsb-release debhelper =
bc \
        cpio kmod libdw-dev libelf-dev libssl-dev python3 rsync &&
     make defconfig deb-pkg -j28 -l28

and I am getting this:

    [...]
      HOSTCC  debian/linux-headers-6.15.4/usr/src/linux-headers-6.15.4/scri=
pts/mod/symsearch.o
      HOSTCC  debian/linux-headers-6.15.4/usr/src/linux-headers-6.15.4/scri=
pts/basic/fixdep
      HOSTCC  debian/linux-headers-6.15.4/usr/src/linux-headers-6.15.4/scri=
pts/selinux/mdp/mdp
      HOSTLD  debian/linux-headers-6.15.4/usr/src/linux-headers-6.15.4/scri=
pts/mod/modpost
    dpkg-deb: building package 'linux-headers-6.15.4' in '../linux-headers-=
6.15.4_6.15.4-2_amd64.deb'.
     dpkg-genbuildinfo --build=3Dfull -O../linux-upstream_6.15.4-2_amd64.bu=
ildinfo
     dpkg-genchanges --build=3Dfull -O../linux-upstream_6.15.4-2_amd64.chan=
ges
    dpkg-genchanges: info: including full source code in upload
     dpkg-source --compression=3Dgzip --after-build .
    dpkg-source: info: using options from src.bookworm/debian/source/local-=
options: --diff-ignore --extend-dif
    f-ignore=3D.*
    dpkg-buildpackage: info: full upload (original source is included)

Thus, for me, everything works as expected.

Tested with v6.13+, v6.15.4 and v6.16-rc4 on an up-to-date and minimal Debi=
an
bookworm and Debian unstable.

Which version of dpkg-dev do you have installed on your system?

Kind regards,
Nicolas

--HzGfVSfzp6TgoaAt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmhmYT4ACgkQiMa8nIia
bbhCew/+KUZpXJT930so4kTMrz8/j9W2XdxBcLYPcFH1Q4DU4gMIK2myfTYylORX
AJ7i8Vmz99EFltbNnCQ+IMNE2qOozlkdiWb1GJYcmgU90wMb8LSRTdE9lw5IIZW8
Isrxg9NwVrXJgZaUJm1/JD/DfuBtC5m/eUsDxRiVGACjGJxZb5wDmBcOMK4sA33T
RW0EDFluvwe5EqoAGAkmsPAchMU9iSqMKv7ycD3K+1hsLu4GMA4OSHqLPv8028er
HShEjvFQ/OlIebTbsXp6EYfydGwx/eStMiHX4WxF9KpcfvV/bl9SSUqV5o3Nd6Ti
aecKP0/3Zc8BiYSTxerQF7VzviF4cUUyZwbl6g7AjzVv6eixHllGkbiWaUiSATS6
KzwKv0e//HYngabdvS5ISwxHKSy1BUrLnc2HLy43QT3XFx1Ht9tH7RWbevCAESy2
nbi3htpW4cb1zQj6nQROhTin1GCqDAmYtS5B+stws7V+p+GYD5PA3hHrt4A0tpzS
f7Btr+hAqG2KIF8C3LbNrAQQyf0nn2wHxCvgTwLcfbWe26sjHIPTB+hGVv6nMbn7
D+JErfRisdEGgjRFYvJJLFqODpzzBfPf/jTFZjzK9SM9p2T1zCOZG/OnSoud5PX7
Ruvqy7KKnnkk8Kwati1LfkRfyHyOLpsyxpYkpub2DJflvIpIEEA=
=62kA
-----END PGP SIGNATURE-----

--HzGfVSfzp6TgoaAt--
