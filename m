Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781AF27E1DC
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748360042; cv=none; b=A0q1y3eb3+GEOcBUOwxslKzFYS3DQ22a7ey/O87zhHPpc4X7I5ntlW4icJ3vGqQBHZHzmEipOKmVp0sTmRAgN4QL4V6MAm1pOlHJ4o99w6USRZ6ZFajSOi0HA01uVeosOqQsdnG90uigFuihzIrFtSAmMeiUIhJRBdlE3U5MwAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748360042; c=relaxed/simple;
	bh=Cv1Vo2DmzQ6FqHtwxc0u/gsIoHSEVlJATjuABAdLw0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4o2su5Uxwrl/kzNVW65ijL4N7yqjII2IvEFNVN3Es2dk67khrtrCbFwgwE8mQbmZwGmrVYPuyoQoUp/3RWGgZ3LxZnhxfTBbh80cUBsW4GslqWsUPTDLz7NpGYrASi7jNsdJJfiA+V6e6faB20gCQB3cjpl4XC5BOS2cpb3n3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YTwNWcci; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YTwNWcci"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-3a3758b122cso2253559f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748360038; x=1748964838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cv1Vo2DmzQ6FqHtwxc0u/gsIoHSEVlJATjuABAdLw0g=;
        b=YTwNWccig6MA2gBV+mMYoRPekwrf1MsNmHQj7BAWsk4mxY/aFYnlhzaklG+DSGAHs6
         X1bPqErVwKNtvIe/8KERHpBa1qn+JlCodBwOSscH/510UGgxJbOwRw+972G2iQxGGqzg
         l7Vw3yDW0JIF+MV/mTuGHYprB7ROuD9rzBwaC0+E5HIj8nlpfuTArfSDtz3ii4F0qWuW
         Drt+/qTV/X1Frbpk1NWjD4pFzVI3A4yF4b32AoUGQXc1+lwQvP3xdYmObRmnp9rc3lmQ
         e9RJZNi8qtEnxXgC1tD6oGRsh5CP+WQrIZRQyvG07i/sSxrbzApvn6uMI8vNKBAbEQix
         7w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748360038; x=1748964838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cv1Vo2DmzQ6FqHtwxc0u/gsIoHSEVlJATjuABAdLw0g=;
        b=VuaP2xBVgyhr+O7ZWLPpkIplbjgVW6KROpwBFWhnojMURhaVCO2i4oLt7NBko+dffE
         VV6cfBdD+3re5zfRE03tkXiZHwhUiKJmh97KmnKKPI+Wwoc9Cznuz37r7yB/zSRe7Y3k
         6PPZVB9WnEg6Ghs2lD6dDNID96MiacdNW5Fd6nXjxNp81ZPx5OqbM81Kr4ar7+g/ZZYV
         WJxUzniSqu5k0g9S2yfYszlzNbRfv4HNNKvSjO7Zt/P7kcE9HCR+8VnedtIiolGPpdgc
         E3TAvCBud7SszluRFhhyPYgepjYpWJbo5vKKqE4yrs+dphAM5I2tI3zN77zltXx6hHoq
         alsA==
X-Forwarded-Encrypted: i=1; AJvYcCVgcBMU0HMxUyMVHjxEy8Dkh2QHMl85QLooRJRULKH3fE+bj58ShcyHWDuiwL8/oK5XO5QQWNTxwb3Vd34=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2kK/nmcuSc2PvZ+yrvbA50hXooYq8TFZxO/Rrv3OZx6fepvTU
	7v+7UZOD/kFTrejcZ20wHW16eKlhU6qHSyXYpafZOHWQvskyC19s2CV78mV3Dy3Hj7w=
