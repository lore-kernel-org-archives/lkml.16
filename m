Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C62522157E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749038610; cv=none; b=p9VLcTqPZsoj8xfBknhI5SQCpjo2iupZffBzVR/E1FBOgnUjqpV42AFc2wBfJ3doj808GgjJovtT+3XmdFdP9Zq1qG7OrUsWNWDHlEadkpim3gx76th6M7Kmx+PasD40I7F+6JEjOJLBxJTu6XO/9Am6425zMvEs8yfZbcWbblg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749038610; c=relaxed/simple;
	bh=224ooLFIfGjQiYB9ezkIszdxnmiRrwLeu0GIHwWE3fY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9cWXapKGH0QSLCZj2ehVxcxazOT2Y2/HZgFkIU6tCogExgKMnI8ZndXIizclYQpUa7JWOmi9sXluo2wI5X3DxrNClNDsOWzZaKN3MCd+NXKwGRzzyZoJX2x/d7ZRcRSRy20wqtx1QscAktVo9GZGesAnghE1toBNA5sdpG0Q40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FYoJkKgK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FYoJkKgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749038608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4diXHUDmAcP7SFBj3azFrHhHSD0swnED0H5Eh4tf6ok=;
	b=FYoJkKgKmrnJVqr2LiQLPsMw7D3z0xFE7AMbXdXH9lhY6RgzDiDN90USn9pjV/k5/AotwF
	q1nC2sthLcDGVKX/WKJ/K3WfRpOGZZEMUbW4y0enibiRVx+yoYkxYByxvP7U+ICQt8X1Wo
	EYq2t2AWXPfU1CvtwozCvID+FE6Vb1k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-RWcW63S3O2ehkvSuSXhWkg-1; Wed, 04 Jun 2025 08:03:26 -0400
X-MC-Unique: RWcW63S3O2ehkvSuSXhWkg-1
X-Mimecast-MFC-AGG-ID: RWcW63S3O2ehkvSuSXhWkg_1749038606
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a503f28b09so446395f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749038606; x=1749643406;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4diXHUDmAcP7SFBj3azFrHhHSD0swnED0H5Eh4tf6ok=;
        b=b43TYhRunxSjRBWnVmqf3y3qlcB1BLutBrFDWhvD7JPmhuuFeNtd8u57QjSCFktUx2
         6iAwjrxNCK//pSOXY1v4ldpRPgf317ak2REhhBgMIYJoKg+WEGJ9BsLYWzr1mpVJm8f6
         BQ7HrzDX/+sL3mVvhoGGxyG9BqUOho5XtZFRgMdaQzEv6JXvHpDRpgtFLaRzQop57E9t
         atnq5tK263Hgx0Tyy234wkUUSq2aQNEM9AsdI+FxKg3tTPKiKJ6ldQVcKTTvboXSWijE
         5E9XonsJtgf4AbSpc+rYADCzNDSpcPwOUWtingNkjGB7vygGPmtt2QUxSnaJWhElai3N
         PLBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT4RYE26kaRBAeDhve+2+tqgCNk2qKUdAlzotIaizH7Z6E3MIbeYtCiiEGcHV+yVBYL4PDzXOYFRMblSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWrhrSREBoHjp0IN3qrpvQuseQKQBuMoTeC4uRzKfngGvxR451
	KbNCmwgscOULWr97PkKrdwJTC0iXAPeKy6oryiAWV2LJwUtlQTinc12qKUkVUlorjxysEaNWPiH
	7Epv64XT1WY07TiSNvQUE0UeWxar7AZQyWUtKZEoiqcfSAsHHehhl9we4HRK+Kg/jaA==
X-Gm-Gg: ASbGncvPYMWMDqKxLMYg+cHoUF9YN4xjNWQQ8Jv5CfueH+BjrIv0+bLBSS7iYiX1lzH
	uqccOCL9+MevFvJZRbQMFFITcQq4KxswEPgTUtWAwftTRvyibKaJ0D3yqwsJBHblP9DqpRhCShL
	GAPJj/0FtJpJQTkXWyzKxvnDwxSgIjkaeqBM2d9HGzeqjmq36fAEsuLMaIebZdYMXyKYwjGw/3T
	HDhijyMEaxmL9uaWAy/UtbGWk8udOSrCSNO1onBcJp7Rs+/8xLGl7uH0s+fyfxqRJ/4swPmQYnv
	k9ejtkUFAos0Q+VPeRnDtlRwzmIn+LX2HWuLOpMF608lQwFeLBhg/0pKG1ZHpc8ZP08323K2vpb
	oGDe4wsNGF1bjkV+XQClVrY5dpxSP1c7iz21Pe1s=
X-Received: by 2002:adf:fe8f:0:b0:3a5:23c6:eeee with SMTP id ffacd0b85a97d-3a523c6f100mr837997f8f.21.1749038605615;
        Wed, 04 Jun 2025 05:03:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxDHrxlwX2CRsMft0T9uSibYrKTzC6gJCsnUQc1+VzckE3rTrUtENVBFWIg5Pk5c2/LzskBQ==
X-Received: by 2002:adf:fe8f:0:b0:3a5:23c6:eeee with SMTP id ffacd0b85a97d-3a523c6f100mr837944f8f.21.1749038605086;
        Wed, 04 Jun 2025 05:03:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b92bsm21209118f8f.9.2025.06.04.05.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 05:03:24 -0700 (PDT)
