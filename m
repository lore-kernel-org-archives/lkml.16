Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E8222DF9F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542134; cv=none; b=I54E+BlyxppucPC6frwew62rniuoLB0jNIqyczHNehNgQrY9ESpIQNyAR7K7mCZAXdmv8qFafE9xpgoMdqkkLubgypb6F6TJGR8F02Jr+5kSAmJYsP/hXH+z7+UCA5b8klhFERN/G10wY1V0hn3C8dfSmlxMQJ1edC5BPOyhXvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542134; c=relaxed/simple;
	bh=Yotr8TYfPm6pmKdGJbh05bg78hSqtqgGG+6TWDm4Jfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nk610wmNjFYwKx0BBbSBBGhAtdTdvrcGTqwyhe9SaeVQksFsLayhLp6wg/WSUpalOzCeZenI6agTXrb/UuOUJPm13xrb8bWeG4DNZJN1LNTnpEdlpnNzHg/PSh14m6SF9XLkpfv61IaBY7EHwmjj0etgynSZKriPz65v6JtODwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ed2HfU1G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ed2HfU1G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749542132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RnDJgC15fk9PDhHzg2nlx+IAR719Eu/rMlN8WKupT/U=;
	b=Ed2HfU1Gf+78w8uTg2xDTGyG76/2vxyM1tFlEz1F8Djh1bPB9burDujw+NQ+FCsrPSoWQX
	hejWuphr8RQfrsu/MWnosM0UNR9Wbaqvjr8QgAOboa+AAvrpuZhIGP0l6yIxrifToM+JcD
	ONmzrmUGO3U3ScyVjBOh97qciFJOT3U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-ePSwd4zVPRWpptqA8GSVfw-1; Tue, 10 Jun 2025 03:55:31 -0400
X-MC-Unique: ePSwd4zVPRWpptqA8GSVfw-1
X-Mimecast-MFC-AGG-ID: ePSwd4zVPRWpptqA8GSVfw_1749542130
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-453018b4ddeso13473265e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749542130; x=1750146930;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RnDJgC15fk9PDhHzg2nlx+IAR719Eu/rMlN8WKupT/U=;
        b=t/PP2HXfCPpFMTav8p2H4k7SLK7/dlG5CJxqQkbbnoFVBzREd2dUaRq7k+YmVL8Anj
         XnX3x2wbgYla0kvWrZ2yzH5crc8zWrQIghfJbMNHcvu3EQuyhquv5IjIbp9U4NvuHKyw
         ZzUMHstLXprdH015QaYxjGud1CbvwtGbS8MxzVLwbABoOlDxf36nh4e/jzWEv1f4Po0l
         /W4Yn9pnEeFUV74q/xYw0Q0F+A0xnFb0h3pbsQRdH8ETt2Jb2FEvqSVyaqUoZ217a+8v
         ZiYgLW/sX48KXb5VUhp2VfxqrqbN+TIKSnATSZ2jTN42Z8SZA6ei3nJUg7m4GFpTLJrH
         qlDg==
X-Forwarded-Encrypted: i=1; AJvYcCUL4aVczkxhPM/0yBBcXxQu+Bldibo4df7oV/GypDwql1NjFLroP9PsSzXCPpYuYS5Pdesce9/Y4no1ecg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrohEL8y1r7IVjQOwU3Oy/w3P4jymH93VeUY1Ry5aV4Uj39eq+
	OMMl1oZfzHQsFKS9ZGvUnKqAmN8hRSi/EE4yHQCQjUChG2fymaXjXnYv4ZR9b/Kl8+lKy91jeIF
	LHbt/ERP+WsDGbdlTY6yS8ACT7t7Hj4R3s2kKqnjMjg36DVMU9lZAwr7z9/jWYasnUA==
X-Gm-Gg: ASbGncsec3ndYf+0TPk+zI8d9nmxnGh8GG9xrihnrjhlBTZy6DI4T8pWkCeuPjDt5Ip
	OEgZ8IUvcai7dVTY8ozC86A2NfzBWkcsDq3JyNL5UkOB1EhXuEueFelCAl7adJ+n3iu7tM2r/0k
	f7ZA6bbODlgmjY/VqwsUIZi8+9vdj8/40TfE141PjT0nyag5USSgIeV/5aFfegf3GQqe2FEKSC+
	+wpqhAe2NealXxSk1hq/kujdQMXmJKKEkozT+JSPpOH17o/Ciy0ot2FrUQTWmHzFXtaOYO9P6Ec
	Oxz/ZcqLdvy5I2GUl7HDJqlNigCvVL5Xz/PSwfAf8Ujlpzd5wPoFxSA=
X-Received: by 2002:a05:600c:1e15:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-452014b64f8mr130571845e9.25.1749542129763;
        Tue, 10 Jun 2025 00:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH421nTrH4OcTLmqMrDKh3EFaDYseZVqcCQtmD2sbGGWnA6Kf6aETRbNG7IUATNPBpVVXXICQ==
X-Received: by 2002:a05:600c:1e15:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-452014b64f8mr130571655e9.25.1749542129374;
        Tue, 10 Jun 2025 00:55:29 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209cf9715sm134128275e9.18.2025.06.10.00.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:55:29 -0700 (PDT)
