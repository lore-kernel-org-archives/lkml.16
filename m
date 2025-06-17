Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C68F2E716D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166196; cv=none; b=cXpsn8+KchbJmhhaLPoCKaAxpsbR2lXkji/bckwE8vhcrZfoeO2BT0J/n3jPNwkncjab3ATOHK41Gbk9t7Pm+nk1zmw0Fqn9amNynHUtba+kdRkYpIYPXk8wTDP3cTMKTMrdUiRwplWYHQzPU4IIRYxeBfLExUAdfhtpJ+cl4P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166196; c=relaxed/simple;
	bh=vilBjKqDGQ25FawROby/z0qFfVJPGzxTS8vaHzO1axU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4V/HgcPsjLmdqwvLAA2Kq2OYYmgT7+kGZuMOQwPUr1saciyvgCjrQnOWFR03xQADP4ZqpBuhANTaF2YQKh9Ph4HZ/L6GB9G9sTNzKtrTPx3B93pvBnkwm9RZtVm/4+Y45ZVjPDJYHQrm6EkXJqALtcEhD9xln/BlEdUJBnKBHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M0TvgCGb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M0TvgCGb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4532ff4331cso16119395e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750166192; x=1750770992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vilBjKqDGQ25FawROby/z0qFfVJPGzxTS8vaHzO1axU=;
        b=M0TvgCGbFDwLL+XmxdhJjWspu+iw05bJDIX0ivHBOo/cnw/dGH+ehsX6o6fBon397J
         A26OjIKQx7EkkZG3bhkm3rsnRAAyGxgVuJHFvr3yttori0s3rUtHLbGmGOkG8BmLmtFR
         CyG/1GkX9WF47ZGO+5m1C2/GjfCYFLGdkqKu6LKLmyxOPTiPdYCei5XpCCa5h8oWwXcj
         IUMjxf4r0j37LjhBg+YuSf7SackfiFV2znZIPD4cXL36FV6p0DtD8+MtIX8wSg9M+gNq
         LSE28JoQQfQpP/aV4HxHy9b1TRwGxzrWBI42bvPVIoLiHwt4Bkp6liHi8kIKYdZux+SA
         2FbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750166192; x=1750770992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vilBjKqDGQ25FawROby/z0qFfVJPGzxTS8vaHzO1axU=;
        b=ufT1ESwcxVZTyiUPnBHOXgVtoDpItRd18mOth5/wetzwNrLiDo4FFOPneR+03qW9Ry
         8CbhzqcE8prG7jAe8FyK5UkKAhFj6xore1U0xhrQUsDbVuVNoOAPcaSD/KfQebx0pLzx
         yBauScaXoHINDthwARMDY1wNvBJK162gNr0uq9GVco/M1wJULkc24PAeu6oYdXZGiH3x
         objx0aX0Fq1VUCnldtixuuY3+BhURiMRM3OW83gA9HjWDORPDLj61I2xIUc4I1kAvpQg
         QQ9DUASLnQg0Xq8hXHGVMH0xvNtMLW64IyKbUFuQYFL62kJoskz1/OAxYwZvHe1/QkOC
         fpQg==
X-Forwarded-Encrypted: i=1; AJvYcCXpnmPaSdTaLBDxKHIB35o9BK9WdpnCueB63exZDmRcWM5AqPmFGRGscwZjRYRjD3b3Qa/IzyWloDRFW3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwBDuCZKIBXIX1FaSRJuUK2bP6sq4Sqj85H09p7OrqECMkO0Cj
	UiUCJ+TvMUwboqCTcCvJL6PtcLHICTqMmPDFRj3pr3i5ginZ6GmsM+2uF3TzHlFfP0E=
