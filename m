Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9D71FFC5F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765698; cv=none; b=YrEsuZIW6WWEZ8wfDAMYzSFFaalp3BWxyoXHaJTtQ6FXhlxmLWkMjK9o9xCAdCC77oITlMCIfZArc35nF+Nyy7YxfopbhT3soU+dCzfcEo5FdNGg83sgaZnVXYD1gZp+HxnSulVvps+QeAJjnxS0oKl+DLiUTRVvyUlDQMCIG1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765698; c=relaxed/simple;
	bh=FBCGcxAAl6DPHxmOMJ19kI3gVLNGSC8GUi2aPnuMmiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqF0SU9387CRlPF6CJDYQkD4u5WDGu8p68GICqMFvWFh+q1zIAH2JJ2+uN1OwDBFPndvt9pFzdaPcVAZ/d67ad/rU1llcveE2yd8sbh0PWf9oHGDIMZT1NLbP7pcBMxuuXX6kb0WcfuuI3QiW6YfYeDi8XF+FdLCVmNkwli0Q8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iFrxP+gQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iFrxP+gQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744765694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPbZ2GG/vRgMP7SCHzm6/03bJU3vDBJ32vD/KHg7e6A=;
	b=iFrxP+gQ4EgG6rTgwJzxbLF3Td4pAznyiBCi9L7XrcvLXVYAfeFECX6Hsc3K/pNE7Sh6OD
	wy0Lf4FEm8sqA7kkGoWHr/Yw77UZ6lPyhXc0TeOVI3bB25ZTx7gvij+NRu41uq4+/nmvjS
	46Q1HtG9a8KO5IpHuwOedsqXR9d7FK4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-Wju0d3W6PbWHzvq4SlMEaA-1; Tue, 15 Apr 2025 21:08:13 -0400
X-MC-Unique: Wju0d3W6PbWHzvq4SlMEaA-1
X-Mimecast-MFC-AGG-ID: Wju0d3W6PbWHzvq4SlMEaA_1744765692
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224191d9228so73735375ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765692; x=1745370492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vPbZ2GG/vRgMP7SCHzm6/03bJU3vDBJ32vD/KHg7e6A=;
        b=I5nj5UzgQJONflwveHqvXf58cccHjp2f2V3gFG5uE0etLw958MmWYwDHBfA5YIaQVx
         6gqBdSFEPeeTTfra4SQCLCjbjffC927RE8BOFghr/HFEVd22AHQplfD3aotGL8rvliNL
         EXrkAmqSxFk11fecO3rYuoDS/rFNT/Qvb/5sEVR+hN3yot+t0jlubfWlmWb3hZe9sUx6
         tp+De6EMwb7Hor1Ha3EPNaqbBUI9nixDs/dRopaj/P++GJLss1bBX+HRSml0K3lDfVjs
         gqHvXkGDJ0LshG/rkJXX0zTUSO9vdHJb368zPBMje6xexJlf2NToClN7/t2RCYdx1GEF
         IaEg==
X-Forwarded-Encrypted: i=1; AJvYcCWVmQRdNYMj5BaOU93HASKiM1HUVjezt1JcmYaFH0zHXp0ualdU1JENrNXvp99AzZYyN2K9Cezm6SqtG7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWCuDvrVjyEfvRjTJydGSzOqLQMxhTei6s1lmhEgg6QEqKcPz5
	kMFzfkC/RpDkpQmZxEq/V1uVmvzPbYbjvdpIBQwQZhb3QW52NztkPXDLQhjLoDpseosHF9Iv2hz
	fAHcEjQqkfpIiJb+Z1o3ZbtfpQ/fGzzSQt6f86n1lfQ7itnUV9a0MPpyt4dFiVQ==
X-Gm-Gg: ASbGncsL7bQ8dWE56OZQVnThbB9GVAjxBQlOSiH3GHxiqzzO8r7GYOyeLUVfB8SiZB2
	3vrBqg2hT2v/WLQaI0+WdZSZzgU0soH66lUt8xgjlEJMwuDLx5+lYepBS2LjZiyXnaBq31WwZDA
	46JixGCSX4NiwD1K5pBVka9sLRiP+riau1EFcRonUd/QIEi5y4PvcRf2nCo2rm31bA02yjsHYRe
	Lu+Mekfa2jCcJyJDmBNeuuGUJxslzLKdDcpYBrl6VlJIpxUFCjviD7o8DAOjVWyW6lqFuLvYizn
	0A8m8lUJr4APEw==
X-Received: by 2002:a17:903:1b70:b0:224:179a:3b8f with SMTP id d9443c01a7336-22c319f58cfmr19234875ad.23.1744765692065;
        Tue, 15 Apr 2025 18:08:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6A6MIYEwJ44OIIkaN3TE0XQfF682cWnw/bYw0PdyiI1mveB1wu7Yjy3O3iFrZQTiFjazUPQ==
