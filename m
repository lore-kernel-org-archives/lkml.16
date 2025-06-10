Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A372B1A8401;
	Tue, 10 Jun 2025 08:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545335; cv=none; b=DMw222qhhSFUweFlY5RQ8poPvtY+yBNFb0nivWOL8Z42rgugX/oNzXZADl6376eaC6g2b5cRIFEHWDjxzDlbzhh6E2n6LdtXEjLZxfYhenirFFaoPZAKPj66MU5dAWqseH/IWjBx5nYV5x6V2+QrBFeJDqY/EzqNsw/yPByCfaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545335; c=relaxed/simple;
	bh=SL9JhtT3DDxeAr5EA7Sf44Ku4ofDdJXtg3HBktEESyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ogc2IjrsCBp+uLjDfnFMWC7Gzsuhf8eoIfhJmW5hUjIygC81L7Z9EkuzsJm18NRbjbC0Zonj9glD1TnYgiZOW0hzcK4FTAa17uMnwJWES5GmzUB9u3O41umUnCPUWyQ6A6v6KGWxh8UZudbjoJNHyfq4uQb/rXcoBQgOf/2M5fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuhue5vX; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuhue5vX"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-747fc77ba9eso3787718b3a.0;
        Tue, 10 Jun 2025 01:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749545333; x=1750150133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Adyab7mK7y8FZTFYvCFrgwqWEigHl5r5FcCXAv987E=;
        b=cuhue5vXLeX81v7hF+j6N/DBCqWKPZ4EHwrW+SRkVh8E+AAudv8OGzyPCRq9yPmI1O
         bozm4v1X5QK3A1fB/eAybUOP++5gJrN0CaBeJw44aRoHpBFuObcc2U9NWv0V+tYntJjL
         1BrTTkA4tGZ6E5kEtVLC+p4iJ07opVCSgC2YFSaZsUUrsgvLMHdtLrUVPFaiGF/LDEy2
         Dc9UjbfXLospjiXOemiqrSqYfTRgcyx/2aQtPPu+4IAwWlNUNts+mQnq7zZ1G4/sFWHQ
         uFLrTfUNNdJUD46gaq8/DYLufHqj3RKeEdivvLHMITx2m/LfUVn6w2dLJBiaq2yfyniH
         tVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749545333; x=1750150133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Adyab7mK7y8FZTFYvCFrgwqWEigHl5r5FcCXAv987E=;
        b=AJVI4HfGkzDFmbKtqCEvbHKxPsXOdwrFwxD+zT+RAxV4sovAXhH27Tw0J1tUL6/UDG
         qbBGGOuFEuonfQFo3riQTAPgnNx/6dKAH6EOfCeKIUUWNgWb6eLuO/1WV6scpnbxXWzs
         weNNruAZY3DnfX460IWzkTmaANEL2yP2KUEGPgPhZjqlhB5iDsnYO4wIB0o9YtuFZ22V
         GovgzNxTwB3O0kiG5dVMAFogSw/4JJWqhT6pbt05DVDV6lGnJrdcVnY6CNry4dkWkSLt
         GHRZIwv9wlYMFSrBrH18TxqOMe6SJlX0WdCFBioOzSz6aKBCcz3yRcb5bOHbzWDpA1ot
         qUPw==
X-Forwarded-Encrypted: i=1; AJvYcCW4lw6/f1WbyPVScOm5/WeoMgVXnhh4Xog9ihQHyVWjL1SVuNBIve/wkzIxF0DZJ4MP2lsaACqmBVFR4OTu@vger.kernel.org, AJvYcCWfqgTtNGvNt/qSgrrCCtYtsEs8wv23XZmjF45MhFEPaT7Psg9UpvSnemKOM29RuJgLqrqc/aWpeu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOzAk20oCpF5lOY1n7tgoa/rffi5tDTb84Frou6mB7ybZi+Go7
	kVoQ66VkNdGxIrZIe8bAXOX0rbQLZH6+LTCWeT0UoQoV6rUpWD2d2axm1DHf8A==
