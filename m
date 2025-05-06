Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8822820CB
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541723; cv=none; b=J4rZN2n7us8UWiTQJJ7zcm5MELYrQniY742rK+D1WmuzASW1l7G5XRSojvgbFsuDa5zV4Ft1/oEItKEbvdsDMkxpTT9H+tp8DtkOm/bFSlnY9IdDlG4l6Sn19DPqeRPYoEHxHs7YcKoHpoSmQmr1VU1yGABWaUbWPDHeFiUh5TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541723; c=relaxed/simple;
	bh=0mndwP0G65go8lxb/0V36l2Q8yvQcz46CH9SW0JKzMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWAN6YhvJg101xTo0R1QygJ1PXv2yQeWwMFukG5Ka747JX0z0KenBAAiBhbeyVk51ZjeWrmp9MYt87xw7hOFBzMAHlZ5MF4kDqXp9rUHU3SVIiakq3soqzh+DJA9jidQHUXLBQBDqfIxtfXyAUEvZ133X8F7jYuj1+/p3Ob+EO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gNmRBP5X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gNmRBP5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746541720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TqdmjlqautOjkjBVdcvWIi/c2nG7QJsMOWiwO0Bitw0=;
	b=gNmRBP5XXw3Kbgr2PDHFpQlIKQjpEWN3ZxUnyjTl3/7AWt9aLoOYGfSzo0q+1+Lb2uWx9y
	MzcenF3vq/9EgpJAdOc7Un81Y4MKNmPi7hFzbGCKjbISH0YfdDz6lrYkjnRRlckJbmyEB+
	aifoEPOWGYP/Zg6w9IdDqsAY1mKFVFs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-TingoAp5NHuEdnpi7Dw-UA-1; Tue, 06 May 2025 10:28:38 -0400
X-MC-Unique: TingoAp5NHuEdnpi7Dw-UA-1
X-Mimecast-MFC-AGG-ID: TingoAp5NHuEdnpi7Dw-UA_1746541718
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso24636825e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541717; x=1747146517;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TqdmjlqautOjkjBVdcvWIi/c2nG7QJsMOWiwO0Bitw0=;
        b=A9NBvigLA4SJE/A2HEKUsRL6oEslq1aRbr0OXTsdsWmaMVJPeWc6Z9c+VfPnOSFq5x
         Zo57NbOkCoGVeLSYuxgeM3x7E3yBz3xS0qWapWwDM9jNvgyuzqKqGWR447mWTXeIuhrj
         hFeYj12/yu1sfChj2QRZrVJ1Pxm3OUXYyvUbWNKbjZY7o4IYMn2L6cd5iuOD2LMyj9b1
         0h2uVerwHOtZE3rZteMIzuPnQUcwEnjUolNUzSe02V8hI70rJazqF+RdBmsqDEO63zG8
         PwgadLhxUlVNSPASrN7cAtDmL5MUX2aoW3EcPO9HnlK6blfCnF3ckMvNF0km13V1Ds68
         uL/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5PoaKZma/cAE801m7axse8Bub4x6jWlhjFzTiwrPr+Bl8R5TphbkKtsT9dgQe3xbJsa47KcKvWFKilxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOk/zy4yvxr4JKZJr/QhMFQo7AOgq+kZUSf/L5kFQXuWdijvVq
	ioM4Pof9UCzORT3eVHlqwg/JYqL+Gw9A6lN0hPDRD0x20FfyrCGbXoXURNzqmBJJDLX6/HjCKpm
	ItLeyCDDJvmQOcleU91ndca8uIH2AytLcr/kEr9IrMK2b2/EKI+4uh1HMvW2dtw==
X-Gm-Gg: ASbGncv+ee3Cm/c7WMMR9Clb/UyYcUnggHeNYI4NU4xSdvpzO0fJeTFEAsI+jfuhqX4
	N4b4GbFuJHIWsU6u0o7FQSzyTM/nUGI6Lfh5rpV6N+SLu6WuYFMhG9Pi/7wvFjBvf11vRVoUKCR
	ep9v5ZWLzx8mhNz8YF1j1zrJq8ApWeQ/j6AmCb5XN0XHyn2ZfPVDnWOgt+knr8BeG2Jo3QxStmc
	9VcxuIA0oF3Gc3Ym2g5nJIl8sdJgOqp8RtvTf737kEKriKHJExxI7D3J8WYY/vNS2TKpFxiFQe3
	Q0UMKyXlRSV1TLv5WpZB0xU2T4iSBi7hL6VaKJVcmGmcp+cOf+Q=
