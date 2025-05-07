Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D598B1C84D6
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603020; cv=none; b=Uqqxkhi5Sliq7BLi4UyNITaReB/XUM0SO9GbtY/2jW6+727i15Y3pw1iA0PZNUPy+cpMpdQuA5JIjMw8D1LSeSd6tAdLlvN81KzbbCQ+wrEn+WAicxFR95+YnJoOt57VDZjxkzlF4eTXCDMxIvWr9RhMJOKh8ACNSWJUOvPD3PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603020; c=relaxed/simple;
	bh=mxOCt6r8dMXXF8BI8yGOpQKEl8akEH/Tk/ST6h75VNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcgOPAvhNg3SM2iWGf24ntDxHikBt6TgpaOZwJkXmI41sbXuNRRkiqy1P3o3NkpFAh9bJ7POOxdKDus3IYzUXCrAl9YIMkF4jDqPUOmDeSrRK4WWdbPNA+hknmwgjjVanB21OSNNc9D1odl7lbSqv/ccohFulXN7+8XLFgE+RvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P+IAQNv1; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P+IAQNv1"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so1059035666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746603016; x=1747207816; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FUcSqGima0N93ktxJzZwEEa+6e2a/wBilAPnrzIPDEg=;
        b=P+IAQNv1w9zC5RgPKSyKEAshrNq4Qj26AAyG8xFzZfbOHbCuoHQqtkXYhnvF/5k46t
         i9i2alUD/kHkaQkEMaAkodxX5iqaOGpEwlAL3tW3WolPskhhx2k+r9PtNmYRTrlYm4PW
         3vuRp4RVSMR9q3X9J1QxV8QclNlQDxLSw3Ral4p8HvvDCVCuZOcUxRErk4zPLvpnn2Xi
         7XjnoiKUJku0aNkZ8vOOD1SQ8ltNOgNhva8NN9RVTua0/Et7zSIW2Xtp1mXFC4VjEj7V
         OAss83Y3ivMBQcz9YGXPEcFzymkM+IOeq7tsYi9SV1s/iX3F+z9VyRUrJIMuxUx6LW12
         CrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603016; x=1747207816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FUcSqGima0N93ktxJzZwEEa+6e2a/wBilAPnrzIPDEg=;
        b=fGTv+vWroazK6UIDDxTHYe7Tk0fCaeX5LUT23Uehs02/wW0UdO7An0KdMnC4DooAa7
         2LlPU1soncjw2gjzuQIn+lbt7CEgI1xl4BbdwhCacCnHvNovp+zxFFjwKIB3TbDhUN61
         CDYdAaadv9sRWut+eWieISh1RgBgSpgwHeE1BH10zFoRdV6/gPZmzwcn+i4voePthAl0
         PDGmQKLlJRQNBqdL7JOl1RSzVTBMptHU5kWXDf+0cppqf5n/PfQWs1wk2PcoODBKAqvy
         SMIzMYaOw+Ao9T3aGPpRag1jRPlquF+VZ9jzRFCLSf9JPpSLxbty/MlufJYSxNtjpi3z
         ThRg==
X-Forwarded-Encrypted: i=1; AJvYcCUU8LpAEHqfn6w5PUqaLcCRFYfcpuck+ErPMaIwJ70m4vjKxrVzsvjw44AiksS/SUFgy3ybeIJRBask+Jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YznhgPbxtEkPOW6mzxTF7lxc6yhmAO43vIAFrglfYGD3rja26F6
	7l6ugzHy0NyP5Hxuopm+1g8XZt5VBgv/G+rrkOP5mbplrfI8Z5zbzJI6BWPzR2x3FZxWMzkJbXW
	W
X-Gm-Gg: ASbGncthsN/JY9TJYd8l1fY9J6jd62MocQA+J1+BaxbZ/G3ympaR6vH3lLoQV/4bw1W
	rJCvfeTL/2smAN0Z7FMKsY0yIN0FFQTdYCQbYUhj8AxanT6/ZyZDtOgztX0avxC+JmOm7U4McIS
	BmvNmULIyQxvLs+NNbxUCBAweYdUCjXYGQjD/0kw9h2RcQjDcEJko1SczR0eKcf1l6vFgY+inpi
	A4AA+gOl8qKpfvxKDU1WwSq1G5g65UbRk7Am5MKK2J/d3ZBIwaCDHDdGP1ad5YiE7cehSKaaHlm
	NMoe9dt31/rhH2YNUSMspEJ0TMGS7Nw=