X-Gm-Gg: ASbGncvvSZKiytrXq5xj333iy4VFh2hE7d4QdKelFO/nBo893OFVxovW8+tfBFZEOq4
	iZXafBeNjWgduDu9/d2L+YjpFTGasZpB8OXCExQMS8MCCcTcs4cHdVgaBXjNEGt4oHvmT53O6lA
	MCa6dq01CoghMtJd5xt5yW6DXQPKx0UemzGKo6z0UfI3e7QUIGWKBXdZqnO9BbxCfeaj1Ds0033
	aZChLMW2CMtv4HFPvoi7APAWYM3/U9MQ7c4RXC6LZAnbUC47vAAummUSPSp8h0n+YATyWTyhSth
	eqjG6g4BoPgLiRD1vRoJ9r57xKbGh5kn+ztbktqEcd9sPZuDDFbuoEeI3//HNA==
X-Google-Smtp-Source: AGHT+IFp/a3BJUfZ11EtegJLCPwKpNZ2/owGoOb3Tq08bJgJCCkw3iG0UF0qdzi7S7gLYdonMEMPwA==
X-Received: by 2002:a05:6a00:806:b0:737:9b:582a with SMTP id d2e1a72fcca58-74827f3dab7mr23442739b3a.24.1749545332268;
        Tue, 10 Jun 2025 01:48:52 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af38307sm7205070b3a.14.2025.06.10.01.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:48:51 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 33DBB4209E8C; Tue, 10 Jun 2025 15:48:49 +0700 (WIB)
Date: Tue, 10 Jun 2025 15:48:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Nouveau <nouveau@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, Dave Airlie <airlied@redhat.com>,
	Timur Tabi <ttabi@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH] Documentation: nouveau: Update GSP message queue
 kernel-doc reference
Message-ID: <aEfxcKv7pJ5L6wiP@archie.me>
References: <20250610065258.41467-1-bagasdotme@gmail.com>
 <b17709fd-7ca6-40dc-8d9c-7d3a98d9d305@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y8RoNhFPCm0EIgnk"
Content-Disposition: inline
In-Reply-To: <b17709fd-7ca6-40dc-8d9c-7d3a98d9d305@infradead.org>


--Y8RoNhFPCm0EIgnk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:34:06AM -0700, Randy Dunlap wrote:
>=20
>=20
> On 6/9/25 11:52 PM, Bagas Sanjaya wrote:
> > Commit c472d828348caf ("drm/nouveau/gsp: move subdev/engine impls to
> > subdev/gsp/rm/r535/") moves GSP-RM message queue implementation in
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c to versioned path in
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c, but forgets to
> > update kernel-doc reference in nouveau docs, hence triggers htmldocs
> > warnings:
> >=20
> > ERROR: Cannot find file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> > WARNING: No kernel-doc for file ./drivers/gpu/drm/nouveau/nvkm/subdev/g=
sp/r535.c
> >=20
> > Update the reference.
> >=20
> > Fixes: c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subd=
ev/gsp/rm/r535/")
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > ---
> >  Documentation/gpu/nouveau.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.=
rst
> > index b8c801e0068cb0..878fb1ade31e4c 100644
> > --- a/Documentation/gpu/nouveau.rst
> > +++ b/Documentation/gpu/nouveau.rst
> > @@ -25,7 +25,7 @@ providing a consistent API to upper layers of the dri=
ver stack.
> >  GSP Support
> >  ------------------------
> > =20
> > -.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> > +.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
>=20
> Are you sure?  Did that work for you?
>=20
> I see
> /**
>  * DOC: GSP message queue element
>=20
> in drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c but not in the
> file that you referenced.  Maybe it just keeps moving around...

Indeed, the same GSP docs as in v6.15.

>=20
>=20
> This works for me. Please send a v2 if you see the need to.

OK. I will send v2 tomorrow.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Y8RoNhFPCm0EIgnk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEfxawAKCRD2uYlJVVFO
o2kRAP9CJA+u5eZWn1qw86oxaYpm5u/xyz/pc+6HFOmnzwlzUQEAjpmbsMGbxIGC
fShVOwx9gI6Zig+qYWmiMGOve5PQYQ8=
=g2xs
-----END PGP SIGNATURE-----

--Y8RoNhFPCm0EIgnk--
