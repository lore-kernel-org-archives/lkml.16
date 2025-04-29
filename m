Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077372D4B51
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927172; cv=none; b=jl3AUKa/z6vEHmh8qW87oR3MZWohUCDFkSQEMNDWHhBSU7w8HvO3eN8dHbSN0pnQDLCseRf2p0bznqluLHMTBqjd3oXnkHYumUtKmDdCFtKc92zL8yW6ixF8nhmKEod/E8FKuMe4ROPMHj6jGf+XMs+olENn6AjvHZyCTC+SkCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927172; c=relaxed/simple;
	bh=ULcK5tqpMbySYpVfeIJT28xVpefLfkaAs7WExUaK2V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOOsWgJMEGq1gdqx1BBuF1hLZ3O/ymw20BXCAcmcsGimjc6ZTNZzhzFtjNZ2rFZMVa198Ke3rUE4NIooe+jBHeQHli4xjqu0BNo7JfA1KuWLITMAP43V8No1Gh+HeSs08U0rTUBqJ5UhYh3jLd3MJHXhyN/dDzzMR/MNmXKUHXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=a7C2cKzz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a7C2cKzz"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f5bef591d6so11323670a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745927169; x=1746531969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=znQpdTxcq5Q59q25hWrDZ7jqcfAs7XVIcl5H5jOTHxU=;
        b=a7C2cKzzs5yVR2SxJNS71x0+DFcvalG3AghOtS2uiVLM5AZ76PHFlHPLtsu+ES8sed
         dF3/kWuVEjSlUIFMzEOd6nSF7Vfjm6vI6/iaC3zfpvzaqJhVoSapa0yfYBhifS9YysHR
         Epy9teKgO4XaTz3RKnVxaNOHW+xfh4m0R3RZqyrl9yJZaXa222G1KsxfJYmOjD8V+tyW
         ocd1SHaDznCXG0cIoctclzO700ie6+UkRtK6f642d/JD4a4bc0pEyk1KHU6yvSJL9xiN
         HJHcwE2yCQ8nsdCv65douqA26vAUpeeXtT2busSV/SXz5AluR/fletWR4Q33uH9cibEo
         l6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927169; x=1746531969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znQpdTxcq5Q59q25hWrDZ7jqcfAs7XVIcl5H5jOTHxU=;
        b=I1+GJMi6b2IXyqVBkexnhM0e3WabzW1kB1mh+UZme7k/5LlN3WNtML/+ALPAl6Wf+P
         AfmJzWVA1IqNmk8mufsJbaaeY3WZ8/NYU/4NrPxYqB7e/naFaN3RLQDgN6y4g1Ry7GDV
         V0cGRG9QbW/MabZHFiSA+URhs2Cy4QUZNj0QKJR52e3ceYHNu7ztWvNHV+AFeRuOqYNk
         gcbaKWD/ILQy8tlY9tp/a4RlzH2Wc03Hlcgrwx9uJ43ifmNVWmGWXQNyo36vDxHfPdIc
         G4YW7zyZ0vaytvqRgpo4gJJ874d6OemU0kfLBxkrap2GEhgbpdPGc4DIZDFKBYh5UQ98
         Xrbw==
X-Gm-Message-State: AOJu0YxLeB+LzJKnFeph+zOhtAc5FYgOXuMw8x631O6ltPA12bEHi8rh
	exXITMWT0ShFVZUj2msZilJXbewslZph2wPOSxJ2gtl4vneymgR29T64DmiO7ls=
X-Gm-Gg: ASbGnctYJyEQpUUYghuTbwpKn3WxYkaEC7GeVphe1vJvq/X6XyYno2taH12vVnbQEzu
	ebFjMLEe3BDFUUL+54XZVf/yNN1dBcDOsQuTlLMjfZTNdoU+TO+ZO4cdfdbL8gNkL8adbrTpDda
	OKkUYhIAziKfBfdkSHJyhharoXTewwc1denSWSzqEWwqvO3MNoeVn2wLCPdm5egPPjr1zg4bywJ
	KPazX08899nfBPz8+b7zcTplKe+ahi1tuAkoxB9cG8EwRAt08OEhE5S9iw886rqnXIAqYPC6dS5
	7ZXWMb8Sa0dpRARqGVEO1dGc5J2QJ8iFLrTh24zBIxbKiexjOcU3rA==
X-Google-Smtp-Source: AGHT+IHdwrLpQIpUiiyBR38B/ZttRSS4g/Wv80xkTkGlVkMPcowVbaa+12lFPhCvhIOfAu66scr/kQ==
X-Received: by 2002:a17:907:60c9:b0:ac7:cfcc:690d with SMTP id a640c23a62f3a-acec6ab3db1mr282121166b.40.1745927168683;
        Tue, 29 Apr 2025 04:46:08 -0700 (PDT)
Received: from localhost (109-81-85-148.rct.o2.cz. [109.81.85.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6ecfa33csm760681066b.119.2025.04.29.04.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 04:46:08 -0700 (PDT)
Date: Tue, 29 Apr 2025 13:46:07 +0200
From: Michal Hocko <mhocko@suse.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	David Rientjes <rientjes@google.com>, Josh Don <joshdon@google.com>,
	Chuyi Zhou <zhouchuyi@bytedance.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, bpf@vger.kernel.org
Subject: Re: [PATCH rfc 10/12] mm: introduce bpf_out_of_memory() bpf kfunc
Message-ID: <aBC7_2Fv3NFuad4R@tiehlicka>
References: <20250428033617.3797686-1-roman.gushchin@linux.dev>
 <20250428033617.3797686-11-roman.gushchin@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428033617.3797686-11-roman.gushchin@linux.dev>

On Mon 28-04-25 03:36:15, Roman Gushchin wrote:
> Introduce bpf_out_of_memory() bpf kfunc, which allows to declare
> an out of memory events and trigger the corresponding kernel OOM
> handling mechanism.
> 
> It takes a trusted memcg pointer (or NULL for system-wide OOMs)
> as an argument, as well as the page order.
> 
> Only one OOM can be declared and handled in the system at once,
> so if the function is called in parallel to another OOM handling,
> it bails out with -EBUSY.

This makes sense for the global OOM handler because concurrent handlers
are cooperative. But is this really correct for memcg ooms which could
happen for different hierarchies? Currently we do block on oom_lock in
that case to make sure one oom doesn't starve others. Do we want the
same behavior for custom OOM handlers?

-- 
Michal Hocko
SUSE Labs
