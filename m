Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1F623ABB1
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275970; cv=none; b=m5ZnDiQO04ngHuCN/9K962gG6vr235G88XR8Qgrke+hPHcJ6+v4jj2GmZuTaTPwsx6NMxCeOIjnxa6VKBG1Xnj+s2w3SKZ4KLi8HHZXr16af6NLcjXw/RuSX8oCuKNqzsbnP2eO/M6oclWE3tPScryKxr25FEdh7vcrY6KU5vRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275970; c=relaxed/simple;
	bh=owokW7daQ9VQto8Iuj+xIq01IMVFLKnTi3/tD8Wv2cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6TYVtJrFzjPmMB6lOjKO7k9yQteWg9XtN4jEoX7KLim8wpxfuUBbYTlqGBNibEGXcnVqMjXl2hkC0xUHuSf7jtFFWhWvFt4zySFCIi37U+itAWQTUjTXnoXLmAW2mkiXLEEzfMdUJAzvBeqbTWq8VMIAnb32kW0VyrUUBCH3rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ocb6Wcbk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ocb6Wcbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751275967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yeq7h6rzcYIeNa1V1io9unzazS87D3gz4zthrzuogQ8=;
	b=Ocb6WcbkzEB3C/1+6QK7+tjDmNOBhtQN0PK5u2BAmEZttiAfgYrPzs+XcweDRlMEMaUITT
	3Nm22jegwkppn4McPg7RvKh+vlSoivk9EXr4KdGOT4FrzJQQLdIhhbwRucifdA7yyMiGXT
	tyrJUoGuW/YJ5CWP+SuPNOdrR0zWbx0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522--Ymnr_lTMZS28NviMctwdw-1; Mon, 30 Jun 2025 05:32:46 -0400
X-MC-Unique: -Ymnr_lTMZS28NviMctwdw-1
X-Mimecast-MFC-AGG-ID: -Ymnr_lTMZS28NviMctwdw_1751275966
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6facf4cf5e1so40368466d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751275966; x=1751880766;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yeq7h6rzcYIeNa1V1io9unzazS87D3gz4zthrzuogQ8=;
        b=VRdvTS/0FaGtgK8cn4nC1b1030T+fYyEZ5ajdNvsJT23Z3fwoPbLsvWdrjs/InbWzG
         Fbh7YBf9ExLN6JkQdAq7PprkAejfH3NW7JyqDFF9esZR0uxOXqmn0WexGCUK+RQgTfHR
         ZauR0TKnwWg+jtiluqMaeVY+eM6ndkLlM4JrthfzhjoF81OJKSFpx/ZtYGwGU/TMw5s8
         4FiqH6MHmQx7HKTexknZCCxLeFvhUXdcFSEydKvRq7vd0UJ3P9uYXN4TNFhq91UCqTVq
         30SLFL0Is53E7Lw3oAOM9zJ7jXo7xRtMNHYPaVv9LdDmPkfqG9tgTfjWt06aiFCCF9rJ
         PhvQ==
X-Gm-Message-State: AOJu0YzPY4ZnpWCWu3o9cYajOYoVjrAu72oD8lhORTL+Ak0Uu+aHJjo7
	i9+izUax4rnSPSl1NRuZwv5f/CH85oz6nJZQRotEpUK+1VGgsnmKC187g2mFgXOqESQU861EaBc
	fO4a//KW37x+HgKsAfR9hgd00RnGwhVX6haZQvbRXn+C33GdmYZvB5ZRSAHbv9f+kKg==
X-Gm-Gg: ASbGncv2ErvaZWojcszv4+ifYi3/Fm8CdFHeSYmsgAskOK4vtvbuDCo6OEjdS4VFow0
	XJ615pSb352LPpdY8s0K3711WflJ5xY8tpg+N8faqJe+xTeeNbahv/sIh65gzjnrAfKD+oPm/jr
	Dnj9HL3EDkbetkQit9zpZJVH0gat28HU+swJ9IlM0FXi3KOXG0e62gxDjVRPuvEtLUaZFXL3o/0
	6CNaBujhdu+lyQaGlgJ2tOTf9dx3573lw5aScJT7+CNAdaRhC8exjvSIun71rATL/Yb401u1RSj
	C0TnEjqveuJBg4GDOt2NVcAFStPxx/yY9Ll87n9W79w81l6PM0eYGkfcULC9qwGlgewE7h7ABLe
	/F8SH6BgFwJQD9pr7v1LbDX2Kp1NnZJYGbSxpi6RK5g5kEVT7IA==
X-Received: by 2002:a05:6214:5193:b0:6fb:14:5e89 with SMTP id 6a1803df08f44-700033c56f4mr272953616d6.19.1751275965775;
        Mon, 30 Jun 2025 02:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7U0L0AlrzaL/k2g1J5YS9LiArGn8OodlFTi0Cox1AiWhMBmm516CG8BMU0dxxRhXq1iKv+g==
