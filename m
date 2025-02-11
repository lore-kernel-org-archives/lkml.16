Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B516526BD9C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290029; cv=none; b=Yv3DIAMbwOCU/1Cja4mIncMRscxyS+XSSJoBCNeJnZBuy3GsbJ7O5CwJEXL1f2dupS+phwRXA5yVEpWh2HtSRFtCyAZXCM50Hz+9M5ceCrIxzQsBSrOertEr8D/WsaDmU//XUoTuD3pXsLQFtnB2pIho32YXvK8OQqeN2jDngPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290029; c=relaxed/simple;
	bh=U5UbpfpnDG6ApQahN1uTxy71VQED0AwIw8skX+8exXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQsMo4ycTmUVy8m9trR0t6yj+b3cNHoHeX18eQQ7vU6MBQk975e79DNMBv1U/aDFD7Dsb8ijYEcpB0wnqOYkdQQ8nVaIqvv2ozq2whd5KbYWwdS4ifhSU3d2pjPKht6eHlnsy+t5yJ5ZJix//ub7PFpdP23AISMq0v5px5SyiXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5J3gpCh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5J3gpCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739290026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E4eFQMryFpDA7yWPewgj6BQIAUA96Crvxxfw6YiB4aw=;
	b=N5J3gpCh73wzuhMG9sFBSC+Y+6SO8B2L2k3RwEpHFm/I7LEZBO95kCHrecbtCvbvKTMlrl
	hZ74bs33x5m2HqG3/FzGaarTPwz/wo8gvZeMzUR8Dk04wq5kUlcVL8GKvWODCs8yQtMoBt
	tWxE3EF5ud/toIhtNuccRrYljoU5Nfo=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-6pAKaX1hMqeWxqSHhJWEng-1; Tue, 11 Feb 2025 11:07:04 -0500
X-MC-Unique: 6pAKaX1hMqeWxqSHhJWEng-1
X-Mimecast-MFC-AGG-ID: 6pAKaX1hMqeWxqSHhJWEng
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5f6e2ef3190so5929128eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290023; x=1739894823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4eFQMryFpDA7yWPewgj6BQIAUA96Crvxxfw6YiB4aw=;
        b=FmyugJ3DoQBoBYPlTw5NklpOcEPZYhhcP4uaZg2gy+dVLQSy7fok1uIy+yv7V6YzYZ
         VA2ULom73oDqDkf5O+ieIJxeqQWqFK2uGO8cQeWgIWlhR7GUJxPzJGhPJyVNiRFN9E9H
         eml12pnjmZmnF3bgWvL1DGnyIGa/rEAOMP9Et0R/Qe/hg8rF0VijzvZVja4GoLkm7MZN
         s9lB5GpUnLsAsdmOZuDlVPt7g3vJSgArhC86Y7ruiEti4Xtn7pKrJFLsop0PLdiTxFOJ
         9V77XXht+pwIaWpTMQNzESxFevmLE9GSQX2hcviwRBM5KBBecz5PrS1i2neAdVS3A4uk
         yf+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXu8fPRqrzYOvSHVaefzb2DM+k0hOoKlhBdasm1N8hI6YErJT+lErtFX4Z3XPNjiHgqDMzDWqJE/yY6c5M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ho7i5GJv+rebLxsOwzeQ/0SJSt1vKgse8av/0G0st9L5lcjw
	Whar9xvh9oyl8V0nqCpV0oY7jfnVgjIwynxZGiyoQSH+DJYzS+pYa+Z3F5MY5FfFCVKBPVLpXWg
	YoEZrINWRRQFldV5tNgRvUhGkc9NfhuOQ0dXche+7nfhAildDzt7w8PkKhLmcZTcXW/hbpg==
X-Gm-Gg: ASbGnctnYwqdyZOvTeFDIFhH8ji9Uu4E6n5gSZjioN9w/vUkHJC23aqr7jaG8XF9SOR
	8GuWIFCfNgoity3U/qxv+s7Gze4nzjZc7MyFN0At7xyaXNBzMd/HEZHLEwYZPtnUhFz5ZQVkvt7
	LZEsMV1Xwa5l+HW9pkcY5yy5nU8Gn4LI+5QRjfIn8+pePOGI2U+F3bsPZmRt1tH72QmdmvHlv4F
	QKdXeYlBoRphETB62qGLQVCyNSuwDDuLuSesZLBGacFvXOJLn66a6RzZ4H3BaGejG0FlKv1fdJe
	bGDxbFZjf8U3tVx3sI3FiX73DfirDkzhoK5hRk59TldLqRryyIS3ZdVVRvdZt37uBQ==
