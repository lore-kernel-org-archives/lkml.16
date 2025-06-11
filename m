Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD9B2D5432;
	Wed, 11 Jun 2025 01:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749604917; cv=none; b=BmlvKzQcgESRftMTDs1bIptjto5opFC0vkQn3DLiNV+lmNxD6bblJCnSAUFsGOw2E/tVZ86s7foiDZqM504t7EN1F+X8X853awCF/4I3m7qjWh9dAYFniK3Dm2c4V8+SNHJhVq1gCX4vymV+c2GVDT3QKFAUiHdtV23pWWv1B3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749604917; c=relaxed/simple;
	bh=tTjsu8lTN11JSxqzr3hCWB8hrnE0NSoCDe78vDpJErI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lm2uRMCq1yh4063VlZxenNsok/OsFg4AT/YDHr2l7u9Q0pFbS51bS930SA0OEDj+CyaBcDInfUD8PuVWni/etQyjQKav0Sk107rsvnleGt+4OJhQydpMzhjs8fh9RhlFs+Ina22fu1Exfxfa3vu/+6agkvkAa87KcPScS0UhKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KpfWfXf9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KpfWfXf9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EFDC4CEED;
	Wed, 11 Jun 2025 01:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749604916;
	bh=tTjsu8lTN11JSxqzr3hCWB8hrnE0NSoCDe78vDpJErI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KpfWfXf92tyEGz1rtvsaSElzITNTB2ok7P2/fIh/B0wztIDOXdpIBM508+PHNB0LY
	 OD2InUbShjewc0Eb74Gl1RGoKubl07NA9cr+lTuC91N5l3Sv0p+/URPtFXVJvZ/SvM
	 NFtaq0n+Ft1yzKU1EZW3SuHFzCnZMAjZMkRqgHE4=
Date: Tue, 10 Jun 2025 18:21:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Casey Chen <cachen@purestorage.com>
Cc: surenb@google.com, kent.overstreet@linux.dev, corbet@lwn.net,
 dennis@kernel.org, tj@kernel.org, cl@gentwo.org, vbabka@suse.cz,
 mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
 rientjes@google.com, roman.gushchin@linux.dev, harry.yoo@oracle.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, yzhong@purestorage.com
Subject: Re: [PATCH] alloc_tag: add per-NUMA node stats
Message-Id: <20250610182155.36090c78124e1f60f2959d8e@linux-foundation.org>
In-Reply-To: <20250610233053.973796-1-cachen@purestorage.com>
References: <20250610233053.973796-1-cachen@purestorage.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Jun 2025 17:30:53 -0600 Casey Chen <cachen@purestorage.com> wrote:

> Add support for tracking per-NUMA node statistics in /proc/allocinfo.
> Previously, each alloc_tag had a single set of counters (bytes and
> calls), aggregated across all CPUs. With this change, each CPU can
> maintain separate counters for each NUMA node, allowing finer-grained
> memory allocation profiling.
> 
> This feature is controlled by the new
> CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS option:
> 
> * When enabled (=y), the output includes per-node statistics following
>   the total bytes/calls:
> 
> <size> <calls> <tag info>
> ...
> 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
>         nid0     94912        2966
>         nid1     220544       6892
> 7680         60       mm/dmapool.c:254 func:dma_pool_create
>         nid0     4224         33
>         nid1     3456         27
> 
> * When disabled (=n), the output remains unchanged:
> <size> <calls> <tag info>
> ...
> 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
> 7680         60       mm/dmapool.c:254 func:dma_pool_create
> 
> To minimize memory overhead, per-NUMA stats counters are dynamically
> allocated using the percpu allocator. PERCPU_DYNAMIC_RESERVE has been
> increased to ensure sufficient space for in-kernel alloc_tag counters.
> 
> For in-kernel alloc_tag instances, pcpu_alloc_noprof() is used to
> allocate counters. These allocations are excluded from the profiling
> statistics themselves.

What is glaringly missing here is "why".

What is the use case?  Why does Linux want this?  What benefit does
this bring to our users?  This is the most important part of the
changelog because it tells Andrew why he is even looking at this patch.


