Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CE8253F0F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289620; cv=none; b=D3jn/hzuenJUluTqw4PsrcWzJpoiXxnUZeblKqtNfT6isFJFCH9FGHclapkIaOA/A9iRip/9crEGnE255PsNy2T+k2GdX3UAeMTODFFckfe9IGehRgaYn/uHDE9JMTOPY/RPH3ghZcdMOU8s2VgdnvvRFoG8So5wiWrYLpJ4OGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289620; c=relaxed/simple;
	bh=c7zgBDyJZBAEksUpFF1d9uZy6DE5OZ0FyCg5uBMHiEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H5VGR4cuYO+cb+yyEgXFq4JyW8Iye4IAs/141i9TJZv65m8a8L2aPWXShOzoKtfcwMf1oLF4cxO5sw4W7ov1J/VldopBS9hhsveLMq0PuFQd5J22DGYnIUIYfbSr3soaEvcJ/3hAoLY5R3QkRxs0MW3mCBE6nnJt7vwFrwJpHYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eHmE0H+F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eHmE0H+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739289615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5eR6z51HlTDrGEEKuRBQbK6HD1KiQiTJqr1uKdaTpVc=;
	b=eHmE0H+FA3wW2KxRzmzft2yyv78ayoOb/sNsyPjjXGj3Dpf/vN/8IGLLgr43Zr1zYVegkC
	gZjSRhuCzd6i4BShkjLLI+SEb+U7Oh3wftFRb2CXNAuS0+E04CTeIEVQ1NJyK2lhhQ3Cey
	hBRIHtXeu7wULBzqim2/1NEUcjPE7qo=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-EHLLGrJANjmFHhvKjpdKdw-1; Tue, 11 Feb 2025 11:00:10 -0500
X-MC-Unique: EHLLGrJANjmFHhvKjpdKdw-1
X-Mimecast-MFC-AGG-ID: EHLLGrJANjmFHhvKjpdKdw
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5fc7e85d5c2so454854eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289609; x=1739894409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5eR6z51HlTDrGEEKuRBQbK6HD1KiQiTJqr1uKdaTpVc=;
        b=DJthJ37qvwnknd7rpZuGXlsw41Fbd/SeAiGYzZyNvRvwbMEmO+jdW3AOfPcvWvadwX
         JwZ0X3BEYSa0Q6mPKPdqNndhRVa++fClFq8bfyYUXLCwgUTO1F1vDDMLpy6UjQ6VbfLx
         OM4YLrTUxlAkZ8O7QpH1P940BzdwHPSeFJVgGVR2Rls7PkuFf1O1bfgqEaa/MQ55SL88
         4e1+5F1ValI7aKaEWh5OPeR1apfnGk6LJrCvOSOsRuQ48AXTsdyqGTlp/uVnRT0Kc5Ks
         vwTDaDw131kygi4EC5CL/fBlPuz+hZPZHWmeV8ntDZR2x/ATBhqDgRK49OjftevbgxtZ
         KIeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqTVGeXu3zKtixR9JuQXx3ojDEpKknV4P3UnZhVQBcBtfAuT9XYIu+xRNewMeP+klea6lFsN6MHXkyyRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPDlbYEeDgyd75yNfefElEk1a8dGi/xQ5BavmAQ3aRWF65d5dR
	a60IdMioMCogfSZJ8ZULFliLFA2alK4VbXdD2PAmxpFceiSFNabPQ9CDlAyxVOseKOWJhpKyJTC
	QOHBGIt07jHgdO3kP1i60DTIsylAauzSxAQDiVsp+kSTi5dk18co1yQTcLJw2rA==
X-Gm-Gg: ASbGncuLjNt3KLibqUN06uJLgijXgJ7aKeaPhQlbYfb2Bba9uGbf+q77ata1oTeV6r5
	nGAp8YtvCVi6026JqWBl0ELcFyKSsy19HXlNB/aDty6YARQ86D27zwQIOFAjZAwNJ2PX+OPZezX
	aqwnA1Am0ZVPROhqDWX34YEp4LTtEpE0g5PEHajYeE44HaJcGxAdo3FkLB4K21Em3H0ZZ80xxpt
	yi5UhRrRilyVqF2SSaX+IV/NeQGfsFQU0Pr/YsK4iQTsudZNFpEG14JFtppWr1jJsOaKyCJOzGj
	YZ/wN0IwdOdoCdysBEcqXPKDNEcqh9LUzlpSnNEwoVw3Gp8pd24HQWVqN3GNgAB64w==
X-Received: by 2002:a05:6820:1787:b0:5fc:9430:d747 with SMTP id 006d021491bc7-5fc9430de7emr3490648eaf.1.1739289609526;
        Tue, 11 Feb 2025 08:00:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHagic0XDZbhexruw22NPZAkw8lVjDiuwAmK8Si9PD1YR5NxKNSbr/M2JN0NAY4DO07y3JDlw==
