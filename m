Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A96381BA
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747853157; cv=none; b=jJB1VlVTFgdcMJ9mSSHVk9W4LYLZnD0+p5y58b+DG/WZONxBiltunN9HZSJbgumUGI9ve98YHgYYK9dxv3YxXiAVszBewQ3Ahmpcg6XsKUxQsr+GoJiKAEFOYIvtuPehKLz20vp8Gm6HfmlXNgauDHAgYFqZnOEeyN0pFG5uEsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747853157; c=relaxed/simple;
	bh=LYjLJmThU61NbIP8XRAsnYD4C0EoiLBTx7NC9szONOA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oav/uqy8YmLRk68yTrIsKVAIVbPGKOcRpotSjRneKT/DtKeNyJFgcMvJtspq9C4RGNe5VO7Pwi+oFpU4MPMKCnjR33Fj1NzKd1j9XSSrqXbT5O0UvrJcnJNRpYiS0abUNX0q7ZvSp4LNFltRdLbhoznin6aDXVSZaGpjiKCK0QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQJwvDpI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQJwvDpI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE22C4CEE4;
	Wed, 21 May 2025 18:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747853156;
	bh=LYjLJmThU61NbIP8XRAsnYD4C0EoiLBTx7NC9szONOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oQJwvDpICuPfG+tPW0YPx6MuMk/qNCEGqyoMPXpDoIeetZN/SbhMnu4DEJexUtUJn
	 glggBEFb6xjQ543Go87CfI7NAWfpbhhYQgHYHxOpyLqpnQZUev5Jo7GYst1q8yA2y6
	 cwJZn1H5bBt2plXq6tunwLBggmglUHNWu8EGQbwZDtkXjjuHxatOM/zFNwCQd684E/
	 5dRMgeeN5tlPAdcpB5Su9hh12/RkVPZ8BTazI6x3GOcdtW5YJUviag2Hr/4VRLv5en
	 c+G5lho/YqAKd3gwYqcVcHTd1RUzr+zCuavmntAaN1SkRXKupL8YLZeOpvw64OqZj5
	 zvwG6RJYiqG2Q==
From: SeongJae Park <sj@kernel.org>
To: Bharata B Rao <bharata@amd.com>
Cc: SeongJae Park <sj@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com,
	dave.hansen@intel.com,
	gourry@gourry.net,
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
Date: Wed, 21 May 2025 11:45:52 -0700
Message-Id: <20250521184552.46414-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521080238.209678-1-bharata@amd.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bharata,

On Wed, 21 May 2025 13:32:36 +0530 Bharata B Rao <bharata@amd.com> wrote:

> Hi,
> 
> This is an attempt to convert the NUMA balancing to do batched
> migration instead of migrating one folio at a time. The basic
> idea is to collect (from hint fault handler) the folios to be
> migrated in a list and batch-migrate them from task_work context.
> More details about the specifics are present in patch 2/2.
> 
> During LSFMM[1] and subsequent discussions in MM alignment calls[2],
> it was suggested that separate migration threads to handle migration
> or promotion request may be desirable. Existing NUMA balancing, hot
> page promotion and other future promotion techniques could off-load
> migration part to these threads. Or if we manage to have a single
> source of hotness truth like kpromoted[3], then that too can hand
> over migration requests to the migration threads. I am envisaging
> that different hotness sources like kmmscand[4], MGLRU[5], IBS[6]
> and CXL HMU would push hot page info to kpromoted, which would
> then isolate and push the folios to be promoted to the migrator
> thread.

I think (or, hope) it would also be not very worthless or rude to mention other
existing and ongoing works that have potentials to serve for similar purpose or
collaborate in future, here.

DAMON is designed for a sort of multi-source access information handling.  In
LSFMM, I proposed[1] damon_report_access() interface for making it easier to be
extended for more types of access information.  Currenlty damon_report_access()
is under early development.  I think this has a potential to serve something
similar to your single source goal.

Also in LSFMM, I proposed damos_add_folio() for a case that callers want to
utilize DAMON worker thread (kdamond) as an asynchronous memory
management operations execution thread while using its other features such as
[auto-tuned] quotas.  I think this has a potential to serve something similar
to your migration threads.  I haven't started damos_add_folio() development
yet, though.

I remember we discussed about DAMON on mailing list and in LSFMM a bit, on your
session.  IIRC, you were also looking for a time to see if there is a chance to
use DAMON in some way.  Due to the technical issue, we were unable to discuss
on the two new proposals on my LSFMM session, and it has been a bit while since
our last discussion.  So if you don't mind, I'd like to ask if you have some
opinions or comments about these.

[1] https://lwn.net/Articles/1016525/


Thanks,
SJ

[...]
