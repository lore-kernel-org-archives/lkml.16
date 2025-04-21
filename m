Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7844C22ACE3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745276366; cv=none; b=h+8Z5rhhmeS9jtwJE1b/lO2M+GOyIaJ0ojiZI7M+l2wKNOo+dxUgvYPKlu9idSnNM9jdg698oIAczosKDUyb/7rINoMYji6s5CWHX2Q+Ec+B2TtfxnjhN9/rsiRwJYnPWixviSGwIqlqawnoQgvp0MFYutQ6Z164YKZ/1IpQ3e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745276366; c=relaxed/simple;
	bh=ebsskF4Rmx9x2NEcLJ3VCcQSQ/+L1tQBK+Pn+z3GXaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drhpVcvzfFeaLFIbH0a38ncoer6+pcB3QHHHu6eBh0/Q6dMVj7Dlh014ybJEpFOGlHoT4IuZsO0X4vesCBSHe3iruW7zZpN5qZAC+gPkRuEdOiQ1UHxUO1OlLUhqYL9geTEC1e1hiMzabqD1fVK4GPwEFMpxglcYQL6ktU/Q4PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=EgWVdVWN; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="EgWVdVWN"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4769aef457bso53928301cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745276363; x=1745881163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCxYzSvMQrXsgyqCqZOeSZ06BULrmA1cRmi98g2+icg=;
        b=EgWVdVWNBi9KfwYxmeMa80V7aPGhahxPd63cLqj4un87WlNvXolXZ/nj8QfWt/3K61
         xwMhuO630wQL8P/IR+6S3G8WmpgSnoNXv6snIbLKxFHXBL3KODtZ97ZW0tiT/xcjYAkT
         sBPhqt78QMJCFa0QfGZkkh/OJ0v+y7iq080XdU1jlG14mQP/+fGggCqYyb33YOeU++Fz
         UtFlQCX8B9F20AwMbbhQaZOEfe3IMoxLutCITT4UYNTCUzFrERREqSsVgzbPOimeUBK+
         DIn8SwZ07EPeCmCGNten1GqXeyTBzfxekHifNmPM1VCLImQjgLZjw/dEIk/O2PHtiojM
         SVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745276363; x=1745881163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCxYzSvMQrXsgyqCqZOeSZ06BULrmA1cRmi98g2+icg=;
        b=FIu/Hd1gkJ5rJnbLJMAnqg9eVt4ByZldFByXUx7S1ucjKo2Qp1DPV3w5a0t5immiVi
         b+s/NBtd7dqTTFQkt0DvoqdwaAU7T9T6oK5l7kA1SQc7v+lIwtvKBhz3yRXKU2nQt0rY
         n2kAOy3bWV4Oeyc0e2al5PAxWQ37ZLOj1+FVJdKlxM/DIAUmwfurvXiLQpWLgO9icf0Y
         5aDxSgLzhgDksusxMqSu/b/1+AaVauKYw5bs5bQ0MJtUf8RujPZdFZIMtDXlnDWq+cRJ
         9+NgIBO4dw67mhFIGGaUpp/O/GCKgfS6po/vF2MLgakknQNykdb4USDuYPwTayLDjceD
         l30w==
X-Forwarded-Encrypted: i=1; AJvYcCWncjZvrgdhvYff05Qy5H13+Y+1EG/dVINWqyq2chgZ8TUPU/4EvpPWBPSaRfNDMa2ed96V4mimXGs7x/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb4Vgzl9AuN2aZwu9X5Rh4AoB+eRNeqvwVHoocoUXwCwQeDGES
	DBOJBy3JpNJVU9TvSQ+CEtqeH1WF9LOCaG86F4b/Uzfr3FdTSEsMNNFO74VmVDI=
