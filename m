Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA9F1FFC55
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601623; cv=none; b=CV4s557Nsw6P4YoZUZ7EXyL8C5bcATT13jWYEQINl2TbqzPnSH6pyU/3EbE5AIlJJ8ewN9kpVDMhUyZW9q0kpidDR/67j6qXJh8QE4T7rEd+xLRSDab5NE6znZhwISJZGUHt9jOPjAHgvSnYXDzAemIOoeUnhHeCjyT/XrbjrIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601623; c=relaxed/simple;
	bh=c58F+QaXwUKRmiF3JgG7XE2wJHv/Kt46YXIMky3LTPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVi1gsNF2b3ORgMEwctoSHMdmtJ1EVI5u0xNJlVMotWYVCIDe/OquxkgJ3SmvgqBh776MI443naa3DxCyDD5DodCTCfBWCGP/0n1CHQD3zO3zM1wwZPAHZW0WwUQ3PPwD+YCjJtFmWlTQv0uAfEus/m1OHMuzQa+mSVbJkApZgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Opu9M+lg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Opu9M+lg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21644aca3a0so108817065ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 08:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738601621; x=1739206421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e/d4YqkcQ1AIMsQCiK36w7Q480dfLOzuiJQ38Uik4jA=;
        b=Opu9M+lgVLcrkALZPzTKX2eLYrSJ6IFFFd8MAn7oIR0XVLyM/p1g/0gjTueRw1BRoP
         VKCPlKM1ifi/uwl5THnRkWFYfUXpISqzeJDqTrXwZXyH+zseNSKq+VQZMd80N8O5d2CP
         N4NBGeGPvtkoYHL4NirW7rYatfVgRaK/cCk/lJG3sKdxYTXfpkrQyx8U/R4swyN0eNsm
         4hs0DJSwAHBshC3jiMVSfQ/eVmXaIVVuYuHrP8xvALJBh9AgQXnIwvuFsp3CSjmUrv/w
         QxNaUS4BO7j4hgP9zw5YvfmeF3jLl7ZJxHnodQS84r8sjVW2Xlg1qCwPx1azgxGXunKS
         C5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601621; x=1739206421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/d4YqkcQ1AIMsQCiK36w7Q480dfLOzuiJQ38Uik4jA=;
        b=cqTxUDcQOuYBikW1XRQgJLnaE28VDePEgqazmzWsQubbeELzyTo6N/UMx59dK2M6vT
         ZBKMkFNnnHE8b191TghVMWfiTYScM+Sys2lBVAmGmKV2yFwfedk0yOfajV+/g4TRTfmC
         OS7UF94njVSMusG6zP5/IJnN3gzNxSYkMFmKQmLNvq1ZlYEzPnLb5T9KVWixYxkK16lP
         5rMR4J1TVfIcFaLFA/r8QhR+tT/4om4icT46q7al3Ecmb8PZc7iOGtcy6mWV1Dajak4q
         yvSjsT18wFMP78AXkmXAatYC4qOkJP9qIVHRzvVYWjOI0vPtpgHo6SusTtvHuL9koEAJ
         liuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT63RURITakKTXhYxRPH/TyFxXq/ygHDnWbbCbDYsKTaCyZ3ZVuhweDnKv3kfRcHWt+s39T1Bm9HpxC3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLNkuwK47zFM04QmLxgVnn0TZtRl3IV0Sxn+kjw5nd6AHI1HCA
	IjV22Jzx68rSD10WftVHZrmA9QvBefJN7H9OKuuHd1TD+OJvCyPFLel0GH7w6g==
X-Gm-Gg: ASbGncuKl/QPl+0lZJhT56esAUVN3mvoqUHkM2NRQcWhD1jjbla9LUI9j14844rPkTM
	OMnAe7ZhQ4+pxRnvRfmPQRYy6VO0ex55IBGX16ul3Bv/8aWhFKANUw29+YOtjurAwLyhmtU8weW
	T4QSw1Vp2sw6JV32k71uhXwhs7/oPIjxiWXqreKEt0+PdjddNaToXfT0tKmGsVJt3rgiD65chGt
	ovZ0zEmdUXUfiXt5FKW4uwylYreI6x0x3UUnnpfaqj2p0rAFGwiEQP5iO+dmQ+KMcbt1vq27Ksl
	3JkeiANBxCO6FpAfUcsYccsfy3b7kpo6Y5Hm3+GxfZ6EQLo6fg==
X-Google-Smtp-Source: AGHT+IFdJOSnpkQuRkfcGwvGUcDocSPWu16Ur+hRWJYZmTC3T4ZgPnF+ZwmcqZ/dlVy+CzA0etjR0Q==
X-Received: by 2002:a17:902:ccd1:b0:216:4e9f:4ed4 with SMTP id d9443c01a7336-21dd7dcb2a9mr414185175ad.36.1738601620791;
        Mon, 03 Feb 2025 08:53:40 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33246c4sm77992915ad.254.2025.02.03.08.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:53:39 -0800 (PST)
Date: Mon, 3 Feb 2025 16:53:35 +0000
From: Benson Leung <bleung@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>, heikki.krogerus@linux.intel.com,
	abhishekpandit@chromium.org, dan.carpenter@linaro.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	akuchynski@google.com, ukaszb@chromium.org
Subject: Re: [PATCH 1/2] usb: typec: thunderbolt: Fix loops that iterate
 TYPEC_PLUG_SOP_P and TYPEC_PLUG_SOP_PP
Message-ID: <Z6D0j3EphmwMoWj3@google.com>
References: <Z5Psp615abaaId6J@google.com>
 <2025020328-lunacy-commend-9f52@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ytJCkdmVGeJhU5sb"
Content-Disposition: inline
In-Reply-To: <2025020328-lunacy-commend-9f52@gregkh>


--ytJCkdmVGeJhU5sb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, Feb 03, 2025 at 04:18:28PM +0100, Greg KH wrote:
> On Fri, Jan 24, 2025 at 07:40:23PM +0000, Benson Leung wrote:
> > Fixes these Smatch static checker warnings:
> > drivers/usb/typec/altmodes/thunderbolt.c:116 tbt_altmode_work() warn: w=
hy is zero skipped 'i'
> > drivers/usb/typec/altmodes/thunderbolt.c:147 tbt_enter_modes_ordered() =
warn: why is zero skipped 'i'
> > drivers/usb/typec/altmodes/thunderbolt.c:328 tbt_altmode_remove() warn:=
 why is zero skipped 'i'
> >=20
> > Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternat=
e Mode")
> >=20
> > Signed-off-by: Benson Leung <bleung@chromium.org>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/usb/typec/altmodes/thunderbolt.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> Please always use 'git send-email' or if not, manually thread your
> patches so they all show up together as a series.  These are both
> individual and as such, don't play nice with tools.

Sorry about that. I still need to set up my git-send-email workflow on this=
 new
cloud workstation, and I'll get that rectified for next time.

>=20
> I'll try to manually handle them, but you owe me...

Thanks! I'll definitely owe you one.

>=20
> thanks,
>=20
> greg k-h

Benson

--ytJCkdmVGeJhU5sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ6D0jwAKCRBzbaomhzOw
wtdjAQDFIFP3kN6znPHOCe1ZKG3eK9rCFV4h9ndZJYwHMfddBAD/eSwUOe1C6d0B
OsbqfpBW8MJSuLXFplTtltFSQnFFQQI=
=pDi2
-----END PGP SIGNATURE-----

--ytJCkdmVGeJhU5sb--