Probably related to the above omission: why per-nid?  It would be more
flexible to present the per-cpu counts and let userspace aggregate that
into per-node info if that is desirable.

>
> ...
>
> --- a/include/linux/alloc_tag.h
> +++ b/include/linux/alloc_tag.h
> @@ -15,6 +15,8 @@
>  #include <linux/static_key.h>
>  #include <linux/irqflags.h>
>  
> +extern int pcpu_counters_num;

This globally-visible variable's identifier is too generic - the name
should communicate which subsystem the variable belongs to.  Perhaps
alloc_tag_num_pcpu_counters?  It's long, but only used in a few places.

In fact, it's a count-of-nodes so a better name would be alloc_tag_num_nodes.

Also, as it's written to a single time, __read_mostly is appropriate.

>  struct alloc_tag_counters {
>  	u64 bytes;
>  	u64 calls;
> @@ -134,16 +136,34 @@ static inline bool mem_alloc_profiling_enabled(void)
>  				   &mem_alloc_profiling_key);
>  }
>  
> +static inline struct alloc_tag_counters alloc_tag_read_nid(struct alloc_tag *tag, int nid)
> +{
> +	struct alloc_tag_counters v = { 0, 0 };
> +	struct alloc_tag_counters *counters;
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {

for_each_possible_cpu() is lame - potentially much more expensive than
for_each_online_cpu.  Is it impractical to use for_each_online_cpu()?

Probably doesn't matter for a userspace displaying function but
userspace can do weird and unexpected things.

> +		counters = per_cpu_ptr(tag->counters, cpu);
> +		v.bytes += counters[nid].bytes;
> +		v.calls += counters[nid].calls;
> +	}
> +
> +	return v;
> +}
> +
>
> ...
>
>  static int allocinfo_show(struct seq_file *m, void *arg)
>  {
>  	struct allocinfo_private *priv = (struct allocinfo_private *)arg;
> @@ -116,6 +136,9 @@ static int allocinfo_show(struct seq_file *m, void *arg)
>  		priv->print_header = false;
>  	}
>  	alloc_tag_to_text(&buf, priv->iter.ct);
> +#ifdef CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS
> +	alloc_tag_to_text_all_nids(&buf, priv->iter.ct);
> +#endif

We can eliminate the ifdef by adding

#else
static inline void alloc_tag_to_text_all_nids(struct seq_buf *out, struct codetag *ct)
{
}
#endif

above.

> +static void alloc_tag_to_text_all_nids(struct seq_buf *out, struct codetag *ct)

