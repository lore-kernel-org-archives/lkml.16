Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D9D21FF25
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543035; cv=none; b=RhTSlk/ebvKUmXMsDCu+Yz2vplHOS/R2l+NCTRStZuvfwBLMWp1XncKGDTnzxZMEii3Xx83dxXHtHAQQr46DB6IiAOESDoJnDSqkHJPpAaiTvKvqJf9fGGoxTqBAFSVGhquTaWLvBRSsO1KDiF7oO1QX9UOvQbDFuTD3uPuP1Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543035; c=relaxed/simple;
	bh=QG0i7x8Uw5xKx6uhGOfCdVxbTUKJGiihq51eIytm85o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LS6EB+pGc7tZlL85DcQYwJKkIG9M597apW7Ma2HE3A+YAT7x+9ZjxRpTds2bz8M+lr0uK7GLR3YH3nW0I80E6iB52x58I0HkDIudnAIYJPiWkaqGeTYMu8uuAqlpi7JDxqxflpDU45m6L8rH2hCZiLU70dzVFbS6IBtZid4n8xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EyRMsMqe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EyRMsMqe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749543030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XBF5G6xXJgxVi2vMYnM2PoWsVLDMf3ZJWcnIVkEvmXs=;
	b=EyRMsMqeN92M0bmi03oBECtQAfYwkwow2lHcgQFFEIl3s9BTIshKw42w5bluJOpyjKrCsj
	3kj6rS4x7yQQPJ70t0AFnMvaQ03y4HqSep4GaTFP4xdVLhxYnVrmSoIur18ukOiLv5QdWL
	62pPTZCqEcrt0z6Zs1vOgZ9IO8+qrac=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-XsDfokjUNWS_ksiNMxaTCQ-1; Tue, 10 Jun 2025 04:10:24 -0400
X-MC-Unique: XsDfokjUNWS_ksiNMxaTCQ-1
X-Mimecast-MFC-AGG-ID: XsDfokjUNWS_ksiNMxaTCQ_1749543024
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so2639104f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543024; x=1750147824;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XBF5G6xXJgxVi2vMYnM2PoWsVLDMf3ZJWcnIVkEvmXs=;
        b=i++GBirwrDLNe0GJ4IkHU3YMyJ6MQMHjSnvTZ32SQL2FvnsB7rYLLGgp+KVp5nFNf5
         KT/5FDzFKlT73T5lNHxfLQ0I+0Ey4LbYcnYkKRFl027jaNRn9XdZqjYAWZAWcN2q99mS
         4j2NbSJ0Th0VNuS29qZcNxFmN1FcsL+XOU9EkUj+qEuu42n4Pj5ujc97INymWIudKbFk
         BqSNoCST/650M1oXjPLfgutREijeUomrOSu6/Zhf/ebjblL9voRXWBr227kqXynhottU
         yYZNkT5RRMatTfpvQ4Kk/7jmq7VZqkuarUFWlngvqqDbKRvHCMOD6LBRpgYzJ5bLY3bI
         Cutw==
X-Forwarded-Encrypted: i=1; AJvYcCVOfEJuJiXm+eNf6v1nFbFQV1/qxhSJSdN+UC8OSs8+YyTGwwwI8cnigjjs0nEVcQ5V7tGnbvveKre4Tj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe+OjsdULYJvft+VdIY1I14xCPYN9AoIBwmRA5zNhAFPxC9k8z
	wUzIAM0kO25fJUlCgI6TB0FNeaMV4bt4r7u43ZZE25nOMcyVa8rMJjKmJXX+xku+lWPFtGCyef3
	8jqYh57jAP5/RinjAa5IceW+Ypitc7QGTgH0YLupL5rPL3U/4ijuaanESilF+HZoqtg==
