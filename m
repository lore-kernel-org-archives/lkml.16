Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061602E425D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077363; cv=none; b=ItDOUxmds7rHGsJqD5Zct8ikn9Io/rjCDtgtZb67x5IOAGTzf7dpkGx7W0gbVJR2arGJG128JieaHv9Drk9ETeXQnUdFKwKj8/p69N6juRPFfy/Zm5yenItcdAweuNACoyf2BJAlhoHqsNdhhGlr6IBtAGbQwhIW/y1mGT1hI94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077363; c=relaxed/simple;
	bh=3usY9lY6oayE+0dFcy5Qz4s4cFx0UxJUC+AE8gVZg0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCQBETcjIQrBw+PWqWQs9tu9sUn+zp7J0sH0rSAxeTD2C7Br1Kz7nwTpaCM7gaU0N6q9P0f9nagvanYE6naos9iQaJVUYdBrTdPuWjF1d6+9BVQ7bY2QX7NWyuLPbFo+ck244uzDa0z6JP8D9/BGIxhp/ZtbCfQ9Hw3pkemB7I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GDjrVvTX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GDjrVvTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750077359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TEsiMOxT2FmOg/HQn0RlppUl66kt12m1IKYKF/f5J6c=;
	b=GDjrVvTXWgtLEPIJaTalwpnqiJFtxnV9pAbsqarSMYSzEi2Qp8yShEDF9Tn3uKONfX/K0G
	myJLpbgfP+qJXth+H6pFJ0glQTc13YJqXrwgf4fnTwnxhbu9hXp6xyhcHNJYQvCy+ahucF
	dJ3qZ4/Ro7wj0+ltVY50uoh+xsW4lT0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-xoSiFVi5N1e7xdFDYMUApA-1; Mon, 16 Jun 2025 08:35:58 -0400
X-MC-Unique: xoSiFVi5N1e7xdFDYMUApA-1
X-Mimecast-MFC-AGG-ID: xoSiFVi5N1e7xdFDYMUApA_1750077356
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450de98b28eso27903635e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750077356; x=1750682156;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TEsiMOxT2FmOg/HQn0RlppUl66kt12m1IKYKF/f5J6c=;
        b=NG3mGC3TUesRfS+van0b91BnEeUPeBTDaiYzkAhS7dv9spH1mZpWyFwYZ3RJqXNikR
         hc5BO0KTBjnSC9MsJgl0ireWF3UCLuJxo/1UebUPGc6C3At+dHAqPDBvesZ7tfmhFFib
         yOO1+uhuP1WPEiUswIDnuRlYpTt4FZcihGi8a3SMxvl/Z4CK/Ur7CMAbQ4mQ5hc/XRcM
         Rwz6DnANdz5NX3MKBA+1jIcV8+6GhIekFRkM1JZylitOzh/Z/Ni0zVrKVkm20rNE+Ml+
         tkERnF94klne/ygLCT4s4JYPkmNa4WM51c8DVoroFEWpRtSYucJU6UZg3M7SkuHrdgGb
         6R/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVghtF3uaneKeDeH9m+SsGIAzW/DcmxzHfM6U3wk6UbxxaAVL105RJtkAGz/oVtmYibhZAgAvnORG/YXmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYKrim+o8J7xi/etFIyiKsE1jeB7o7BfcheBMdueK5jZNavGuk
	4MPA3vGlEluXiTu9TdLwdCCGB3ztDw7iJprsrbdBeNqUXDduWiDHvKwRHNFiHXm6BfMgbMQM+Cn
	v29qJFZJk6NJd9yxbFx17eHyDdTX9kKcf1AiQP9YIalh61LsclpH6aoL/Va8lGyBUEQ==
