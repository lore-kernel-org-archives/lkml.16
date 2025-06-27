Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391162045AD
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751051248; cv=none; b=roWbH2x7lyjdYOuAfNmEF2yZ9OzYhSvKBnZLQvHJoUA0bgS6CajXxp56tqSU2dWcYZ3ghJq7/QL90UOzU/ncUxKg9QQrpVPAJoqmXpZSCf4pTF5/awOi3mY7ArhNVoC+shtrxavqV80QimWk+9tR1Yq2+N/rUN7oKlzR4zC6vEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751051248; c=relaxed/simple;
	bh=GHZyCz3k+4Q/vRmIMYgAOLIbt1ZePQ/jnRsUDREhYUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F2zVzj1Uh+vC7uiqJVhL5WKmlhzCzr35dw6op6muTy6bJmTqyu2J12ox+8Q8ydhd0iyFqw6EpKFxoopSF65JI1tP7OUq8lZJvmgJk2qU0lM+2KlQY5kgex4caPyoAL+kU+yW123t9fRjr+kGNUFGN9wuWvb9MIjhQmAqe/AbSjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixdkWGva; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixdkWGva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A108AC4CEF1;
	Fri, 27 Jun 2025 19:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751051247;
	bh=GHZyCz3k+4Q/vRmIMYgAOLIbt1ZePQ/jnRsUDREhYUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ixdkWGvaCrS/O5cwtfV6sAHGQaTnOjAtp1awY1We1C3fqgdRJUrYV/N649q15g1dC
	 It52OqJkNdWk6ika8cM297cJu5pMBpPi81qgjewKpHujOviXnqMmBJjVxBHwLi2MNn
	 MkoB5bS5Q9ZHvBvHbokwZ/hfpuwT1+IUJtXLjUjK/1orGdibVX7J3vpMzmqujb8tOK
	 nfXHNEZkwHeV0hLXj0gy0T4R3G0W7g9/dRMVyMDtN6qjw+htSRJIiMynEcx6EyvEuK
	 TJ8IcnhzCBjZtaW1zXtSDtKlTal28FYrgp73DnPhH8EGmHKrgyKzzVTuE7FddeviXx
	 dllC9k/ctZYDA==
From: SeongJae Park <sj@kernel.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: SeongJae Park <sj@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	akpm@linux-foundation.org,
	mhocko@kernel.org,
	hannes@cmpxchg.org,
	roman.gushchin@linux.dev,
	yosryahmed@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mm: introduce per-node proactive reclaim interface
Date: Fri, 27 Jun 2025 12:07:25 -0700
Message-Id: <20250627190725.52969-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <zutbi6jjx6rj2beytkp2ihpyxkuvg43ggsglfhimluojko4frf@gacgibzen5k4>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 25 Jun 2025 16:10:16 -0700 Shakeel Butt <shakeel.butt@linux.dev> wrote:

> On Mon, Jun 23, 2025 at 11:58:51AM -0700, Davidlohr Bueso wrote:
> > This adds support for allowing proactive reclaim in general on a
> > NUMA system. A per-node interface extends support for beyond a
> > memcg-specific interface, respecting the current semantics of
> > memory.reclaim: respecting aging LRU and not supporting
> > artificially triggering eviction on nodes belonging to non-bottom
> > tiers.
> > 
> > This patch allows userspace to do:
> > 
> >      echo "512M swappiness=10" > /sys/devices/system/node/nodeX/reclaim
[...]
> One orthogonal thought: I wonder if we want a unified aging (hotness or
> generation or active/inactive) view of jobs/memcgs/system. At the moment
> due to the way LRUs are implemented i.e. per-memcg per-node, we can have
> different view of these LRUs even for the same memcg. For example the
> hottest pages in low tier node might be colder than coldest pages in the
> top tier.

I think it would be nice to have, and DAMON could help.

DAMON can monitor access patterns on the entire physical address space and make
actions such as migrating pages to different nodes[1] or LRU-[de]activate
([anti-]aging)[2] for specific cgroups[3,4], based on the monitored access
pattern.

Such migrations and [anti-]aging would not conflict with page fault and memory
pressure based promotions and demotions, so could help existing tiering
solutions by running those together.

> Not sure how to implement it in a scalable way.

DAMON's monitoring overhead is designed to be not ruled by memory size, so
scalable in terms of memory size.  We recently found it actually shows
reasonable monitoring results on an 1 TiB memory machine[5].  DAMON incurs
minimum overhead and limited to one CPU by default.  If needed, it could also
scale out using multiple threads.

[1] https://lore.kernel.org/all/20250420194030.75838-1-sj@kernel.org
[2] https://lore.kernel.org/all/20220613192301.8817-1-sj@kernel.org
[3] https://lkml.kernel.org/r/20221205230830.144349-1-sj@kernel.org
[4] https://lore.kernel.org/20250619220023.24023-1-sj@kernel.org
[5] page 46, right side plot of
    https://static.sched.com/hosted_files/ossna2025/16/damon_ossna25.pdf?_gl=1*12x1jv*_gcl_au*OTkyNjI0NTk0LjE3NTA4Nzg1Mzg.*FPAU*OTkyNjI0NTk0LjE3NTA4Nzg1Mzg.


Thanks,
SJ