X-Received: by 2002:a05:6820:1787:b0:5fc:9430:d747 with SMTP id 006d021491bc7-5fc9430de7emr3490615eaf.1.1739289609213;
        Tue, 11 Feb 2025 08:00:09 -0800 (PST)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-14-70-52-22-87.dsl.bell.ca. [70.52.22.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc7d808b03sm1807135eaf.24.2025.02.11.08.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:00:08 -0800 (PST)
Message-ID: <4bf1321d-ca18-43d5-9d6a-1b2625be6107@redhat.com>
Date: Tue, 11 Feb 2025 11:00:07 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/4] mm: page_owner: use new iteration API
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, yuzhao@google.com
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, muchun.song@linux.dev,
 lcapitulino@gmail.com
References: <cover.1737754625.git.luizcap@redhat.com>
 <712c1e058c58ba0d4c407089fbcc45c55ceb8efc.1737754625.git.luizcap@redhat.com>
 <40036244-644a-42e0-a5e4-4838a98b1cbc@redhat.com>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <40036244-644a-42e0-a5e4-4838a98b1cbc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-02-11 10:15, David Hildenbrand wrote:
> On 24.01.25 22:37, Luiz Capitulino wrote:
>> The page_ext_next() function assumes that page extension objects for a
>> page order allocation always reside in the same memory section, which
>> may not be true and could lead to crashes. Use the page_ext_iter API
>> instead.
>>
>> Fixes: e98337d11bbd ("mm/contig_alloc: support __GFP_COMP")
>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>> ---
> 
> [...]
> 
>>   void __folio_copy_owner(struct folio *newfolio, struct folio *old)
>> @@ -364,24 +376,26 @@ void __folio_copy_owner(struct folio *newfolio, struct folio *old)
>>       int i;
>>       struct page_ext *old_ext;
>>       struct page_ext *new_ext;
>> +    struct page_ext_iter old_iter;
>> +    struct page_ext_iter new_iter;
>>       struct page_owner *old_page_owner;
>>       struct page_owner *new_page_owner;
>>       depot_stack_handle_t migrate_handle;
>> -    old_ext = page_ext_get(&old->page);
>> +    old_ext = page_ext_iter_begin(&old_iter, &old->page);
>>       if (unlikely(!old_ext))
>>           return;
>> -    new_ext = page_ext_get(&newfolio->page);
>> +    new_ext = page_ext_iter_begin(&new_iter, &newfolio->page);
>>       if (unlikely(!new_ext)) {
>> -        page_ext_put(old_ext);
>> +        page_ext_iter_end(&old_iter);
>>           return;
>>       }
>>       old_page_owner = get_page_owner(old_ext);
>>       new_page_owner = get_page_owner(new_ext);
>>       migrate_handle = new_page_owner->handle;
>> -    __update_page_owner_handle(new_ext, old_page_owner->handle,
>> +    __update_page_owner_handle(&new_iter, old_page_owner->handle,
>>                      old_page_owner->order, old_page_owner->gfp_mask,
>>                      old_page_owner->last_migrate_reason,
>>                      old_page_owner->ts_nsec, old_page_owner->pid,
>> @@ -390,8 +404,13 @@ void __folio_copy_owner(struct folio *newfolio, struct folio *old)
>>        * Do not proactively clear PAGE_EXT_OWNER{_ALLOCATED} bits as the folio
>>        * will be freed after migration. Keep them until then as they may be
>>        * useful.
>> +     *
>> +     * Note that we need to re-grab the page_ext iterator since
>> +     * __update_page_owner_handle changed it.
>>        */
>> -    __update_page_owner_free_handle(new_ext, 0, old_page_owner->order,
>> +    page_ext_iter_end(&new_iter);
>> +    page_ext_iter_begin(&new_iter, &newfolio->page);
> 
> So a page_ext_iter_reset() could be helpful, that wouldn't drop the RCU lock. With that, we could probably also drop the comment.

That's a good suggestion, I'll give it a try.

> 
>> +    __update_page_owner_free_handle(&new_iter, 0, old_page_owner->order,
>>                       old_page_owner->free_pid,
>>                       old_page_owner->free_tgid,
>>                       old_page_owner->free_ts_nsec);
>> @@ -402,12 +421,12 @@ void __folio_copy_owner(struct folio *newfolio, struct folio *old)
>>        */
>>       for (i = 0; i < (1 << new_page_owner->order); i++) {
>>           old_page_owner->handle = migrate_handle;
>> -        old_ext = page_ext_next(old_ext);
>> +        old_ext = page_ext_iter_next(&old_iter);
>>           old_page_owner = get_page_owner(old_ext);
>>       }
>> -    page_ext_put(new_ext);
>> -    page_ext_put(old_ext);
>> +    page_ext_iter_end(&new_iter);
>> +    page_ext_iter_end(&old_iter);
> 
> In general, we should look into implementing the iterator without temporarily dropping the RCU lock I think.

OK.

> 
> Nothing jumped at me from a quick glimpse, but yes, this usage is not that easy.
> 