X-Received: by 2002:a05:6820:1b8a:b0:5fa:4c67:b70c with SMTP id 006d021491bc7-5fc95ff892dmr2622050eaf.1.1739290023510;
        Tue, 11 Feb 2025 08:07:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG39aw8WEQq2GJ6eGTl/RE2qyvtd1GVqHepnABtWrQ7NjwsCwdSbz+zeNEqAMnCPL7YyoXT5Q==
X-Received: by 2002:a05:6820:1b8a:b0:5fa:4c67:b70c with SMTP id 006d021491bc7-5fc95ff892dmr2622026eaf.1.1739290023100;
        Tue, 11 Feb 2025 08:07:03 -0800 (PST)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-14-70-52-22-87.dsl.bell.ca. [70.52.22.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc7ecf380asm1708438eaf.19.2025.02.11.08.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:07:02 -0800 (PST)
Message-ID: <77dbe174-f055-42be-9b98-c5f37bcc462e@redhat.com>
Date: Tue, 11 Feb 2025 11:07:01 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/4] mm: page_ext: add an iteration API for page extensions
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, yuzhao@google.com
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, muchun.song@linux.dev,
 lcapitulino@gmail.com
References: <cover.1737754625.git.luizcap@redhat.com>
 <70bc5513e599d3386533fcc25dfe33685d2ca1bb.1737754625.git.luizcap@redhat.com>
 <192c5383-2be5-48da-b0f5-eda602505b70@redhat.com>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <192c5383-2be5-48da-b0f5-eda602505b70@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-02-11 10:25, David Hildenbrand wrote:
