Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FDD21CC5D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275161; cv=none; b=p86j4vYMb5eh+YC0dZ9OdDVhT6eR2tlAjVlVo3/AmS8mliwLVWYqhn5F0h0c9bExuOsstCkCCKbkJkOmFF4zlV0VtQmWbR+Gidtil8Xm98st2ujNwPTQh50/NUR+pKi23++nThz5V1Eeqy+tJnkwJ4nqNYe/P0IXXwGPbQkCzGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275161; c=relaxed/simple;
	bh=WIiz8zPojBe/0WV3elPzmz3YXDGo0TGtSCnW8wU8KFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cdm2BGcJjRKn5BaJcU1YdvwmtMDbN1bX9opOLHV3ecPZDZZrmjkILFz+9TAYaDd9WCrjz5JWvMEEGceHA1bgpeHujd+erPC4XsHQ51a2E8jWIN3aDdUZP62bocQk0h0KY5u4/1jmhsFvJRFjzkUvGG+DTtBqyBtNWBzXbETXq7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jt3W5UVU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jt3W5UVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751275158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mtBU2fh1YbaPePVsxZHEQ+3oaFEJS3ncFa6eqBnUs8k=;
	b=Jt3W5UVULvMHTCDGuzaWkuEy+1zd7jj5mWZgQUJQcEfyKMlWsDFHOqDL4Y1KFcvs8gEiAi
	SMUm0wp6EJIT2bMfgArU3yFkUZ4EWiunwg9f46WBW1mRLXBhI+wLt8o9nSAPqFwjjnnIIx
	dS/ODnWLyL5JYnifB7jaFrCqM99h9IU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-dIF-cB2cPxySDTFA6FG79Q-1; Mon, 30 Jun 2025 05:19:17 -0400
X-MC-Unique: dIF-cB2cPxySDTFA6FG79Q-1
X-Mimecast-MFC-AGG-ID: dIF-cB2cPxySDTFA6FG79Q_1751275156
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so2052089f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751275156; x=1751879956;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mtBU2fh1YbaPePVsxZHEQ+3oaFEJS3ncFa6eqBnUs8k=;
        b=F+hWBu+W7zebPX9kYT0QF2cNWSegCklb2u2G5Bc5OqKm4fdHkatWuHXfP8S5tL5JU2
         NPinHnObrHfYRGgKCpwVq9XJjawrKb1pxTdeM1yCJIMWuvB5FJMYXH+yAKflIADfzr9Q
         7gFH/8slRb1a97LMjahibFmaggLfgzhOJEbmg0+GvHDN6xj2kURQ5jD26iqfhmbaFUZH
         WGX3vwCS911HkigtQchJDbCzy9Qtl5dAZ976/xUoPhoiSsXeubUDVwpPkXRT11264bYc
         6d5cT2GdhdzI6IRn8QPPl4eq6RlRkyHynCFJnmKVwyMX9w07meQPlHIvWXeg1L3KK9st
         Fp+g==
X-Gm-Message-State: AOJu0YydBl0V7q5h858MMa02wTO2d79BjDOWrj2d5PuknqAu+sCo9YFg
	MT9os936E3y7ftStRr6M0oPfS6yWVNSTOKj5echJpGzSU4SP+Sww4XPu6nQMJVMSyKML/VZO2u6
	j7reg+ZOtAiYUkbCiW9TuqKvRJPnpRhyGGn3rZEsRjFBH1sLVEspBQKmmgEn9Rf4idw==
X-Gm-Gg: ASbGncvSwdqA/mYYw20jtugQ1BiFe3whwSQdd0ksP8Qf4MG+Q1QUo7zp0M5AlqlJV1H
	y0izAPhg0fjyNkNdroiWj2yOpRXkzNO38BUU9M2LpfYc0SkcSFohY54MPJnvBqflLU2/oOQM4mR
	Lnnl6ZHxV0Nt/hb16AtgiTXtxS5KUsDvlftA6EIyVei4Xe6qLZ9G3iw3wcVR9K+aFNU0v5YcWLM
	X83O7MNjmuLH9Kq5ToEIKhevs30Hz2jjPgQ0XOJMT9AB2+idB2zBeNDCEOJw6PJ8EZUV+xTVi4Q
	UPdOWLr1OMQ+tNvdz/qYJWnNWKEznLnpOvcdGGGXF4ReiNmmaNTjCcA4hs6Wnce2VjWuBrmE4p1
	L3eI+4GPavBFaA6gY9hT4LPDfsgZi197u/x0rx9pfsWrGWKHmIQ==
