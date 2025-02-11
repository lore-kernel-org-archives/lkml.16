Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268AE1F9A9C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274177; cv=none; b=EigK5TSOfof7km38XkdAkPbMKdgUmyk+IzwBi87zrsNyh8h9/JqQpbTiXbqJp4Q4Tja+KFTrxZXNyfUmeEbhMXOT/HNfhAlpJOkWJ+jk9FfTNzMEztGNbq8xB1Do3B/KFXFbDOQ8dcA1zmv8UUkrmY5TqavDwjhOrchSBNoYggY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274177; c=relaxed/simple;
	bh=q2ER+H/uXCXVKISmQ5pI6JtncMW+jYrzUku5FAQJa7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsp2erEl146E8VhaSmTGC1+nD5DWaEWSdlWzzQ4GDrQmw2i5gXmS/pflweBojdSo+ksq9pk1YOPGziUXI1uvUiAXyziysr5fydlK792eOqQOVoyQPlwQ8Yhs0706PtPDV72ILKu0Y/Yy1RRYtAP2uNtI/ne4FzlbDHw/Wk/Sqig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RA1LeiBv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RA1LeiBv"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab744d5e567so1060603266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739274173; x=1739878973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yImLolx1dYvJiGok8R/MgSIPH3BQANa0TBwOjxPIHfk=;
        b=RA1LeiBv+RY9Z4ZjINUbFuNqeTbZuteoH1FUlsaxDE/ZMIyxDV1pBrI1Cy1vwXtv8n
         dfYlAjyZGVr57s1B19NKsXwHGMLjr0f+9eGMk6EFOntaWUfm0mOClIdE35KnOxmqaEFn
         SZqEgdBOH/yovQh7hd1SRbERT417ruwbszDXEVC1hfpcmARYk2WK+/uCKmBUM1tjIT4C
         NboQvM03/4JcHSERRub0Ad+uMa3apyA3wJqrspJcZ0gE3ZxB+qQISgLU5DVZODh0OcQj
         sz1IgKC6Y0/Eh3MXzO0Kl6wxklRxHi/ZF3SjsCJKwWUiV58Y3iLlzOTuhGtv+ykSDvwn
         vOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739274173; x=1739878973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yImLolx1dYvJiGok8R/MgSIPH3BQANa0TBwOjxPIHfk=;
        b=ZgV6lXTqgkEnbFTI9XpERRx76y/6CdcC+3lHBy/ZeQpJhLYa7fY3GqGoTlim1l2Dnd
         LFpig/+US4q3o5ce4P7LwBazCYlZINrqCgKeYzaZDT/7zQ2txO2glQIBosS00ZinIcYV
         59IlSocKd11pEWqrIxu6YJ0eVLEfc3VweI5rUFi5+IOi/zxaEZRnJ2ylsVo6zcbqZdzj
         vhHuKLbIDinHtHdsXXrHwaMR9/hUGdGadInUJHv6X9HE+9NQNDvuGJUy2M+adEwzi7zM
         yOSqerIG+D3yxVbY/JGS29Soshh04OLriU2wnLf9tPQXj7C5CNc026FOCdr6O77QC9s5
         pd+g==
X-Gm-Message-State: AOJu0YwGyDDfRp+qwsDtwDs/Z6IL9ODZxv+lQSLwLZNS98L/rlvkw+66
	yQKP31hrPrIIe9I0LOrTHeG27ZAKcrKN8lWbRt1yZUM2C6Our6tEZZdDQJjvQlw=
X-Gm-Gg: ASbGncu38+ophrXoPjsJ4VcwhEWKw16VlbP7TsNkrznFI5ffXzl1c8xKSCDmQrJthqS
	JLEc6VX8kU3TySTLQHB3OfJI8urYA/HpDhhpyC+LUxntM7E31YwzU3fJmVESvQ+MgacUUc8kzQH
	AsMU8snJE0HU4QHfMZTz1VG6TRMROpeMTvJX2WMMv7thBSPjjK5P6Ik/S2JLmbye9R5kMe1AQPk
	BWZZl3/OM+9MxOH1a7iP0TzU3/e5jYb/n8Kd75YC91cv4Gz8HGl8RKP1/t+3bNZaCT2Ene+AHuY
	XdFjxSEF0pJe788Sjmy9OKjgEqpy
X-Google-Smtp-Source: AGHT+IGTBrnKOFw0mPFN3Fmkl3m/QpO51+eGneSiPtw1xqy5fXne9PL8xZ6RDr/Hk6A2GN3TQ+maoQ==
X-Received: by 2002:a17:906:2983:b0:ab7:d34a:8f83 with SMTP id a640c23a62f3a-ab7daf85005mr240137366b.17.1739274173134;
        Tue, 11 Feb 2025 03:42:53 -0800 (PST)
