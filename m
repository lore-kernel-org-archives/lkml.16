Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B378191F6C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336659; cv=none; b=CLuGsut6UiAuzxIYMJWccbFczJ0B1vR5gs5JDy/TEG0r6gk7M3kmfCBjd8EHUTt7JC7irTYiGwwYYo8shsPgQ8kBMxGB7J2pH8aBhHXOzGt4lijp0kuGj22WnnvUmPAxF5gjK/JlENX+PJEkU4GM0WkSVBBefMmQXBQBJwknw4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336659; c=relaxed/simple;
	bh=L4ErrlartbpiaXjuuc4IMxcUD86ChXOTzftrgtTG3Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKaDV/Iuy926TmGh/Ht6QXpEiomk7I1KvoUpbHk8CxMXFlGgyKh8qmMRDf4i5z1uwpKjMrLR+vVtSEfrni7kk8wPgFhPbaGC/jj8Gd3f8UsSynfQVFUhA0GawnKwsjydfcC78Ar7z0WLun2/O4WWpjVe4yXSne6aQfN/iFUioEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZznomIsl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZznomIsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747336654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sJNMtDx5hX6lhKqp4kq8GqC8YkQ6trkiCXO1tYpsLKU=;
	b=ZznomIslLMzifwVFznBBWLSkh3sm7DazxLLcNVOTEm7JituHs2VE0rexGE8w4NXbjZgGua
	oorbgnWlKCd7x2d7Xz/sKHclDqvwNcDfO4VGHO4IwiBSG9SzlX1kjrmlZtrRJeNgqZylpj
	+i7Rjw0iGHWUx1HZ3gtAkntKmrtMtvg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-jIweWxi9MDi_OJlUNsG9gQ-1; Thu, 15 May 2025 15:17:32 -0400
X-MC-Unique: jIweWxi9MDi_OJlUNsG9gQ-1
X-Mimecast-MFC-AGG-ID: jIweWxi9MDi_OJlUNsG9gQ_1747336651
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a35989e5b2so592147f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747336651; x=1747941451;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sJNMtDx5hX6lhKqp4kq8GqC8YkQ6trkiCXO1tYpsLKU=;
        b=DjRV9TJum8bjMVYLPNOeP19eRM/aLmAL7VQovprkl75fALalyMrCIKctJOhMgUDiPH
         aCIspdM1NyPUOKssPc93q2ZASxO04AiLKRxY1+gT2YqA6pYPCvXBWFr9/k5ftgQCL6Vr
         0qBq2KcfODPgn3CAuQweWOuYVqhJxF5qNPDln/heDWEkSsRsPxKeXgao3rf+YTKpn9hm
         Zwo66cWS1pWp060FvaTRlOsf/MFFwJwpL7Fvbvq5MFk+d+RPaTDTso/qSFUkEf2x7N/9
         EOO6AI/yhqNjbVu+sYMwuTbqGMJX+GbahVselxCDDXitXTVVVFuGrg8dKlb+Rx/FpW/E
         H+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVaH+06JnJh+oUgzcyepFLqqzFbWzbbYdWNV3+b8EkdDYIWiXZj9NLpjTakoCpsfQZNwBOVvacXG72/5fI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8AVWAMKzQJAQ3ctLxbfLgo2X6uniCqvxWy675eEnWhwXtub7a
	2FkeUuZbJjTg5EOgeoMIeS9neJaRE7VvSLDus7N9ZZZUJMTLsyy1BjamTLuLtl/3F5GcOy25tLJ
	80/+iyE/U/xs31dCXMyLd1wyl7LEKZZVM//oMadypPPiSHu+0u49v4FqiWAPNqxjDww==
X-Gm-Gg: ASbGncs/jYdyGmJVI5TM9qHSxMJto10ic5dJqx9E/ZoLGYDdaRNCG1LlXWv5GDt5EFc
	4oURL+wqfeJED6i4shXHpqIhh77+hrBSpOtyySGwqrEwrSDGM3VFPu4otVrmdevWZfEdx0m3z3L
	Zz8tYjTedXGD4Om5hDk+MMO0QPVooTkgejZNHHUtBD9d9MnkexwfjJH6y0T053Sq1Cl503ZIRWU
	L3UUKgJAulEy/xic3L9R9SjKlTDUL7UvYZYmLu+jvuRoTjjnGaTECWbeEHSig5jvfQ6RETHfN7u
	DalXk0FlP+eKqEJzElis1okVZen4RMPQXd4DtwPF0EAKgr/AZGtXoioihuDkZkFQbLeu2PUxDVe
	ZgmaR3M+7cBeh4SFDCpgfB3SWGicaMmFriNf12Mw=