X-Received: by 2002:a05:6214:5193:b0:6fb:14:5e89 with SMTP id 6a1803df08f44-700033c56f4mr272953076d6.19.1751275965347;
        Mon, 30 Jun 2025 02:32:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771acfe6sm64232136d6.31.2025.06.30.02.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 02:32:44 -0700 (PDT)
Message-ID: <997a3af4-0c8f-4f8d-8230-08b43d0761b6@redhat.com>
Date: Mon, 30 Jun 2025 11:32:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] mm: remove boolean output parameters from
 folio_pte_batch_ext()
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
 <20250627115510.3273675-5-david@redhat.com>
 <b6ccc61b-2948-4529-9c9d-47e9c9ed25ab@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b6ccc61b-2948-4529-9c9d-47e9c9ed25ab@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.06.25 21:04, Lorenzo Stoakes wrote:
> On Fri, Jun 27, 2025 at 01:55:10PM +0200, David Hildenbrand wrote:
>> Instead, let's just allow for specifying through flags whether we want
>> to have bits merged into the original PTE.
>>
>> For the madvise() case, simplify by having only a single parameter for
>> merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
>> dirty bit is not required, but also not harmful. This code is not that
>> performance critical after all to really force all micro-optimizations.
>>
>> As we now have two pte_t * parameters, use PageTable() to make sure we
>> are actually given a pointer at a copy of the PTE, not a pointer into
>> an actual page table.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Overall a really nice cleanup! Just some comments below.
> 
>> ---
>>   mm/internal.h | 58 +++++++++++++++++++++++++++++++--------------------
>>   mm/madvise.c  | 26 +++++------------------
>>   mm/memory.c   |  8 ++-----
>>   mm/util.c     |  2 +-
>>   4 files changed, 43 insertions(+), 51 deletions(-)
>>
>> diff --git a/mm/internal.h b/mm/internal.h
>> index 6000b683f68ee..fe69e21b34a24 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -208,6 +208,18 @@ typedef int __bitwise fpb_t;
>>   /* Compare PTEs honoring the soft-dirty bit. */
>>   #define FPB_HONOR_SOFT_DIRTY		((__force fpb_t)BIT(1))
>>
>> +/*
>> + * Merge PTE write bits: if any PTE in the batch is writable, modify the
>> + * PTE at @ptentp to be writable.
>> + */
>> +#define FPB_MERGE_WRITE			((__force fpb_t)BIT(2))
>> +
>> +/*
>> + * Merge PTE young and dirty bits: if any PTE in the batch is young or dirty,
>> + * modify the PTE at @ptentp to be young or dirty, respectively.
>> + */
>> +#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(3))
>> +
>>   static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>>   {
>>   	if (!(flags & FPB_HONOR_DIRTY))
>> @@ -220,16 +232,11 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>>   /**
>>    * folio_pte_batch_ext - detect a PTE batch for a large folio
>>    * @folio: The large folio to detect a PTE batch for.
>> + * @vma: The VMA. Only relevant with FPB_MERGE_WRITE, otherwise can be NULL.
>>    * @ptep: Page table pointer for the first entry.
>> - * @pte: Page table entry for the first page.
>> + * @ptentp: Pointer at a copy of the first page table entry.
> 
> This seems weird to me, I know it's a pointer to a copy of the PTE, essentially
> replacing the pte param from before, but now it's also an output value?
> Shouldn't this be made clear?

As you spotted, I make that clear below and for each and every flag that 
someone would set that would affect it.

> 
> I know it's a pain and churn but if this is now meant to be an output var we
> should probably make it the last param too.
> 
> At least needs an (output) or something here.

Well, it's an input+output parameter.

"Pointer at a copy of the first page table entry that might be modified 
depending on @flags." is a bit mouthful, but maybe clearer than just 
"output".

[...]

>>   	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>>   	VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
>>   	VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
>> +	VM_WARN_ON(virt_addr_valid(ptentp) && PageTable(virt_to_page(ptentp)));
> 
> Hm so if !virt_addr_valid(ptentp) we're ok? :P

I had the same question when writing that. Obviously, 
PageTable(virt_to_page(ptentp)) faulted when called on something on the 
stack. (ran into that ... :) )

Maybe "VM_WARN_ON(virt_addr_valid(ptentp));" would work as well, but I 
am not sure how that function behaves on all architectures ...

> I also think a quick comment here
> would help, the commit message explains it but glancing at this I'd be confused.
> 
> Something like:
> 
> /* Ensure this is a pointer to a copy not a pointer into a page table. */

Yes, makes sense.


-- 
Cheers,

David / dhildenb

