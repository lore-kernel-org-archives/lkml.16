Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A661AE877;
	Fri,  2 May 2025 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171015; cv=none; b=KkirW9PULt/Ix/TOUyK550FmvIURQKOOMbOSmdmDN3Po0rDDD88ts4ShJ9DNqLyZO9HoJdKHXRdEebNx0vhD/8ajpA2AQYv3z4qMXyzRbcNN5J6O/X4A5AB2lcLjhL8dJ3l9SaU0vFJMYtahxWri3dB1FL6z3zTgMGcEtoE5zbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171015; c=relaxed/simple;
	bh=/F4YIEMqZA+aTAeaYWQzXH78v5/HOeUmmLzyOtPA7mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJS+5uRPMYg2BMBUl9ASK7wl4RknpqFIdJeP45Rcu6xHgKVItULMcMiK/+b+nVa/qlx2UT1Lmj+oin9oEnApvQSTsa33PZGvvgkLCgY7bR8Lds0MTm/LU1QNgrr1eFuqHfZuLcOinPUhmEQ6hWiTcTX+0WVLKwEsiViTviVAIWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNOjQ2Op; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNOjQ2Op"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223f4c06e9fso16449235ad.1;
        Fri, 02 May 2025 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746171013; x=1746775813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H73Vab/GWNXbFGiWUUMX37ZLjVojiTMLjvN4/NhO0uU=;
        b=ZNOjQ2OpAwhZzP1vTskbq+pWZWQY9jlrdOyuKYEXJ+b9xYElQ//PStYAO73RtkjwRW
         eYAitywAHrDmS1kJbLKPvxku188/qZ2ZBZRhYNE4ASCxnG6jMikY0srSBuczOhPxga3Q
         T4dOS7FHDtOm+/IXEOp1RKM8GApbCrbipBgVqskqrVVHEeYByRdOa74VLnK6005m2L+M
         rddj2nscKHwWVwEIlTfIddSYEEbtdHooTZuWYu9GW9yMqA+Mgcxo5/lMLKkHEH2qoO2b
         mWIXzlGn5dzVw2jiEDsIxmnq467sh3DcR3AutHkxv4ct+SHFq4IkBbv+1pTrK/o66vSC
         +Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746171013; x=1746775813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H73Vab/GWNXbFGiWUUMX37ZLjVojiTMLjvN4/NhO0uU=;
        b=Plno3bWoIZqy5ev6hSmc0eTPBcMV8fQXByitxYGfmjAUyzUCerV0dhfIe717kMh4O2
         0rKP2OgBOK7WukCis2G1Ko7DbDIs8j7uJs3DmRcTEz5wTJX/p6wphpu+YLVpXVKjUIi4
         qkbCBrY1sRU+VIoN7hZY3Hs/kbRw1VdVetzYU2vst/xbnu9Fr9KIxmxu+w4EicMpUimY
         iZHctFOS0xXt0djdjbttFEC53orjnu9+7t8QWB5DiEM3yEBH8qKR3WRKYdeiMFdbC1wx
         54xZrHkAy7v+G0wVSFN7laiN7C1CB4h3OLBFV40fvm7e/nRG9XW2EffQxDeKOA9KPLVD
         gu/A==
X-Forwarded-Encrypted: i=1; AJvYcCVtY7PyWJozJhB/nca6R13C/+3j5UcNbY/hLJwjWOi6EtxyvJ4OZgigKAhiArm8FmSRk/cMxWeNY1E=@vger.kernel.org, AJvYcCXC6Bkcg/gC19v+FiiAkSKOI76TNkYVhivgsh0cE+0BcsQQqN65SJXOM9imt81t/K/j4HGnWwzrFBxYt6XS@vger.kernel.org
X-Gm-Message-State: AOJu0YzD3aXAuGKzZnEHEcTqSutFgdqfRQMMVrdBGqQTre5YF7HDviGO
	EbeGVLwVSj3P6o7onVqBuoHoXn9E1qQewgTXwag3cDdO5eyrX4Jo
X-Gm-Gg: ASbGnctdnJFY/9wePHjM7XF+ewhhZWNKSLcVTFrvD0csMlj813ULARQImCGjgGe/rPu
	besap2q78xSFAa1zFn/oean4iBsYLEnA8E8yfibBUbh74MBnomHaYpcyRWeLWFBSF4XjwoJgXVV
	XGfx8R/HarOMu61eIYPviQS09tney2n0mmX6Zi30ucMgBdv9z8pZhdYN+kZlK00l/6yYw2agrN/
	krgeqbfUX0CYkdjf7miDjJ9Kkz90dPh3Q+z8puFLBy+rAXbkwFmT1wBReNB5kS6L7ExDQaxwmJD
	ZgxfGfpPS0j8AvOYhKuzt4Rljg8LoyVzl+lyrhZo
X-Google-Smtp-Source: AGHT+IGuSrcwQ0ohbtCnf4UdVyUYXhpw38Ls4x/HnE/rV/mhHe/iYqVjWnA7Bzqc6Z5emjylgBkrMA==
X-Received: by 2002:a17:902:db12:b0:224:3d:2ffd with SMTP id d9443c01a7336-22e0863a1f7mr82307685ad.17.1746171012754;
        Fri, 02 May 2025 00:30:12 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fa1csm982475ad.133.2025.05.02.00.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:30:11 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3468A420A6AB; Fri, 02 May 2025 14:30:09 +0700 (WIB)
Date: Fri, 2 May 2025 14:30:08 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>, peterz@infradead.org
Cc: kprateek.nayak@amd.com, gautham.shenoy@amd.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH] docs/sched: Make the sched-stats documentation consistent
Message-ID: <aBR0gBIxZFGhJixx@archie.me>
References: <20250430062559.1188661-1-swapnil.sapkal@amd.com>
 <aBQnuv9JLOHYayiu@archie.me>
 <87ikmj1qok.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nRa2lLqxAcQAUP5G"
Content-Disposition: inline
In-Reply-To: <87ikmj1qok.fsf@trenco.lwn.net>


--nRa2lLqxAcQAUP5G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 12:18:19AM -0600, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>=20
> >> +    9)  # of times in this domain detach_task() was called even thoug=
h the
> >>          target task was cache-hot when busy
> >                            s/cache-hot/hot-cached/ maybe?
>=20
> That strikes me as anything but an improvement; the existing phrasing is
> fine.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--nRa2lLqxAcQAUP5G
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBR0fAAKCRD2uYlJVVFO
o1LwAQDW3606wSJOv9d8j8m4txj7yRoZXe3QgHKO3ey60i9DdgEA8TWv1NqT6LZi
vCaDZ1KkqWOsNfXLfERTlKc1F63jdgE=
=xKId
-----END PGP SIGNATURE-----

--nRa2lLqxAcQAUP5G--
