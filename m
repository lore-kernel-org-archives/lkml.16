Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B329208E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252320; cv=none; b=RB+MsEHxK0pyPYtq0nKSCr8seugQbXBSj21b6+ddUp+Ur6ogQFnE0mYtxMD1qW1lB21/ouyz7GcD91h7A1a4enyvQ9iD7QT0UZ0dmctZDUmswO00UNll87iSUbHo5yp6I4mkjsVXyN2F6Ura01iuXwcQtENTnXCLgOgfmyo+laE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252320; c=relaxed/simple;
	bh=4CKWeTBIT1knGVu6jcAuG1i1LqNGaQeUgFesPH56WYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZ0kTB96yAFG6mjDo9lZsngL/7FxV/7n+jA+wjZfY/8Y6caL8PmB742HmyEuZwCuCN8bjBbCsvt099H2CJN29i/Ecc3JgrI69gwEPPUDMLuyvGIPKLSRz287mxWzlOZaACkZXnkwrEsZS9W+vRzFu0BYi3+GDv/kMncK/VGUjRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=au+w+hbT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="au+w+hbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747252316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KJPdhscMBkqWxz0QIEhErqluhnteOKl5RJ/gTfqAORE=;
	b=au+w+hbTWxaUHPm8wkh3n/IWZqH0sMqCXzM4auJP0JTXy66ZxBzHe1dDyfCt1l067jex9E
	9DjY/AvjeHTUeDMDNcEcMejuQJzpmh/1lpDb2xFUi9adnlFRNlLC/HJBosSy9U4RQOTq/c
	kjwIJzlMpFtSG0B1UDiNo86JNxLkyHk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-RM4juN7mOtWFXI-m3rL_VQ-1; Wed, 14 May 2025 15:51:55 -0400
X-MC-Unique: RM4juN7mOtWFXI-m3rL_VQ-1
X-Mimecast-MFC-AGG-ID: RM4juN7mOtWFXI-m3rL_VQ_1747252314
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a0b5d18cb7so55781f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747252314; x=1747857114;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KJPdhscMBkqWxz0QIEhErqluhnteOKl5RJ/gTfqAORE=;
        b=CddHCQailJvkuN7mPgkdgkIWXut34xSYHQIdf7vYISr5n2D31xxfFCLMMdHRdFCT1O
         93OIScC+KOzHVUJaWLiZn6CKwb2mwK5cwYxrgrpFC+on35TFAkvketGrhYuItZ4pvTJn
         n6bx7BWKEzhKdzNTsptDuKgwjGsaDhk/0Rg92Almr2HTrdUkDSwEvMFaZAVioiUVYbkB
         e7jEiejrZ1LG00kKbSiJPcgbVR8zlBIPxgFFB41mKSF75/nMWJdN1FHASjwumY212bdv
         tE3mbidNXnEUuvRVq9JQsbVl1tLNKilBuK74gjTSyQD6gAjklx4JplJaunQv/1l8gJN9
         ITrg==
X-Gm-Message-State: AOJu0Yysu/cgLZ1Bhhs9gfvLW9n/NWmwRk8wVsx9kQX8sEADE9JLQ9xh
	e0g/Cc8x94/YQWdtGJcyNQvUQSGVfw95njgo/9Nom8d4JhOzddw+Ug5oKOBXdeymp1AH/juMYO4
	TNLUD/DGJuQdaqxO1UlS0u9PZxHVFDIuH7UaJ9vS6GxL30PW09/IpOQEvfTEP+Q==
X-Gm-Gg: ASbGnctsqWxnrwJY1sTs1Gw/v9ClzIvuP2KmkpK56p/jrhwsABjqn1Y5CC7T3OejeWD
	6JwJCHTrPekVJvYG4TPVHjCXD39SqERfhCr3zyLnM/Kx7JP+QpbTBmcfs3whug5LfJJ4OpXXVYN
	/zZ+EmbffmnnHOWd0fJYYpeCz9veTD9hdKv6mHEXROKcROhThNSxZMr/3bdGvzPFnofCJcntx4F
	vRSJqpUUMKkSeXQrEuz59eZ7WuztcI/pzdrHZoSDMdTAboSu4edIid9EzxlLqsLzutV0ES/jrRO
	BErO9agztVWxFml+EJdelmYK1hgZpSERvMMcGQY4rK9rUL2yp02V9ijPG2ses6VkgC4GhOAURya
	6iuMBJxRwRv9tg/wkgBBgWpPYKYARH8nxcYOcf1Y=
X-Received: by 2002:a5d:64c3:0:b0:3a2:6bc:3f25 with SMTP id ffacd0b85a97d-3a34991dab9mr4021085f8f.36.1747252314246;
        Wed, 14 May 2025 12:51:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSBbLb+wxrmL209KdMQoSzKyRwwmeEwKpF1uIgID7Mz2+GWtMlN0Mw5GJBZ6AogWzzltZPcg==
