Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31C5136658
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750749005; cv=none; b=IdR8kzDLjV98Jl+w6WvX+zfKRQ+V3Cw7LKcfwi2bS5XXC4wS8o5KKqy7zFg5pVRppS1QxyMhjUOn1LeC7ZDNQ1yr8LQM6D+yUQPScrvmdxu21BvONppnef3pbGQANmFWp+2NoDUQ7DQbvzBfOwo/0quLrpUuTswwJMXyGAB3Vro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750749005; c=relaxed/simple;
	bh=iGGBrNRm6+Hn7q+qv/V7ELw7CaAhXZB9cDkZsJM7Z+c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PJnssuR64lqtW2qZsgnY8WtJDb+9mFfx16hRC1E3vAxGLO4fgq+13T8L7fCFWTVEsDWSSSXxFeXykFrYZC+ld8QWynzBoMvWwmNhi2VkpOdBJm1Jef58gqGutiOqZ3EJ4GbPTn/iGccgDYO7bveHHO1IgMdKsvO8jh+ixkcj5HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7w34Fi6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7w34Fi6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28780C4CEE3;
	Tue, 24 Jun 2025 07:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750749005;
	bh=iGGBrNRm6+Hn7q+qv/V7ELw7CaAhXZB9cDkZsJM7Z+c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K7w34Fi6xEmoWTI7PLYRovUp6o1cpHCA88HPPuFv4queEFrLM0ujUCUfsx5UsW4Iq
	 +YqwdQ2dSaLurT+emNExhWXMN43Em20AJFU3wK9bxAOeOGVvvWLZ/6arWJ0t8cCvzk
	 hlYdRLD73tVd8OqbW/h+0YM3d/a41Ag+bPvQ97c6zXPAnkLNVPaTXCs0GqkLfnX6nO
	 kHCr9UplG9gkyEz76chMTQzz9yyN0R4HbxHk8DKzdAxXXWkFo4YpkPh3xLC5ILGbDR
	 uxxcM84cbRf5gx5YJAHk9NmSv+V3zJMJsfiBk6NYsltJj7jelzJDDo3MAH0ALy+xv/
	 ZR+e6O6eKrPPQ==
Date: Tue, 24 Jun 2025 16:09:58 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Raghavendra K T <raghavendra.kt@amd.com>
Cc: <AneeshKumar.KizhakeVeetil@arm.com>, <Hasan.Maruf@amd.com>,
 <Michael.Day@amd.com>, <akpm@linux-foundation.org>, <bharata@amd.com>,
 <dave.hansen@intel.com>, <david@redhat.com>, <dongjoo.linux.dev@gmail.com>,
 <feng.tang@intel.com>, <gourry@gourry.net>, <hannes@cmpxchg.org>,
 <honggyu.kim@sk.com>, <hughd@google.com>, <jhubbard@nvidia.com>,
 <jon.grimm@amd.com>, <k.shutemov@gmail.com>, <kbusch@meta.com>,
 <kmanaouil.dev@gmail.com>, <leesuyeon0506@gmail.com>, <leillc@google.com>,
 <liam.howlett@oracle.com>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <mgorman@techsingularity.net>, <mingo@redhat.com>,
 <nadav.amit@gmail.com>, <nphamcs@gmail.com>, <peterz@infradead.org>,
 <riel@surriel.com>, <rientjes@google.com>, <rppt@kernel.org>,
 <santosh.shukla@amd.com>, <shivankg@amd.com>, <shy828301@gmail.com>,
 <sj@kernel.org>, <vbabka@suse.cz>, <weixugc@google.com>,
 <willy@infradead.org>, <ying.huang@linux.alibaba.com>, <ziy@nvidia.com>,
 <Jonathan.Cameron@huawei.com>, <dave@stgolabs.net>, <yuanchu@google.com>,
 <kinseyho@google.com>, <hdanton@sina.com>
Subject: Re: [RFC PATCH V2 12/13] trace/kscand: Add tracing of scanning and
 migration
Message-Id: <20250624160958.e36196456a4c8befc99717ba@kernel.org>
In-Reply-To: <20250624055617.1291159-13-raghavendra.kt@amd.com>
References: <20250624055617.1291159-1-raghavendra.kt@amd.com>
	<20250624055617.1291159-13-raghavendra.kt@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Jun 2025 05:56:16 +0000
Raghavendra K T <raghavendra.kt@amd.com> wrote:

> Add tracing support to track
>  - start and end of scanning.
>  - migration.
> 
> CC: Steven Rostedt <rostedt@goodmis.org>
> CC: Masami Hiramatsu <mhiramat@kernel.org>
> CC: linux-trace-kernel@vger.kernel.org
> 
> Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
> ---
>  include/trace/events/kmem.h | 90 +++++++++++++++++++++++++++++++++++++
>  mm/kscand.c                 |  8 ++++
>  2 files changed, 98 insertions(+)
> 
> diff --git a/include/trace/events/kmem.h b/include/trace/events/kmem.h
> index f74925a6cf69..682c4015414f 100644
> --- a/include/trace/events/kmem.h
> +++ b/include/trace/events/kmem.h
> @@ -9,6 +9,96 @@
>  #include <linux/tracepoint.h>
>  #include <trace/events/mmflags.h>
>  

Please make sure the event is not exposed when it is not used.

#ifdef CONFIG_KSCAND

Thank you,

