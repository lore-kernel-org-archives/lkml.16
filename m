Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5F71E5B7E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600290; cv=none; b=mmzD6Wn1Jp12dyT07R/J7PmOBiYe0BKI2F73YAIF6jtXef0ZffStAWUzJCueppvu6SN3kwDtB6DVw5Kg/EtOZCDyqHOsC7nbatcq/xM9SzuKUjvL3CHOs2SGKru65GfEtj9CyvyMFNouDeHFEEKXUaIHm1wumwE1iPyCoOgRneM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600290; c=relaxed/simple;
	bh=pYbm4oKrcbp95Dq1PTEEfwDfRZYpGx1EOdUtHv6e53Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Is6tLarFYAQixjcjTteSbbphxMz51j4R2rg4XDrJlyf58MtQSCTQCE5C4DXDVjyIKE8apdJ+QPxisUKAEdd+JFbd7IuMT4X+4ldkX4T9kL1vqFzvnC7Bw8BJjb+O3n0N3zBGzAikPAIEIqUyQNUX6rd/UC+lFbBAapy3VShO4nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PecP5oMa; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PecP5oMa"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so25544895e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743600287; x=1744205087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pYbm4oKrcbp95Dq1PTEEfwDfRZYpGx1EOdUtHv6e53Q=;
        b=PecP5oMa8dowBg7EIkbM/rBwG1X7RkPAorXXoX7awMVINPcgk0Kpgr+YvwO8mdgmsc
         KTzuaRZ1R2tKeJ/leN299rSfYWDWyPku21Awh/ild1mpuC87+Vr471mitfeCLkZ155Xx
         rdmgEaSEioo5u0s0GaDlryIjkP3ejBNivSHiBtBW4WNimT0hfC7SFbwHc4J9hyJ1utPe
         YCG/k9LjUfq6gr04FPPbiizOhEvmoJkApvM/vpHYuVFLn5Ptcnvhd4Ce3mQQAV9XSg0r
         6UU4l/T/gY1llzpBEpBAzco0w3xQBd5Niua0c5KtHZg0Qf9SDjQ9drHuwotbmClPT+jP
         AKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743600287; x=1744205087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYbm4oKrcbp95Dq1PTEEfwDfRZYpGx1EOdUtHv6e53Q=;
        b=BzZsW3Za3FJKqNzYIHhxAXO5nTLIi2CuFN2kP76nGOOYYeGS3ixDHmuqlYdxRrCpuI
         uzTYtuhjAsS6M9E4fHobiOZkGoISnQ5gjZMvadQUmyNnyNuachDS4Bpa7I7rHjG2VAyU
         eCyAhWC+kbUh2soUBCtXbSR47s2wptlhtXny0xAC0PrR+wQz8x/dxix+XU68AAriTNcT
         9ogOrdwS+RNIzvMLZmYwNnwjmFFeZ3yY7D+fv2aMm8KGrMj/mShAs3semGc2RhNQUh87
         /pHyerI7u1EgFfhE/hgHjcvHqFJDdzm1ZG/xdMO5OINbu75GYzla621qf/3ygjpzMXUf
         LgaA==
X-Forwarded-Encrypted: i=1; AJvYcCURKB+kUbR6M6EBKXxlS8LQf9M6wK1CFAdnM71eSr89r2fqJvBfiRcw+B73XfuhD3IH2x6i3QqllxXyBQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqmfFdlCpyY4aMng6BqrCVyKBx9ZJyKMtIp1KxUWQJ/l6VaUu0
	27+YgR5lFlU9FvQh5fohN7sZyPxRvj1ad6KPlVgMW817PbSpwqufg9+p0bK1TYs=
X-Gm-Gg: ASbGncvpE+T2VTF139erT8s35avX0hff/ZAPGaU1o9DlfYZdyEUMGVHh9JTtx23sYd5
	rBM7wwu8zbxzIeZn9LoXB0cI598oHTrOqnxCPuCQzLDOf4Kl46MHBFcgTG3UagsjNn7istuceuP
	MhW4vE19anwTPSl6/H06mya7y+ZNkCAzF2vGSf+BoG+95JzEbexUtNuDcAWUjiKASKiVHi5Vnm4
	4XhoDi3RtD96hUL0QD2ndiTOXigT8XgaLszsIYMqtXfNQxk5z9NQDmX56GL7Zd29WDJ9LUQ+JZc
	EbB/azesG/6A7/TC2kdSfKthscnfY02tZoZhPUO3cJ+6G3k=
X-Google-Smtp-Source: AGHT+IEkZXhkt4dJXs5ZW/Wkxvhp30py7B3KBHkoW/nccx47rr6X5SfhnzuAV8/c487Johxbo/aSgw==
X-Received: by 2002:a05:600c:1f0e:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-43eb5c29e54mr28042485e9.15.1743600286855;
        Wed, 02 Apr 2025 06:24:46 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e467sm17067309f8f.79.2025.04.02.06.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:24:46 -0700 (PDT)
Date: Wed, 2 Apr 2025 15:24:44 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Mel Gorman <mgorman@suse.de>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Tim Chen <tim.c.chen@intel.com>, Aubrey Li <aubrey.li@intel.com>, 
	Rik van Riel <riel@surriel.com>, Raghavendra K T <raghavendra.kt@amd.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Xunlei Pang <xlpang@linux.alibaba.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, Chen Yu <yu.chen.surf@foxmail.com>
Subject: Re: [PATCH] sched/numa: Add statistics of numa balance task
 migration and swap
Message-ID: <ufu5fuhwzzdhjoltgt5bpoqaonqur4t44phmz4oninzqlqpop7@hbwza7jri3ly>
References: <20250402010611.3204674-1-yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4tucdzeycj4q3iyr"
Content-Disposition: inline
In-Reply-To: <20250402010611.3204674-1-yu.c.chen@intel.com>


--4tucdzeycj4q3iyr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] sched/numa: Add statistics of numa balance task
 migration and swap
MIME-Version: 1.0

Hello Chen.

On Wed, Apr 02, 2025 at 09:06:11AM +0800, Chen Yu <yu.c.chen@intel.com> wro=
te:
> On system with NUMA balancing enabled, it is found that tracking
> the task activities due to NUMA balancing is helpful.
=2E..
> The following two new fields:
>=20
> numa_task_migrated
> numa_task_swapped
>=20
> will be displayed in both
> /sys/fs/cgroup/{GROUP}/memory.stat and /proc/{PID}/sched

Why is the field /proc/$pid/sched not enough?

Also, you may want to update Documentation/admin-guide/cgroup-v2.rst
too.

Thanks,
Michal

--4tucdzeycj4q3iyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ+06mgAKCRAt3Wney77B
SW8CAQCXwIcQIqtvT1iWJCuoc6huUPtKvhF+cl6qPbYfLvIufwEAltSTP9q9VKKA
ptKpUW0AUPlg9fYltaInQYPUopxCJgk=
=/Gj8
-----END PGP SIGNATURE-----

--4tucdzeycj4q3iyr--