X-Received: by 2002:a5d:64c3:0:b0:3a2:6bc:3f25 with SMTP id ffacd0b85a97d-3a34991dab9mr4021064f8f.36.1747252313826;
        Wed, 14 May 2025 12:51:53 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f15:6200:d485:1bcd:d708:f5df? (p200300d82f156200d4851bcdd708f5df.dip0.t-ipconnect.de. [2003:d8:2f15:6200:d485:1bcd:d708:f5df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3521b09c5sm199345f8f.50.2025.05.14.12.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 12:51:53 -0700 (PDT)
Message-ID: <fb12fab1-f2df-4b4f-ae83-1b45e2a7d6bd@redhat.com>
Date: Wed, 14 May 2025 21:51:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] mm/memory_hotplug: PG_offline_skippable for
 offlining memory blocks with PageOffline pages
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 virtualization@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <20250514111544.1012399-1-david@redhat.com>
 <20250514111544.1012399-2-david@redhat.com>
 <7E5BD96D-971F-4AFC-AC09-503310BE8E68@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7E5BD96D-971F-4AFC-AC09-503310BE8E68@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks a bucnh for the review!

>> +
>> +		if (PageOffline(page) && PageOfflineSkippable(page))
>> +			continue;
>> +
> 
> Some comment like "Skippable PageOffline() pages are not migratable but are
> skipped during memory offline" might help understand the change.

I can add a comment like for the other cases.

> 
> Some thoughts after reading the related code:
> 
> offline_pages() is a little convoluted, since it has two steps to make
> sure a range of memory can be offlined:
> 1. start_isolate_page_range() checks unmovable (maybe not migratable
> is more precise) pages using has_unmovable_pages(), but leaves unmovable
> PageOffline() page handling to the driver;

Right, it's best-effort. For ZONE_MOVABLE we're skipping the checks 
completely.

I was wondering for a longer time that -- with the isolate flag being a 
separate bit soon :) -- we could simply isolate the whole range, and 
then fail if we stumble over an unmovable page during migration. That 
is, get rid of has_unmovable_pages() entirely. Un-doing the isolation 
would then properly preserve the migratetype -- no harm done?

Certainly worth a look. What do you think about that?

> 2. scan_movable_pages() and do_migrate_range() migrate pages and handle
> different types of PageOffline() pages.

Right, migrate what we can, skip these special once, and bail out on any 
others (at least in this patch, patch #2 restores the pre-virtio-mem 
behavior).

> 
> It might make the logic cleaner if start_isolate_page_range() can
> have a callback to allow driver to handle PageOffline() pages.

We have to identify them repeadetly, so start_isolate_page_range() would 
not be sufficient. Also, callbacks are rather tricky for the case where 
we cannot really stabilize the page.

> 
> Hmm, Skippable PageOffline() pages are virtio-mem specific, I wonder
> why offline_pages() takes care of them. Shouldn't virtio-mem driver
> handle them?
 > I also realize that the two steps in offline_pages()> are very 
similar to alloc_contig_range() and virtio-mem is using
> alloc_contig_range(). I wonder if the two steps in offline_pages()
> can be abstracted out and shared with virtio-mem.Yes, offline_pages()> operates at memory section granularity, different from the granularity,
> pageblock size, of alloc_contig_range() used in virtio-mem, but
> both are trying to check unmovable pages and migrate movable pages.

Not sure I get completely what you mean. virtio-mem really wants to use 
alloc_contig_range() to allocate ranges it wants to unplug, because it 
will fail fast and allows for smaller ranges.

offline_pages() is primarily also about offlining the memory section, 
which virtio-mem must do in order to remove the Linux memory block.

> 
> 
>>   		folio = page_folio(page);
>>
>>   		if (!folio_try_get(folio))
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index a6fe1e9b95941..325b51c905076 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -7023,12 +7023,12 @@ unsigned long __offline_isolated_pages(unsigned long start_pfn,
>>   			continue;
>>   		}
>>   		/*
>> -		 * At this point all remaining PageOffline() pages have a
>> -		 * reference count of 0 and can simply be skipped.
>> +		 * At this point all remaining PageOffline() pages must be
>> +		 * "skippable" and have exactly one reference.
>>   		 */
>>   		if (PageOffline(page)) {
>> -			BUG_ON(page_count(page));
>> -			BUG_ON(PageBuddy(page));
>> +			WARN_ON_ONCE(!PageOfflineSkippable(page));
>> +			WARN_ON_ONCE(page_count(page) != 1);
>>   			already_offline++;
>>   			pfn++;
>>   			continue;
>> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>> index b2fc5266e3d26..debd898b794ea 100644
>> --- a/mm/page_isolation.c
>> +++ b/mm/page_isolation.c
>> @@ -121,16 +121,11 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
>>   			continue;
>>
>>   		/*
>> -		 * We treat all PageOffline() pages as movable when offlining
>> -		 * to give drivers a chance to decrement their reference count
>> -		 * in MEM_GOING_OFFLINE in order to indicate that these pages
>> -		 * can be offlined as there are no direct references anymore.
>> -		 * For actually unmovable PageOffline() where the driver does
>> -		 * not support this, we will fail later when trying to actually
>> -		 * move these pages that still have a reference count > 0.
>> -		 * (false negatives in this function only)
>> +		 * PageOffline() pages that are marked as "skippable"
>> +		 * are treated like movable pages for memory offlining.
>>   		 */
>> -		if ((flags & MEMORY_OFFLINE) && PageOffline(page))
>> +		if ((flags & MEMORY_OFFLINE) && PageOffline(page) &&
>> +		    PageOfflineSkippable(page))
>>   			continue;
> 
> With this change, we are no longer give non-virtio-mem driver a chance
> to decrease PageOffline(page) refcount? Or virtio-mem is the only driver
> doing this?

The only in-tree driver making use of this so far, yes.


There is one tweak I'll have to perform in the virtio-mem driver to 
cover one corner case: when force-unloading the virtio-mem driver, we 
have to make sure that memory blocks with fake-offline pages cannot get 
offlined (re-onlining would be bad). I'll fix that up.

-- 
Cheers,

David / dhildenb

