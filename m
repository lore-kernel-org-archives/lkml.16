Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA04C9D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 03:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745034458; cv=none; b=gLGVA+heHYxk/3PjJ7vaHD4PWi5qSi4M1YUTmEJM2/f85Vjba5oaOLXi3m0KFNwC78DRhDxpkYn9gMJHL/HlDGTl+EOk5pTXTJ8xhrHAkIF7EVryUzJKwXBrPlrlqx2BQXxBYej1m/E5De4szaxUtCmM9gmmxr8UrMYXlTjuB7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745034458; c=relaxed/simple;
	bh=bDGf7ax5uP145Z/QywUJDacWIi6TfWyn1aWA58lT7uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBBED6UIH/R8uT3GoHVl+dfa5wCGihutPSwU3r4RsIcRnrLfYQdsQwMVQRjZ3+CX8yJXMku7/fXdlDV0JnZdR0GzaLiX1cSYb2Wbq26S45q8l0eq4XbQjmvB/CoIPfIcZaroOvhjGmawp/UFhEQQt8i7euLVMuGX5O8MBdBwA3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=lHSPqzJ8; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="lHSPqzJ8"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c58974ed57so222298985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745034455; x=1745639255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oGkr4hYBihWGh7JmZ8GOd7BMmZ2Z6d/IyfdB5vi5hx4=;
        b=lHSPqzJ8gu/CYWVc6WvFFgDSRUE7tIs3dSF7guM+aO0BubMIjvkrY+PqR4YCeDdrLK
         U/uKmfw9ytzv89LuGk/3zMmWqSAuDlE69jDCisZ6zpepI45y5x8Ios97GOWfQsP+ddp6
         Q34NupwdEWIQ4435jbM7SZ6+nrElvstuaRn+cr7idflh55Lr8IfFGpPSB+zW+Qpvp1ZN
         gLuIW6aCuYU3yz2LVgjD6kGf/th5YqU5+y4SWFKLIv2A+cYQLHXRu7gegc4OiEK3vtYb
         D1HG7eBo9BkH7cCOUohqp3ylnFc2ULpqaPey5X9GQxDGqtIBcjS86/BwIVs3daY6Wo8M
         r0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745034455; x=1745639255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGkr4hYBihWGh7JmZ8GOd7BMmZ2Z6d/IyfdB5vi5hx4=;
        b=bXWOnyzNN9vDQIbwR53iXCUE3Zl6hm3WGdeE2tcCWXTh4dy7s5gEg2CYF12yuuzK4p
         v3n4h6IidDbGlnWSMFJ+HvdjnSVAMad91o5AarP9nAxdsroyUcjuqLe4Mzbn/MNSiZ1j
         wQQJOhbc1P4oB0HfY1i2QMrnHCfKKPsh5povu09gRMZL771PzFAL3i6/qdg6+cXUzxmb
         YX5cDulQVJBEdxSbh6UB+v8QI3W3pcLOVLuHs6eapLDA4wSEI0Feep/jyjDgx47bw1Le
         RQ4odvH11me8zX/jEx/Bn9+3T8Ed/bPMIalNBkbNGjnXh78s4bNI7KRUzvhp3WbCHZcH
         4ifg==
X-Forwarded-Encrypted: i=1; AJvYcCW94qWI4DXop2aoQZKBy4j1QRAdC3fmRD0paFeS6VVPE5+88odrxPqTliDeUhLOvBQhYC5rVGllexal+Po=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1ntmD8EBS12/7HClg1xiOeMF03Qc2eRTCI+09rvX8fWPq+Xm
	tTdJL6ig0dsPUxwlOnra2TBERNBV4w++UNNnSJopfHzVbM7DPIAmtrMtED+u+TM=
X-Gm-Gg: ASbGncs40y/ISE1cXrVLcK7FfRzOk5qhmEMtSsE6ttvw+mHoV52QHFjsvG7TBGCXKMs
	zCv5C4s8EitG8vCtKxeMP1moej0NpXo4wIt0+9CybH6azEwWIWysryhg6/Lc58E6r6bbNrLYIpI
	XCCaa1G7WxLQgLgV6sGuC3QkUbhgYZapMl0vx9cnhR/hqcmPgFzyuEy4RaPtWnw3OkQpUI0KB0z
	oIfiG5hVzzK3JSFv5lW/nFRz81PhHZ4fFg3zfBLs4KmpxYBysSD1q6Z+t5afZAQbzI0FYOlZR2Z
	LmGwmWcC6xnHGRLCSMb3+ugrvNp7fzyuMvz3J8jZmkjGnncyxbRyoo0EC4ZNfxgooG62kU1e8T/
	vdgnfTLdJJPaAsiecSDy1hB4=
X-Google-Smtp-Source: AGHT+IHLpDeJmAWC8vn48omh/WZzD3TF09eoVh++JIk/Dh5S1v8tWk78RgXlZgP26pjlrMn9VABJOg==
X-Received: by 2002:a05:620a:4413:b0:7c0:be39:1a34 with SMTP id af79cd13be357-7c928038eb8mr806824685a.43.1745034455556;
        Fri, 18 Apr 2025 20:47:35 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6ee74sm177409985a.1.2025.04.18.20.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 20:47:32 -0700 (PDT)
Date: Fri, 18 Apr 2025 23:47:30 -0400
From: Gregory Price <gourry@gourry.net>
To: Waiman Long <llong@redhat.com>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com, tj@kernel.org,
	hannes@cmpxchg.org, mkoutny@suse.com, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, akpm@linux-foundation.org
Subject: Re: [PATCH v2 2/2] vmscan,cgroup: apply mems_effective to reclaim
Message-ID: <aAMc0ux6_jEhEskd@gourry-fedora-PF4VCD3F>
References: <20250418031352.1277966-1-gourry@gourry.net>
 <20250418031352.1277966-2-gourry@gourry.net>
 <162f1ae4-2adf-4133-8de4-20f240e5469e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162f1ae4-2adf-4133-8de4-20f240e5469e@redhat.com>

On Fri, Apr 18, 2025 at 10:06:40PM -0400, Waiman Long wrote:
> > +bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
> > +{
> > +	struct cgroup_subsys_state *css;
> > +	unsigned long flags;
> > +	struct cpuset *cs;
> > +	bool allowed;
> > +
> > +	css = cgroup_get_e_css(cgroup, &cpuset_cgrp_subsys);
> > +	if (!css)
> > +		return true;
> > +
> > +	cs = container_of(css, struct cpuset, css);
> > +	spin_lock_irqsave(&callback_lock, flags);
> > +	/* At least one parent must have a valid node list */
> > +	while (nodes_empty(cs->effective_mems))
> > +		cs = parent_cs(cs);
> 
> For cgroup v2, effective_mems should always be set and walking up the tree
> isn't necessary. For v1, it can be empty, but memory cgroup and cpuset are
> unlikely in the same hierarchy.
> 

Hm, do i need different paths here for v1 vs v2 then?  Or is it
sufficient to simply return true if effective_mems is empty (which
implies v1)?

Thanks,
~Gregory