X-Received: by 2002:a5d:5f8d:0:b0:3a1:f5c6:2bd with SMTP id ffacd0b85a97d-3a35c835163mr1013214f8f.31.1747336651056;
        Thu, 15 May 2025 12:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECT8dyUlXgGTgoGjmJtA6ShxjYaPIjG4aJRMZeEL1TlBKtaWpU5rNup1niQGn7Xjq8wdQwXw==
X-Received: by 2002:a5d:5f8d:0:b0:3a1:f5c6:2bd with SMTP id ffacd0b85a97d-3a35c835163mr1013167f8f.31.1747336650376;
        Thu, 15 May 2025 12:17:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef8f7sm76660795e9.39.2025.05.15.12.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 12:17:29 -0700 (PDT)
Message-ID: <869607c4-5deb-451e-bd83-fe5890bd54cf@redhat.com>
Date: Thu, 15 May 2025 21:17:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <732ff995-0e18-4e8c-a0a5-14da400d4078@gmail.com>
 <6c66e167-1be5-4298-8131-5434d9ff67df@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6c66e167-1be5-4298-8131-5434d9ff67df@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.05.25 20:36, Lorenzo Stoakes wrote:
> One thing I wanted to emphasise - shouldn't we invoke
> khugepaged_enter_vma() for VMAs we set VM_HUGEPAGE for?
> 
> I note in __mmap_new_vma() we do so for non-anon VMAs _prior_ to invoking
> vma_set_thp_policy().
> 
> I _really_ hate putting in conditional logic like this for specific
> cases. Feels very hacky.
> 
> On Thu, May 15, 2025 at 05:47:34PM +0100, Usama Arif wrote:
>>
>>
>> On 15/05/2025 17:06, Lorenzo Stoakes wrote:
>>
>>>> Its doing the same as KSM as suggested by David. Does KSM break these tests?
>>>> Is there some specific test you can point to that I can run that is breaking
>>>> with this patch and not without it?
>>>
>>> They don't build, at all. I explain how you can attempt a build below.
>>>
>>
>> Ah yes, I initially thought by break you meant they were failing. I saw that,
>> will fix it.
>>
>>> And no, KSM doesn't break the tests, because steps were taken to make them
>>> not break the tests :) I mean it's really easy - it's just adding some
>>> trivial stubs.
>>>
>>
>> Yes, will do Thanks!
> 
> Thanks.
> 
>>
>>> If you need help with it just ping me in whatever way helps and I can help!
>>>
>>> It's understandable as it's not necessarily clear this is a thing (maybe we
>>> need self tests to build it, but that might break CI setups so unclear).
>>>
>>> The merging is much more important!
> 
> To re-emphasise ^ the merging is key - I will unfortunately have to NACK
> any series that breaks it. So this is an absolute requirement here.
> 
>>>
>>>>
>>>>
>>>>> I really feel this series needs to be an RFC until we can get some
>>>>> consensus on how to approach this.
>>>>
>>>> There was consensus in https://lore.kernel.org/all/97702ff0-fc50-4779-bfa8-83dc42352db1@redhat.com/
>>>
>>> I disagree with this asssessment, that doesn't look like consensus at all,
>>> I think at least this is a very contentious or at least _complicated_ topic
>>> that we need to really dig into.
>>>
>>> So in my view - it's this kind of situation that warrants an RFC until
>>> there's some stabilisation and agreement on a way forward.
>>>
>>
>> Sure will change next revision to RFC, unless hopefully maybe we can
>> get a consensus in this revision :)
> 
> Thanks!
> 
>>
>>>>
>>>>>
>>>>> On Thu, May 15, 2025 at 02:33:30PM +0100, Usama Arif wrote:
>>>>>> This is set via the new PR_SET_THP_POLICY prctl.
>>>>>
>>>>> What is?
>>>>>
>>>>> You're making very major changes here, including adding a new flag to
>>>>> mm_struct (!!) and the explanation/justification for this is missing.
>>>>>
>>>>
>>>> I have added the justification in your reply to the coverletter.
>>>
>>> As stated there, you've not explained why alternatives are unworkable, I
>>> think we need this!
>>>
>>> Sort of:
>>>
>>> 1. Why not cgroups? blah blah blah
>>> 2. Why not process_madvise()? blah blah blah
>>> 3. Why not bpf? blah blah blah
>>> 4. Why not <something I've not thought of>? blah blah blah
>>>
>>
>> I will add this in the next cover letter.
> 
> Thanks
> 
>>
>>
>>>>
>>>>>> This will set the MMF2_THP_VMA_DEFAULT_HUGE process flag
>>>>>> which changes the default of new VMAs to be VM_HUGEPAGE. The
>>>>>> call also modifies all existing VMAs that are not VM_NOHUGEPAGE
>>>>>> to be VM_HUGEPAGE. The policy is inherited during fork+exec.
>>>>>
>>>>> So you can only set this flag?
>>>>>
>>>>
>>>> ??
>>>
>>> This patch is only allowing the setting of this flag. I am asking 'so you
>>> can only set this flag?'
>>>
>>> To which it appears the answer is, yes I think :)
>>>
>>> An improved cover letter could say something like:
>>>
>>> "
>>> Here we implement the first flag intended to allow the _overriding_ of huge
>>> page policy to ensure that, when
>>> /sys/kernel/mm/transparent_hugepage/enabled is set to madvise, we are able
>>> to maintain fine-grained control of individual processes, including any
>>> fork/exec'd, by setting this flag.
>>>
>>> In subsequent commits, we intend to permit further such control.
>>> "
>>>
>>>>
>>>>>>
>>>>>> This allows systems where the global policy is set to "madvise"
>>>>>> to effectively have THPs always for the process. In an environment
>>>>>> where different types of workloads are stacked on the same machine,
>>>>>> this will allow workloads that benefit from always having hugepages
>>>>>> to do so, without regressing those that don't.
>>>>>
>>>>> Again, this explanation really makes no sense at all to me, I don't really
>>>>> know what you mean, you're not going into what you're doing in this change,
>>>>> this is just a very unclear commit message.
>>>>>
>>>>
>>>> I hope this is answered in my reply to your coverletter.
>>>
>>> You still need to improve the cover letter here I think, see above for a
>>> suggestion!
>>>
>>
>> Sure, will do in the next revision, Thanks!
> 
> Thanks
> 
>>>>
>>>>>>
>>>>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>>>>> ---
>>>>>>   include/linux/huge_mm.h                       |  3 ++
>>>>>>   include/linux/mm_types.h                      | 11 +++++++
>>>>>>   include/uapi/linux/prctl.h                    |  4 +++
>>>>>>   kernel/fork.c                                 |  1 +
>>>>>>   kernel/sys.c                                  | 21 ++++++++++++
>>>>>>   mm/huge_memory.c                              | 32 +++++++++++++++++++
>>>>>>   mm/vma.c                                      |  2 ++
>>>>>>   tools/include/uapi/linux/prctl.h              |  4 +++
>>>>>>   .../trace/beauty/include/uapi/linux/prctl.h   |  4 +++
>>>>>>   9 files changed, 82 insertions(+)
>>>>>>
>>>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>>>> index 2f190c90192d..e652ad9ddbbd 100644
>>>>>> --- a/include/linux/huge_mm.h
>>>>>> +++ b/include/linux/huge_mm.h
>>>>>> @@ -260,6 +260,9 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
>>>>>>   	return orders;
>>>>>>   }
>>>>>>
>>>>>> +void vma_set_thp_policy(struct vm_area_struct *vma);
>>>>>
>>>>> This is a VMA-specific function but you're putting it in huge_mm.h? Why
>>>>> can't
>>>> this be in vma.h or vma.c?
>>>>>
>>>>
>>>> Sure can move it there.
>>>>
>>>>>> +void process_vmas_thp_default_huge(struct mm_struct *mm);
>>>>>
>>>>> 'vmas' is redundant here.
>>>>>
>>>>
>>>> Sure.
>>>>>> +
>>>>>>   unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>>>>>   					 unsigned long vm_flags,
>>>>>>   					 unsigned long tva_flags,
>>>>>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>>>>>> index e76bade9ebb1..2fe93965e761 100644
>>>>>> --- a/include/linux/mm_types.h
>>>>>> +++ b/include/linux/mm_types.h
>>>>>> @@ -1066,6 +1066,7 @@ struct mm_struct {
>>>>>>   		mm_context_t context;
>>>>>>
>>>>>>   		unsigned long flags; /* Must use atomic bitops to access */
>>>>>> +		unsigned long flags2;
>>>>>
>>>>>
>>>>> Ugh, god really??
>>>>>
>>>>> I really am not a fan of adding flags2 just to add a prctl() feature like
>>>>> this. This is crazy.
>>>>>
>>>>> Also this is a TERRIBLE name. I mean, no please PLEASE no.
>>>>>
>>>>> Do we really have absolutely no choice but to add a new flags field here?
>>>>>
>>>>> It again doesn't help that you don't mention nor even try to justify this
>>>>> in the commit message or cover letter.
>>>>>
>>>>
>>>> And again, I hope my reply to your email has given you the justification.
>>>
>>> No :) I understood why you did this though of course.
>>>
>>>>
>>>>> If this is a 32-bit kernel vs. 64-bit kernel thing so we 'ran out of bits',
>>>>> let's just go make this flags field 64-bit on 32-bit kernels.
>>>>>
>>>>> I mean - I'm kind of insisting we do that to be honest. Because I really
>>>>> don't like this.
>>>>
>>>>
>>>> If the maintainers want this, I will make it a 64 bit only feature. We
>>>> are only using it for 64 bit servers. But it will probably mean ifdef
>>>> config 64 bit in a lot of places.
>>>
>>> I'm going to presume you are including me in this category rather than
>>> implying that you are deferring only to others :)
>>>
>>
>> Yes ofcourse! I mean all maintainers :)
>>
>> And hopefully everyone else as well :)
>>
>>> So, there's another option:
>>>
>>> Have a prerequisite series that makes mm_struct->flags 64-bit on 32-bit
>>> kernels, which solves this problem everywhere and avoids us wasting a bunch
>>> of memory for a very specific usecase, splitting flag state across 2 fields
>>> (which are no longer atomic as a whole of course), adding confusion,
>>> possibly subtly breaking anywhere that assumes mm->flags completely
>>> describes mm-granularity flag state etc.
>>>
>>
>> This is probably a very basic question, but by make mm_struct->flags 64-bit on 32-bit
>> do you mean convert flags to unsigned long long when !CONIFG_64BIT?
> 
> Yes. This would be a worthwhile project in its own right.
> 
> I will be changing vma->vm_flags in the same way soon.
> 
>>
>>> The RoI here is not looking good, otherwise.
>>>
>>>>
>>>>>
>>>>> Also if we _HAVE_ to have this, shouldn't we duplicate that comment about
>>>>> atomic bitops?...
>>>>>
>>>>
>>>> Sure
>>>>
>>>>>>
>>>>>>   #ifdef CONFIG_AIO
>>>>>>   		spinlock_t			ioctx_lock;
>>>>>> @@ -1744,6 +1745,11 @@ enum {
>>>>>>   				 MMF_DISABLE_THP_MASK | MMF_HAS_MDWE_MASK |\
>>>>>>   				 MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK)
>>>>>>
>>>>>> +#define MMF2_THP_VMA_DEFAULT_HUGE		0
>>>>>
>>>>> I thought the whole idea was to move away from explicitly refrencing 'THP'
>>>>> in a future where large folios are implicit and now we're saying 'THP'.
>>>>>
>>>>> Anyway the 'VMA' is totally redundant here.
>>>>>
>>>>
>>>> Sure, I can remove VMA.
>>>> I see THP everywhere in the kernel code.
>>>> Its mentioned 108 times in transhuge.rst alone :)
>>>> If you have any suggestion to rename this flag, happy to take it :)
>>>
>>> Yeah I mean it's a mess man, and it's not your fault... Again naming is
>>> hard, I put a suggestion in reply to cover letter anyway...
>>>
>>>>
>>>>>> +#define MMF2_THP_VMA_DEFAULT_HUGE_MASK		(1 << MMF2_THP_VMA_DEFAULT_HUGE)
>>>>>
>>>>> Do we really need explicit trivial mask declarations like this?
>>>>>
>>>>
>>>> I have followed the convention that has existed in this file, please see below
>>>> links :)
>>>> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1645
>>>> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1623
>>>> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1603
>>>> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1582
>>>
>>> Ack, yuck but ack.
>>>
>>>>
>>>>
>>>>>> +
>>>>>> +#define MMF2_INIT_MASK		(MMF2_THP_VMA_DEFAULT_HUGE_MASK)
>>>>>
>>>>>> +
>>>>>>   static inline unsigned long mmf_init_flags(unsigned long flags)
>>>>>>   {
>>>>>>   	if (flags & (1UL << MMF_HAS_MDWE_NO_INHERIT))
>>>>>> @@ -1752,4 +1758,9 @@ static inline unsigned long mmf_init_flags(unsigned long flags)
>>>>>>   	return flags & MMF_INIT_MASK;
>>>>>>   }
>>>>>>
>>>>>> +static inline unsigned long mmf2_init_flags(unsigned long flags)
>>>>>> +{
>>>>>> +	return flags & MMF2_INIT_MASK;
>>>>>> +}
>>>>>> +
>>>>>>   #endif /* _LINUX_MM_TYPES_H */
>>>>>> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
>>>>>> index 15c18ef4eb11..325c72f40a93 100644
>>>>>> --- a/include/uapi/linux/prctl.h
>>>>>> +++ b/include/uapi/linux/prctl.h
>>>>>> @@ -364,4 +364,8 @@ struct prctl_mm_map {
>>>>>>   # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>>>>>>   # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
>>>>>>
>>>>>> +#define PR_SET_THP_POLICY		78
>>>>>> +#define PR_GET_THP_POLICY		79
>>>>>> +#define PR_THP_POLICY_DEFAULT_HUGE	0
>>>>>> +
>>>>>>   #endif /* _LINUX_PRCTL_H */
>>>>>> diff --git a/kernel/fork.c b/kernel/fork.c
>>>>>> index 9e4616dacd82..6e5f4a8869dc 100644
>>>>>> --- a/kernel/fork.c
>>>>>> +++ b/kernel/fork.c
>>>>>> @@ -1054,6 +1054,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>>>>>>
>>>>>>   	if (current->mm) {
>>>>>>   		mm->flags = mmf_init_flags(current->mm->flags);
>>>>>> +		mm->flags2 = mmf2_init_flags(current->mm->flags2);
>>>>>>   		mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
>>>>>>   	} else {
>>>>>>   		mm->flags = default_dump_filter;
>>>>>> diff --git a/kernel/sys.c b/kernel/sys.c
>>>>>> index c434968e9f5d..1115f258f253 100644
>>>>>> --- a/kernel/sys.c
>>>>>> +++ b/kernel/sys.c
>>>>>> @@ -2658,6 +2658,27 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>>>>>>   			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
>>>>>>   		mmap_write_unlock(me->mm);
>>>>>>   		break;
>>>>>> +	case PR_GET_THP_POLICY:
>>>>>> +		if (arg2 || arg3 || arg4 || arg5)
>>>>>> +			return -EINVAL;
>>>>>> +		if (!!test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2))
>>>>>
>>>>> I really don't think we need the !!? Do we?
>>>>
>>>> I have followed the convention that has existed in this file already,
>>>> please see:
>>>> https://elixir.bootlin.com/linux/v6.14.6/source/kernel/sys.c#L2644
>>>
>>> OK, but please don't, I don't see why this is necessary. if (truthy) is
>>> fine.
>>>
>>> Unless somebody has a really good reason why this is necessary, it's just
>>> ugly ceremony.
>>>
>>
>> Agreed :)
> 
> Thanks
> 
>>
>>>>
>>>>>
>>>>> Shouldn't we lock the mm when we do this no? Can't somebody change this?
>>>>>
>>>>
>>>> It wasn't locked in PR_GET_THP_DISABLE
>>>> https://elixir.bootlin.com/linux/v6.14.6/source/kernel/sys.c#L2644
>>>>
>>>> I can acquire do mmap_write_lock_killable the same as PR_SET_THP_POLICY
>>>> in the next series.
>>>>
>>>> I can also add the lock in PR_GET_THP_DISABLE.
>>>
>>> Well, the issue I guess is... if the flags field is atomic, and we know
>>> over this call maybe we can rely on mm sticking around, then we probalby
>>> don't need an mmap lock actually.
>>>
>>>>
>>>>>> +			error = PR_THP_POLICY_DEFAULT_HUGE;
>>>
>>> Wait, error = PR_THP_POLICY_DEFAULT_HUGE? Is this the convention for
>>> returning here? :)
>>
>> I see a few of the PR_GET_.. setting the return value. I hope I didnt
>> misinterpret that.
> 
> Yeah I thought it might be the case. I reemphasise my dislike of prctl().
> 
>>
>>>
>>>>>> +		break;
>>>>>> +	case PR_SET_THP_POLICY:
>>>>>> +		if (arg3 || arg4 || arg5)
>>>>>> +			return -EINVAL;
>>>>>> +		if (mmap_write_lock_killable(me->mm))
>>>>>> +			return -EINTR;
>>>>>> +		switch (arg2) {
>>>>>> +		case PR_THP_POLICY_DEFAULT_HUGE:
>>>>>> +			set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
>>>>>> +			process_vmas_thp_default_huge(me->mm);
>>>>>> +			break;
>>>>>> +		default:
>>>>>> +			return -EINVAL;
>>>
>>> Oh I just noticed - this is really broken - you're not unlocking the mmap()
>>> here on error... :) you definitely need to fix this.
>>>
>>
>> Ah yes, will do Thanks!
> 
> Thanks
> 
>>
>>>>>> +		}
>>>>>> +		mmap_write_unlock(me->mm);
>>>>>> +		break;
>>>>>>   	case PR_MPX_ENABLE_MANAGEMENT:
>>>>>>   	case PR_MPX_DISABLE_MANAGEMENT:
>>>>>>   		/* No longer implemented: */
>>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>>>> index 2780a12b25f0..64f66d5295e8 100644
>>>>>> --- a/mm/huge_memory.c
>>>>>> +++ b/mm/huge_memory.c
>>>>>> @@ -98,6 +98,38 @@ static inline bool file_thp_enabled(struct vm_area_struct *vma)
>>>>>>   	return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
>>>>>>   }
>>>>>>
>>>>>> +void vma_set_thp_policy(struct vm_area_struct *vma)
>>>>>> +{
>>>>>> +	struct mm_struct *mm = vma->vm_mm;
>>>>>> +
>>>>>> +	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
>>>>>> +		vm_flags_set(vma, VM_HUGEPAGE);
>>>>>> +}
>>>>>> +
>>>>>> +static void vmas_thp_default_huge(struct mm_struct *mm)
>>>>>> +{
>>>>>> +	struct vm_area_struct *vma;
>>>>>> +	unsigned long vm_flags;
>>>>>> +
>>>>>> +	VMA_ITERATOR(vmi, mm, 0);
>>>>>
>>>>> This is a declaration, it should be grouped with declarations...
>>>>>
>>>>
>>>> Sure, will make the change in next version.
>>>>
>>>> Unfortunately checkpatch didn't complain.
>>>
>>> Checkpatch actually complains the other way :P it doesn't understand
>>> macros.
>>>
>>> So you'll start getting a warning here, which you can ignore. It sucks, but
>>> there we go. Making checkpatch.pl understand that would be a pain, probs.
>>>
>>>>
>>>>>> +	for_each_vma(vmi, vma) {
>>>>>> +		vm_flags = vma->vm_flags;
>>>>>> +		if (vm_flags & VM_NOHUGEPAGE)
>>>>>> +			continue;
>>>>>
>>>>> Literally no point in you putting vm_flags as a separate variable here.
>>>>>
>>>>
>>>> Sure, will make the change in next version.
>>>
>>> Thanks!
>>>
>>>>
>>>>> So if you're not overriding VM_NOHUGEPAGE, the whole point of this exercise
>>>>> is to override global 'never'?
>>>>>
>>>>
>>>> Again, I am not overriding never.
>>>>
>>>> hugepage_global_always and hugepage_global_enabled will evaluate to false
>>>> and you will not get a hugepage.
>>>
>>> Yeah, again ack, but I kind of hate that we set VM_HUGEPAGE everywhere even
>>> if the policy is never.
>>>
>>> And we now get into realms of:
>>>
>>> 'Hey I set prctl() to make everything huge pages, and PR_GET_THP_POLICY
>>> says I've set that, but nothing is huge? BUG???'
>>>
>>> Of course then you get into - if somebody sets it to never, do we go around
>>> and remove VM_HUGEPAGE and this MMF_ flag?
>>>
>>>>
>>>>
>>>>> I'm really concerned about this.
>>>>>
>>>>>> +		vm_flags_set(vma, VM_HUGEPAGE);
>>>>>> +	}
>>>>>> +}
>>>>>
>>>>> Do we have an mmap write lock established here? Can you confirm that? Also
>>>>> you should add an assert for that here.
>>>>>
>>>>
>>>> Yes I do, its only called in PR_SET_THP_POLICY where mmap_write lock was taken.
>>>> I can add an assert if it helps.
>>>
>>> It not only helps, it's utterly critical :)
>>>
>>> 'It's only called in xxx()' is famous last words for a programmer, because
>>> later somebody (maybe even your good self) calls it from somewhere else
>>> and... we've all been there...
>>>
>>
>> Thanks! Will do.
> 
> Thanks.
> 
>>>>
>>>>>> +
>>>>>> +void process_vmas_thp_default_huge(struct mm_struct *mm)
>>>>>> +{
>>>>>> +	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
>>>>>> +		return;
>>>>>> +
>>>>>> +	set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2);
>>>>>> +	vmas_thp_default_huge(mm);
>>>>>> +}
>>>>>> +
>>>>>> +
>>>>>>   unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>>>>>   					 unsigned long vm_flags,
>>>>>>   					 unsigned long tva_flags,
>>>>>> diff --git a/mm/vma.c b/mm/vma.c
>>>>>> index 1f2634b29568..101b19c96803 100644
>>>>>> --- a/mm/vma.c
>>>>>> +++ b/mm/vma.c
>>>>>> @@ -2476,6 +2476,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
>>>>>>   	if (!vma_is_anonymous(vma))
>>>>>>   		khugepaged_enter_vma(vma, map->flags);
>>>>>>   	ksm_add_vma(vma);
>>>>>> +	vma_set_thp_policy(vma);
>>>>>
>>>>> You're breaking VMA merging completely by doing this here...
>>>>>
>>>>> Now I can map one VMA with this policy set, then map another immediately
>>>>> next to it and - oops - no merge, ever, because the VM_HUGEPAGE flag is not
>>>>> set in the new VMA on merge attempt.
>>>>>
>>>>> I realise KSM is just as broken (grr) but this doesn't justify us
>>>>> completely breaking VMA merging here.
>>>>
>>>> I think this answers it. Its doing the same as KSM.
>>>
>>> Yes, but as I said there, it's not acceptable, at all.
>>>
>>> You're making it so litearlly VMA merging _does not happen at all_. That's
>>> unacceptable and might even break some workloads.
>>>
>>> You'll certainly cause very big kernel metadata usage.
>>>
>>> Consider:
>>>
>>> |-----------------------------|..................|
>>> | some VMA flags, VM_HUGEPAGE | proposed new VMA |
>>> |-----------------------------|..................|
>>>
>>> Now, because you set VM_HUGEPAGE _after any merge is attempted_, this will
>>> _always_ be fragmented, forever.
>>>
>>
>> So if __mmap_new_vma and do_brk_flags are called after merge attempt,
>> is it possible to vma_set_thp_policy (or do something similar) before
>> the merge attempt?
>>
>> Actually I just read your reply to the next block, so I think its ok?
>> Added more to the next block.
>>
>> I dont have any preference on where its put, so happy with putting this
>> earlier.
> 
> Yeah, you can just do it earlier. But you maybe should just set the flag in
> the appropriate field rather than using the set flags helper.
> 
>>
>>
>>> That's just not... acceptable.
>>>
>>> The fact KSM is broken this way doesn't make that OK.
>>>
>>> Especially on brk(), which now will _always_ allocate new VMAs for every
>>> brk() expansion which doesn't seem very efficient.
>>>
>>> It may also majorly degrade performance.
>>>
>>> That makes me think we need some perf testing for this ideally...
>>>
>>>>
>>>>>
>>>>> You need to set earlier than this. Then of course a driver might decide to
>>>>> override this, so maybe then we need to override that.
>>>>>
>>>>> But then we're getting into realms of changing fundamental VMA code _just
>>>>> for this feature_.
>>>>>
>>>>> Again I'm iffy about this. Very.
>>>>>
>>>>> Also you've broken the VMA userland tests here:
>>>>>
>>>>> $ cd tools/testing/vma
>>>>> $ make
>>>>> ...
>>>>> In file included from vma.c:33:
>>>>> ../../../mm/vma.c: In function ‘__mmap_new_vma’:
>>>>> ../../../mm/vma.c:2486:9: error: implicit declaration of function ‘vma_set_thp_policy’; did you mean ‘vma_dup_policy’? [-Wimplicit-function-declaration]
>>>>>   2486 |         vma_set_thp_policy(vma);
>>>>>        |         ^~~~~~~~~~~~~~~~~~
>>>>>        |         vma_dup_policy
>>>>> make: *** [<builtin>: vma.o] Error 1
>>>>>
>>>>> You need to create stubs accordingly.
>>>>>
>>>>
>>>> Thanks will do.
>>>
>>> Thanks!
>>>
>>>>
>>>>>>   	*vmap = vma;
>>>>>>   	return 0;
>>>>>>
>>>>>> @@ -2705,6 +2706,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
>>>>>>   	mm->map_count++;
>>>>>>   	validate_mm(mm);
>>>>>>   	ksm_add_vma(vma);
>>>>>> +	vma_set_thp_policy(vma);
>>>>>
>>>>> You're breaking merging again... This is quite a bad case too as now you'll
>>>>> have totally fragmented brk VMAs no?
>>>>>
>>>>
>>>> Again doing it the same as KSM.
>>>
>>> That doesn't make it ok. Just because KSM is broken doesn't make this ok. I
>>> mean grr at KSM :) I'm going to look into that and see about
>>> investigating/fixing that behaviour.
>>>
>>> obviously I can't accept anything that will fundamentally break VMA
>>> merging.
>>>
>>
>> Ofcourse!
>>
>>> The answer really is to do this earlier, but you risk a driver overriding
>>> it, but that's OK I think (I don't even think any in-tree ones do actually
>>> _anywhere_ - and yes I was literally reading through _every single_ .mmap()
>>> callback lately because I am quite obviously insane ;)
>>>
>>> Again I can help with this.
>>>
>>
>> Appreaciate it!
>>
>> I am actually not familiar with the merge code. I will try and have a look,
>> but if you could give a pointer to the file:line after which its not acceptable
>> to have and I can move vma_set_thp_policy to before it or try and do something
>> similar to that.
> 
> Ack.
> 
> I wrote the latest merge and mmap() code so am well placed on this :>)
> 
> But I don't think we should use vma_set_thp_policy() in these places, we
> should just set the flag, to avoid trying to do a write lock etc. etc.,
> plus we want to set the flag in a place that's not a VMA yet in both cases.
> 
> So we'd need something like in do_mmap():
> 
> +	vm_flags |= mm_implied_vma_flags(mm);
> 	addr = mmap_region(file, addr, len, vm_flags, pgoff, uf);
> 
> Where mm_implied_vma_flags() reads the MMF flags and sees if any imply VMA
> flags.
> 
> But we have something for that already don't we? mm->def_flags.
> 
> Can't we use that actually? That should work for mmap too?

Yeah, look at

commit 1860033237d4be09c5d7382585f0c7229367a534
Author: Michal Hocko <mhocko@suse.com>
Date:   Mon Jul 10 15:48:02 2017 -0700

     mm: make PR_SET_THP_DISABLE immediately active


Where we moved away from that. As raised, I am not sure I like what we 
did with PR_SET_THP_DISABLE.

And I don't want any new magical prctl like that that add new magical 
internal toggles.

OTOH, I am completely fine with a prctl that just changes the default 
for new VMAs (just like applying madvise imemdiately afterwards). I'm 
also fine with a prtctl that changes all existing VMAs, but maybe just 
issuing a madvise() is the better solution, to cleanly separate it.

All not too crazy and not too invasive -- piggybagging on VM_HUGEPAGE / 
VM_NOHUGEPAGE.

I can life with that if it solves a use case.

-- 
Cheers,

David / dhildenb