> +DECLARE_EVENT_CLASS(kmem_mm_class,
> +
> +	TP_PROTO(struct mm_struct *mm),
> +
> +	TP_ARGS(mm),
> +
> +	TP_STRUCT__entry(
> +		__field(	struct mm_struct *, mm		)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->mm = mm;
> +	),
> +
> +	TP_printk("mm = %p", __entry->mm)
> +);
> +
> +DEFINE_EVENT(kmem_mm_class, kmem_mm_enter,
> +	TP_PROTO(struct mm_struct *mm),
> +	TP_ARGS(mm)
> +);
> +
> +DEFINE_EVENT(kmem_mm_class, kmem_mm_exit,
> +	TP_PROTO(struct mm_struct *mm),
> +	TP_ARGS(mm)
> +);
> +
> +DEFINE_EVENT(kmem_mm_class, kmem_scan_mm_start,
> +	TP_PROTO(struct mm_struct *mm),
> +	TP_ARGS(mm)
> +);
> +
> +TRACE_EVENT(kmem_scan_mm_end,
> +
> +	TP_PROTO( struct mm_struct *mm,
> +		 unsigned long start,
> +		 unsigned long total,
> +		 unsigned long scan_period,
> +		 unsigned long scan_size,
> +		 int target_node),
> +
> +	TP_ARGS(mm, start, total, scan_period, scan_size, target_node),
> +
> +	TP_STRUCT__entry(
> +		__field(	struct mm_struct *, mm		)
> +		__field(	unsigned long,   start		)
> +		__field(	unsigned long,   total		)
> +		__field(	unsigned long,   scan_period	)
> +		__field(	unsigned long,   scan_size	)
> +		__field(	int,		 target_node	)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->mm = mm;
> +		__entry->start = start;
> +		__entry->total = total;
> +		__entry->scan_period  = scan_period;
> +		__entry->scan_size    = scan_size;
> +		__entry->target_node  = target_node;
> +	),
> +
> +	TP_printk("mm=%p, start = %ld, total = %ld, scan_period = %ld, scan_size = %ld node = %d",
> +		__entry->mm, __entry->start, __entry->total, __entry->scan_period,
> +		__entry->scan_size, __entry->target_node)
> +);
> +
> +TRACE_EVENT(kmem_scan_mm_migrate,
> +
> +	TP_PROTO(struct mm_struct *mm,
> +		 int rc,
> +		 int target_node),
> +
> +	TP_ARGS(mm, rc, target_node),
> +
> +	TP_STRUCT__entry(
> +		__field(	struct mm_struct *, mm		)
> +		__field(	int,   rc			)
> +		__field(	int,   target_node		)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->mm = mm;
> +		__entry->rc = rc;
> +		__entry->target_node = target_node;
> +	),
> +
> +	TP_printk("mm = %p rc = %d node = %d",
> +		__entry->mm, __entry->rc, __entry->target_node)
> +);
> +
>  TRACE_EVENT(kmem_cache_alloc,
>  
>  	TP_PROTO(unsigned long call_site,
> diff --git a/mm/kscand.c b/mm/kscand.c
> index db7b2f940f36..029d6d2bedc3 100644
> --- a/mm/kscand.c
> +++ b/mm/kscand.c
> @@ -1035,6 +1035,7 @@ static void kmigrated_migrate_mm(struct kmigrated_mm_slot *mm_slot)
>  			}
>  
>  			ret = kmigrated_promote_folio(info, mm, dest);
> +			trace_kmem_scan_mm_migrate(mm, ret, dest);
>  
>  			/* TBD: encode migrated count here, currently assume folio_nr_pages */
>  			if (!ret)
> @@ -1230,6 +1231,9 @@ static unsigned long kscand_scan_mm_slot(void)
>  	mm_target_node = READ_ONCE(mm->target_node);
>  	if (mm_target_node != mm_slot_target_node)
>  		WRITE_ONCE(mm->target_node, mm_slot_target_node);
> +
> +	trace_kmem_scan_mm_start(mm);
> +
>  	now = jiffies;
>  
>  	if (mm_slot_next_scan && time_before(now, mm_slot_next_scan))
> @@ -1300,6 +1304,8 @@ static unsigned long kscand_scan_mm_slot(void)
>  		kscand_update_mmslot_info(mm_slot, total, target_node);
>  	}
>  
> +	trace_kmem_scan_mm_end(mm, address, total, mm_slot_scan_period,
> +			mm_slot_scan_size, target_node);
>  
>  outerloop:
>  	/* exit_mmap will destroy ptes after this */
> @@ -1453,6 +1459,7 @@ void __kscand_enter(struct mm_struct *mm)
>  	spin_unlock(&kscand_mm_lock);
>  
>  	mmgrab(mm);
> +	trace_kmem_mm_enter(mm);
>  	if (wakeup)
>  		wake_up_interruptible(&kscand_wait);
>  }
> @@ -1463,6 +1470,7 @@ void __kscand_exit(struct mm_struct *mm)
>  	struct mm_slot *slot;
>  	int free = 0, serialize = 1;
>  
> +	trace_kmem_mm_exit(mm);
>  	spin_lock(&kscand_mm_lock);
>  	slot = mm_slot_lookup(kscand_slots_hash, mm);
>  	mm_slot = mm_slot_entry(slot, struct kscand_mm_slot, slot);
> -- 
> 2.34.1
> 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