> On 24.01.25 22:37, Luiz Capitulino wrote:
>> The page extension implementation assumes that all page extensions of a
>> given page order are stored in the same memory section. The function
>> page_ext_next() relies on this assumption by adding an offset to the
>> current object to return the next adjacent page extension.
>>
>> This behavior works as expected for flatmem but fails for sparsemem when
>> using 1G pages. Commit e98337d11bbd ("mm/contig_alloc: support
>> __GFP_COMP") exposes this issue, making it possible for a crash when
>> using page_owner or page_table_check page extensions.
>>
>> The problem is that for 1G pages, the page extensions may span memory
>> section boundaries and be stored in different memory sections. This issue
>> was not visible before commit e98337d11bbd ("mm/contig_alloc: support
>> __GFP_COMP") because alloc_contig_pages() never passed more than
>> MAX_PAGE_ORDER to post_alloc_hook(). However, the mentioned commit
>> changed this behavior allowing the full 1G page order to be passed.
>>
>> Reproducer:
>>
>>   1. Build the kernel with CONFIG_SPARSEMEM=y and the table extensions
>>   2. Pass 'default_hugepagesz=1 page_owner=on' in the kernel command-line
>>   3. Reserve one 1G page at run-time, this should crash (backtrace below)
>>
>> To address this issue, this commit introduces a new API for iterating
>> through page extensions. In page_ext_iter_next(), we always go through
>> page_ext_get() to guarantee that we do a new memory section lookup for
>> the next page extension. In the future, this API could be used as a basis
>> to implement for_each_page_ext() type of macro.
>>
>> Thanks to David Hildenbrand for helping identify the root cause and
>> providing suggestions on how to fix it (final implementation and bugs are
>> all mine though).
>>
>> Here's the backtrace, without kasan you can get random crashes:
>>
>> [   76.052526] BUG: KASAN: slab-out-of-bounds in __update_page_owner_handle+0x238/0x298
>> [   76.060283] Write of size 4 at addr ffff07ff96240038 by task tee/3598
>> [   76.066714]
>> [   76.068203] CPU: 88 UID: 0 PID: 3598 Comm: tee Kdump: loaded Not tainted 6.13.0-rep1 #3
>> [   76.076202] Hardware name: WIWYNN Mt.Jade Server System B81.030Z1.0007/Mt.Jade Motherboard, BIOS 2.10.20220810 (SCP: 2.10.20220810) 2022/08/10
>> [   76.088972] Call trace:
>> [   76.091411]  show_stack+0x20/0x38 (C)
>> [   76.095073]  dump_stack_lvl+0x80/0xf8
>> [   76.098733]  print_address_description.constprop.0+0x88/0x398
>> [   76.104476]  print_report+0xa8/0x278
>> [   76.108041]  kasan_report+0xa8/0xf8
>> [   76.111520]  __asan_report_store4_noabort+0x20/0x30
>> [   76.116391]  __update_page_owner_handle+0x238/0x298
>> [   76.121259]  __set_page_owner+0xdc/0x140
>> [   76.125173]  post_alloc_hook+0x190/0x1d8
>> [   76.129090]  alloc_contig_range_noprof+0x54c/0x890
>> [   76.133874]  alloc_contig_pages_noprof+0x35c/0x4a8
>> [   76.138656]  alloc_gigantic_folio.isra.0+0x2c0/0x368
>> [   76.143616]  only_alloc_fresh_hugetlb_folio.isra.0+0x24/0x150
>> [   76.149353]  alloc_pool_huge_folio+0x11c/0x1f8
>> [   76.153787]  set_max_huge_pages+0x364/0xca8
>> [   76.157961]  __nr_hugepages_store_common+0xb0/0x1a0
>> [   76.162829]  nr_hugepages_store+0x108/0x118
>> [   76.167003]  kobj_attr_store+0x3c/0x70
>> [   76.170745]  sysfs_kf_write+0xfc/0x188
>> [   76.174492]  kernfs_fop_write_iter+0x274/0x3e0
>> [   76.178927]  vfs_write+0x64c/0x8e0
>> [   76.182323]  ksys_write+0xf8/0x1f0
>> [   76.185716]  __arm64_sys_write+0x74/0xb0
>> [   76.189630]  invoke_syscall.constprop.0+0xd8/0x1e0
>> [   76.194412]  do_el0_svc+0x164/0x1e0
>> [   76.197891]  el0_svc+0x40/0xe0
>> [   76.200939]  el0t_64_sync_handler+0x144/0x168
>> [   76.205287]  el0t_64_sync+0x1ac/0x1b0
>>
>> Fixes: e98337d11bbd ("mm/contig_alloc: support __GFP_COMP")
>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>> ---
>>   include/linux/page_ext.h | 10 ++++++++
>>   mm/page_ext.c            | 55 ++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 65 insertions(+)
>>
>> diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
>> index e4b48a0dda244..df904544d3fac 100644
>> --- a/include/linux/page_ext.h
>> +++ b/include/linux/page_ext.h
>> @@ -93,6 +93,16 @@ static inline struct page_ext *page_ext_next(struct page_ext *curr)
>>       return next;
>>   }
>> +struct page_ext_iter {
>> +    unsigned long pfn;
>> +    struct page_ext *page_ext;
>> +};
>> +
>> +struct page_ext *page_ext_iter_begin(struct page_ext_iter *iter, struct page *page);
>> +struct page_ext *page_ext_iter_get(const struct page_ext_iter *iter);
>> +struct page_ext *page_ext_iter_next(struct page_ext_iter *iter);
>> +void page_ext_iter_end(struct page_ext_iter *iter);
>> +
>>   #else /* !CONFIG_PAGE_EXTENSION */
>>   struct page_ext;
>> diff --git a/mm/page_ext.c b/mm/page_ext.c
>> index 641d93f6af4c1..0b6eb5524cb2c 100644
>> --- a/mm/page_ext.c
>> +++ b/mm/page_ext.c
>> @@ -549,3 +549,58 @@ void page_ext_put(struct page_ext *page_ext)
>>       rcu_read_unlock();
>>   }
>> +
>> +/**
>> + * page_ext_iter_begin() - Prepare for iterating through page extensions.
>> + * @iter: page extension iterator.
>> + * @page: The page we're interested in.
>> + *
>> + * Return: NULL if no page_ext exists for this page.
>> + */
>> +struct page_ext *page_ext_iter_begin(struct page_ext_iter *iter, struct page *page)
>> +{
>> +    iter->pfn = page_to_pfn(page);
>> +    iter->page_ext = page_ext_get(page);
>> +
>> +    return iter->page_ext;
>> +}
>> +
>> +/**
>> + * page_ext_iter_get() - Get current page extension
>> + * @iter: page extension iterator.
>> + *
>> + * Return: NULL if no page_ext exists for this iterator.
>> + */
>> +struct page_ext *page_ext_iter_get(const struct page_ext_iter *iter)
>> +{
>> +    return iter->page_ext;
>> +}
>> +
>> +/**
>> + * page_ext_iter_next() - Get next page extension
>> + * @iter: page extension iterator.
>> + *
>> + * Return: NULL if no next page_ext exists.
>> + */
>> +struct page_ext *page_ext_iter_next(struct page_ext_iter *iter)
>> +{
>> +    if (!iter->page_ext)
>> +        return NULL;
>> +
>> +    page_ext_put(iter->page_ext);
>> +
>> +    iter->pfn++;
>> +    iter->page_ext = page_ext_get(pfn_to_page(iter->pfn));
>> +
>> +    return iter->page_ext;
>> +}
>> +
>> +/**
>> + * page_ext_iter_end() - End iteration through page extensions.
>> + * @iter: page extension iterator.
>> + */
>> +void page_ext_iter_end(struct page_ext_iter *iter)
>> +{
>> +    page_ext_put(iter->page_ext);
>> +    iter->page_ext = NULL;
>> +}
> 
> We should likely move all these to the header file, and implement
> page_ext_iter_next() without dropping the RCU lock. Further, we should add
> the optimization where possible right away.