X-Received: by 2002:a05:600c:1907:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-441d00e221emr34519715e9.9.1746541717560;
        Tue, 06 May 2025 07:28:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhBK+Al8ZViSGMNvg4AlN2nu+Cwr+mS+PiDWz3grM9m3WE79JtzALkqjsCYpJJ6Q1/wVrc0A==
X-Received: by 2002:a05:600c:1907:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-441d00e221emr34519295e9.9.1746541717026;
        Tue, 06 May 2025 07:28:37 -0700 (PDT)
Received: from ?IPV6:2a01:599:915:8911:b13f:d972:e237:7fe2? ([2a01:599:915:8911:b13f:d972:e237:7fe2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28045sm215537325e9.35.2025.05.06.07.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:28:36 -0700 (PDT)
Message-ID: <d048366b-eb6a-4fea-9b60-af834182b1b9@redhat.com>
Date: Tue, 6 May 2025 16:28:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
 <8780e63d-22c1-4133-a800-dec50fd1b5fa@lucifer.local>
 <f561dab6-c70e-485c-a3f7-2c5198fcf8c6@arm.com>
 <9a2129ce-55b6-47e7-a879-00e7982c8ec4@lucifer.local>
 <76cac3c0-2a52-4ff6-b7df-7a316983d197@arm.com>
 <3b53d194-95fc-4067-97b4-59e9c1832f68@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3b53d194-95fc-4067-97b4-59e9c1832f68@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.05.25 14:58, Lorenzo Stoakes wrote:
> On Thu, May 01, 2025 at 12:33:30PM +0100, Ryan Roberts wrote:
>> On 30/04/2025 15:34, Lorenzo Stoakes wrote:
>>> On Wed, Apr 30, 2025 at 03:09:50PM +0100, Ryan Roberts wrote:
>>>> On 29/04/2025 14:52, Lorenzo Stoakes wrote:
>>>>> On Tue, Apr 29, 2025 at 10:53:32AM +0530, Dev Jain wrote:
>>>>>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>>>>>> Architecture can override these helpers.
>>>>>>
>>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>>>> ---
>>>>>>   include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
>>>>>>   1 file changed, 38 insertions(+)
>>>>>>
>>>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>>>> index b50447ef1c92..ed287289335f 100644
>>>>>> --- a/include/linux/pgtable.h
>>>>>> +++ b/include/linux/pgtable.h
>>>>>> @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>>>>>   }
>>>>>>   #endif
>>>>>>
>>>>>> +/* See the comment for ptep_modify_prot_start */
>>>>>
>>>>> I feel like you really should add a little more here, perhaps point out
>>>>> that it's batched etc.
>>>>>
>>>>>> +#ifndef modify_prot_start_ptes
>>>>>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>>>>>> +		unsigned long addr, pte_t *ptep, unsigned int nr)
>>>>>
>>>>> This name is a bit confusing,
>>>>
>>>> On naming, the existing (modern) convention for single-pte helpers is to start
>>>> the function name with ptep_. When we started adding batched versions, we took
>>>> the approach of adding _ptes as a suffix. For example:
>>>>
>>>> set_pte_at()
>>>> ptep_get_and_clear_full()
>>>> ptep_set_wrprotect()
>>>>
>>>> set_ptes()
>>>> get_and_clear_full_ptes()
>>>> wrprotect_ptes()
>>>>
>>>> In this case, we already have ptep_modify_prot_start() and
>>>> ptep_modify_prot_commit() for the existing single-pte helper versions. So
>>>> according to the convention (or at least how I interpret the convention), the
>>>> proposed names seem reasonable.
>>>>
>>>
>>> Right, I'm fine with following convention (we should), I just find 'ptes'
>>> really ambiguous. It's not just a -set of PTE entries- it's very explicitly
>>> for a large folio. I'd interpret some 'ptes' case to mean 'any number of
>>> pte entries', though I suppose it'd not in practice be any different if
>>> that were the intended use.
>>>
>>> However, the proposed use case is large folio 'sub' PTEs and it'd be useful
>>> in callers to know this is explicitly what you're doing.
>>>
>>> I feel like '_batched_ptes' makes it clear it's a _specific_ set of PTE
>>> entriess you're after (not just in effect multiple PTE entries).
>>
>> I don't mind _batched_ptes. _pte_batch would be shorter though - what do you think?
> 
> Sounds good!
> 
>>
>> But if we go with one of these, then we should consistently apply it to all the
>> existing helpers IMHO - perhaps with a preparatory patch at the start of the series.
>>
>>>
>>> However, I'm less insistent on this with a comment that explains what's
>>> going on.
>>
>> That would still get my vote :)
> 
> Awesome :)
> 
>>
>>>
>>> I don't want to hold this up with trivialities around naming...
>>
>> There are TWO hard things in computer science; cache invalidation, naming, and
>> off-by-one errors :)
> 
> Haha yes... I continue to be surprised at how bloody hard it is as my
> career goes on...
> 
>>
>>>
>>> ASIDE: I continue to absolutely HATE the ambiguity between 'PxD/PTE' and
>>> 'PxD/PTE entries' and the fact we use both as a short-hand for each
>>> other. But that's not related to this series, just a pet peeve... :)
>>
>> I assume you are referring to the ambiguity between the *table* and the *entry*
>> (which just goes to show how ambiguous it is I guess)... I also hate this and
>> still trip over it all the time...
> 
> Yes. As do I, as does everybody I think... Sadly I think unavoidable :(
> 
>>
>>>
>>>>> it's not any ptes, it's those pte entries
>>>>> belonging to a large folio capped to the PTE table right that you are
>>>>> batching right?
>>>>
>>>> Yes, but again by convention, that is captured in the kerneldoc comment for the
>>>> functions. We are operating on a batch of *ptes* not on a folio or batch of
>>>> folios. But it is a requirement of the function that the batch of ptes all lie
>>>> within a single large folio (i.e. the pfns are sequential).
>>>
>>> Ack, yeah don't love this nr stuff but fine if it's convention...
>>>
>>>>   > Perhaps modify_prot_start_large_folio() ? Or something with 'batched' in
>>>>> the name?
>>>>>
>>>>> We definitely need to mention in comment or name or _somewhere_ the intent
>>>>> and motivation for this.
>>>>
>>>> Agreed!
>>>
>>> ...and luckily we are aligned on this :)
>>>
>>>>
>>>>>
>>>>>> +{
>>>>>> +	pte_t pte, tmp_pte;
>>>>>> +
>>>>>
>>>>> are we not validating what 'nr' is? Even with debug asserts? I'm not sure I
>>>>> love this interface, where you require the user to know the number of
>>>>> remaining PTE entries in a PTE table.
>>>>
>>>> For better or worse, that's the established convention. See part of comment for
>>>> set_ptes() for example:
>>>>
>>>> """
>>>>   * Context: The caller holds the page table lock.  The pages all belong
>>>>   * to the same folio.  The PTEs are all in the same PMD.
>>>> """
>>>>
>>>>>
>>>>>> +	pte = ptep_modify_prot_start(vma, addr, ptep);
>>>>>> +	while (--nr) {
>>>>>
>>>>> This loop is a bit horrible. It seems needlessly confusing and you're in
>>>>> _dire_ need of comments to explain what's going on.
>>>>>
>>>>> So my understanding is, you have the user figure out:
>>>>>
>>>>> nr = min(nr_pte_entries_in_pte, nr_pgs_in_folio)
>>>>>
>>>>> Then, you want to return the pte entry belonging to the start of the large
>>>>> folio batch, but you want to adjust that pte value to propagate dirty and
>>>>> young page table flags if any page table entries within the range contain
>>>>> those page table flags, having called ptep_modify_prot_start() on all of
>>>>> them?
>>>>>
>>>>> This is quite a bit to a. put in a header like this and b. not
>>>>> comment/explain.
>>>>
>>>> This style is copied from get_and_clear_full_ptes(), which has this comment,
>>>> which explains all this complexity. My vote would be to have a simple comment
>>
>> Oops; I meant "similar" when my fingers somehow typed "simple"... This is not
>> simple :)
> 
> Ha, yeah indeed :P that makes more sense!
> 
>>
>>>> for this function:
>>>>
>>>> /**
>>>>   * get_and_clear_full_ptes - Clear present PTEs that map consecutive pages of
>>>>   *			     the same folio, collecting dirty/accessed bits.
>>>>   * @mm: Address space the pages are mapped into.
>>>>   * @addr: Address the first page is mapped at.
>>>>   * @ptep: Page table pointer for the first entry.
>>>>   * @nr: Number of entries to clear.
>>>>   * @full: Whether we are clearing a full mm.
>>>>   *
>>>>   * May be overridden by the architecture; otherwise, implemented as a simple
>>>>   * loop over ptep_get_and_clear_full(), merging dirty/accessed bits into the
>>>>   * returned PTE.
>>>>   *
>>>>   * Note that PTE bits in the PTE range besides the PFN can differ. For example,
>>>>   * some PTEs might be write-protected.
>>>>   *
>>>>   * Context: The caller holds the page table lock.  The PTEs map consecutive
>>>>   * pages that belong to the same folio.  The PTEs are all in the same PMD.
>>>>   */
>>>>
>>>
>>> OK I think the key bit here is 'consecutive pages of the same folio'.
>>>
>>> I'd like at least a paragraph about implementation, yes the original
>>> function doesn't have that (and should imo), something like:
>>>
>>> 	We perform the operation on the first PTE, then if any others
>>> 	follow, we invoke the ptep_modify_prot_start() for each and
>>> 	aggregate A/D bits.
>>>
>>> Something like this.
>>>
>>> Point taken on consistency though!
>>>
>>>>>
>>>>> So maybe something like:
>>>>>
>>>>> pte = ptep_modify_prot_start(vma, addr, ptep);
>>>>>
>>>>> /* Iterate through large folio tail PTEs. */
>>>>> for (pg = 1; pg < nr; pg++) {
>>>>> 	pte_t inner_pte;
>>>>>
>>>>> 	ptep++;
>>>>> 	addr += PAGE_SIZE;
>>>>>
>>>>> 	inner_pte = ptep_modify_prot_start(vma, addr, ptep);
>>>>>
>>>>> 	/* We must propagate A/D state from tail PTEs. */
>>>>> 	if (pte_dirty(inner_pte))
>>>>> 		pte = pte_mkdirty(pte);
>>>>> 	if (pte_young(inner_pte))
>>>>> 		pte = pte_mkyoung(pte);
>>>>> }
>>>>>
>>>>> Would work better?
>>>>>
>>>>>
>>>>>
>>>>>> +		ptep++;
>>>>>> +		addr += PAGE_SIZE;
>>>>>> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>>>>>
>>>>>
>>>>>
>>>>>> +		if (pte_dirty(tmp_pte))
>>>>>> +			pte = pte_mkdirty(pte);
>>>>>> +		if (pte_young(tmp_pte))
>>>>>> +			pte = pte_mkyoung(pte);
>>>>>
>>>>> Why are you propagating these?
>>>>>
>>>>>> +	}
>>>>>> +	return pte;
>>>>>> +}
>>>>>> +#endif
>>>>>> +
>>>>>> +/* See the comment for ptep_modify_prot_commit */
>>>>>
>>>>> Same comments as above, needs more meat on the bones!
>>>>>
>>>>>> +#ifndef modify_prot_commit_ptes
>>>>>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
>>>>>
>>>>> Again need to reference large folio, batched or something relevant here,
>>>>> 'ptes' is super vague.
>>>>>
>>>>>> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
>>>>>
>>>>> Nit, but you put 'p' suffix on ptep but not on 'old_pte'?
>>>>>
>>>>> I'm even more concerned about the 'nr' API here now.
>>>>>
>>>>> So this is now a user-calculated:
>>>>>
>>>>> min3(large_folio_pages, number of pte entries left in ptep,
>>>>> 	number of pte entries left in old_pte)
>>>>>
>>>>> It really feels like something that should be calculated here, or at least
>>>>> be broken out more clearly.
>>>>>
>>>>> You definitely _at the very least_ need to document it in a comment.
>>>>>
>>>>>> +{
>>>>>> +	for (;;) {
>>>>>> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>>>>>> +		if (--nr == 0)
>>>>>> +			break;
>>>>>
>>>>> Why are you doing an infinite loop here with a break like this? Again feels
>>>>> needlessly confusing.
>>>>
>>>> I agree it's not pretty to look at. But apparently it's the most efficient. This
>>>> is Willy's commit that started it all: Commit bcc6cc832573 ("mm: add default
>>>> definition of set_ptes()").
>>>>
>>>> For the record, I think all your comments make good sense, Lorenzo. But there is
>>>> an established style, and personally I think at this point is it more confusing
>>>> to break from that style.
>>>
>>> This isn't _quite_ style, I'd say it's implementation, we're kind of
>>> crossing over into something a little more I'd say :) but I mean I get your
>>> point, sure.
>>>
>>> I mean, fine, if (I presume you're referring _only_ to the for (;;) case
>>> above) you are absolutely certain it is more performant in practice I
>>> wouldn't want to stand in the way of that.
>>
>> No I'm not certain at all... I'm just saying that's been the argument in the
>> past. I vaguely recall I even tried changing the loop style in batched helpers I
>> implemented in the past and David asked me to stick with the established style.
> 
> I definitely defer to David's expertise, but I feel there's some room here
> for improving things.

Yeah, I recall Willy introducing that scheme, arguing that it is the 
most efficient once. Can't argue with that :)


-- 
Cheers,

David / dhildenb

