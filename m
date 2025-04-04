Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CBA1624C9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743761390; cv=none; b=LZM19vSOp4/89mjsztZJlSdb41/P2PTTYvFO7uTicPVBYrfOFDlLzYrWlLpiFiRTgrmlglndVaE+9qtZmhkw8sOqTbc/9ftfpi4DlRoyOIa+g6q28e32fCm997OEniHvChdOnVQc1r5Ex1p9g5JU87o1tFwEKBBnPgr+hurtX0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743761390; c=relaxed/simple;
	bh=je9/+LLB+8P+V0veGc7CdWBkAAkt2eRRGTJjxVgo2Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HolvOLQeKS9Phhcvp42/BQ4rJdWp77fNKs3jGCCTPjZL3DbOEeL6aFXiAfO99ntiqlFwDzThFp8vJG3Nbs122ZJ8NjMZad/n7YKp3gTWOCZGOI3i1VlhLLbCqy4bqXGbUxBFxim4KbnVxBmTBengW4gX89EWgHGtwjEWEcgbY3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YpCN5eTg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YpCN5eTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743761387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3SIzr0ll4CsCLTfo5lewMtXGBAjGGWX9b1OB/Vucfow=;
	b=YpCN5eTgjAOoFosT8AJK2PHlTPkjo/41CB4ztHu7Bh1jvSNHed677JWDUGFeP0q5C8LYUK
	Xab/gSu/eX+7DGzH67Ozx6ztJCbCFGTxLstxUr5Cp2nwxNQETE2Tz7Cape+rMHhiuhjESF
	ZxWKFPsz+ZG3VWJAe2BVLsjC3BW/Ybw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-lTxMqiihNgu3_d8vNfgRMg-1; Fri, 04 Apr 2025 06:09:43 -0400
X-MC-Unique: lTxMqiihNgu3_d8vNfgRMg-1
X-Mimecast-MFC-AGG-ID: lTxMqiihNgu3_d8vNfgRMg_1743761382
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-30bfc0f5599so8904401fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743761382; x=1744366182;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3SIzr0ll4CsCLTfo5lewMtXGBAjGGWX9b1OB/Vucfow=;
        b=MmAPzQ1oOHLG+HY//s+3XHZElj4iSz1Om2jYIlML4RW4FD/83cBEgyAif4WOB9KQtx
         0h7pexwLJOZuFL4KC9xK0lgFVTrBkfXzrXB99K9LmikSYz1rxYW0DcqaAWTcIQqqrjvo
         p/q7/AxN01lslAv0/lPye99dtR1/Iv/zoJKP0IQO30ml95Ekh5eHAJNd6pwNokL7064x
         kqVQysf+GBcV1k8n1tJKw60GwquzbC75LC8WZ6HMH9SEIDf3dhIjMbpsP4dSerKraz3l
         lnyTP4ew2/LTXK9tlEZMdmCUPEBpHqW97Vz7rq3uShuoHgwlRYqi2Ur2XSOPvWdyMl1c
         /HZA==
X-Forwarded-Encrypted: i=1; AJvYcCUSSmk3/Fo1EkVUxI5TgCVfcWG/ADnOoygzdJH9AyxKob/L5JLtol5QQgp5HxWNa66nMAl0uOZzUE4Irpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG0FFtsTmYvfFi3Kl412i5XPBvby+wjDp7LMn7FIQpjwmEt+6z
	2FlMt7Eswv1zpqcpC1eQoVPF67Xji7z1x0blPlkvhdOhiGUSHh1Ee/NMFmgyfN3fdAxWMy2b2qX
	Xdv913B43w4QPxPumzhxaGfi7vFxDusTbh7H8eTDdDXIdL7I5X61oblqulUmGyA==
X-Gm-Gg: ASbGncuT++5kjd+lh7jW+EfNSQcUxjfGfna+9jIBGnPdd6Bmy1NMabCZKccD7GU3RG2
	KsajK5w3D6qyqj3duHCqLUJAUd3VLHnFjqONuHHcj+FohZhpd2l32KoJa3kATZ2k6qQEmjQVVOe
	fyMmPZb/8raROziTY/Cbi70OGjOg6VkJJ5rAn7l/PKdsmk2OZG0pkc2szbwECIC/GOmjiXw1Vvb
	OPuDk0gUHYVLaqVLX3LJcdKTBviNVJnJMz0Q4IqmA/dyaY1azsua3YcnYer7F1+QqRQ+oBV4IuJ
	Lsu3IqFcH8fAPmadlWsPaUYtQO2Qcd6UZZzG/Hq52manXux7T+wTF2PnuqL7QF0BIo4ZEjeGiPc
	hEBrEp6JBOM0vft+idHUbjH1kc7zJwXc4nZ5f+MP9kRw=