I agreed.

> 
> 
> Maybe something like this might work:
> 
> 
> diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
> index df904544d3fac..4a79820cfe63e 100644
> --- a/include/linux/page_ext.h
> +++ b/include/linux/page_ext.h
> @@ -69,12 +69,24 @@ extern void page_ext_init(void);
>   static inline void page_ext_init_flatmem_late(void)
>   {
>   }
> +static inline bool page_ext_next_possible(unsigned long next_pfn)
> +{
> +       /*
> +        * page_ext is allocated per memory section. Once we cross a
> +        * memory section, we have to fetch the new pointer.
> +        */
> +       return next_pfn % PAGES_PER_SECTION;
> +}
>   #else
>   extern void page_ext_init_flatmem(void);
>   extern void page_ext_init_flatmem_late(void);
>   static inline void page_ext_init(void)
>   {
>   }
> +static inline bool page_ext_next_possible(unsigned long pfn)
> +{
> +       return true;
> +}
>   #endif
> 
>   extern struct page_ext *page_ext_get(const struct page *page);
> @@ -100,9 +112,32 @@ struct page_ext_iter {
> 
>   struct page_ext *page_ext_iter_begin(struct page_ext_iter *iter, struct page *page);
>   struct page_ext *page_ext_iter_get(const struct page_ext_iter *iter);
> -struct page_ext *page_ext_iter_next(struct page_ext_iter *iter);
>   void page_ext_iter_end(struct page_ext_iter *iter);
> 
> +/**
> + * page_ext_iter_next() - Get next page extension
> + * @iter: page extension iterator.
> + *
> + * Return: NULL if no next page_ext exists.
> + */
> +struct page_ext *__page_ext_iter_next(struct page_ext_iter *iter)
> +{
> +       if (WARN_ON_ONCE(!iter->page_ext))
> +               return NULL;
> +
> +       iter->pfn++;
> +       if (page_exit_iter_next_fast_possible(iter)) {
> +               iter->page_ext = page_ext_next(iter->page_ext);
> +       } else {
> +               /*
> +         * Grabbing the new one before putting the old one makes sure
> +                * that we won't be dropping the RCU read lock.
> +                */
> +               iter->page_ext = page_ext_get(pfn_to_page(iter->pfn));
> +               page_ext_put(iter->page_ext);
> +       }
> +    WARN_ON_ONCE(!iter->page_ext)
> +       return iter->page_ext;
> +}
> +
>   #else /* !CONFIG_PAGE_EXTENSION */
> 
> 
> We should just assume that if the first page_ext exists, then the
> other ones must exist as well (thus the WARN_ON_ONCE()).
> 
> If the page_ext_get+page_ext_put thingy regarding RCU does not work,
> we should have a new function that looks up the page_ext, assuming
> we already hold the rcu lock. (but I think this should work)
> 
> 
> In general, I think this iterator API will be a lot cleaner to use.

Thanks for looking into this, David.

It's been a few weeks that I don't look at this code, but your suggestion
makes sense to me. I'll give this a try for the next posting.