Received: from localhost (109-81-84-135.rct.o2.cz. [109.81.84.135])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab79378ee30sm808155066b.160.2025.02.11.03.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:42:52 -0800 (PST)
Date: Tue, 11 Feb 2025 12:42:51 +0100
From: Michal Hocko <mhocko@suse.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Oleg Nesterov <oleg@redhat.com>, linux-mm@kvack.org
Subject: Re: [PATCH 6/6 v2] mm: Drain LRUs upon resume to userspace on
 nohz_full CPUs
Message-ID: <Z6s3u6Uu8I7r2Jox@tiehlicka>
References: <20250209223005.11519-1-frederic@kernel.org>
 <20250209223005.11519-7-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209223005.11519-7-frederic@kernel.org>

On Sun 09-02-25 23:30:04, Frederic Weisbecker wrote:
> LRUs can be drained through several ways. One of them may add disturbances
> to isolated workloads while queuing a work at any time to any target,
> whether running in nohz_full mode or not.
> 
> Prevent from that on isolated tasks with defering LRUs drains upon
> resuming to userspace using the isolated task work framework.

I have to say this is rather cryptic description of the udnerlying
problem. What do you think about the following:

LRU batching can be source of disturbances for isolated workloads
running in the userspace because it requires kernel worker to handle
that and that would preempt the said task. The primary source for such
disruption would be __lru_add_drain_all which could be triggered from
non-isolated CPUs.

Why would an isolated CPU have anything on the pcp cache? Many syscalls
allocate pages that might end there. A typical and unavoidable one would
be fork/exec leaving pages on the cache behind just waiting for somebody
to drain.

This patch addresses the problem by noting a patch has been added to the
cache and schedule draining to the return path to the userspace so the
work is done while the syscall is still executing and there are no
suprises while the task runs in the userspace where it doesn't want to
be preempted.

> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>  include/linux/swap.h     | 1 +
>  kernel/sched/isolation.c | 3 +++
>  mm/swap.c                | 8 +++++++-
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index b13b72645db3..a6fdcc04403e 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -406,6 +406,7 @@ extern void lru_add_drain(void);
>  extern void lru_add_drain_cpu(int cpu);
>  extern void lru_add_drain_cpu_zone(struct zone *zone);
>  extern void lru_add_drain_all(void);
> +extern void lru_add_and_bh_lrus_drain(void);
>  void folio_deactivate(struct folio *folio);
>  void folio_mark_lazyfree(struct folio *folio);
>  extern void swap_setup(void);
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index f25a5cb33c0d..1f9ec201864c 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -8,6 +8,8 @@
>   *
>   */
>  
> +#include <linux/swap.h>
> +
>  enum hk_flags {
>  	HK_FLAG_DOMAIN		= BIT(HK_TYPE_DOMAIN),
>  	HK_FLAG_MANAGED_IRQ	= BIT(HK_TYPE_MANAGED_IRQ),
> @@ -253,6 +255,7 @@ __setup("isolcpus=", housekeeping_isolcpus_setup);
>  #if defined(CONFIG_NO_HZ_FULL)
>  static void isolated_task_work(struct callback_head *head)
>  {
> +	lru_add_and_bh_lrus_drain();
>  }
>  
>  int __isolated_task_work_queue(void)
> diff --git a/mm/swap.c b/mm/swap.c
> index fc8281ef4241..da1e569ee3ce 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -37,6 +37,7 @@
>  #include <linux/page_idle.h>
>  #include <linux/local_lock.h>
>  #include <linux/buffer_head.h>
> +#include <linux/sched/isolation.h>
>  
>  #include "internal.h"
>  
> @@ -376,6 +377,8 @@ static void __lru_cache_activate_folio(struct folio *folio)
>  	}
>  
>  	local_unlock(&cpu_fbatches.lock);
> +
> +	isolated_task_work_queue();
>  }

This placement doens't make much sense to me. I would put
isolated_task_work_queue when we queue something up. That would be
folio_batch_add if folio_batch_space(fbatch) > 0.

>  
>  #ifdef CONFIG_LRU_GEN
> @@ -738,7 +741,7 @@ void lru_add_drain(void)
>   * the same cpu. It shouldn't be a problem in !SMP case since
>   * the core is only one and the locks will disable preemption.
>   */
> -static void lru_add_and_bh_lrus_drain(void)
> +void lru_add_and_bh_lrus_drain(void)
>  {
>  	local_lock(&cpu_fbatches.lock);
>  	lru_add_drain_cpu(smp_processor_id());
> @@ -769,6 +772,9 @@ static bool cpu_needs_drain(unsigned int cpu)
>  {
>  	struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
>  
> +	if (!housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
> +		return false;
> +

Would it make more sense to use cpu_is_isolated() and use it explicitly
in __lru_add_drain_all so that it is clearly visible - with a comment
that isolated workloads are dealing with cache on their return to
userspace.

>  	/* Check these in order of likelihood that they're not zero */
>  	return folio_batch_count(&fbatches->lru_add) ||
>  		folio_batch_count(&fbatches->lru_move_tail) ||
> -- 
> 2.46.0

-- 
Michal Hocko
SUSE Labs
