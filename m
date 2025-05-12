Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815E5255E46
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046210; cv=none; b=rorbdLN3XF19gkFfp0B2YEuDV476C6du33NTopwzv0hTOV3g4xvf4eRwriLnwy10fiyHH0WT4jCN43ffRgWiR3bJ4bZXViVBVKVgABG/qC8nr0nTV4jCGC8ZDU2ZqkGfAbp6Llv4n6icgoinaqOlJ3MK16jfsn5vfw1DLttsiQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046210; c=relaxed/simple;
	bh=grWKcuszBYfX5XjvmYER5UpUwXN2KPvsZQy+qbn88KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=td9URQI/8xiS5URnV53ESj/stVeL5llKPRt4YU2Y6QllHT3uK1/QWAFrX6fK8WBPFp1Gt6xr/EjJW7ImkpVug7uBjJjF5DvQ0iYIDVz14tGhN3I6/dsnXBcqUPg+4E7OZM0BUkNfqOeCbw2dhMUhW4LitNDxtilL1e2O/xmBeJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RqLZha3W; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RqLZha3W"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so812898166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747046207; x=1747651007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=grWKcuszBYfX5XjvmYER5UpUwXN2KPvsZQy+qbn88KY=;
        b=RqLZha3WoHdCgSW6yGKjpDGnL0IcUoRQiujPU1QXs1mlDOXuAFx2YO48aau3pwkwnE
         gLKj45LtuORUQO2ewNWeCXY2G8IuhdCgToOOqYJjjLVlsTYLstvqO6OeJwxz/qHLA4oO
         hkSdwARTIuLU6cDnE9GrR8Kk2z79rSY9mpBANhqhvMi0qjyi6RHdFLvQq87QAK1c4x+u
         x2yd8BxZfCXH6lk6yNB7S9R18OS7YfrjEyQQSaiOTsnDvPI5T+4/1iPMu9/XBaDz3vmj
         05/2TMmgfF/aYBi/QjX2BkzcSodYlNmKKWtMDWEbBrwZ0B/wjaf/NgJDZRoPaVchncSx
         NBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747046207; x=1747651007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grWKcuszBYfX5XjvmYER5UpUwXN2KPvsZQy+qbn88KY=;
        b=V3Kr0WD1x0wiRp6SHvepz+89IovLhhWpj/d14ik149e0USSfWrP0qn2gzbd8LgMapB
         vjoVX2wfMvpfImoBH5oyUnaFMgKzNwP0bKKRHooI9LI1wK52D8/TRPfT+ted1tES/m2G
         zPxGcTaXPYRb7c7b6KZVdTgrw14genbtffX5W4TiGTss5a0lVLqg0Jb5c8LNzz9BpSlg
         jTi4ZYW+LXAImVr5VCjFvkloXS+PTYnAjgfVKe2KcLv813m/k4+wCiUTcruukOacm8r1
         qkxKBK4vdqViPAwPnTgzPluFIqytwzMeEh54b7n0y2ipKasqLWARpE8P7CMAmthNreox
         3YIw==
X-Gm-Message-State: AOJu0YxaNT9Fiia4rjmPhyoslvRfVCloG23U2FMxUGdpUWFECeRm28ZE
	x0cfcBFs/VB3QdXtti6/LS+d7g1BsKl5cPOWLu9GiThykmuULVDObRA6jHqSKRnvnmlbQKT2GHG
	m
X-Gm-Gg: ASbGncsA8UaHDoruxL31T1+SUTWxq/D/ouwWVIA36dw49fBkRiFoIROgdO6x3/DUkCH
	883By23zYBSIAoDc/VC1feUr/WK+MhAn2HmUvdS6zEi0IcHMf5Ao9N4SbgE0Ok4ZTs1hQP34Iaw
	ijCG4eK6d/ERJo5ZtWio9xwGmVg6EQDE4acA3dqyoiCmHFsOE/DaAZQIX3fu9ngRD/usul9lUWd
	v5hvtmq/FT0ZjLt3n3vqk+YtYuEbBHv1NfODUNrbn5P+tWXzeZ1dRMdrtqsyq77Z5xJrHzuhevs
	ej99pZmFSCvmmfjaop2hZh8esKWEpat23lRN+ejdEwqJ4vS25JZFbA==
X-Google-Smtp-Source: AGHT+IHPn3opWPuGz4biVathI6IuKk2eNFCTG4feYuGEpgYqHsGeEkZnfVt67vF/3B+VhYi0n3xoQw==
X-Received: by 2002:a17:907:7fa6:b0:ad2:54c5:42e8 with SMTP id a640c23a62f3a-ad254c54483mr208102766b.8.1747046206673;
        Mon, 12 May 2025 03:36:46 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad22a3a1501sm475507966b.121.2025.05.12.03.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 03:36:46 -0700 (PDT)
Date: Mon, 12 May 2025 12:36:44 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, David Rientjes <rientjes@google.com>, 
	Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
	Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com1>, Frederic Weisbecker <frederic@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Chen Yu <yu.c.chen@intel.com>, Kees Cook <kees@kernel.org>, Yu-Chun Lin <eleanor15x@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Subject: Re: [RFC/PATCH] sched: Support moving kthreads into cpuset cgroups
Message-ID: <avxk2p2dr3bywzhujwnvbakjyv4gsnshssvgwj5276aojh7qbl@llhdz2e55iai>
References: <20250506183533.1917459-1-xii@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7glneb545a7qokgx"
Content-Disposition: inline
In-Reply-To: <20250506183533.1917459-1-xii@google.com>


--7glneb545a7qokgx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC/PATCH] sched: Support moving kthreads into cpuset cgroups
MIME-Version: 1.0

Hello.

On Tue, May 06, 2025 at 11:35:32AM -0700, Xi Wang <xii@google.com> wrote:
> In theory we should be able to manage kernel tasks with cpuset
> cgroups just like user tasks, would be a flexible way to limit
> interferences to real-time and other sensitive workloads.

I can see that this might be good for PF_USER_WORKER type of kernel
tasks. However, generic kernel tasks are spawned by kernel who
knows/demands which should run where and therefore they should not be
subject to cpuset restrictions. When limiting interference is
considered, there's CPU isolation for that.

The migratable kthreadd seems too coarse grained approach to me (also
when compared with CPU isolation).
I'd mostly echo Tejun's comment [1].

Regards,
Michal

[1] https://lore.kernel.org/r/aBqmmtST-_9oM9rF@slm.duckdns.org/

--7glneb545a7qokgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaCHPOQAKCRAt3Wney77B
SVYEAP0Z/JUxAkFu4aDyuiT90IBTasBvJ2EsEmMP4MGjnahpUAEA1KAPjq8QHIRv
YGcQlipcEFx4WvZFEk5JBaHodIcCvQA=
=LnfL
-----END PGP SIGNATURE-----

--7glneb545a7qokgx--
