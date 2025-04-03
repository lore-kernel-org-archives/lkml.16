Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FFE25178B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743703063; cv=none; b=HZ1KAPGEb4Q9/1LuCGwQm2beg6xMEhDkNo4liLslXLyecS1bPTpx9CwwraC1nM+0akoJMIERW9BfoqhoiryVylSmAc/CPsdkHJCvHsFiUW/CXRIv002oTtJNkRenm7ehCTKnAwYHZBR1YF71qA/BZt9y3PiuariaFwOb+BJvvxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743703063; c=relaxed/simple;
	bh=aQe0dG2t2PdKaMN2uEpck+VEDItnqutZ4+rHhe9oGz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODZeTrh0NRG8ANGQoJSjQbBOGF0BIensiAqYWhAfbUpxILz2YiPMcqONOm3Tmv+6siJMH5oDqRNW4u04yO9g2QRbJwQj9UkXKRe/aqyFCOgiEwtSjH6VbP+tMS4S6oG8CkYsHLe+tkkQMoNz7WIb2fdJA3P6PCWjdftt8mjXTIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N8XjXlR1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N8XjXlR1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-391342fc0b5so964431f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 10:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743703060; x=1744307860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aQe0dG2t2PdKaMN2uEpck+VEDItnqutZ4+rHhe9oGz4=;
        b=N8XjXlR1ESCMMPQdngHb9oJDOykJPsAndSIDLpxDnmHkwZMzVlW/UijEZaIHszsu6z
         1FRGCmC6gZpjIvJ1kCx6jQe4+gzVXTIdtmiMNv7Sih0tOvPMUo02t0zOtkZY2EumWvfX
         kil7Yqkg6p3M4sp1+Vs0aYw/pNlQ/p3/nGVHZTNTFsJOW5tbLfJ6FJ3yyJojDwfEZtvf
         zoorh7tD8kIwjUWTLOD+wNJTe2rbcM41ZHiZKXvroGXIFhhhrGy/LujGzQAUiB0xyuo1
         jGRTcSz2UGQE9AW5USCbN3r8d9JincYfy4EuBCJ1E7fG2YTo5Q5pMW18YK1/KhSssO11
         QqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703060; x=1744307860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQe0dG2t2PdKaMN2uEpck+VEDItnqutZ4+rHhe9oGz4=;
        b=dL/nTk8y9ngOsfG4O4iJICwkH+l9mcybGl7uD0Q/3npE3eLv6UI0EwcxNccH+mKMtz
         FTZP9megW7OSz5g98zQEhDmrzjGBWOXxRUaHzQ9q+iLYATkh3M9Dw70sNy0pZv0Fv/3W
         JB91pfZQkQ2KpUoh3mGgGolZJ+zia5FexRBGfdjM4So8zcCYWrSww8McVplUJAheCASI
         lB1agJX3w8a4CGuj1PDQBegWEIWeYxB/B5pjUJ4zYk+xlpkBj4ACVFg2ewGUT7coeGu7
         Ts0swmM8jYAJXECIP2diMdiTlGsYjipVptx/3k1eakIOC+0HfinT78xR688Eaid8GHST
         rLMw==
X-Forwarded-Encrypted: i=1; AJvYcCXg9SveTUbaPT9GP/I64SxD9UlruoccD1wQD//59PaVQWmcg3yKcVwXhwP744+hwkzf8Zq54z2T9ewOMrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzavFX3JH+h1Yw9he+I6iyX2DS9czapjDDhmvbtF8TnJQ/+ouuB
	kwBnJfW/kFTK0/ZgdbCG1xdRqabDinfYUYoGJeNOvU0KDWiAwRj2d/W9kddZ+as=
X-Gm-Gg: ASbGnctBXkr14H1BIGVNyflJup3xXJowQcnqhzaatb1W7y9Hq6nywB4x+Yej70Wv2Ei
	+5Foi3+sRLKy3efmxdbsnikRelY2GqgNwXf8OdoJs1vwkG0yuqmQbfP7soGrT8mkbYE+V5piiHR
	DRqZzJT5KFY0cLLhXbGVOvLNB5tlXRDMjGONC0UGnlQbbu9smLZJvf310Ut6O9Pu1046zBZBFNU
	qZWDKa5PS9dI+W8JKYAsI4vec+9R7ny9xMh2/dSQUV0OcumvUG10qdYbAbnXb3XkXu2hNG7yGsY
	CN6OKwuXXMlRgLL52AVaST1vrShRpJ9Gzurzx537GO7YnX0=
X-Google-Smtp-Source: AGHT+IGGLzZEpNqM6rKSLI7qiGvPhUOyR8Me69L/N0NVms1TUpJkn/DB/jchypOx5p6MFN/+/u0KoA==
X-Received: by 2002:a5d:64e6:0:b0:39c:1efb:ec93 with SMTP id ffacd0b85a97d-39cba98b7edmr195916f8f.48.1743703059686;
        Thu, 03 Apr 2025 10:57:39 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6ae5sm2415661f8f.32.2025.04.03.10.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 10:57:39 -0700 (PDT)
Date: Thu, 3 Apr 2025 19:57:37 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Mel Gorman <mgorman@suse.de>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Tim Chen <tim.c.chen@intel.com>, Aubrey Li <aubrey.li@intel.com>, Rik van Riel <riel@surriel.com>, 
	Raghavendra K T <raghavendra.kt@amd.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Xunlei Pang <xlpang@linux.alibaba.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, Chen Yu <yu.chen.surf@foxmail.com>
Subject: Re: [PATCH] sched/numa: Add statistics of numa balance task
 migration and swap
Message-ID: <rifx3cqihmywhslbnpy6ge3pvl3acvgaasxvwyurrip3ewljnn@xqb4lex7xpsn>
References: <20250402010611.3204674-1-yu.c.chen@intel.com>
 <ufu5fuhwzzdhjoltgt5bpoqaonqur4t44phmz4oninzqlqpop7@hbwza7jri3ly>
 <7710c312-77da-4b8d-bb80-74598433ecd6@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5inkdjfgglli4fgy"
Content-Disposition: inline
In-Reply-To: <7710c312-77da-4b8d-bb80-74598433ecd6@amd.com>


--5inkdjfgglli4fgy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] sched/numa: Add statistics of numa balance task
 migration and swap
MIME-Version: 1.0

On Wed, Apr 02, 2025 at 11:13:03PM +0530, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> The /proc/$pid/sched accounting is only done when schedstats are
> enabled. memcg users might want to track it separately without relying
> on schedstats which also enables a bunch of other scheduler related
> stats collection adding more overheads.

.oO(memory.[numa_]stat could end up with something similar since not all
users are interested in all fields but all users are affected by added
fields)

Thanks,
Michal

--5inkdjfgglli4fgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ+7MDgAKCRAt3Wney77B
SSJtAP9y+6MLacyhDdxgIDeSpr9nE4pWSv811LCHFbY5X5xYSgD/VmDhJjTHW9mf
2qZ9YjklpUmxbrQuWSOTeWSJ/KvBug4=
=XD67
-----END PGP SIGNATURE-----

--5inkdjfgglli4fgy--