Message-ID: <ddcdd8b9-566c-4f6c-b1f7-861e93a80fbb@redhat.com>
Date: Wed, 4 Jun 2025 14:03:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] mm,memory_hotplug: Implement numa node notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250603110850.192912-1-osalvador@suse.de>
 <20250603110850.192912-3-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250603110850.192912-3-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.25 13:08, Oscar Salvador wrote:
> There are at least six consumers of hotplug_memory_notifier that what they
> really are interested in is whether any numa node changed its state, e.g: going
> from being memory aware to becoming memoryless and vice versa.
> 
> Implement a specific notifier for numa nodes when their state gets changed,
> and have those consumers that only care about numa node state changes use it.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>   drivers/acpi/numa/hmat.c  |   6 +-
>   drivers/base/node.c       |  21 +++++
>   drivers/cxl/core/region.c |  14 ++--
>   drivers/cxl/cxl.h         |   4 +-
>   include/linux/memory.h    |  38 ++++++++-
>   kernel/cgroup/cpuset.c    |   2 +-
>   mm/memory-tiers.c         |   8 +-
>   mm/memory_hotplug.c       | 161 +++++++++++++++++---------------------
>   mm/mempolicy.c            |   8 +-
>   mm/slub.c                 |  13 ++-
>   10 files changed, 155 insertions(+), 120 deletions(-)
> 
> diff --git a/drivers/acpi/numa/hmat.c b/drivers/acpi/numa/hmat.c
> index 9d9052258e92..9ac82a767daf 100644
> --- a/drivers/acpi/numa/hmat.c
> +++ b/drivers/acpi/numa/hmat.c
> @@ -962,10 +962,10 @@ static int hmat_callback(struct notifier_block *self,
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
> @@ -1118,7 +1118,7 @@ static __init int hmat_init(void)
>   	hmat_register_targets();
>   
>   	/* Keep the table and structures if the notifier may use them */
> -	if (hotplug_memory_notifier(hmat_callback, HMAT_CALLBACK_PRI))
> +	if (hotplug_node_notifier(hmat_callback, HMAT_CALLBACK_PRI))
>   		goto out_put;
>   
>   	if (!hmat_set_default_dram_perf())
> diff --git a/drivers/base/node.c b/drivers/base/node.c


[...]


> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index 5ec4e6d209b9..8c5c88eaffb3 100644
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

Very nitpicky: MEM vs. MEMORY inconsistency. Also, I am not sure about 
"MEMORYLESS vs. MEMORY AWARE" terminology (opposite of aware is not 
less) and "BECOMING" vs. "CANCEL" ...

There must be something better ... but what is it. :)

NODE_ADDING_FIRST_MEMORY
NODE_ADDED_FIRST_MEMORY
NODE_CANCEL_ADDING_FIRST_MEMORY

NODE_REMOVING_LAST_MEMORY
NODE_REMOVED_LAST_MEMORY
NODE_CANCEL_REMOVING_LAST_MEMORY

Maybe something like that? I still don't quite like the "CANCEL" stuff.

NODE_ADDING_FIRST_MEMORY
NODE_ADDED_FIRST_MEMORY
NODE_NOT_ADDED_FIRST_MEMORY

NODE_REMOVING_LAST_MEMORY
NODE_REMOVED_LAST_MEMORY
NODE_NOT_REMOVED_LAST_MEMORY

Hm ...

> +
>   struct memory_notify {
>   	/*
>   	 * The altmap_start_pfn and altmap_nr_pages fields are designated for
> @@ -109,7 +117,10 @@ struct memory_notify {
>   	unsigned long altmap_nr_pages;
>   	unsigned long start_pfn;
>   	unsigned long nr_pages;
> -	int status_change_nid_normal;
> +	int status_change_nid;
> +};

Could/should that be a separate patch after patch #1 removed the last user?

Also, I think the sequence should be (this patch is getting hard to 
review for me due to the size):

#1 existing patch 1
#2 remove status_change_nid_normal
#3 introduce node notifier
#4-#X: convert individual users to node notifier
#X+1: change status_change_nid to always just indicate the nid, renaming
       it on the way (incl current patch #3)


> +
> +struct node_notify {
>   	int status_change_nid;

This should be called "nid" right from the start.

>   
> @@ -157,15 +168,34 @@ static inline unsigned long memory_block_advised_max_size(void)
>   {
>   	return 0;
>   }
> +

[...]

>   	 * {on,off}lining is constrained to full memory sections (or more
> @@ -1194,11 +1172,22 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>   	/* associate pfn range with the zone */
>   	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
>   
> -	arg.start_pfn = pfn;
> -	arg.nr_pages = nr_pages;
> -	node_states_check_changes_online(nr_pages, zone, &arg);
> +	node_arg.status_change_nid = NUMA_NO_NODE;
> +	if (!node_state(nid, N_MEMORY)) {
> +		/* Node is becoming memory aware. Notify consumers */
> +		cancel_node_notifier_on_err = true;
> +		node_arg.status_change_nid = nid;
> +		ret = node_notify(NODE_BECOMING_MEM_AWARE, &node_arg);
> +		ret = notifier_to_errno(ret);
> +		if (ret)
> +			goto failed_addition;
> +	}

I assume without NUMA, that code would never trigger? I mean, the whole 
notifier doesn't make sense without CONFIG_NUMA :)

-- 
Cheers,

David / dhildenb