X-Gm-Gg: ASbGncsgDrWnAuBJ6Y9yFpRmgPkriPb1FdikjR7L8lxDLNdjB0iEMuVnpjTEdzrmccu
	0YbORXOxU9J5x1y13B7050cZg2SWz9hWxOi/4hBBgmi3UhfcYeCvhgvCXJ/KpKAZwu4FNzENuen
	7I7qXGb0EvrAfU7RwGQkeYP683hDUye68ftCWLY2yVxqaGId94tbOqbnraAh95s0gzHoJTJe5zV
	BcYbryd96CjkC6DyL35UWnBf8+812PGQGivU+LW2JXfzDtsi5qTAsMg9UhHVJZb8f0TrZl0ileK
	vX/2gSpzSa8ybHiGkxKhaa2dk6pu2ZedVi04X4GrqTwgQXqWV3Ls8g==
X-Google-Smtp-Source: AGHT+IETwYmaYx0EttRck+9kgxlJI3atNAQf8VACLl80GW0wQZExnGpeej3Nd8ilBizlPR2Jq06v1g==
X-Received: by 2002:a05:622a:180c:b0:477:13b7:8336 with SMTP id d75a77b69052e-47aec394c93mr174731611cf.17.1745276363290;
        Mon, 21 Apr 2025 15:59:23 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c4d68csm48905001cf.47.2025.04.21.15.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:59:22 -0700 (PDT)
Date: Mon, 21 Apr 2025 18:59:20 -0400
From: Gregory Price <gourry@gourry.net>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Waiman Long <llong@redhat.com>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, hannes@cmpxchg.org, mhocko@kernel.org,
	roman.gushchin@linux.dev, muchun.song@linux.dev, tj@kernel.org,
	mkoutny@suse.com, akpm@linux-foundation.org
Subject: Re: [PATCH v3 2/2] vmscan,cgroup: apply mems_effective to reclaim
Message-ID: <aAbNyJoi_H5koD-O@gourry-fedora-PF4VCD3F>
References: <20250419053824.1601470-1-gourry@gourry.net>
 <20250419053824.1601470-3-gourry@gourry.net>
 <ro3uqeyri65voutamqttzipfk7yiya4zv5kdiudcmhacrm6tej@br7ebk2kanf4>
 <babdca88-1461-4d47-989a-c7a011ddc2bd@redhat.com>
 <7dtp6v5evpz5sdevwrexhwcdtl5enczssvuepkib2oiaexk3oo@ranij7pskrhe>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dtp6v5evpz5sdevwrexhwcdtl5enczssvuepkib2oiaexk3oo@ranij7pskrhe>

On Mon, Apr 21, 2025 at 10:39:58AM -0700, Shakeel Butt wrote:
> On Sat, Apr 19, 2025 at 08:14:29PM -0400, Waiman Long wrote:
> > 
> > On 4/19/25 2:48 PM, Shakeel Butt wrote:
> > > On Sat, Apr 19, 2025 at 01:38:24AM -0400, Gregory Price wrote:
> > > > +bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
> > > > +{
> > > > +	struct cgroup_subsys_state *css;
> > > > +	unsigned long flags;
> > > > +	struct cpuset *cs;
> > > > +	bool allowed;
> > > > +
> > > > +	css = cgroup_get_e_css(cgroup, &cpuset_cgrp_subsys);
> > > > +	if (!css)
> > > > +		return true;
> > > > +
> > > > +	cs = container_of(css, struct cpuset, css);
> > > > +	spin_lock_irqsave(&callback_lock, flags);
> > > Do we really need callback_lock here? We are not modifying and I am
> > > wondering if simple rcu read lock is enough here (similar to
> > > update_nodemasks_hier() where parent's effective_mems is accessed within
> > > rcu read lock).
> > 
> > The callback_lock is required to ensure the stability of the effective_mems
> > which may be in the process of being changed if not taken.
> 
> Stability in what sense? effective_mems will not get freed under us
> here or is there a chance for corrupted read here? node_isset() and
> nodes_empty() seems atomic. What's the worst that can happen without
> callback_lock?

Fairly sure nodes_empty is not atomic, it's a bitmap search.

~Gregory