>  	seq_commit(m, seq_buf_used(&buf));
>  	return 0;
>  }
>
> ...
>
> @@ -247,19 +270,41 @@ static void shutdown_mem_profiling(bool remove_file)
>  void __init alloc_tag_sec_init(void)
>  {
>  	struct alloc_tag *last_codetag;
> +	int i;
>  
>  	if (!mem_profiling_support)
>  		return;
>  
> -	if (!static_key_enabled(&mem_profiling_compressed))
> -		return;
> -
>  	kernel_tags.first_tag = (struct alloc_tag *)kallsyms_lookup_name(
>  					SECTION_START(ALLOC_TAG_SECTION_NAME));
>  	last_codetag = (struct alloc_tag *)kallsyms_lookup_name(
>  					SECTION_STOP(ALLOC_TAG_SECTION_NAME));
>  	kernel_tags.count = last_codetag - kernel_tags.first_tag;
>  
> +#ifdef CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS
> +	pcpu_counters_num = num_possible_nodes();
> +#else
> +	pcpu_counters_num = 1;
> +#endif

In the CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS=n case, let's make
pcpu_counters_num a constant "1", visible to all compilation units. 

That way the compiler can optimize away all the

	for (nid = 0; nid < pcpu_counters_num; nid++)

looping.

> +	pcpu_counters_size = pcpu_counters_num * sizeof(struct alloc_tag_counters);
> 
> +	for (i = 0; i < kernel_tags.count; i++) {
> +		/* Each CPU has one alloc_tag_counters per numa node */
> +		kernel_tags.first_tag[i].counters =
> +			pcpu_alloc_noprof(pcpu_counters_size,
> +					  sizeof(struct alloc_tag_counters),
> +					  false, GFP_KERNEL | __GFP_ZERO);
> +		if (!kernel_tags.first_tag[i].counters) {
> +			while (--i >= 0)
> +				free_percpu(kernel_tags.first_tag[i].counters);
> +			pr_info("Failed to allocate per-cpu alloc_tag counters\n");

pr_err(), methinks.

> +			return;

And now what happens.  Will the kernel even work?

This code path is untestable unless the developer jumps through hoops
and it will never be tested again.

We assume that __init-time allocations always succeed, so a hearty
panic() here would be OK.

> +		}
> +	}
> +
> +	if (!static_key_enabled(&mem_profiling_compressed))
> +		return;
> +
>  	/* Check if kernel tags fit into page flags */
>  	if (kernel_tags.count > (1UL << NR_UNUSED_PAGEFLAG_BITS)) {
>  		shutdown_mem_profiling(false); /* allocinfo file does not exist yet */
> @@ -622,7 +667,9 @@ static int load_module(struct module *mod, struct codetag *start, struct codetag
>  	stop_tag = ct_to_alloc_tag(stop);
>  	for (tag = start_tag; tag < stop_tag; tag++) {
>  		WARN_ON(tag->counters);
> -		tag->counters = alloc_percpu(struct alloc_tag_counters);
> +		tag->counters = __alloc_percpu_gfp(pcpu_counters_size,
> +						   sizeof(struct alloc_tag_counters),
> +						   GFP_KERNEL | __GFP_ZERO);
>  		if (!tag->counters) {
>  			while (--tag >= start_tag) {
>  				free_percpu(tag->counters);

Ditto here, actually.

Not that it matters much.  It's init.text and gets thrown away, shrug.

> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
>
> ...
>
> @@ -428,6 +429,7 @@ void __show_mem(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
>  		nr = alloc_tag_top_users(tags, ARRAY_SIZE(tags), false);
>  		if (nr) {
>  			pr_notice("Memory allocations:\n");
> +			pr_notice("<size> <calls> <tag info>\n");
>  			for (i = 0; i < nr; i++) {
>  				struct codetag *ct = tags[i].ct;
>  				struct alloc_tag *tag = ct_to_alloc_tag(ct);
> @@ -435,16 +437,27 @@ void __show_mem(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
>  				char bytes[10];
>  
>  				string_get_size(counter.bytes, 1, STRING_UNITS_2, bytes, sizeof(bytes));
> -
>  				/* Same as alloc_tag_to_text() but w/o intermediate buffer */
>  				if (ct->modname)
> -					pr_notice("%12s %8llu %s:%u [%s] func:%s\n",
> -						  bytes, counter.calls, ct->filename,
> -						  ct->lineno, ct->modname, ct->function);
> +					pr_notice("%-12s %-8llu %s:%u [%s] func:%s\n",
> +						bytes, counter.calls, ct->filename,
> +						ct->lineno, ct->modname, ct->function);
>  				else
> -					pr_notice("%12s %8llu %s:%u func:%s\n",
> -						  bytes, counter.calls, ct->filename,
> -						  ct->lineno, ct->function);
> +					pr_notice("%-12s %-8llu %s:%u func:%s\n",
> +						bytes, counter.calls,
> +						ct->filename, ct->lineno, ct->function);
> +
> +#ifdef CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS
> +				int nid;

C99 definition.

> +				for (nid = 0; nid < pcpu_counters_num; nid++) {

If we're going to use C99 (is OK now) then it's better to go all the
way and give `i' loop scope.  "for (int i..".

> +					counter = alloc_tag_read_nid(tag, nid);
> +					string_get_size(counter.bytes, 1, STRING_UNITS_2,
> +							bytes, sizeof(bytes));
> +					pr_notice("        nid%-5u %-12lld %-8lld\n",
> +						  nid, counter.bytes, counter.calls);
> +				}
> +#endif
>  			}
>  		}
>  	}
>
> ...
>