Message-ID: <f5eb2eb8-4eb7-4697-afc7-bd4a32785415@redhat.com>
Date: Tue, 10 Jun 2025 09:55:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/10] mm,memory_hotplug: Drop status_change_nid
 parameter from memory_notify
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-11-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250609092149.312114-11-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 11:21, Oscar Salvador wrote:
> The 'status_change_nid' field was used to track changes in the memory
> state of a numa node, but that funcionality has been decoupled from
> memory_notify and moved to node_notify.
> Current consumers of memory_notify are only interested in which node the
> memory we are adding belongs to, but we can derive the nid from the pfn
> because we call move_pfn_range_to_zone(), which sets the node in the page
> via __init_single_page(), before calling in any memory notifier.
> 
> Drop the 'status_change_nid' parameter from 'memory_notify' struct and update documentation
> accordingly.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---
>   Documentation/core-api/memory-hotplug.rst |  7 -------
>   include/linux/memory.h                    |  1 -
>   mm/memory_hotplug.c                       |  2 --
>   mm/page_ext.c                             | 16 +++-------------
>   4 files changed, 3 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
> index b19c3be7437d..74897713c4f8 100644
> --- a/Documentation/core-api/memory-hotplug.rst
> +++ b/Documentation/core-api/memory-hotplug.rst
> @@ -59,17 +59,10 @@ The third argument (arg) passes a pointer of struct memory_notify::
>   	struct memory_notify {
>   		unsigned long start_pfn;
>   		unsigned long nr_pages;
> -		int status_change_nid;
>   	}
>   
>   - start_pfn is start_pfn of online/offline memory.
>   - nr_pages is # of pages of online/offline memory.
> -- status_change_nid is set node id when N_MEMORY of nodemask is (will be)
> -  set/clear. It means a new(memoryless) node gets new memory by online and a
> -  node loses all memory. If this is -1, then nodemask status is not changed.
> -
> -  If status_changed_nid* >= 0, callback should create/discard structures for the
> -  node if necessary.
>   
>   The callback routine shall return one of the values
>   NOTIFY_DONE, NOTIFY_OK, NOTIFY_BAD, NOTIFY_STOP
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index a9ccd6579422..de8b898ada3f 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -109,7 +109,6 @@ struct memory_notify {
>   	unsigned long altmap_nr_pages;
>   	unsigned long start_pfn;
>   	unsigned long nr_pages;
> -	int status_change_nid;
>   };
>   
>   struct notifier_block;
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 0550f3061fc4..07d7bdb65761 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1186,7 +1186,6 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>   
>   	mem_arg.start_pfn = pfn;
>   	mem_arg.nr_pages = nr_pages;
> -	mem_arg.status_change_nid = node_arg.nid;
>   	cancel_mem_notifier_on_err = true;
>   	ret = memory_notify(MEM_GOING_ONLINE, &mem_arg);
>   	ret = notifier_to_errno(ret);
> @@ -1987,7 +1986,6 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>   
>   	mem_arg.start_pfn = start_pfn;
>   	mem_arg.nr_pages = nr_pages;
> -	mem_arg.status_change_nid = node_arg.nid;
>   	cancel_mem_notifier_on_err = true;
>   	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
>   	ret = notifier_to_errno(ret);
> diff --git a/mm/page_ext.c b/mm/page_ext.c
> index c351fdfe9e9a..f08353802fa6 100644
> --- a/mm/page_ext.c
> +++ b/mm/page_ext.c
> @@ -369,25 +369,15 @@ static void __invalidate_page_ext(unsigned long pfn)
>   }
>   
>   static int __meminit online_page_ext(unsigned long start_pfn,
> -				unsigned long nr_pages,
> -				int nid)
> +				unsigned long nr_pages)
>   {
>   	unsigned long start, end, pfn;
>   	int fail = 0;
> +	int nid = pfn_to_nid(start_pfn);

Nit: Keep reverse xmas tree :)

>   
>   	start = SECTION_ALIGN_DOWN(start_pfn);
>   	end = SECTION_ALIGN_UP(start_pfn + nr_pages);
>   
> -	if (nid == NUMA_NO_NODE) {
> -		/*
> -		 * In this case, "nid" already exists and contains valid memory.
> -		 * "start_pfn" passed to us is a pfn which is an arg for
> -		 * online__pages(), and start_pfn should exist.
> -		 */
> -		nid = pfn_to_nid(start_pfn);
> -		VM_BUG_ON(!node_online(nid));
> -	}
> -
>   	for (pfn = start; !fail && pfn < end; pfn += PAGES_PER_SECTION)
>   		fail = init_section_page_ext(pfn, nid);
>   	if (!fail)
> @@ -436,7 +426,7 @@ static int __meminit page_ext_callback(struct notifier_block *self,
>   	switch (action) {
>   	case MEM_GOING_ONLINE:
>   		ret = online_page_ext(mn->start_pfn,
> -				   mn->nr_pages, mn->status_change_nid);
> +				   mn->nr_pages);
>   		break;
>   	case MEM_OFFLINE:
>   		offline_page_ext(mn->start_pfn,

I would have moved the page_ext stuff into a separate patch, including 
documenting why that is fine (e.g., memmap initialized before 
GOING_ONLINE call).

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

