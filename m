Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1755C1EF1D;
	Thu,  5 Jun 2025 02:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088881; cv=none; b=jhaPjZn6+biivVilG2/Ustb6yLgQgb1T+7V42Df2WR25IAWwxE9YqmfTwq8eFmLbnREBBf/xZovCvM7hQyw47G5YwtD5GVITAALAii+4GVa5K4AeHpFDprqpKOj6n9E0KIjlxY5pJWXmmUZ9FxolsG7eb7qGQ/bsfCQR4C9GYm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088881; c=relaxed/simple;
	bh=fnHqjeoRa3loKHhYS5bX+oT63Gr6BHq+bGrhR4L6D7g=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIo3ntH/baon3kgvQ5I1JtWDEUdsshIMPH2zEJlD+Lk8cX03cqqvAGhBeCAxltaROg5aPH595FWZmtED6ex2EXjep248j350+ze79/9ts/sLnERFY7A1tSOY2pWRJQRrjJgW5ApgTuYNQLh27aAk/pshriMxVWLrcDWclvws16Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0bwDh/6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0bwDh/6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23526264386so4272235ad.2;
        Wed, 04 Jun 2025 19:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749088879; x=1749693679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4XY4QyVzfpslN+lSr0r9kDuHIIiF3VbHDAvnPwfeec=;
        b=L0bwDh/6/26vyFkC1lSYqtj1/FAAx7QFN8uQjhCa7w3glw3X2C0OxwnRaYJnYsfE3o
         DXM8XROS7rLHoPvQ8BeizF5JcAApifQzwvzAnVJV3vO5LgHxyxTR7w6qXvtXHMRKxk4J
         cD9Pusae0/FpB2dyG1ZA88TMwVM/3b7fidgaBxUGu/L+EbmjpyJvRky2IXgL2/oEavZX
         6lF7x/oS3fWGc3IGtznTEaDDT327nGjJBFTIzSdf6dIknAoMCd7TuLJydgebBGcNDdLh
         p+8/haFlfrk+lYHZRXkzhAkLSRubqtsHfmgnKIsvo2irVFY8oQ5BKLuYRgmABSLVKoPA
         YMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749088879; x=1749693679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4XY4QyVzfpslN+lSr0r9kDuHIIiF3VbHDAvnPwfeec=;
        b=J8TMaXD/aoNso2Q/lR1FUnlmblc9Z8Eb3zLlRFDPJKcFhzoWks8s1+27h4I4CJ83iq
         iWlM+8MqpLjOTaumBGIEtg3ZI0aW8qTceDQQhA2TEdBNCyN5aAXiS2TFooB9vVTWHWBz
         za9IwAuA8Pj22GeEmZGnKe1R8dSiOviT3xMAfARtIb8SZ3l3h1v4zlsl5ikYiOjkQJB7
         wwXjG8m8aePzHZPpIUrt/gWsNSPG2OOt/eUUkhyBBi37EGI407kd6M3toyV7YQeI9EZJ
         /m4AP5b45UgUZ2pYZ0mT8Tt7IIlYrDWmHGjTkNJmt8RiWnLoTpPxhArJWQ5f9qLyKHCW
         eFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/Kd/aHztu1UTqdqRLCrwBaZIVTnQ2GSb8CTzyGDki08GknsFn0rwQ1AjyzJY5aZUAQGv5PBqe9+lKIU4X@vger.kernel.org, AJvYcCXtLyLPZApQMy9V3A/hjqXDqql4NrxQ37NLjWLHVDNBi2QPOYlnOUmLzgj32Nz2gbKEoZ2Zw+ZlgBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiSxOgUSbTv8BWXbKFNZKY8ZMseL6BptVjiMyThvRwZ+QSL/Np
	A36yDopEg3G9FgROfbT8ZAhke5iLjU3TN+Ti0sbcPwukrO6S50kdnX7i
X-Gm-Gg: ASbGncuZh0vyfA5xZic/t7WjoU9Qfh/R1pOVMTHRsTYeSJMtWAQ9LD/UQAWSxJyBaoh
	gxyBCnizAUwIA9JLB3Jzwd5KgwF7ZZhRUyrGTpSm2/RM87XX7/vxNh0akw+ZtxqjlPGQTk2jOxB
	OekRKjLAa5RIKVLPy6fOeiYCOL9psFBylKwEWxTa1PLGdHEd/vidNYV3tjSzwO35oc17przaXuM
	+KX6zd8M51NYkwf9P9wPbJyBNo6ii1B+pE2xf/W3z437yzrVLQsweVvd58plTFrfHc9EnsGXwWU
	WuTNJPFCp32w4UJ0pj7UWBQMB5+GdQdynZV+ROQRSBU/ZWH3QRI=
