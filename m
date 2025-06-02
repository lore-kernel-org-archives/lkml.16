Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2911474DA;
	Mon,  2 Jun 2025 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748860119; cv=none; b=ZeMx0JzAJPWNfOvCnTbJTG9HAFMB+tNQ9/MoDhIEOWNWRkxYL0JQhDqoB5yAcauhfsml/JsZdBESKI4XxaHa/eMweZJ4fXXRUxnqGaiFHCJ32D4uZbCu8CYfPEr4Bg2C5HcHABi9a8GMAckP/35/RFWBTezfmi5LB5jpUv3jRmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748860119; c=relaxed/simple;
	bh=OuYd3hOfZThZU0t6WFn7pLEFQFhkMYGVDnq/qUDfuL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5Q1zHMyaE8WJ/cJyl110OEXmLSHmsLwAgaScfDZCyZG1oHdWNh6XBWufXkCigJ+WBBXQaeexznFMGhwv4tXSH+Oi+gs8AyYoVmGANcMPRnMuOQCEehWkoTn5LuLSDiYmWe5xU85V0UFADfNgx3sh3vbyWcccJYIwZjtwwAL7sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgHSNsXQ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgHSNsXQ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so3620116a91.3;
        Mon, 02 Jun 2025 03:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748860117; x=1749464917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OuYd3hOfZThZU0t6WFn7pLEFQFhkMYGVDnq/qUDfuL0=;
        b=BgHSNsXQairP+05/sqMjDXTVOegTZBvtc/+6LAZN2HBNGJrmCArzvCkkzrQWkiV1dT
         Us8tqPO10zgaMTQU6Yj+rqa5QaqJRplpfvLNbQ1beftfJH00/2bqpZ+VPb3sTOxLcwk8
         Ubj6h03w8d2dFZggtia0VdLwsjCrrkZNPlZzUGS4JxozZvq/99Lgx+w65gnelH3kJCUq
         KppcJr0gI1bacc26ECJOozig/9ABv4x+PxLmCfemm9FD8gTK5Tq8vubLG5IJFj9MtwS3
         RDTaZ8e90hivQ3qdY8u+JW2dX5oPa9G1LAtoDQ2drCpW2rVQSnoHzoUp3k4pbEwCmin+
         sp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748860117; x=1749464917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuYd3hOfZThZU0t6WFn7pLEFQFhkMYGVDnq/qUDfuL0=;
        b=s1jJjQh1qZEyC+4fJV4DqHniJSjiVDqIisKabZrSRWkCk7TJ/MjguLJm+onMEUo11s
         4ExFkBvc78YWMljdj+zfqyp1apcNlQg49MxXY5AAw3711z5oCadjtt4Nii3nc0khxhgG
         qQ4nT23B+1OYPlrGuO/P42CPpds0oYgZvznb6LOPN3mnWym/9s+UmMovhd4pAQjZenL/
         39Sh0TgFX3M+bzIRSO6+Yo+KyTmAHm1aUVDhPLl9+j4K2URqwNzMKbYZmdOU8SsTFOhB
         OajW2GRUGnoTgKBp2dAg1yE9KwY4cuqeq3HYRcYuvcKrnJ2hYnVpsUbfHhGLDgfDc5J7
         6WcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2yWrysRMwJP6bhkKM7XZVQBQGgdi+xpulT+kSzz6vrR0IJq7Bww7UcL7/mKHm62ss52R0JpHSo5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWunlwZKFRuIh4lrT/I5FgFhta9Ajs9M7TB9nNtE2IRg5brY7J
	BJWCsSEYgpOC+dhsZ8CXFFZkgzhVqqFsuCk98P0V3w0+BPoAJfS4r9gc
X-Gm-Gg: ASbGncu9CHvY8CN7o/+jUSOibweepP6PAfD2xpDkd66fJqyrIB/tv4YtihadqL8xUiG
	7nVKIkVqLacAqO5BrI5PNEaUwq4gUytndrEGBUNcfHtCG0OsCMemspf9S7Zp+9L9wdMHF1wV0RO
	SSCWbCc6Zx6xB0wJ8JzSDQdlUAZaqvZaU6cXdVrz9rHwZc/sa8FS3a2GueOV2+2cBPtoDjFTz7A
	8vYxhT/N7h9wr+Nfwh+poNq0CpGd2vPxHm7Tos2j+Ml8SDTbA2PUXPPsCaqxjjgFn7r+EVIGYQy
	k7MPGwLARKo3Zyf/frDNzy96Kf1HNeSKkQF2pe6QGS2ic3e7Wfc=
X-Google-Smtp-Source: AGHT+IE+liVhMoyKDMDliAK4dVbSyWeXCdAOFmNkSSiGaidC3KRBwGMgukh56ysEGbrmL57jT/9JNQ==
X-Received: by 2002:a17:90b:1d51:b0:311:a314:c2dc with SMTP id 98e67ed59e1d1-3125036bafdmr21358726a91.14.1748860117238;
        Mon, 02 Jun 2025 03:28:37 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd974asm67847265ad.97.2025.06.02.03.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 03:28:36 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C95664209E8C; Mon, 02 Jun 2025 17:28:31 +0700 (WIB)
Date: Mon, 2 Jun 2025 17:28:31 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	William Raezer <wraezer@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH] Documentation: Add a source tree map overview
Message-ID: <aD18z7fXZDpN9Wpb@archie.me>
References: <CAKg96b=n1pZi4FUBqe+puUJo9ndRfU8npvo9w6fE6Enshe73Hg@mail.gmail.com>
 <f882f6d9-c914-48af-97b7-0aad6d995819@infradead.org>
 <aDz92QNc3ZSVkdx3@archie.me>
 <6459566b-bf9f-4e07-9290-41853cdee9ec@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wdCv78B4gWZchILF"
Content-Disposition: inline
In-Reply-To: <6459566b-bf9f-4e07-9290-41853cdee9ec@infradead.org>


--wdCv78B4gWZchILF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 01, 2025 at 07:49:08PM -0700, Randy Dunlap wrote:
>=20
>=20
> On 6/1/25 6:26 PM, Bagas Sanjaya wrote:
> > On Sun, Jun 01, 2025 at 09:50:14AM -0700, Randy Dunlap wrote:
> >>
> >> Also, when I look at source-map.html with a web browser, no parts of
> >> the source-map are shown. (tested with multiple browsers)
>=20
> No, I mean that what I see is mostly a blank/empty page.
> Other that the sidebar, it only contains this line:
>=20
> =C2=A9The kernel development community. | Powered by Sphinx 8.2.3 & Alaba=
ster 1.0.0 | Page source

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--wdCv78B4gWZchILF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaD18ywAKCRD2uYlJVVFO
o8MMAQDhLa+WofbVfZja/hmJNHarEiIZbcxy7jnWERk7jiTrzwD/RPZrDylOdhdf
2pLvhj2IetPxdlAZi+HbS8TOX8trjA8=
=winf
-----END PGP SIGNATURE-----

--wdCv78B4gWZchILF--