X-Gm-Gg: ASbGncslhMA5XBwaWqZDyXiRGhptBBus0+0ag21ITZh5l7Cha3LRRHgWt/gSo/Wk3aA
	woisGksOr3rjw1yHASpihx4HV6bWB8FMJFa1GzZdlP5htqj3pZWhlDunXUn3qqeqkAU3IRUaGXq
	GnwvZm02ovsr/MNu8i/4cdRklIZEDGbuckny0hu7q7GcEQc6l38iYmPkba/Dqt6kopTJSccvlZk
	ABoD7eiUO39Lns7LcGFLUVozpcu5g+8ZDbHMeHOeA+rAmSKz56JPygy6bZ/+jK1y4ABAOnrtOuG
	W5udVjGuH+hWd7ILA5xdvpr2s9eGAIpnMhlCTDkdy3NCL1dEvBr7THewY9fPlEyMDjkOB49+TY3
	jNLA1Jx0ViAAbmDHBRKO8DunAu0dyOmcyXAU7Aw/6vleF2bw=
X-Received: by 2002:a05:600c:2e51:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-4533b27222cmr64389465e9.11.1750077356523;
        Mon, 16 Jun 2025 05:35:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjXqMAbFmDiv4vkOMSIM0QV8w7A3uM/4KMu9kgqGmhwemN8e1AyYIVjbrkZHR0ngY7AGD7gg==
X-Received: by 2002:a05:600c:2e51:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-4533b27222cmr64389295e9.11.1750077356170;
        Mon, 16 Jun 2025 05:35:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13c19esm143647315e9.25.2025.06.16.05.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 05:35:55 -0700 (PDT)
Message-ID: <400b4d5a-8973-4301-a86b-41e1b412a3da@redhat.com>
Date: Mon, 16 Jun 2025 14:35:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/10] mm,memory_hotplug: Implement numa node notifier
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-4-osalvador@suse.de>
 <2bec8b53-f788-493e-a76e-1f804ed3aa0c@redhat.com>
 <aE_WG6bnjtLBzCp8@localhost.localdomain>
 <10c87a0e-c9fe-48fe-9bbd-16afd244b4ec@redhat.com>
 <aE_a4_rGbMLJKBIs@localhost.localdomain>
 <360f2f04-4542-4595-bf36-c45ed10335af@redhat.com>
 <aFADwYs9LcyK5tVn@localhost.localdomain>
 <23431108-b5b8-4c8a-8869-8f994371e7a5@redhat.com>
 <aFAO9igZQ7yP1m7A@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFAO9igZQ7yP1m7A@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 14:32, Oscar Salvador wrote:
