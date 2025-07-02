Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9324F21D3EC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477801; cv=none; b=heCAME0PKs+0spPheGX+3ETVbF5TF/x1Fl5jX+G2wrekYRfZ2MynjRq3WzgrStGu5updXRBHuA9VXwLpjeBI8IwF4Q/P/y7JTBB6z1D9QZOX2yBPO0MPlcP6Jhv5mKAjEJynQsA9BnWgI1Q5612DSkUp0kxDQG9C4R1GlwLTOzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477801; c=relaxed/simple;
	bh=y2pR6yQDvVevbuK2S7tIV1FWcSc0rKyw74l3rSOVSic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nbz3+nEx0XSNqqPcBqSkj0j0T8m3GcW+S9QSkl/BmOjH9Ew0E/DPWNXTpLejqU7sJKk8wJshhC4MkMtMFRc7jha8Pb+rdazWdocD4fPaZOy9Wjp8NznEdNmSP5QhKNqs2q/F9c8zgnf28u8eL7GqBqsJbyjFB5xC5iG/pEN3/Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HZryfUfi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HZryfUfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751477798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2GYUJnG0xPXypeyK4CSQtcgb/+YIuzlv2KlvaPQvSUE=;
	b=HZryfUfilqwrrfgZM8D0GGGYN085bejbcgf3Weafs4Gww2acsX/6Wzx/xbPEd6ILqe/XJp
	MrEbY2UWF5BCg2tMTggeHdnNZs/IouHPDgCFEIedlQ3ZXe3RQ5eHk313COAacII+ZiciEj
	esGGXSFx/zzrmgntBS/0hKxS/x1mh7w=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-AOzTChY7PVai8rhZD8Avlw-1; Wed, 02 Jul 2025 13:36:37 -0400
X-MC-Unique: AOzTChY7PVai8rhZD8Avlw-1
X-Mimecast-MFC-AGG-ID: AOzTChY7PVai8rhZD8Avlw_1751477796
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2eae95dfae3so5030792fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477796; x=1752082596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2GYUJnG0xPXypeyK4CSQtcgb/+YIuzlv2KlvaPQvSUE=;
        b=kOcCMUvxnDBPmVrmD3f12aEGdFb1wMm8qoN4Hku3/JntiFSU6TRzvXDzjCLy4H4xNn
         XUWHyY2386QS7uO9+iwdmoGxfoKmWZto8Uxv1AUyN4/NNR+canyDv07DnDOyiPB7EWZ2
         8biTO9PjAAVwUdpMjj6yhN6kDCsiWRxVhXfpiRP1pS1UcmfYaq6ADZs1uz6ZS/x8TMT+
         pT0AQiBSL6Qt5vpapL9MGRlWOyTGom7Oc6nY8awkJlBLarAbDeFNyotAjPfmQ4gdZJCC
         9LyoK6FIy3TtaJ1WLt8bWAda2U+lOArSRev3fVCGkGjL1Ozaogiut8bzPdXmI4iXcRVU
         8jMA==
X-Forwarded-Encrypted: i=1; AJvYcCXQB7AVDJuNVEErNE7WAxMbH9anMphFr74x6czB+ymA47UEbmzhg8sDFpl9jx+ndwGzjUrso+9MBp0GWpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOiDeFrSGBgb3LAz8HAAm26wPfgRmvFGkXz+C8cesoDIB5/j/w
	F3rtW+9RCPC/GkpMNqUB9kLLPvo3gExhCa1bRcY+2m5CQ8cmNhjDRdwhy7H4vOnzWjwxERLqNn3
	/iiBTqlwU1bX97SZjqpwrfymqxG52vwBu84ifZLRzVi/kZBcdvmt1UzbzV5uMKcLNfQ==