X-Google-Smtp-Source: AGHT+IGyZy18YKprGlTzoo34XE4Q33oI40JvIwcZGv4ymlfnzos5D3EVaruPWivmKI3pyBJL2DdAxQ==
X-Received: by 2002:a17:902:cecf:b0:234:8ec1:4aea with SMTP id d9443c01a7336-235e1200863mr66986925ad.52.1749088879071;
        Wed, 04 Jun 2025 19:01:19 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb297c8sm9365315a12.26.2025.06.04.19.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 19:01:18 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id ABA104209E8C; Thu, 05 Jun 2025 09:01:14 +0700 (WIB)
Date: Thu, 5 Jun 2025 09:01:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm: add overview diagram for drm stack
Message-ID: <aED6ahMoKjO11JVv@archie.me>
References: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>
 <aDz-Pq4eMAYmzqsJ@archie.me>
 <aEBaJ5zMHfzhpdlz@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="esmnYBZSXAl4HZ/C"
Content-Disposition: inline
In-Reply-To: <aEBaJ5zMHfzhpdlz@phenom.ffwll.local>


--esmnYBZSXAl4HZ/C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2025 at 04:37:27PM +0200, Simona Vetter wrote:
> On Mon, Jun 02, 2025 at 08:28:30AM +0700, Bagas Sanjaya wrote:
> > On Sun, Jun 01, 2025 at 06:18:47PM -0400, Abdulrasaq Lawani wrote:
> > > Add an overview diagram of Linux DRM architecture for
> > > graphics and compute to introduction.rst
> > >=20
> > > Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> > > ---
> > > <snipped>...
> > > diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/i=
ntroduction.rst
> > > index 3cd0c8860b949408ed570d3f9384edd5f03df002..a8d3f953a470180b395ec=
52a45d0f3f4561424e0 100644
> > > --- a/Documentation/gpu/introduction.rst
> > > +++ b/Documentation/gpu/introduction.rst
> > > @@ -14,7 +14,45 @@ including the TTM memory manager, output configura=
tion and mode setting,
> > >  and the new vblank internals, in addition to all the regular features
> > >  found in current kernels.
> > > =20
> > > -[Insert diagram of typical DRM stack here]
> > > +Overview of the Linux DRM Architecture
> > > +--------------------------------------
> > > +::
> > > +
> > > +        +-----------------------------+
> > > +        |     User-space Apps         |
> > > +        | (Games, Browsers, ML, etc.) |
> > > +        +-----------------------------+
> > > +                      |
> > > +                      v
> > > +        +---------------------------------------+
> > > +        |    Graphics APIs   |   Compute APIs   |
> > > +        |  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> > > +        +---------------------------------------+
> > > +                |                   |
> > > +                v                   v
> > > +        +---------------------+  +-----------------------+
> > > +        |  User-space Driver  |  |    Compute Runtime    |
> > > +        |  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> > > +        +---------------------+  +-----------------------+
> > > +                |                   |
> > > +                +--------+----------+
> > > +                         |
> > > +                         v
> > > +                +-----------------------+
> > > +                |   libdrm (DRM API)    |
> > > +                +-----------------------+
> > > +                          |
> > > +                          v
> > > +        +-------------------------------------------+
> > > +        |     Kernel DRM/KMS Driver (i915, amdgpu,  |
> > > +        |     nouveau, etc.)                        |
> > > +        +-------------------------------------------+
> > > +                |                       |
> > > +                v                       v
> > > +        +----------------+     +-------------------+
> > > +        | GPU Display HW |     | GPU Compute Units |
> > > +        +----------------+     +-------------------+
> > > +
>=20
> I'm a bit late to the party, apologies. I'm not sure how much use there is
> in an extremely simplified diagram like this, least because it's really
> incomplete and leaves out the entire display and compositor side.
>=20
> My idea was that we'd instead link to the large pile of introductory and
> overview talks further down in this file, if people want to get an
> overview over what drm does.

So the stub that's being patched here can be removed, right?

>=20
> If you want I guess you could add some links to the relevant wikipedia
> pages, I think they also do a fairly decent job of explaining the big
> picture.

What articles?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--esmnYBZSXAl4HZ/C
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaED6agAKCRD2uYlJVVFO
o+P/AP46+k76LZr5ysuDahlolJMYUhTpQvrwrM4YWtWsu9yU8QEA9v9QEfg1I8Ew
mwig43hchoMKvLYr3f/QQu4dFHZ1fQ0=
=capg
-----END PGP SIGNATURE-----

--esmnYBZSXAl4HZ/C--
