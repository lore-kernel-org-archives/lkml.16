Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381931E104E
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748249211; cv=none; b=YIce8lrsL7FkbMNt6lm6f5y5abtOLNshdRxi3md7UMjNKzaEYzcumnr6UG/64uRIeelwD1Uryh9w03SZqnMMiYOMaZLkk4FlB1ZJDWRispchxMYemKtoiawchZp387cy96T8aKsh3jz9RX9aGLOSU7yUPe6QScDfAXghSGhy5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748249211; c=relaxed/simple;
	bh=JOumsy8f69M8YdIc4xojwmVYWLFBA796grd9FipnoNs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l3R/tHqOyKe+XLhLVgW2qofn/MO5fAAIsfTfMHIyXwk6YByRiAJyHEY9SqErYrC7qJqDKV0GBXWhf/t5x2Q4+E/L4rS3Y3atq6ZK+ON4IjlrSyvAZhSlzGhzsdovgfgSvjU/dsTVaI0qdfKpe2ZtEnMiNewQyzOImtww2KXqdN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=eeenQEqb; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="eeenQEqb"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748249200; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=oBqyPTu8lskfG4nnPphpIwrCfBbzNKVNhmRKwastU4c=;
	b=eeenQEqb4GtS015h2ucn1frhLDdDghbUnUtzbKCee7bxm9g2ltCG7M06KDZ4ELFRoApLEO1q8CNPZLzPFLgjLlvQGrd56Td8pKHDn0vVO3iNm+6HxVLDfoP82MmKq21tHZb36GeBpJsBETJF4rwPntMBl2ThgMI6wGA8DtMXlAo=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WbnAuIq_1748249197 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 May 2025 16:46:38 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Bharata B Rao <bharata@amd.com>
Cc: <linux-kernel@vger.kernel.org>,  <linux-mm@kvack.org>,
  <Jonathan.Cameron@huawei.com>,  <dave.hansen@intel.com>,
  <gourry@gourry.net>,  <hannes@cmpxchg.org>,
  <mgorman@techsingularity.net>,  <mingo@redhat.com>,
  <peterz@infradead.org>,  <raghavendra.kt@amd.com>,  <riel@surriel.com>,
  <rientjes@google.com>,  <sj@kernel.org>,  <weixugc@google.com>,
  <willy@infradead.org>,  <ziy@nvidia.com>,  <dave@stgolabs.net>,
  <nifan.cxl@gmail.com>,  <joshua.hahnjy@gmail.com>,
  <xuezhengchu@huawei.com>,  <yiannis@zptcorp.com>,
  <akpm@linux-foundation.org>,  <david@redhat.com>
Subject: Re: [RFC PATCH v0 0/2] Batch migration for NUMA balancing
In-Reply-To: <20250521080238.209678-1-bharata@amd.com> (Bharata B. Rao's
	message of "Wed, 21 May 2025 13:32:36 +0530")
References: <20250521080238.209678-1-bharata@amd.com>
Date: Mon, 26 May 2025 16:46:36 +0800
Message-ID: <87sekrbvyr.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Hi, Bharata,

Bharata B Rao <bharata@amd.com> writes:

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
> migration part to these threads.

What is the expected benefit of the change?

For code reuse, we can use migrate_misplaced_folio() or
migrate_misplaced_folio_batch() in various promotion path.

For workload latency influence, per my understanding, PTE scanning is
much more serious than migration.  Why not start from that?

> Or if we manage to have a single
> source of hotness truth like kpromoted[3], then that too can hand
> over migration requests to the migration threads. I am envisaging
> that different hotness sources like kmmscand[4], MGLRU[5], IBS[6]
> and CXL HMU would push hot page info to kpromoted, which would
> then isolate and push the folios to be promoted to the migrator
> thread.
>
> As a first step, this is an attempt to batch and perform NUMAB
> migrations in async manner. Separate migration threads aren't
> yet implemented but I am using Gregory's patch[7] that provides
> migrate_misplaced_folio_batch() API to do batch migration of
> misplaced folios.
>
> Some points for discussion
> --------------------------
> 1. To isolate the misplaced folios or not?
>
> To do batch migration, the misplaced folios need to be stored in
> some manner. I thought isolating them and using the folio->lru
> field to link them up would be the most straight-forward way. But
> then there were concerns expressed about folios remaining isolated
> for long until they get migrated.
>
> Or should we just maintain the PFNs instead of folios and
> isolate them only just prior to migrating them?
>
> 2. Managing target_nid for misplaced pages
>
> NUMAB provides the accurate target_nid for each folio that is
> detected as misplaced. However when we don't migrate the folio
> right away, but instead want to batch and do asyn migration later,
> then where do we keep track of target_nid for each folio?
>
> In this implementation, I am using last_cpupid field as it appeared
> that this field could be reused (with some challenges mentioned
> in 2/2) for isolated folios. This approach may be specific to NUMAB
> but then each sub-system that hands over pages to the migrator thread
> should also provide a target_nid and hence each sub-system should be
> free to maintain and track the target_nid of folios that it has
> isolated/batched for migration in its own specific manner.
>
> 3. How many folios to batch?
>
> Currently I have a fixed threshold for number of folios to batch.
> It could be a sysctl to allow a setting between a min and max. It
> could also be auto-tuned if required.
>
> The state of the patchset
> -------------------------
> * Still raw and very lightly tested
> * Just posted to serve as base for subsequent discussions
>   here and in MM alignment calls.
>
> References
> ----------
> [1] LSFMM LWN summary - https://lwn.net/Articles/1016519/
> [2] MM alignment call summary - https://lore.kernel.org/linux-mm/263d7140-c343-e82e-b836-ec85c52b54eb@google.com/
> [3] kpromoted patchset - https://lore.kernel.org/linux-mm/20250306054532.221138-1-bharata@amd.com/
> [4] Kmmscand: PTE A bit scanning - https://lore.kernel.org/linux-mm/20250319193028.29514-1-raghavendra.kt@amd.com/
> [5] MGLRU scanning for page promotion - https://lore.kernel.org/lkml/20250324220301.1273038-1-kinseyho@google.com/
> [6] IBS base hot page promotion - https://lore.kernel.org/linux-mm/20250306054532.221138-4-bharata@amd.com/
> [7] Unmapped page cache folio promotion patchset - https://lore.kernel.org/linux-mm/20250411221111.493193-1-gourry@gourry.net/
>
> Bharata B Rao (1):
>   mm: sched: Batch-migrate misplaced pages
>
> Gregory Price (1):
>   migrate: implement migrate_misplaced_folio_batch
>
>  include/linux/migrate.h |  6 ++++
>  include/linux/sched.h   |  4 +++
>  init/init_task.c        |  2 ++
>  kernel/sched/fair.c     | 64 +++++++++++++++++++++++++++++++++++++++++
>  mm/memory.c             | 44 ++++++++++++++--------------
>  mm/migrate.c            | 31 ++++++++++++++++++++
>  6 files changed, 130 insertions(+), 21 deletions(-)

---
Best Regards,
Huang, Ying
