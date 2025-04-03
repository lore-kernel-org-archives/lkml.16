Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF21B253344
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743703387; cv=none; b=To3ZtZd0MjZhSWWMT/ZwgC+F+JGQNKO8XKqgnCQ+E0CuQPb8DVIck5gJ2aYOj31Nai/8hchPxwjP4WKzXUd6tpju4CjUUxXPJfUkp3IPem2Yn8z0pN6ZWq4mvT6/+gvNEsGLwh7gt4i8YGROaw4GqDwgtpoT3q5vCj6R9WaNzyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743703387; c=relaxed/simple;
	bh=8bqspJWW+gl6XkucNMvM8Ewl32Fobkcp8JB8eqmHRw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aE58cCfk5vC1xU1kgrU7rk2brzX9o+9ViqFcHmPUwN+0NRjl7t3qz6nowoM+4CScc4JcXEkJ9GRokAh0I6K0KUdrpbCb8aIxUsa5n0g1hisSlOuQzlz3Mws0NDV62Bs/MUr+C2b55xBULtC6Xz20fpXbXPdD5bqO8Cmz/NPN//A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cpabh8kB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cpabh8kB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso8511825e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743703384; x=1744308184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8bqspJWW+gl6XkucNMvM8Ewl32Fobkcp8JB8eqmHRw0=;
        b=cpabh8kBGt6hp1+H1xkLcgm10R2aF8iiBSj4u7Y0h2tx4OAqqovsCnY2zIcZ0zQ/ei
         O7BEg24PzFo3Z2yH2/EMtwWjF8kfCIDsHeNyitVzMk0Bw6mV4oAkmReL1EDc3oLbo3VZ
         y1Sw0uVZiKnrR6geeeIDBpBt7aKEQ3wFkpZfDIn+gzVhThmLCeZY3Q3TwIfzC3i2nuaS
         bnUFEpm81+uF/aVHIAC7LdYNixJiotxFZFqTAWROfYeG2SisZ+0cDF+kXeVIjEaPFAZ6
         9wE50iN5MchxxHNOT2iZx3Sz0r4LxwmeSUNhuQDKadH6hpJDXY0YnClC2ahHFTmF4djt
         /onQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703384; x=1744308184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bqspJWW+gl6XkucNMvM8Ewl32Fobkcp8JB8eqmHRw0=;
        b=Dkg2gckFwcr055FvMpnD6O38Iy82CyA4hgnEBCCMcB4yu64kI6Cm8ykTqPHm0Lme7i
         DABsbYhKfBNwKC4TbEl4Y1ShHhV+kWJhozc+um4tVZvg5XVcE9lJFCHhHS8H8RG3LN77
         8K5+SwCOnUnDvUJyT9dtnSfqaJCeqLMNSHI6ko49sPQ30rqP9dLzSxeQkWGypMLmeNkB
         1/0XbQ/Zdkjxq4B4rSvA8f1YcBXoWHxQ9fvuvUWrpFU7V/SoVeS4DwsktNGb5ZfguZwa
         6dD/08oHn/Al+pw1GX0VY+fXvyBcDpEgbD7EA9kfV8OgtIq4dxxMWRJmlobk/6pf2mV5
         RlDg==
X-Forwarded-Encrypted: i=1; AJvYcCUveJm+h1OiBHz0BMqhQIKFUVls3AlsT4YX3mx1DX9gGoKJ0aRRSuuJ3CpiF5krOTj6e8Dy3fr56qTiftU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAcigPs+zbR3evOuyncVctivDBK98Fc26YBdUnREM1vlW574EH
	IJwv+JHtM6IsoNHBdXctF+eFdQkzhJQ5FkL7DFohZ45QBeiPtR+uMOMr5OgRTjs=
X-Gm-Gg: ASbGncsDEWV2O9saBb6gi3s7UTxZEGevA4mjPGrj1De05gQKKAQ7pmx6s65BFCYG0Zq
	/pc7Dp4L6SGS6cRakYKgVusmhOx994uknd/lkAglUQy6XkBabV/tMh7aMShBZiKk/GaM9cDokNW
	Ik3a2R93XmyNLsfoKUfm5E1fRb2+dK+1PQvBDfIOCK5LipcdZF4ybPrWnEtL180NYXyB3qiF/0z
	zQQhp4mSntZPqKgIN6uDBUFrU97GqRLAmuV5UeAry3JfT4hmxYmHIJS5oS9ShyTH2QN7akcyS5l
	q+9hDiRZvnzjTo+BlDAtbOREBGjieNjf/6sCa+evHaG7fQ7X9dXfncx4+g==
X-Google-Smtp-Source: AGHT+IHc9+xcqKfnS5TtRa8ckiUJWDR/Q3sVK7iLIqV18S7EGnZzlO47g3UTmwdBkNHAhiFPjh7kpg==
X-Received: by 2002:a05:600c:1f86:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-43ecfa06ab0mr424785e9.32.1743703383971;
        Thu, 03 Apr 2025 11:03:03 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec169b8a3sm27842955e9.19.2025.04.03.11.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 11:03:03 -0700 (PDT)
Date: Thu, 3 Apr 2025 20:03:01 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>
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
Message-ID: <ufnmsikyh6budl4qkhy5o4m76yldvlns3yja743bdwvxwsljer@ztbsqf7gx6oi>
References: <20250402010611.3204674-1-yu.c.chen@intel.com>
 <ufu5fuhwzzdhjoltgt5bpoqaonqur4t44phmz4oninzqlqpop7@hbwza7jri3ly>
 <7cbbbd8f-a4b4-491d-bb60-97defff6007c@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cmo6hhl6vnnkdo2y"
Content-Disposition: inline
In-Reply-To: <7cbbbd8f-a4b4-491d-bb60-97defff6007c@intel.com>


--cmo6hhl6vnnkdo2y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] sched/numa: Add statistics of numa balance task
 migration and swap
MIME-Version: 1.0

On Thu, Apr 03, 2025 at 10:47:44AM +0800, "Chen, Yu C" <yu.c.chen@intel.com> wrote:
> In the context of NUMA balancing, it would be helpful to not only monitor on
> the activities of individual task/thread but also the resource usage and
> task migrations at the group level - which helps us quickly evaluate the
> performance and resource usage of the container - like per memcg
> numa_pages_migrated, numa_pte_updates introduced in

Somehow I thought that these are the useful metrics (amount of misplaced
memory) and the aggregated task stats aren't interesting (they'd be more
or less proportion of total number of tasks in the group and you don't
know which task it was).

> Got it, will do in next version.

OK.

Thanks,
Michal

--cmo6hhl6vnnkdo2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ+7NUwAKCRAt3Wney77B
SXyAAP9zRNbWyXvRY68kwReBWQwU+IWj9P0H4vV7txVVj+beHQD/Vl708/8cL+7h
OSXoRbmFYGoPx1rHTLM6MtQrJS4noAA=
=Vpoo
-----END PGP SIGNATURE-----

--cmo6hhl6vnnkdo2y--