X-Gm-Gg: ASbGncv8qZnADn7pZ2LIhX3XYHM2o31ZfDYTv6ZHHTNPehvOQOnh118POK1zU5zme9F
	J2RjrSoL39xLOH/DesKN0vDZpGdez5o+YmRNT/ntWXjZRml81OI9ku64g6W6OwGFdh8xFprRA9g
	nRtbJfRpURhktGC+OYe00EaCgrdlDOWjKUhj2jqVLg5X80Zr8LDT+tHJgo5g/3dQJqXVwMZn85c
	DuUW3xL8HrCE2gB11/+I/dK1JFtpEH0E8bYEowYZH9uuL6Gd8r8NdhsuytVDP4XhLQm0bWcVlUZ
	4mtBsG4/qLhdjObTuzoL+56I9ocu/SsjxJ+scTGyoy7iwmdcfwukPU8=
X-Received: by 2002:a5d:64e3:0:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3a55142089emr1990657f8f.24.1749543023664;
        Tue, 10 Jun 2025 01:10:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmc32OVn4VB6Y16DXAXXYh1Z/B1ThbVQcP1o7+AJvFTD7BDPcrczU9YvnUVKFluEmO2SNCRw==
X-Received: by 2002:a5d:64e3:0:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3a55142089emr1990623f8f.24.1749543023224;
        Tue, 10 Jun 2025 01:10:23 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e055d2asm131752915e9.2.2025.06.10.01.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 01:10:22 -0700 (PDT)
Message-ID: <2bec8b53-f788-493e-a76e-1f804ed3aa0c@redhat.com>
Date: Tue, 10 Jun 2025 10:10:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/10] mm,memory_hotplug: Implement numa node notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-4-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250609092149.312114-4-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 11:21, Oscar Salvador wrote:
> There are at least six consumers of hotplug_memory_notifier that what they
> really are interested in is whether any numa node changed its state, e.g: going
> from having memory to not having memory and vice versa.
> 
> Implement a specific notifier for numa nodes when their state gets changed,
> which will later be used by those consumers that are only interested
> in numa node state changes.
> 
> Add documentation as well.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>   Documentation/core-api/memory-hotplug.rst |  66 +++++++++
>   drivers/base/node.c                       |  21 +++
>   include/linux/node.h                      |  40 ++++++
>   mm/memory_hotplug.c                       | 155 ++++++++++------------
>   4 files changed, 200 insertions(+), 82 deletions(-)
> 
> diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
> index d1b8eb9add8a..b19c3be7437d 100644
> --- a/Documentation/core-api/memory-hotplug.rst
> +++ b/Documentation/core-api/memory-hotplug.rst
> @@ -9,6 +9,9 @@ Memory hotplug event notifier
>   
>   Hotplugging events are sent to a notification queue.
>   
> +Memory notifier
> +----------------
> +
>   There are six types of notification defined in ``include/linux/memory.h``:
>   
>   MEM_GOING_ONLINE
> @@ -80,6 +83,69 @@ further processing of the notification queue.
>   
>   NOTIFY_STOP stops further processing of the notification queue.
>   
> +Numa node notifier
> +------------------
> +
> +There are six types of notification defined in ``include/linux/node.h``:
> +
> +NODE_ADDING_FIRST_MEMORY
> + Generated before memory becomes available to this node for the first time.
> +
> +NODE_CANCEL_ADDING_FIRST_MEMORY
> + Generated if NODE_ADDING_FIRST_MEMORY fails.
> +
> +NODE_ADDED_FIRST_MEMORY
> + Generated when memory has become available fo this node for the first time.
> +
> +NODE_REMOVING_LAST_MEMORY
> + Generated when the last memory available to this node is about to be offlined.
> +
> +NODE_CANCEL_REMOVING_LAST_MEMORY
> + Generated when NODE_CANCEL_REMOVING_LAST_MEMORY fails.
> +
> +NODE_REMOVED_LAST_MEMORY
> + Generated when the last memory available to this node has been offlined.
> +
> +A callback routine can be registered by calling::
> +
> +  hotplug_node_notifier(callback_func, priority)
> +
> +Callback functions with higher values of priority are called before callback
> +functions with lower values.
> +
> +A callback function must have the following prototype::
> +
> +  int callback_func(
> +
> +    struct notifier_block *self, unsigned long action, void *arg);
> +
> +The first argument of the callback function (self) is a pointer to the block
> +of the notifier chain that points to the callback function itself.
> +The second argument (action) is one of the event types described above.
> +The third argument (arg) passes a pointer of struct node_notify::
> +
> +        struct node_notify {
> +                int nid;
> +        }
> +
> +- nid is the node we are adding or removing memory to.
> +
> +  If nid >= 0, callback should create/discard structures for the
> +  node if necessary.