X-Gm-Gg: ASbGncsdkbltIGGlM/iHY3d/sZCHTaNMFQQ3OxSyxqtfcC6dasdShi+/7e3h95kNDKd
	/8a3f44mn6CS6pLwxhJFyCHLkxStOEW0uUPpe2lf02b/33yLqjAcq6qLRGCZazjoAfvBHp1jzAB
	wn+Y9kk3UeeRoNBtqe7r/wPFvzlr0TYDHaTYzwd8ZLgdK2HOlifkVlr2dYrrAhmtwu8WaL7yZxL
	BPPLdxWKEHjP1uaxmm8iKMDAcr25+I6/1HkEaFiG8LYJeBKCuhpPH0NBYTpRfqdsFWvJgmXD4PY
	XZuugv27GFu4Is3Wstn9s8Q7ZB7qKoStEZMCUaAVxmFpgfpL0d03UoZAJWLhLj/J
X-Google-Smtp-Source: AGHT+IHysJ08+pzr7UCdPT0UGdBC9YYU3cJA+cs7HKuUS6c65alf3G9CO8oJ2h20auenaGh6kPbrag==
X-Received: by 2002:a05:600c:4f4a:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-4533c9efc7amr139976505e9.0.1750166192163;
        Tue, 17 Jun 2025 06:16:32 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224956sm178254615e9.4.2025.06.17.06.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:16:31 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:16:30 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Bertrand Wlodarczyk <bertrand.wlodarczyk@intel.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, JP Kobryn <inwardvessel@gmail.com>
Subject: Re: [PATCH] cgroup/rstat: change cgroup_base_stat to atomic
Message-ID: <ftih3vsbegjha32tjoktayjyak6zs6n7cbfuwzjasutexqiluo@pjauxm2b6xmn>
References: <20250617102644.752201-2-bertrand.wlodarczyk@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tbtvuy725qgnutu4"
Content-Disposition: inline
In-Reply-To: <20250617102644.752201-2-bertrand.wlodarczyk@intel.com>


--tbtvuy725qgnutu4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup/rstat: change cgroup_base_stat to atomic
MIME-Version: 1.0

Hello.

This is interesting.

On Tue, Jun 17, 2025 at 12:26:45PM +0200, Bertrand Wlodarczyk <bertrand.wlo=
darczyk@intel.com> wrote:
> The kernel currently faces scalability issues when multiple userspace
> programs attempt to read cgroup statistics concurrently.

Does "currently" mean that you didn't observe this before per-subsys
split?

> The primary bottleneck is the css_cgroup_lock in cgroup_rstat_flush,
> which prevents access and updates to the statistics
> of the css from multiple CPUs in parallel.

I think this description needs some refresh on top of the current
mainline (at least after the commit 748922dcfabdd ("cgroup: use
subsystem-specific rstat locks to avoid contention") to be clear which
lock (and locking functions) is apparently contentious.

> Given that rstat operates on a per-CPU basis and only aggregates
> statistics in the parent cgroup, there is no compelling reason
> why these statistics cannot be atomic.
> By eliminating the lock, each CPU can traverse its rstat hierarchy
> independently, without blocking. Synchronization is achieved during
> parent propagation through atomic operations.
>=20
> This change significantly enhances performance in scenarios
> where multiple CPUs access CPU rstat within a single cgroup hierarchy,
> yielding a performance improvement of around 50 times compared
> to the mainline version.

Given the recent changes and to be on the same page, it'd be better if
you referred to particular commits/tags when benchmarking so that it's
unambiguous what is compared with what.

> Notably, performance for memory and I/O rstats remains unchanged,
> as these are managed in separate submodules.
=20

> Additionally, this patch addresses a race condition detectable
> in the current mainline by KCSAN in __cgroup_account_cputime,
> which occurs when attempting to read a single hierarchy
> from multiple CPUs.

Could you please extract this fix and send it separately?

Thanks,
Michal

--tbtvuy725qgnutu4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaFFqqwAKCRB+PQLnlNv4
CJWBAPwO2FSSQNlPj92zV3HJKlnIboB+NjndaeBWIuJw53GzxAD/aMA7zfPeMpx4
86uB3wcvm2dJdtfMWrBlqYUmY7CIOww=
=ZlDq
-----END PGP SIGNATURE-----

--tbtvuy725qgnutu4--
