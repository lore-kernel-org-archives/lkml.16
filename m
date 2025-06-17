Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3D72063E7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750189140; cv=none; b=BevuI9/PjmxORXXSqaivoJpVglNbKymveAVLasukqnbCcsq1nPuxT/NgUNgmK9iFmubUdMQRsXTXpOvzjcmv1YhRpgU85kMLXFvkZHAZvmeGK5dL9I2Tuf/YvKKrswUlIilPlwlq28Elqg2BqTbsB84s4kSviGN3aMPnqTbjIN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750189140; c=relaxed/simple;
	bh=T6/GPJUaE5MWO1xJYkdWZ+ZjWpepTkI5T3JAT7p2KUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+zlfwZ+nUv7AJgLIO+yDMFMI28DW95zAivYOw6lr7+nSwUpdbvgwmaEpW9ymzakFs1T+nI2iH2MSyx03jf6fjbq0gRmLgnl8df6SDtw5haG7bR4+kE23jVx/SLprwzdM5v8G8gwHMGDxtPjFfGAJ/j3tdkFQcZIejDKHXtSL1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nNiMjqme; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nNiMjqme"
Date: Tue, 17 Jun 2025 12:38:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750189135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4glMiMkHgRFcU3DsIIfl2zw2C365sdHCF6BOHGpWlxw=;
	b=nNiMjqmeytdSt1NSBO5GH+jC1MrgK7NYBOn2uyEclOXBjXHdzP25+sRv/P2PRE5rEyZ2q0
	iGPJUFqtq+6LpgyKNtZXmdoJu8jXYcuvKcVSdzMuZjVtwwSxZyKhXth4/55VePAC7lo1MI
	TSu8dvgo7qJow0bSx72Tg6xP6XI1jZY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Tejun Heo <tj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	JP Kobryn <inwardvessel@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Vlastimil Babka <vbabka@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, bpf@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH v2 0/4] cgroup: nmi safe css_rstat_updated
Message-ID: <rnbk6cnvkvpdaei7zhtgcmzw3cbokmbgt6qnorf5cpey5ievlq@yffgq4oslnvv>
References: <20250611221532.2513772-1-shakeel.butt@linux.dev>
 <aFBfNRVAyE1FU9aQ@slm.duckdns.org>
 <qtudjvrdvbsz6rrygb5bt32dzps6ocwefhr5hyfgtam65jowdo@colgnna6ogqm>
 <aFG8mZOOwl9s5ySm@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFG8mZOOwl9s5ySm@slm.duckdns.org>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 17, 2025 at 09:06:01AM -1000, Tejun Heo wrote:
> On Mon, Jun 16, 2025 at 12:20:28PM -0700, Shakeel Butt wrote:
> > On Mon, Jun 16, 2025 at 08:15:17AM -1000, Tejun Heo wrote:
> > > Hello,
> > > 
> > > On Wed, Jun 11, 2025 at 03:15:28PM -0700, Shakeel Butt wrote:
> > > > Shakeel Butt (4):
> > > >   cgroup: support to enable nmi-safe css_rstat_updated
> > > >   cgroup: make css_rstat_updated nmi safe
> > > >   cgroup: remove per-cpu per-subsystem locks
> > > >   memcg: cgroup: call css_rstat_updated irrespective of in_nmi()
> > > 
> > > The patches look good to me. How should it be routed? Should I take all
> > > four, just the first three or would it better to route all through -mm?
> > > 
> > 
> > I would like all four to be together and since most of the code is in
> > cgroup, cgroup tree makes more sense unless Andrew has different
> > opinion.
> 
> Okay, I'll route them through cgroup. The patches don't apply cleanly on
> cgroup/for-6.17. Can you please send a refreshed set?

Yup, I will do asap.