X-Gm-Gg: ASbGncs9kxInQO6W8AquVj/BgtfBhLfaVFVU5Goru1jxOgH8njrcoBtSyj0qroC4NFt
	pV0kGuWNbRPj30WtRjegceCxVLxv0vP6CkPFA1zCTJp+83CtwH9NvCdvlbHYtANplloK9DkoE+i
	/GBATtMO4HUBpvnTztNMEeNcz/pYLOMrRYz51L9X4ILIvfYKtvzJYpv0H/cqQPNOBQ7tl1dn+KM
	IWN5CTP1XAubZ3Zi4g6AJfqv9UZW6rLGHLEQ7YjeayOj20puq+P0jSvWsBP9FGvNm1ydn3jMZ4I
	PbLPfoAZdG4cYtpkwdGfEwLghjhc5zg66ZT2xmeVjkmyAqyk5YKXeg==
X-Google-Smtp-Source: AGHT+IGk2qNk54noCscUr24iAodxJKN/7cT22Vh7jDH5UNWtoxDLDUp8G3Mzk08IM6dkmwqbyJXyKA==
X-Received: by 2002:a05:6000:11c5:b0:3a4:cfd7:dd4d with SMTP id ffacd0b85a97d-3a4cfd7deabmr8137691f8f.34.1748360037610;
        Tue, 27 May 2025 08:33:57 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d67795eesm7332405f8f.86.2025.05.27.08.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:33:57 -0700 (PDT)
Date: Tue, 27 May 2025 17:33:55 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, hannes@cmpxchg.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	surenb@google.com, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	lkp@intel.com, Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH v9 2/2] sched: Annotate sched_clock_irqtime with
 __read_mostly
Message-ID: <umy4kicwvlsaszajo62pcpgptcdqi2yp7pponvlch5h6tirabb@mhhq2en3piel>
References: <20250511030800.1900-1-laoar.shao@gmail.com>
 <20250511030800.1900-3-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6dxp2iqhjfg66h5e"
Content-Disposition: inline
In-Reply-To: <20250511030800.1900-3-laoar.shao@gmail.com>


--6dxp2iqhjfg66h5e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 2/2] sched: Annotate sched_clock_irqtime with
 __read_mostly
MIME-Version: 1.0

On Sun, May 11, 2025 at 11:08:00AM +0800, Yafang Shao <laoar.shao@gmail.com=
> wrote:
> Eric reported an issue [0] as follows,
> : rebalance_domains() can attempt to change sched_balance_running
> : more than 350,000 times per second on our servers.
>=20
> : If sched_clock_irqtime and sched_balance_running share the
> : same cache line, we see a very high cost on hosts with 480 threads
> : dealing with many interrupts.

I'd say this patch could be independent from the "series".

> While the rebalance_domains() issue has been resolved [1], we should
> proactively annotate sched_clock_irqtime with __read_mostly to prevent
> potential cacheline false sharing. This optimization is particularly
> justified since sched_clock_irqtime is only modified during TSC instabili=
ty
> events.
>=20
> Link: https://lore.kernel.org/all/20250423174634.3009657-1-edumazet@googl=
e.com/ [0]
> Link: https://lore.kernel.org/all/20250416035823.1846307-1-tim.c.chen@lin=
ux.intel.com/ [1]
>=20
> Reported-by: Eric Dumazet <edumazet@google.com>
> Debugged-by: Eric Dumazet <edumazet@google.com>
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Cc: Eric Dumazet <edumazet@google.com>

I can say
Reviewed-by: Michal Koutn=C3=BD <mkoutny@suse.com>

but it'd be good to have also Tested-by: wrt the cache traffic
reduction.

0.02=E2=82=AC,
Michal

--6dxp2iqhjfg66h5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaDXbYAAKCRAt3Wney77B
SYk8AQDxDQZu9Uq0G7hrTUBP5punGWKQ/PIZHEkHzu6U4BtnuQEAkhyUQFGbgI+F
dQmTzezgKzsQ4prNcbWJpgimSB4ygAo=
=CNdf
-----END PGP SIGNATURE-----

--6dxp2iqhjfg66h5e--