X-Received: by 2002:a05:651c:1593:b0:30b:a187:7a77 with SMTP id 38308e7fff4ca-30f0a0f1089mr8519331fa.4.1743761382387;
        Fri, 04 Apr 2025 03:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4B/TTLFDYSweBeLZKXhR438tgNLN9kv74ufbq11z4eU0eot/A36k+dW9Y0ijrjuRNqz2cKg==
X-Received: by 2002:a05:651c:1593:b0:30b:a187:7a77 with SMTP id 38308e7fff4ca-30f0a0f1089mr8519251fa.4.1743761381954;
        Fri, 04 Apr 2025 03:09:41 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ce946sm4953141fa.104.2025.04.04.03.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 03:09:41 -0700 (PDT)
Message-ID: <9d5567ee-8c48-4fbd-97fd-d13f28325621@redhat.com>
Date: Fri, 4 Apr 2025 12:09:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm,memory_hotplug: Implement numa node notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 mkoutny@suse.com, Dan Williams <dan.j.williams@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250401092716.537512-1-osalvador@suse.de>
 <20250401092716.537512-2-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250401092716.537512-2-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.04.25 11:27, Oscar Salvador wrote:
> There are at least four consumers of hotplug_memory_notifier that what they
> really are interested in is whether any numa node changed its state, e.g: going
> from being memory aware to becoming memoryless.
> 
> Implement a specific notifier for numa nodes when their state gets changed,
> and have those consumers that only care about numa node state changes use it.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---
>   drivers/acpi/numa/hmat.c  |  6 +--
>   drivers/base/node.c       | 19 +++++++++
>   drivers/cxl/core/region.c | 14 +++----
>   drivers/cxl/cxl.h         |  4 +-
>   include/linux/memory.h    | 38 ++++++++++++++++++
>   kernel/cgroup/cpuset.c    |  2 +-
>   mm/memory-tiers.c         |  8 ++--
>   mm/memory_hotplug.c       | 84 +++++++++++++++++++++++++++++----------
>   mm/slub.c                 | 22 +++++-----
>   9 files changed, 148 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/acpi/numa/hmat.c b/drivers/acpi/numa/hmat.c
> index bfbb08b1e6af..d18f3efa2149 100644
> --- a/drivers/acpi/numa/hmat.c
> +++ b/drivers/acpi/numa/hmat.c
> @@ -918,10 +918,10 @@ static int hmat_callback(struct notifier_block *self,
>   			 unsigned long action, void *arg)
>   {
>   	struct memory_target *target;
> -	struct memory_notify *mnb = arg;
> +	struct node_notify *mnb = arg;
>   	int pxm, nid = mnb->status_change_nid;
>   
> -	if (nid == NUMA_NO_NODE || action != MEM_ONLINE)
> +	if (nid == NUMA_NO_NODE || action != NODE_BECAME_MEM_AWARE)
>   		return NOTIFY_OK;
>   
>   	pxm = node_to_pxm(nid);
> @@ -1074,7 +1074,7 @@ static __init int hmat_init(void)
>   	hmat_register_targets();
>   
>   	/* Keep the table and structures if the notifier may use them */
> -	if (hotplug_memory_notifier(hmat_callback, HMAT_CALLBACK_PRI))
> +	if (hotplug_node_notifier(hmat_callback, HMAT_CALLBACK_PRI))
>   		goto out_put;
>   
>   	if (!hmat_set_default_dram_perf())
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 0ea653fa3433..182c71dfb5b8 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -110,6 +110,25 @@ static const struct attribute_group *node_access_node_groups[] = {
>   	NULL,
>   };
>   
> +static BLOCKING_NOTIFIER_HEAD(node_chain);
> +
> +int register_node_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&node_chain, nb);
> +}
> +EXPORT_SYMBOL(register_node_notifier);
> +
> +void unregister_node_notifier(struct notifier_block *nb)
> +{
> +	blocking_notifier_chain_unregister(&node_chain, nb);
> +}
> +EXPORT_SYMBOL(unregister_node_notifier);
> +
> +int node_notify(unsigned long val, void *v)
> +{
> +	return blocking_notifier_call_chain(&node_chain, val, v);
> +}
> +
>   static void node_remove_accesses(struct node *node)
>   {
>   	struct node_access_nodes *c, *cnext;
> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> index e8d11a988fd9..7d187088f557 100644
> --- a/drivers/cxl/core/region.c
> +++ b/drivers/cxl/core/region.c
> @@ -2409,12 +2409,12 @@ static int cxl_region_perf_attrs_callback(struct notifier_block *nb,
>   					  unsigned long action, void *arg)
>   {
>   	struct cxl_region *cxlr = container_of(nb, struct cxl_region,
> -					       memory_notifier);
> -	struct memory_notify *mnb = arg;
> +					       node_notifier);
> +	struct node_notify *mnb = arg;
>   	int nid = mnb->status_change_nid;
>   	int region_nid;
>   
> -	if (nid == NUMA_NO_NODE || action != MEM_ONLINE)
> +	if (nid == NUMA_NO_NODE || action != NODE_BECAME_MEM_AWARE)
>   		return NOTIFY_DONE;
>   
>   	/*
> @@ -3388,7 +3388,7 @@ static void shutdown_notifiers(void *_cxlr)
>   {
>   	struct cxl_region *cxlr = _cxlr;
>   
> -	unregister_memory_notifier(&cxlr->memory_notifier);
> +	unregister_node_notifier(&cxlr->node_notifier);
>   	unregister_mt_adistance_algorithm(&cxlr->adist_notifier);
>   }
>   
> @@ -3427,9 +3427,9 @@ static int cxl_region_probe(struct device *dev)
>   	if (rc)
>   		return rc;
>   
> -	cxlr->memory_notifier.notifier_call = cxl_region_perf_attrs_callback;
> -	cxlr->memory_notifier.priority = CXL_CALLBACK_PRI;
> -	register_memory_notifier(&cxlr->memory_notifier);
> +	cxlr->node_notifier.notifier_call = cxl_region_perf_attrs_callback;
> +	cxlr->node_notifier.priority = CXL_CALLBACK_PRI;
> +	register_node_notifier(&cxlr->node_notifier);
>   
>   	cxlr->adist_notifier.notifier_call = cxl_region_calculate_adistance;
>   	cxlr->adist_notifier.priority = 100;
> diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
> index bbbaa0d0a670..d4c9a499de7a 100644
> --- a/drivers/cxl/cxl.h
> +++ b/drivers/cxl/cxl.h
> @@ -532,7 +532,7 @@ struct cxl_region_params {
>    * @flags: Region state flags
>    * @params: active + config params for the region
>    * @coord: QoS access coordinates for the region
> - * @memory_notifier: notifier for setting the access coordinates to node
> + * @node_notifier: notifier for setting the access coordinates to node
>    * @adist_notifier: notifier for calculating the abstract distance of node
>    */
>   struct cxl_region {
> @@ -545,7 +545,7 @@ struct cxl_region {
>   	unsigned long flags;
>   	struct cxl_region_params params;
>   	struct access_coordinate coord[ACCESS_COORDINATE_MAX];
> -	struct notifier_block memory_notifier;
> +	struct notifier_block node_notifier;
>   	struct notifier_block adist_notifier;
>   };
>   
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index 12daa6ec7d09..1d814dfbb8a8 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -99,6 +99,14 @@ int set_memory_block_size_order(unsigned int order);
>   #define	MEM_PREPARE_ONLINE	(1<<6)
>   #define	MEM_FINISH_OFFLINE	(1<<7)
>   
> +/* These states are used for numa node notifiers */
> +#define NODE_BECOMING_MEM_AWARE		(1<<0)
> +#define NODE_BECAME_MEM_AWARE		(1<<1)
> +#define NODE_BECOMING_MEMORYLESS	(1<<2)
> +#define NODE_BECAME_MEMORYLESS		(1<<3)
> +#define NODE_CANCEL_MEM_AWARE		(1<<4)
> +#define NODE_CANCEL_MEMORYLESS		(1<<5)

Assuming we can remove the _normal stuff and we can do what we do in 
patch #2 here already ... meaning we unconditionally store the nid in 
the MEM notifier ...

What about extending the existing memory notifier instead?

That is, we add

MEM_NODE_BECOMING_MEM_AWARE ... and trigger it using the same notifier 
chain. We only have to make sure these new events will be properly 
filtered out (IIRC, for most we do that already).

Of course, the range will not apply to these events, but the nid would 
apply to all.

Just a thought.

-- 
Cheers,

David / dhildenb