X-Received: by 2002:a05:6000:2b0f:b0:3a5:25e2:6129 with SMTP id ffacd0b85a97d-3a6f3152f1emr9473449f8f.21.1751275155748;
        Mon, 30 Jun 2025 02:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQqdKm45w04yiic3ZYPmpNace4MCCYApA8LQNWNBwb3BMQskmhwY5Q4uLDWRVoQHBh0j1OnA==
X-Received: by 2002:a05:6000:2b0f:b0:3a5:25e2:6129 with SMTP id ffacd0b85a97d-3a6f3152f1emr9473418f8f.21.1751275155253;
        Mon, 30 Jun 2025 02:19:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59659sm9856867f8f.77.2025.06.30.02.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 02:19:14 -0700 (PDT)
Message-ID: <9185c50a-1427-45fc-941d-e9796cea4831@redhat.com>
Date: Mon, 30 Jun 2025 11:19:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] mm: split folio_pte_batch() into folio_pte_batch()
 and folio_pte_batch_ext()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-4-david@redhat.com>
 <ec53b2ad-9c1b-4039-b59e-905e1853c1a0@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ec53b2ad-9c1b-4039-b59e-905e1853c1a0@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.06.25 20:48, Lorenzo Stoakes wrote:
> On Fri, Jun 27, 2025 at 01:55:09PM +0200, David Hildenbrand wrote:
>> Many users (including upcoming ones) don't really need the flags etc,
>> and can live with a function call.
>>
>> So let's provide a basic, non-inlined folio_pte_batch().
> 
> Hm, but why non-inlined, when it invokes an inlined function? Seems odd no?

We want to always generate a function that uses as little runtime checks 
as possible. Essentially, optimize out the "flags" as much as possible.

In case of folio_pte_batch(), where we won't use any flags, any checks 
will be optimized out by the compiler.

So we get a single, specialized, non-inlined function.

> 
>>
>> In zap_present_ptes(), where we care about performance, the compiler
>> already seem to generate a call to a common inlined folio_pte_batch()
>> variant, shared with fork() code. So calling the new non-inlined variant
>> should not make a difference.
>>
>> While at it, drop the "addr" parameter that is unused.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Other than the query above + nit on name below, this is really nice!
> 
>> ---
>>   mm/internal.h  | 11 ++++++++---
>>   mm/madvise.c   |  4 ++--
>>   mm/memory.c    |  6 ++----
>>   mm/mempolicy.c |  3 +--
>>   mm/mlock.c     |  3 +--
>>   mm/mremap.c    |  3 +--
>>   mm/rmap.c      |  3 +--
>>   mm/util.c      | 29 +++++++++++++++++++++++++++++
>>   8 files changed, 45 insertions(+), 17 deletions(-)
>>
>> diff --git a/mm/internal.h b/mm/internal.h
>> index ca6590c6d9eab..6000b683f68ee 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -218,9 +218,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>>   }
>>
>>   /**
>> - * folio_pte_batch - detect a PTE batch for a large folio
>> + * folio_pte_batch_ext - detect a PTE batch for a large folio
>>    * @folio: The large folio to detect a PTE batch for.
>> - * @addr: The user virtual address the first page is mapped at.
>>    * @ptep: Page table pointer for the first entry.
>>    * @pte: Page table entry for the first page.
>>    * @max_nr: The maximum number of table entries to consider.
>> @@ -243,9 +242,12 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>>    * must be limited by the caller so scanning cannot exceed a single VMA and
>>    * a single page table.
>>    *
>> + * This function will be inlined to optimize based on the input parameters;
>> + * consider using folio_pte_batch() instead if applicable.
>> + *
>>    * Return: the number of table entries in the batch.
>>    */
>> -static inline unsigned int folio_pte_batch(struct folio *folio, unsigned long addr,
>> +static inline unsigned int folio_pte_batch_ext(struct folio *folio,
>>   		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
>>   		bool *any_writable, bool *any_young, bool *any_dirty)
> 
> Sorry this is really really annoying feedback :P but _ext() makes me think of
> page_ext and ugh :))
> 
> Wonder if __folio_pte_batch() is better?
> 
> This is obviously, not a big deal (TM)

Obviously, I had that as part of the development, and decided against it 
at some point. :)

Yeah, _ext() is not common in MM yet, in contrast to other subsystems. 
The only user is indeed page_ext. On arm we seem to have set_pte_ext(). 
But it's really "page_ext", that's the problematic part, not "_ext" :P

No strong opinion, but I tend to dislike here "__", because often it 
means "internal helper you're not supposed to used", which isn't really 
the case here.

E.g.,

alloc_frozen_pages() -> alloc_frozen_pages_noprof() -> 
__alloc_frozen_pages_noprof()

-- 
Cheers,

David / dhildenb

