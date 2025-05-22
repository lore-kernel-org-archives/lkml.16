Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5639148FE6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747939942; cv=none; b=dP2trh7aA8yjaFpNzR5OgnlYxT3a6NxpS0r6JL5sE2PlQ217pETQP0o8NFhHQ39AZexGtiGUSFjOC2Rbql/sD/ATXN4HGJz4zsxJT3dJ6fgqmJoXNykn2T8SttKmxaH7YwsopHncLzP7XqNYSfOyjx00eHbfyim5asCGWUAxzhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747939942; c=relaxed/simple;
	bh=OmcJmFrYMF/uIfDhZxz9R89CVIAO7GUP6Rp+QMQA4Cw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oioIEKOtKe03R1SQuTVhWQHgjq/q3q1nNELZS0m8i5a588yn3o1hs9YscGSi7it31cDLChzeFu6fOHP79NsZ9UWBkYjXp9L/tEeT7eKAX78peZ14dgw1rG7c+iBf0iaZMKuaAUKhQszSZOVFYm8UB/K3VthY4AkCjLh/4PQS7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNcP9Ilh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNcP9Ilh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0010CC4CEE4;
	Thu, 22 May 2025 18:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747939942;
	bh=OmcJmFrYMF/uIfDhZxz9R89CVIAO7GUP6Rp+QMQA4Cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uNcP9IlhXC5J2lvLG54o8CBqlzhqljYSbdFmEnk80/85KX5Us+Z6YPriz9YkVqSmV
	 paTl4YyF1Ii8Q1Y001w/K4UjAY17Af/hsZioZNpVZqvXwRIr2Or/3p9tKHymba4Nvp
	 GKo74E0RBNrgK8zeR/i3vKf4DepexjLefIaFArWRuxgRenRV2z3zfG35anngKawvYk
	 FZXpST/BPwlqJV5c8qEWbWHjcA9IL3Tmd+cFxrBkujDt15HvJYVYzNlT6xfcjqv1m9
	 ET/3apfObjR9ffxUYAcxEvb0OezpeGEea5LO4JKjqpybkK7/sJrnXY/ZrAbFAA7xc8
	 EJI0QJRchzbfA==
From: SeongJae Park <sj@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: SeongJae Park <sj@kernel.org>,
	Bharata B Rao <bharata@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com,
	dave.hansen@intel.com,
	hannes@cmpxchg.org,
	mgorman@techsingularity.net,
	mingo@redhat.com,
	peterz@infradead.org,
	raghavendra.kt@amd.com,
	riel@surriel.com,
	rientjes@google.com,
	weixugc@google.com,
	willy@infradead.org,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	dave@stgolabs.net,
	nifan.cxl@gmail.com,
	joshua.hahnjy@gmail.com,
	xuezhengchu@huawei.com,
	yiannis@zptcorp.com,
	akpm@linux-foundation.org,
	david@redhat.com
Subject: Re: [RFC PATCH v0 0/2] Batch migration for NUMA balancing
Date: Thu, 22 May 2025 11:52:19 -0700
Message-Id: <20250522185219.57843-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <aC9hqyuqeGB457Cq@gourry-fedora-PF4VCD3F>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 May 2025 13:40:59 -0400 Gregory Price <gourry@gourry.net> wrote:

> On Thu, May 22, 2025 at 09:30:23AM -0700, SeongJae Park wrote:
> > On Wed, 21 May 2025 23:08:16 -0400 Gregory Price <gourry@gourry.net> wrote:
> > 
> > > 
> > > It seems to me that DAMON might make use of the batch migration
> > > interface, so if you need any changes or extensions, it might be good
> > > for you (SJ) to take a look at that for us.
> > 
> > For batch migration interface, though, to be honest I don't find very clear
> > DAMON's usage of it, since DAMON does region-based sort of batched migration.
> > Again, I took only a glance on migration batching part and gonna take more time
> > to the details.
> > 
> 
> DAMON would identify a set of PFNs or Folios to migrate, at some point,
> wouldn't it be beneficial to DAMON to simply re-use:
> 
> int migrate_misplaced_folio_batch(struct list_head *folio_list, int node)

Good idea.  Actually we implemnted DAMOS_MIGRATE_HOT and DAMOS_MIGRATE_COLD
instead of DAMOS_PROMOTE and DAMOS_DEMOTE since we didn't sure the promotion
path logic is somewhat everyone agreed upon.  FYI, I'm planning to revisit the
promotion path logic later (don't wait for me though ;) ).

> 
> If not, then why?

I'll need to look into the detail, but from a high level glance I think it is a
good idea.

> 
> That's why I mean by what would DAMON want out of such an interface.
> Not the async part, but the underlying migration functions.

Makes sense, thank you!


Thanks,
SJ

[...]