X-Google-Smtp-Source: AGHT+IHqKJq02AuZsFAg2B/0m60918EK+9L4EdzuO2FhU+iMmip8U73qvmZiflX/x/5tz03zWRyg4g==
X-Received: by 2002:a17:907:8d85:b0:aca:cac8:1cf9 with SMTP id a640c23a62f3a-ad1e8ce4638mr216327466b.33.1746603016054;
        Wed, 07 May 2025 00:30:16 -0700 (PDT)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad1891a2515sm862828966b.39.2025.05.07.00.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:30:15 -0700 (PDT)
Date: Wed, 7 May 2025 09:30:15 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>,
	Greg Thelen <gthelen@google.com>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v3] memcg: introduce non-blocking limit setting option
Message-ID: <aBsMB3oes6Kn0TEl@tiehlicka>
References: <20250506232833.3109790-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506232833.3109790-1-shakeel.butt@linux.dev>

On Tue 06-05-25 16:28:33, Shakeel Butt wrote:
> Setting the max and high limits can trigger synchronous reclaim and/or
> oom-kill if the usage is higher than the given limit.  This behavior is
> fine for newly created cgroups but it can cause issues for the node
> controller while setting limits for existing cgroups.
> 
> In our production multi-tenant and overcommitted environment, we are
> seeing priority inversion when the node controller dynamically adjusts the
> limits of running jobs of different priorities.  Based on the system
> situation, the node controller may reduce the limits of lower priority
> jobs and increase the limits of higher priority jobs.  However we are
> seeing node controller getting stuck for long period of time while
> reclaiming from lower priority jobs while setting their limits and also
> spends a lot of its own CPU.
> 
> One of the workaround we are trying is to fork a new process which sets
> the limit of the lower priority job along with setting an alarm to get
> itself killed if it get stuck in the reclaim for lower priority job.
> However we are finding it very unreliable and costly.  Either we need a
> good enough time buffer for the alarm to be delivered after setting limit
> and potentialy spend a lot of CPU in the reclaim or be unreliable in
> setting the limit for much shorter but cheaper (less reclaim) alarms.
> 
> Let's introduce new limit setting option which does not trigger reclaim
> and/or oom-kill and let the processes in the target cgroup to trigger
> reclaim and/or throttling and/or oom-kill in their next charge request.
> This will make the node controller on multi-tenant overcommitted
> environment much more reliable.

I would say this is a bit creative way to go about kernel interfaces. I
am not aware of any other precedence like that but I recognize this is
likely better than a new set of non-blocking interface.

It is a bit unfortunate that we haven't explicitly excluded O_NONBLOCK
previously so we cannot really add this functionality correctly without
risking breaking any existing users. Sure it hasn't made sense to write
to these files with O_NONBLOCK until now but there is the hope.

> Explanation from Johannes on side-effects of O_NONBLOCK limit change:
>   It's usually the allocating tasks inside the group bearing the cost of
>   limit enforcement and reclaim. This allows a (privileged) updater from
>   outside the group to keep that cost in there - instead of having to
>   help, from a context that doesn't necessarily make sense.
> 
>   I suppose the tradeoff with that - and the reason why this was doing
>   sync reclaim in the first place - is that, if the group is idle and
>   not trying to allocate more, it can take indefinitely for the new
>   limit to actually be met.
> 
>   It should be okay in most scenarios in practice. As the capacity is
>   reallocated from group A to B, B will exert pressure on A once it
>   tries to claim it and thereby shrink it down. If A is idle, that
>   shouldn't be hard. If A is running, it's likely to fault/allocate
>   soon-ish and then join the effort.
> 
>   It does leave a (malicious) corner case where A is just busy-hitting
>   its memory to interfere with the clawback. This is comparable to
>   reclaiming memory.low overage from the outside, though, which is an
>   acceptable risk. Users of O_NONBLOCK just need to be aware.

Good and useful clarification. Thx!

> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Greg Thelen <gthelen@google.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Michal Koutný <mkoutny@suse.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Yosry Ahmed <yosry.ahmed@linux.dev>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>

Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!

-- 
Michal Hocko
SUSE Labs
