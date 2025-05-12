Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF92254AF3
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747045216; cv=none; b=KZzHkXRUqF3kMjeMzZ+es1VWHxnzeM6ZBiO0cm/tfoxhjOVYX/kbm4odU2Hrt+hUzzQNMjn+RHt8bctdrHJOJYbghakhQCUjEuR2UOBDvRfyuuszsbmVpqEsFEqUvn1jQynHBZiJDv2p+uZ9jhOQunSMqV/JNLXpykYPrRxQ8L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747045216; c=relaxed/simple;
	bh=kUnlC7NyTAMEtEffczBHSiagZwvWftD9sbC8qLtEHJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFGthW34f9dz2L2SjT6EBBaXb1XY3LJGvgT5DAVSkFK5WVU4lqLiMCpUunjEIxTW+F90qzGOrmoGu2um6gJDCITZDNcRysYqtqZQVrp7UMvmImJs04Irne+e5xiyzp4m5usOIGPYJGKvlvMhhJg2Ck1rR16S1hVyJuAcxQjEx3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G8WbJXU5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G8WbJXU5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5fc8c68dc9fso1566990a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747045212; x=1747650012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kUnlC7NyTAMEtEffczBHSiagZwvWftD9sbC8qLtEHJA=;
        b=G8WbJXU5UJTOtbBSAvLPQ0Bv8RpIuLcfJGrqC+MPExSTVX9f1+vshgheoK7tWLCumt
         S0MksvgIoET4dPmOBSPZJXERH48TsFvoDudGu8gzHsuhwcnDc85Tgkekw7oHOrwZYbWB
         0VrUA2TjlziI2jauOsb7fbMWRvBl2+NvnEAfdeg4MdQNJ4SHbhQ0E2puzf1502hYsZft
         DWF9oTT4ZFmcxphV70Tpls0palamRwUhe8tqu+N8JTEhYUE0AzjQ5dPOoRuF1jQxZIfi
         nyhuF8z386AuT5DTVMK0WhYq9H2ZZ0a5XLUDmJVJShu9TdPI7V/WCpsL8B1pkZ7OI/eL
         MeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747045212; x=1747650012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUnlC7NyTAMEtEffczBHSiagZwvWftD9sbC8qLtEHJA=;
        b=fKufiRPPPHnJn9VUXgwUCpuj/xegmAqVpU0zTGeVnSL1ED59EemSnTPLfus2nzSEd4
         S2k5P2JyHHmMvCB+UNGkpPVb0bGEEcAV52xC97uoFELe2jAZ7Jzp9KTyr4Shs9+2Bg0r
         bsvOi6F4Qi9piOA8rPzhRqSYDKLG2pWP9OlZC/1JCIpRpwQres7dqhb9l6ZsdVOTO7P2
         8Q5X/UCNdGQxvjIdCTuf+SC/yxYF3dSCLrFgyHd/7YdpWgjfj8qxWFXgPuqnEagbfBdA
         sPglgjyo59A4OGTatl3Kmo9okkcJmNxU/t/lMCLkcWKvVMa1tZ+i7s6Z6tME3pQUZdS9
         srsA==
X-Forwarded-Encrypted: i=1; AJvYcCXVtMyF6bbhe+qMn/ITRdZP7cJyPz27ceFJqoJGBgWJaazoHvgpIxPiD4UXDYizE8mL1mqyqPLWGTgB1jI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyJGGrl/GRFNmqd+T4PDEaedensfWE2pakgsA21q3o1oiIleO3
	5W1cQo+YTxgldaCegWo9gvlbvno97HFUwUYkJY9RJ0mYZKLLbG2aRV6borgSu3HmfK1aZ9at8ZN
	6
X-Gm-Gg: ASbGncv9SboQ0xVRQLaeB2RwHwuo8zLrw5zbDVg1bYXWTKjUjqiVy/+QcLyWxFo7WaM
	IQxyRTNSbpOowsAYKQULkl9NEiQ589ekDA3sjkmK6PoUbP97UgKYxZFqsyOeLv5x91HzJ61owIq
	wPDaSAv4dvy10BsfS7xtfPazviDSxgsT5DDf9zDnrn6qXR/bbem7ABWx5s4lSCvV3j1qdC229pR
	ZaoYZayqB7ICGA99l+KLN0RauARITjXdjnmXUGrAWCBt+iHN/5arsJuKivwEPXCjMOPbKEvHCJH
	t73b6YhbZP/Qh+q8TXGC0RboJIOR9jLzxv+qsgLc4kzsdch9umlAUw==
X-Google-Smtp-Source: AGHT+IFUAbxYrukJJZfaN2RoAV8/y3rGTOsQXQjzWfgCtVE3ocfvNLmhTM4rjN/+iktiYHhkshhdoA==
X-Received: by 2002:a05:6402:274a:b0:5fe:17be:a93 with SMTP id 4fb4d7f45d1cf-5fe17be0c7bmr2867590a12.29.1747045212130;
        Mon, 12 May 2025 03:20:12 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d7010f9sm5470504a12.63.2025.05.12.03.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 03:20:11 -0700 (PDT)
Date: Mon, 12 May 2025 12:20:10 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH PoC] kernel/cgroup/pids: refactor "pids.forks" into
 "pids.stat"
Message-ID: <m2ak6nayh25g7zzsnm6ouik5uovctaa6kfstxbfboupvbsik3u@7f3wzsfayhhg>
References: <aBkqeM0DoXUHHdgq@slm.duckdns.org>
 <20250506153057.210213-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f5d52j3js6og7sab"
Content-Disposition: inline
In-Reply-To: <20250506153057.210213-1-max.kellermann@ionos.com>


--f5d52j3js6og7sab
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH PoC] kernel/cgroup/pids: refactor "pids.forks" into
 "pids.stat"
MIME-Version: 1.0

Hi.

On Tue, May 06, 2025 at 05:30:56PM +0200, Max Kellermann <max.kellermann@io=
nos.com> wrote:
> Proof-of-concept patch as reply to
> https://lore.kernel.org/cgroups/aBkqeM0DoXUHHdgq@slm.duckdns.org/ to
> be applied on top of
> https://lore.kernel.org/lkml/20250502121930.4008251-1-max.kellermann@iono=
s.com/
>=20

I'm still curious about the reasoning for the introduction of permanent
metric like this -- why isn't cgroup's cpu.stat and memory.stat (that
are more tied to actual resources) sufficient to troubleshoot. I'd like
to see that in the commit message that introduces pids.stat.

> This is quick'n'dirty, with a lot of code copied from mm/memcontrol.c
> and adjusted.

I think the transfer of PIDS_CHARGE_BATCH into the implementation is
overkill at this stage (and it skews the stat field).

Thanks,
Michal

--f5d52j3js6og7sab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaCHLWAAKCRAt3Wney77B
SYfKAQCYFIQaxufq/TL8dGsRMnijkRIDsvWAaqB78asTbtd14wD9EXx+G1YPxjSs
s8po33xydIe+XMeE9sTi8DnUMRufFA4=
=/iaI
-----END PGP SIGNATURE-----

--f5d52j3js6og7sab--