> On Mon, Jun 16, 2025 at 02:21:02PM +0200, David Hildenbrand wrote:
>> Exactly. I recall I checked some of them in the past as well, when I
>> stumbled over this behavior.
> 
> Now, about simplying the cancel_{mem,node}_notifier_on_err.
> It would look like this:
> 
>   diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>   index d6df85452c72..ff887f10b114 100644
>   --- a/mm/memory_hotplug.c
>   +++ b/mm/memory_hotplug.c
>   @@ -1150,11 +1150,16 @@ void mhp_deinit_memmap_on_memory(unsigned long pfn, unsigned long nr_pages)
>    int online_pages(unsigned long pfn, unsigned long nr_pages,
>    		       struct zone *zone, struct memory_group *group)
>    {
>   -	bool cancel_mem_notifier_on_err = false, cancel_node_notifier_on_err = false;
>    	const int nid = zone_to_nid(zone);
>    	int need_zonelists_rebuild = 0;
>   -	struct memory_notify mem_arg;
>   -	struct node_notify node_arg;
>   +	struct memory_notify mem_arg = {
>   +		.start_pfn = pfn,
>   +		.nr_pages = nr_pages,
>   +		.status_change_nid = NUMA_NO_NODE,
>   +	};
>   +	struct node_notify node_arg = {
>   +		.nid = NUMA_NO_NODE,
>   +	};
>    	unsigned long flags;
>    	int ret;
>   
>   @@ -1173,21 +1178,16 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>    	/* associate pfn range with the zone */
>    	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
>   
>   -	node_arg.nid = NUMA_NO_NODE;
>    	if (!node_state(nid, N_MEMORY)) {
>    		/* Adding memory to the node for the first time */
>   -		cancel_node_notifier_on_err = true;
>    		node_arg.nid = nid;
>   +		mem_arg.status_change_nid = nid;
>    		ret = node_notify(NODE_ADDING_FIRST_MEMORY, &node_arg);
>    		ret = notifier_to_errno(ret);
>    		if (ret)
>    			goto failed_addition;
>    	}
>   
>   -	mem_arg.start_pfn = pfn;
>   -	mem_arg.nr_pages = nr_pages;
>   -	mem_arg.status_change_nid = node_arg.nid;
>   -	cancel_mem_notifier_on_err = true;
>    	ret = memory_notify(MEM_GOING_ONLINE, &mem_arg);
>    	ret = notifier_to_errno(ret);
>    	if (ret)
>   @@ -1249,9 +1249,8 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>    	pr_debug("online_pages [mem %#010llx-%#010llx] failed\n",
>    		 (unsigned long long) pfn << PAGE_SHIFT,
>    		 (((unsigned long long) pfn + nr_pages) << PAGE_SHIFT) - 1);
>   -	if (cancel_mem_notifier_on_err)
>   -		memory_notify(MEM_CANCEL_ONLINE, &mem_arg);
>   -	if (cancel_node_notifier_on_err)
>   +	memory_notify(MEM_CANCEL_ONLINE, &mem_arg);
>   +	if (node_arg.nid != NUMA_NO_NODE)
>    		node_notify(NODE_CANCEL_ADDING_FIRST_MEMORY, &node_arg);
>    	remove_pfn_range_from_zone(zone, pfn, nr_pages);
>    	return ret;
>   @@ -1899,13 +1898,18 @@ static int count_system_ram_pages_cb(unsigned long start_pfn,
>    int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>    			struct zone *zone, struct memory_group *group)
>    {
>   -	bool cancel_mem_notifier_on_err = false, cancel_node_notifier_on_err = false;
>    	unsigned long pfn, managed_pages, system_ram_pages = 0;
>    	const unsigned long end_pfn = start_pfn + nr_pages;
>    	struct pglist_data *pgdat = zone->zone_pgdat;
>    	const int node = zone_to_nid(zone);
>   -	struct memory_notify mem_arg;
>   -	struct node_notify node_arg;
>   +	struct memory_notify mem_arg = {
>   +		.start_pfn = pfn,
>   +		.nr_pages = nr_pages,
>   +		.status_change_nid = NUMA_NO_NODE,
>   +	};
>   +	struct node_notify node_arg = {
>   +		.nid = NUMA_NO_NODE,
>   +	};
>    	unsigned long flags;
>    	char *reason;
>    	int ret;
>   @@ -1970,20 +1974,15 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>    	 * 'nr_pages' more. If so, we know that the node will become empty, and
>    	 * so we will clear N_MEMORY for it.
>    	 */
>   -	node_arg.nid = NUMA_NO_NODE;
>    	if (nr_pages >= pgdat->node_present_pages) {
>    		node_arg.nid = node;
>   -		cancel_node_notifier_on_err = true;
>   +		mem_arg.status_change_nid = node;
>    		ret = node_notify(NODE_REMOVING_LAST_MEMORY, &node_arg);
>    		ret = notifier_to_errno(ret);
>    		if (ret)
>    			goto failed_removal_isolated;
>    	}
>   
>   -	mem_arg.start_pfn = start_pfn;
>   -	mem_arg.nr_pages = nr_pages;
>   -	mem_arg.status_change_nid = node_arg.nid;
>   -	cancel_mem_notifier_on_err = true;
>    	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
>    	ret = notifier_to_errno(ret);
>    	if (ret) {
>   @@ -2087,9 +2086,8 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>    failed_removal_isolated:
>    	/* pushback to free area */
>    	undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
>   -	if (cancel_mem_notifier_on_err)
>   -		memory_notify(MEM_CANCEL_OFFLINE, &mem_arg);
>   -	if (cancel_node_notifier_on_err)
>   +	memory_notify(MEM_CANCEL_OFFLINE, &mem_arg);
>   +	if (node_arg.nid != NUMA_NO_NODE)
>    		node_notify(NODE_CANCEL_REMOVING_LAST_MEMORY, &node_arg);
>    failed_removal_pcplists_disabled:
>    	lru_cache_enable();
> 
> 
> Not sure if I like keeping the cancel_* stuff.
> Strong opinion here? Feelings? :-)

Looks cleaner to me at least :)

-- 
Cheers,

David / dhildenb