Likely that should be removed?

It' probably worth mentioning that one might get notified about 
NODE_CANCEL_ADDING_FIRST_MEMORY even though never notified for 
NODE_ADDING_FIRST_MEMORY. (same for removing)

I recall this can happen if one of the NODE_ADDING_FIRST_MEMORY 
notifiers fails.

(same applies to MEM_CANCEL_*)

Consequently, we might simplify the cancel_mem_notifier_on_err etc 
stuff, simply unconditionally calling the cancel counterparts.

> +
> +The callback routine shall return one of the values
> +NOTIFY_DONE, NOTIFY_OK, NOTIFY_BAD, NOTIFY_STOP
> +defined in ``include/linux/notifier.h``
> +
> +NOTIFY_DONE and NOTIFY_OK have no effect on the further processing.
> +
> +NOTIFY_BAD is used as response to the NODE_ADDING_FIRST_MEMORY,
> +NODE_REMOVING_LAST_MEMORY, NODE_ADDED_FIRST_MEMORY or
> +NODE_REMOVED_LAST_MEMORY action to cancel hotplugging.
> +It stops further processing of the notification queue.
> +
> +NOTIFY_STOP stops further processing of the notification queue.

Should we docunment that failing NODE_ADDED_FIRST_MEMORY / 
NODE_REMOVED_FIRST_MEMORY is very bad?

> +
>   Locking Internals
>   =================
>   
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 25ab9ec14eb8..c5b0859d846d 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -111,6 +111,27 @@ static const struct attribute_group *node_access_node_groups[] = {
>   	NULL,
>   };
>   
> +#ifdef CONFIG_MEMORY_HOTPLUG
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
> +#endif
> +
>   static void node_remove_accesses(struct node *node)
>   {
>   	struct node_access_nodes *c, *cnext;
> diff --git a/include/linux/node.h b/include/linux/node.h
> index 2b7517892230..d7aa2636d948 100644
> --- a/include/linux/node.h
> +++ b/include/linux/node.h
> @@ -123,6 +123,46 @@ static inline void register_memory_blocks_under_node(int nid, unsigned long star
>   #endif
>   
>   extern void unregister_node(struct node *node);
> +
> +struct node_notify {
> +	int nid;
> +};
> +
> +#define NODE_ADDING_FIRST_MEMORY                (1<<0)
> +#define NODE_ADDED_FIRST_MEMORY                 (1<<1)
> +#define NODE_CANCEL_ADDING_FIRST_MEMORY         (1<<2)
> +#define NODE_REMOVING_LAST_MEMORY               (1<<3)
> +#define NODE_REMOVED_LAST_MEMORY                (1<<4)
> +#define NODE_CANCEL_REMOVING_LAST_MEMORY        (1<<5)
> +
> +#if defined(CONFIG_MEMORY_HOTPLUG) && defined(CONFIG_NUMA)
> +extern int register_node_notifier(struct notifier_block *nb);
> +extern void unregister_node_notifier(struct notifier_block *nb);
> +extern int node_notify(unsigned long val, void *v);
> +
> +#define hotplug_node_notifier(fn, pri) ({		\
> +	static __meminitdata struct notifier_block fn##_node_nb =\
> +		{ .notifier_call = fn, .priority = pri };\
> +	register_node_notifier(&fn##_node_nb);			\
> +})
> +#else
> +static inline int register_node_notifier(struct notifier_block *nb)
> +{
> +	return 0;
> +}
> +static inline void unregister_node_notifier(struct notifier_block *nb)
> +{
> +}
> +static inline int node_notify(unsigned long val, void *v)
> +{
> +	return 0;
> +}
> +static inline int hotplug_node_notifier(notifier_fn_t fn, int pri)
> +{
> +	return 0;
> +}
> +#endif
> +
>   #ifdef CONFIG_NUMA
>   extern void node_dev_init(void);
>   /* Core of the node registration - only memory hotplug should use this */
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 94ae0ca37021..0550f3061fc4 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -35,6 +35,7 @@
>   #include <linux/compaction.h>
>   #include <linux/rmap.h>
>   #include <linux/module.h>
> +#include <linux/node.h>
>   
>   #include <asm/tlbflush.h>
>   
> @@ -699,24 +700,6 @@ static void online_pages_range(unsigned long start_pfn, unsigned long nr_pages)
>   	online_mem_sections(start_pfn, end_pfn);
>   }
>   
> -/* check which state of node_states will be changed when online memory */
> -static void node_states_check_changes_online(unsigned long nr_pages,
> -	struct zone *zone, struct memory_notify *arg)
> -{
> -	int nid = zone_to_nid(zone);
> -
> -	arg->status_change_nid = NUMA_NO_NODE;
> -
> -	if (!node_state(nid, N_MEMORY))
> -		arg->status_change_nid = nid;
> -}
> -
> -static void node_states_set_node(int node, struct memory_notify *arg)
> -{
> -	if (arg->status_change_nid >= 0)
> -		node_set_state(node, N_MEMORY);
> -}
> -
>   static void __meminit resize_zone_range(struct zone *zone, unsigned long start_pfn,
>   		unsigned long nr_pages)
>   {
> @@ -1171,7 +1154,9 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>   	int need_zonelists_rebuild = 0;
>   	const int nid = zone_to_nid(zone);
>   	int ret;
> -	struct memory_notify arg;
> +	struct memory_notify mem_arg;
> +	struct node_notify node_arg;
> +	bool cancel_mem_notifier_on_err = false, cancel_node_notifier_on_err = false;

Prefer reverse xmas tree ... :)