X-Received: by 2002:a17:903:1b70:b0:224:179a:3b8f with SMTP id d9443c01a7336-22c319f58cfmr19234595ad.23.1744765691736;
        Tue, 15 Apr 2025 18:08:11 -0700 (PDT)
Received: from [192.168.2.110] ([70.53.200.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef1102sm1916865ad.47.2025.04.15.18.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 18:08:11 -0700 (PDT)
Message-ID: <a7f5a4f7-1ec6-42dc-a93d-af043a01044f@redhat.com>
Date: Tue, 15 Apr 2025 21:07:53 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: use separate nodemask for bootmem allocations
To: Frank van der Linden <fvdl@google.com>, akpm@linux-foundation.org,
 muchun.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: david@redhat.com, osalvador@suse.de
References: <20250402205613.3086864-1-fvdl@google.com>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20250402205613.3086864-1-fvdl@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-02 16:56, Frank van der Linden wrote:
> Hugetlb boot allocation has used online nodes for allocation since
> commit de55996d7188 ("mm/hugetlb: use online nodes for bootmem
> allocation"). This was needed to be able to do the allocations
> earlier in boot, before N_MEMORY was set.

Honest question: I imagine there's a reason why we can't move
x86's hugetlb_cma_reserve() and hugetlb_bootmem_alloc() calls
in setup_arch() to after x86_init.paging.pagetable_init() (which
seems to be where we call zone_sizes_init())? This way we could
go back to using N_MEMORY and avoid this dance.

I'm not familiar with vmemmap if that's the reason...

- Luiz

> 
> This might lead to a different distribution of gigantic hugepages
> across NUMA nodes if there are memoryless nodes in the system.
> 
> What happens is that the memoryless nodes are tried, but then
> the memblock allocation fails and falls back, which usually means
> that the node that has the highest physical address available
> will be used (top-down allocation). While this will end up
> getting the same number of hugetlb pages, they might not be
> be distributed the same way. The fallback for each memoryless
> node might not end up coming from the same node as the
> successful round-robin allocation from N_MEMORY nodes.
> 
> While administrators that rely on having a specific number of
> hugepages per node should use the hugepages=N:X syntax, it's
> better not to change the old behavior for the plain hugepages=N
> case.
> 
> To do this, construct a nodemask for hugetlb bootmem purposes
> only, containing nodes that have memory. Then use that
> for round-robin bootmem allocations.
> 
> This saves some cycles, and the added advantage here is that
> hugetlb_cma can use it too, avoiding the older issue of
> pointless attempts to create a CMA area for memoryless nodes
> (which will also cause the per-node CMA area size to be too
> small).
> 
> Fixes: de55996d7188 ("mm/hugetlb: use online nodes for bootmem allocation")
> Signed-off-by: Frank van der Linden <fvdl@google.com>
> ---
>   include/linux/hugetlb.h |  3 +++
>   mm/hugetlb.c            | 30 ++++++++++++++++++++++++++++--
>   mm/hugetlb_cma.c        | 11 +++++++----
>   3 files changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 8f3ac832ee7f..fc9166f7f679 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -14,6 +14,7 @@
>   #include <linux/pgtable.h>
>   #include <linux/gfp.h>
>   #include <linux/userfaultfd_k.h>
> +#include <linux/nodemask.h>
>   
>   struct ctl_table;
>   struct user_struct;
> @@ -176,6 +177,8 @@ extern struct list_head huge_boot_pages[MAX_NUMNODES];
>   
>   void hugetlb_bootmem_alloc(void);
>   bool hugetlb_bootmem_allocated(void);
> +extern nodemask_t hugetlb_bootmem_nodes;
> +void hugetlb_bootmem_set_nodes(void);
>   
>   /* arch callbacks */
>   
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 6fccfe6d046c..e69f6f31e082 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -58,6 +58,7 @@ int hugetlb_max_hstate __read_mostly;
>   unsigned int default_hstate_idx;
>   struct hstate hstates[HUGE_MAX_HSTATE];
>   
> +__initdata nodemask_t hugetlb_bootmem_nodes;
>   __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
>   static unsigned long hstate_boot_nrinvalid[HUGE_MAX_HSTATE] __initdata;
>   
> @@ -3237,7 +3238,8 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
>   	}
>   
>   	/* allocate from next node when distributing huge pages */
> -	for_each_node_mask_to_alloc(&h->next_nid_to_alloc, nr_nodes, node, &node_states[N_ONLINE]) {
> +	for_each_node_mask_to_alloc(&h->next_nid_to_alloc, nr_nodes, node,
> +				    &hugetlb_bootmem_nodes) {
>   		m = alloc_bootmem(h, node, false);
>   		if (!m)
>   			return 0;
> @@ -3701,6 +3703,15 @@ static void __init hugetlb_init_hstates(void)
>   	struct hstate *h, *h2;
>   
>   	for_each_hstate(h) {
> +		/*
> +		 * Always reset to first_memory_node here, even if
> +		 * next_nid_to_alloc was set before - we can't
> +		 * reference hugetlb_bootmem_nodes after init, and
> +		 * first_memory_node is right for all further allocations.
> +		 */
> +		h->next_nid_to_alloc = first_memory_node;
> +		h->next_nid_to_free = first_memory_node;
> +
>   		/* oversize hugepages were init'ed in early boot */
>   		if (!hstate_is_gigantic(h))
>   			hugetlb_hstate_alloc_pages(h);
> @@ -4990,6 +5001,20 @@ static int __init default_hugepagesz_setup(char *s)
>   }
>   hugetlb_early_param("default_hugepagesz", default_hugepagesz_setup);
>   
> +void __init hugetlb_bootmem_set_nodes(void)
> +{
> +	int i, nid;
> +	unsigned long start_pfn, end_pfn;
> +
> +	if (!nodes_empty(hugetlb_bootmem_nodes))
> +		return;
> +
> +	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
> +		if (end_pfn > start_pfn)
> +			node_set(nid, hugetlb_bootmem_nodes);
> +	}
> +}
> +
>   static bool __hugetlb_bootmem_allocated __initdata;
>   
>   bool __init hugetlb_bootmem_allocated(void)
> @@ -5005,6 +5030,8 @@ void __init hugetlb_bootmem_alloc(void)
>   	if (__hugetlb_bootmem_allocated)
>   		return;
>   
> +	hugetlb_bootmem_set_nodes();
> +
>   	for (i = 0; i < MAX_NUMNODES; i++)
>   		INIT_LIST_HEAD(&huge_boot_pages[i]);
>   
> @@ -5012,7 +5039,6 @@ void __init hugetlb_bootmem_alloc(void)
>   
>   	for_each_hstate(h) {
>   		h->next_nid_to_alloc = first_online_node;
> -		h->next_nid_to_free = first_online_node;
>   
>   		if (hstate_is_gigantic(h))
>   			hugetlb_hstate_alloc_pages(h);
> diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
> index e0f2d5c3a84c..f58ef4969e7a 100644
> --- a/mm/hugetlb_cma.c
> +++ b/mm/hugetlb_cma.c
> @@ -66,7 +66,7 @@ hugetlb_cma_alloc_bootmem(struct hstate *h, int *nid, bool node_exact)
>   		if (node_exact)
>   			return NULL;
>   
> -		for_each_online_node(node) {
> +		for_each_node_mask(node, hugetlb_bootmem_nodes) {
>   			cma = hugetlb_cma[node];
>   			if (!cma || node == *nid)
>   				continue;
> @@ -153,11 +153,13 @@ void __init hugetlb_cma_reserve(int order)
>   	if (!hugetlb_cma_size)
>   		return;
>   
> +	hugetlb_bootmem_set_nodes();
> +
>   	for (nid = 0; nid < MAX_NUMNODES; nid++) {
>   		if (hugetlb_cma_size_in_node[nid] == 0)
>   			continue;
>   
> -		if (!node_online(nid)) {
> +		if (!node_isset(nid, hugetlb_bootmem_nodes)) {
>   			pr_warn("hugetlb_cma: invalid node %d specified\n", nid);
>   			hugetlb_cma_size -= hugetlb_cma_size_in_node[nid];
>   			hugetlb_cma_size_in_node[nid] = 0;
> @@ -190,13 +192,14 @@ void __init hugetlb_cma_reserve(int order)
>   		 * If 3 GB area is requested on a machine with 4 numa nodes,
>   		 * let's allocate 1 GB on first three nodes and ignore the last one.
>   		 */
> -		per_node = DIV_ROUND_UP(hugetlb_cma_size, nr_online_nodes);
> +		per_node = DIV_ROUND_UP(hugetlb_cma_size,
> +					nodes_weight(hugetlb_bootmem_nodes));
>   		pr_info("hugetlb_cma: reserve %lu MiB, up to %lu MiB per node\n",
>   			hugetlb_cma_size / SZ_1M, per_node / SZ_1M);
>   	}
>   
>   	reserved = 0;
> -	for_each_online_node(nid) {
> +	for_each_node_mask(nid, hugetlb_bootmem_nodes) {
>   		int res;
>   		char name[CMA_MAX_NAME];
>   

