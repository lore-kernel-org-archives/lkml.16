Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A409271446;
	Wed, 11 Jun 2025 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645328; cv=none; b=SJXDwJ6wQzeXrpdMWSTgP4FCyStDwoQ1XRnhc3runrCDLm3ui8VGLO9nAOe3zukiZekp2WyUj4h/ZgD3Kz2NCoqyZ+vBSdAfRXUK4EnYt3IyNM2i+4FPzrNummSplD8w8KHZ7DcTDwuI0A8ub4LcsoNbE23NPO1LpAeHuVT+3H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645328; c=relaxed/simple;
	bh=t0nCjZrrmOIdzEI3W2H6cAFIv9YH1hiXrokv4lZSkFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bq+BXB27KDZfCykVGb0ZSgJI3R1Ebbd7mYQjfegp9HeHU81Db/SkskjObQTj6SYmcI4erHlAlkVwWODplx/5AM8la+duMl7JQMn1XsZHDGPPaR9YN7Auiu0dXB2jLL4GWLFK3X9WDfh+dMp/xIige4eKQIgtZU3BUx3NoMAw9MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GN/pw1HN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GN/pw1HN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3386CC4CEF0;
	Wed, 11 Jun 2025 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749645328;
	bh=t0nCjZrrmOIdzEI3W2H6cAFIv9YH1hiXrokv4lZSkFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GN/pw1HNIuoVI5ORPatzV4jaFbkWGGwDHxVVvyN6astR7cmEP37fBsX2qbxc2kJB/
	 Bc5a9xPX9r/VjFjUZsLw1sf/vK3aHtLbF9OdopsUq/0MxrPqroS6+A3NUUI48x/6sH
	 bbUS0gCNmvteUpBaErX0xTI9UCZh4qSMPLjSnZRgThFF759DzsFQiLeR5vFyA+0cYQ
	 Eo05IMSIyr4A7VhXCxWvczpk1fYUovMY7dRc5eSGYgkoZZCzmIeBxsYZMKJtz1ik4q
	 DiFe+g5JzTs4f8KJzksceou0TSlizhRuXOwz//CwYQSHtugzgeMBWh/8IdzYeGMVUU
	 4Z6L96rUltdJA==
Date: Wed, 11 Jun 2025 13:35:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeo Reum Yun <YeoReum.Yun@arm.com>
Cc: Catalin Marinas <Catalin.Marinas@arm.com>,
	"pcc@google.com" <pcc@google.com>,
	"will@kernel.org" <will@kernel.org>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Yury Khrustalev <Yury.Khrustalev@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"frederic@kernel.org" <frederic@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"surenb@google.com" <surenb@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v6 2/9] arm64: report address tag when
 FEAT_MTE_TAGGED_FAR is supported
Message-ID: <a11fc436-9952-4391-a3ec-ad359fabe8bc@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-3-yeoreum.yun@arm.com>
 <c0b4dc8a-b37c-4e8e-be2e-bc8906615702@sirena.org.uk>
 <GV1PR08MB105213A44E40741700202F7CFFB75A@GV1PR08MB10521.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wke583eSUDniqYV3"
Content-Disposition: inline
In-Reply-To: <GV1PR08MB105213A44E40741700202F7CFFB75A@GV1PR08MB10521.eurprd08.prod.outlook.com>
X-Cookie: No skis take rocks like rental skis!


--Wke583eSUDniqYV3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 12:19:57PM +0000, Yeo Reum Yun wrote:
> Hi Mark,
>=20
> > > +HWCAP3_MTE_FAR
> >
> > > +=A0=A0=A0 Functionality implied by ID_AA64PFR2_EL1.MTEFAR =3D=3D 0b0=
001.
> > > +Applications should interpret the values of these bits based on
> > > +the support for the 'mte_far' hwcap. If the support is not present,
> > > +the values of these bits should be considered as undefined otherwise=
 valid.
> >
> > The constant is HWCAP3_MTE_FAR and the cpuinfo is mtefar:
> >
> > +=A0=A0=A0=A0 [KERNEL_HWCAP_MTE_FAR]=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "mt=
efar",
> >
> > The reference to the hwcap should probably be one of these, I'd go for
> > HWCAP3_MTE_FAR since it says hwcap.

> Just for confirmation. so change to "mtefar" -> "mte_far"
> Am I missing?

I'd write it as HWCAP3_MTE_FAR since that's the thing you're
referencing.

--Wke583eSUDniqYV3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJeAkACgkQJNaLcl1U
h9Asggf9G74jgYIOfkHDfNK3jrKW+VMhCh5Ay4gcXOgt1/02Gus2G7gi7djklPJW
0F6eQXMc+QSYnd1re4GTHY8qHhrxlWxH2ezn43kW429LRMgzRtcOFxL4q/hz5kPN
KzygsgukAC/KgcU1BBGn4LwB3XDlW3df+Njo6fPA5c40yRANLAvU2khOiDYCeo5g
+lRzUfUWn6q4quqdd1S/sworrxM7Wx2tqNvdF+Ut5cbTpK37eBG3vVSRxFVlQ9nw
OYsLRMQCndarDD0iNne+XYOFAeSZGaNwUnG+I0i5PIFo0xirpVa8znXXaOK03c3d
uy+kBE31nWlQ3aUpCtwDAtwzkkNw9w==
=72/w
-----END PGP SIGNATURE-----

--Wke583eSUDniqYV3--