[...]

> -
>   static int count_system_ram_pages_cb(unsigned long start_pfn,
>   				     unsigned long nr_pages, void *data)
>   {
> @@ -1937,13 +1899,17 @@ static int count_system_ram_pages_cb(unsigned long start_pfn,
>   int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>   			struct zone *zone, struct memory_group *group)
>   {
> -	const unsigned long end_pfn = start_pfn + nr_pages;
> -	unsigned long pfn, managed_pages, system_ram_pages = 0;
> -	const int node = zone_to_nid(zone);
> -	unsigned long flags;
> -	struct memory_notify arg;
> -	char *reason;
>   	int ret;
> +	char *reason;
> +	enum zone_type zt;
> +	unsigned long flags;
> +	struct memory_notify mem_arg;
> +	struct node_notify node_arg;
> +	const int node = zone_to_nid(zone);
> +	struct pglist_data *pgdat = zone->zone_pgdat;
> +	const unsigned long end_pfn = start_pfn + nr_pages;
> +	unsigned long pfn, managed_pages, system_ram_pages = 0, present_pages = 0;
> +	bool cancel_mem_notifier_on_err = false, cancel_node_notifier_on_err = false;


You'r now reversing the reversed christmas tree :)

>   
>   	/*
>   	 * {on,off}lining is constrained to full memory sections (or more
> @@ -2000,11 +1966,30 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>   		goto failed_removal_pcplists_disabled;
>   	}
>   
> -	arg.start_pfn = start_pfn;
> -	arg.nr_pages = nr_pages;
> -	node_states_check_changes_offline(nr_pages, zone, &arg);
> +	/*
> +	 * Here we count the possible pages within the range [0..ZONE_MOVABLE].
> +	 * If after having accounted all the pages, we see that the nr_pages to
> +	 * be offlined is greater or equal to the accounted pages, we know that the
> +	 * node will become empty, and so, we will clear N_MEMORY for it.
> +	 */
> +	node_arg.nid = NUMA_NO_NODE;
> +	for (zt = 0; zt <= ZONE_MOVABLE; zt++)
> +		present_pages += pgdat->node_zones[zt].present_pages;

Why can't we look at node_present_pages?

-- 
Cheers,

David / dhildenb