X-Gm-Gg: ASbGncuFS8obFRsSL0tk4AnqgcK56i1hYdflUqjZDb9/9k++Vyq0l9K0r0UWr8Nyp3t
	M6H+lFtdeoP3fr2xKevnl4w22gBUXxmhczzkaJ7+lK+C6ydgnBG4KwA3JbNUWC3wqN0n1oNfY9+
	SBEKvIiH40I6FM8us9DJM3N34RDvTlKxwehvfJrIx+iwMSd/uYKqBghyGBjocaEkel7Q+KFufdX
	eZF343mSaXLUDiLUyg/8zLsPt7w55I4Zggwq4KebcFSQ5r6vl0mFyx83Dbhprl47eVMEKWIIADk
	6GuVENqm0uEhCnJQ/Xtu+rCD
X-Received: by 2002:a05:6870:440e:b0:29e:74a0:e03f with SMTP id 586e51a60fabf-2f76c9bbc50mr238179fac.24.1751477795839;
        Wed, 02 Jul 2025 10:36:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH07K6+7yV9tkrUeO7NLAM5+j/shiD8vMQPM7CbAu2aFGr7A9l1QFTE/f7dtdS8hndgCujPHQ==
X-Received: by 2002:a05:6870:440e:b0:29e:74a0:e03f with SMTP id 586e51a60fabf-2f76c9bbc50mr238158fac.24.1751477795444;
        Wed, 02 Jul 2025 10:36:35 -0700 (PDT)
Received: from [192.168.2.110] ([69.156.206.24])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50b4d84sm3936817fac.23.2025.07.02.10.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 10:36:35 -0700 (PDT)
Message-ID: <0021e29e-381d-4f51-93ac-4f6faf0f2ff2@redhat.com>
Date: Wed, 2 Jul 2025 13:36:23 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] fs: stable_page_flags(): use snapshot_page()
To: David Hildenbrand <david@redhat.com>, willy@infradead.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lcapitulino@gmail.com, shivankg@amd.com
References: <cover.1750961812.git.luizcap@redhat.com>
 <ede227784078c4c619582c2c69aee1d8450edf12.1750961812.git.luizcap@redhat.com>
 <fa3a6258-5304-40b2-bb58-e6081ed845d1@redhat.com>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <fa3a6258-5304-40b2-bb58-e6081ed845d1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-01 14:44, David Hildenbrand wrote:
> On 26.06.25 20:16, Luiz Capitulino wrote:
>> A race condition is possible in stable_page_flags() where user-space is
>> reading /proc/kpageflags concurrently to a folio split. This may lead to
>> oopses or BUG_ON()s being triggered.
>>
>> To fix this, this commit uses snapshot_page() in stable_page_flags() so
>> that stable_page_flags() works with a stable page and folio snapshots
>> instead.
>>
>> Note that stable_page_flags() makes use of some functions that require
>> the original page or folio pointer to work properly (eg.
>> is_free_budy_page() and folio_test_idle()). Since those functions can't
>> be used on the page snapshot, we replace their usage with flags that
>> were set by snapshot_page() for this purpose.
>>
>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>> ---
>>   fs/proc/page.c | 25 ++++++++++++++-----------
>>   1 file changed, 14 insertions(+), 11 deletions(-)
>>
>> diff --git a/fs/proc/page.c b/fs/proc/page.c
>> index 936f8bbe5a6f..a2ee95f727f0 100644
>> --- a/fs/proc/page.c
>> +++ b/fs/proc/page.c
>> @@ -147,6 +147,7 @@ static inline u64 kpf_copy_bit(u64 kflags, int ubit, int kbit)
>>   u64 stable_page_flags(const struct page *page)
>>   {
>>       const struct folio *folio;
>> +    struct page_snapshot ps;
>>       unsigned long k;
>>       unsigned long mapping;
>>       bool is_anon;
>> @@ -158,7 +159,9 @@ u64 stable_page_flags(const struct page *page)
>>        */
>>       if (!page)
>>           return 1 << KPF_NOPAGE;
>> -    folio = page_folio(page);
>> +
>> +    snapshot_page(&ps, page);
>> +    folio = &ps.folio_snapshot;
>>       k = folio->flags;
>>       mapping = (unsigned long)folio->mapping;
>> @@ -167,7 +170,7 @@ u64 stable_page_flags(const struct page *page)
>>       /*
>>        * pseudo flags for the well known (anonymous) memory mapped pages
>>        */
>> -    if (page_mapped(page))
>> +    if (folio_mapped(folio))
>>           u |= 1 << KPF_MMAP;
>>       if (is_anon) {
>>           u |= 1 << KPF_ANON;
>> @@ -179,7 +182,7 @@ u64 stable_page_flags(const struct page *page)
>>        * compound pages: export both head/tail info
>>        * they together define a compound page's start/end pos and order
>>        */
>> -    if (page == &folio->page)
>> +    if (ps.idx == 0)
>>           u |= kpf_copy_bit(k, KPF_COMPOUND_HEAD, PG_head);
>>       else
>>           u |= 1 << KPF_COMPOUND_TAIL;
>> @@ -189,10 +192,10 @@ u64 stable_page_flags(const struct page *page)
>>                folio_test_large_rmappable(folio)) {
>>           /* Note: we indicate any THPs here, not just PMD-sized ones */
>>           u |= 1 << KPF_THP;
>> -    } else if (is_huge_zero_folio(folio)) {
>> +    } else if (ps.flags & PAGE_SNAPSHOT_PG_HUGE_ZERO) {
> 
> For that, we could use
> 
> is_huge_zero_pfn(ps.pfn)
> 
> from
> 
> https://lkml.kernel.org/r/20250617154345.2494405-10-david@redhat.com
> 
> 
> You should be able to cherry pick that commit (only minor conflict in vm_normal_page_pmd()) and include it in this series.

OK, will do.

> 
>>           u |= 1 << KPF_ZERO_PAGE;
>>           u |= 1 << KPF_THP;
>> -    } else if (is_zero_folio(folio)) {
>> +    } else if (is_zero_pfn(ps.pfn)) {
>>           u |= 1 << KPF_ZERO_PAGE;
>>       }
>> @@ -200,14 +203,14 @@ u64 stable_page_flags(const struct page *page)
>>        * Caveats on high order pages: PG_buddy and PG_slab will only be set
>>        * on the head page.
>>        */
>> -    if (PageBuddy(page))
>> +    if (PageBuddy(&ps.page_snapshot))
>>           u |= 1 << KPF_BUDDY;
>> -    else if (page_count(page) == 0 && is_free_buddy_page(page))
>  > +    else if (ps.flags & PAGE_SNAPSHOT_PG_FREE)
> 
> Yeah, that is nasty, and inherently racy. So detecting it an snapshot time might be best.
> 
> Which makes me wonder if this whole block should simply be
> 
> if (ps.flags & PAGE_SNAPSHOT_PG_BUDDY)
>      u |= 1 << KPF_BUDDY;
> 
> and you move all buddy detection into the snapshotting function. That is, PAGE_SNAPSHOT_PG_BUDDY gets set for head and tail pages of buddy pages.
> 
> Looks less special that way ;)

I can do this too.

> 
>>           u |= 1 << KPF_BUDDY;
>> -    if (PageOffline(page))
>> +    if (folio_test_offline(folio))
>>           u |= 1 << KPF_OFFLINE;
>  > -    if (PageTable(page))> +    if (folio_test_pgtable(folio))
>>           u |= 1 << KPF_PGTABLE;
> 
> I assume, long-term none of these will actually be folios. But we can change that once we get to it.
> 
> (likely, going back to pages ... just like for the slab case below)
> 
>>       if (folio_test_slab(folio))
>>           u |= 1 << KPF_SLAB;
>> @@ -215,7 +218,7 @@ u64 stable_page_flags(const struct page *page)
>>   #if defined(CONFIG_PAGE_IDLE_FLAG) && defined(CONFIG_64BIT)
>>       u |= kpf_copy_bit(k, KPF_IDLE,          PG_idle);
>>   #else
>> -    if (folio_test_idle(folio))
>> +    if (ps.flags & PAGE_SNAPSHOT_PG_IDLE)
>>           u |= 1 << KPF_IDLE;
> 
> Another nasty 32bit case. At least once we decouple pages from folios,
> the while test-idle in page-ext will vanish and this will get cleaned up.

Thanks for the review!

