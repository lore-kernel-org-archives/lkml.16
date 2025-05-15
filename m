Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FD220B80A;
	Thu, 15 May 2025 16:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747327660; cv=none; b=TCtB5BPLyEfRk3MKScYsNHwwTwetkCVJPGBikXhUVoNAsJGkqh2SUM08kBk37ZxvWyCUv/Ir4dZ1ty5f2KpPaKiTaWERAjkpUS//Nb0mnNZsut9uE0vUhflVVwmXm/Rbrhz5noJuM3mPpgRkXiJ5zz+o1Xt97D7kPIMHF0wjAQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747327660; c=relaxed/simple;
	bh=xge2e+NhikuJzm90624jCZmVAvCKijgb4F6n+DqZauo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DK8v+m3WTpqgvVxFX70JwmI/b2J+RcJy8Q2TelBXVJNySH59faSnT5/7428QONfdPQyHi656g3KZOaX5l/pbNlNnHo3FjiYiPGf86HVoSj3KRAYMLqKE06O9Vqf5WD/I/iZ0Xn+ppBPpLaCbx0ZZQLHpbywzpv+OWZenw2RrUKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHE/T18X; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHE/T18X"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0b6773f8dso852002f8f.1;
        Thu, 15 May 2025 09:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747327656; x=1747932456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkgpkfBDs4JHFOqb847ZHMG9CL/tOHnupWssCLbExzA=;
        b=aHE/T18XZcMrmYjqn5ZQP0j9rVbyBaOfTR8c3jpf1xtBTlP/jISHIcWUcX3X3/Um5N
         BHNxzyN/KcGkT5TYGK3T2rd8oVjZgki+JIMRV6KZT2ZgSH37LZFCH5XpgbVLXu1dWrW8
         JfqvT1L8vq8SfZ8e41RyXW1nX/MR0pgfVuZn783iVdPMMN9JjLcDie1tgjKG8RrDzS5f
         oB5dw8nobrpAJX0V98ssXlwU2tsEOu7ozpv2Ep2541WcLWXNTwZAZRabqTIJ7RG+7+cM
         oaRfGT0OEVCW4oL+LK39C73pMDfnV1MDBK8RhEP95tuW9IGF6D56CZ5a/ulY4lnNlRMK
         dlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747327656; x=1747932456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TkgpkfBDs4JHFOqb847ZHMG9CL/tOHnupWssCLbExzA=;
        b=oNzn91HtC7Lzm6uqbaeqFqS8HzngK52y4RIxc2/aF8Q1rKjzgwmbNgJdemVcvojy57
         rLUSfOxdtxwa20B551RHZWQNH/SaZ7ND3bAjdTP+nS1okR1M63vymVDqZ7tRazIIXN94
         xxv5gObgVEb+KBaJR7wM/Ndz3zvMFlFXD/K/P1z2mhSJUDndBuRr8fAdAI36WV32lUn6
         TTbGad38pSMeSTTP+sxjYLqAs1riTipCEeoniLdP1Wu5XY7bknCh9yZVlnjUYswL+x4y
         Aq9g4It9AMhTNXdPHaMWKTzlsmXkLX9PozgOgVX8Aximu7rw5+aTQVDfTPOix6chB7Lt
         Zreg==
X-Forwarded-Encrypted: i=1; AJvYcCUISbcgzbpnZ6l6z2Jpin6sqaoWIrN0S6LBztAVdDd5SzVxrIkh3RVYrIfdiZF7W5SG4NuRDY/R8Ok=@vger.kernel.org, AJvYcCXo6ZILeCe6H2PKITRv5aTUxNxtCwTzJ1bDR3O6Yzk64EuXQNxaLxoHRfqUritKusMnDC9Ldj33wCShTZQm@vger.kernel.org
X-Gm-Message-State: AOJu0YxEki1HXov2B6iXvPT/WUFvK8Nxe5XT9zEbE17JlLmk0jxr6uWg
	Nqp9/nt45zR3EApmig6NMFpsrzWgj3jQc5716yqgQR1aaciWBk66INrT
X-Gm-Gg: ASbGncsom2OnQDCRjNcjAWgdtwMGLFtpfO54JeGQlauhcAaybP1WLmoL4Q+ekTS0Q6W
	I8bSgQK6x9fsd4ZrwyQfQ8Oq9ZSzEECRhlah6H7GdYgnqgnA3mlbm3RBH/G4mUfHEAVGSdy5yiY
	mNrXAa4MREOZaWzChy94GgS7BlDhIWg20s4wht+JytGqXN0rN/6Gzb+y4D69fHMQgwwkqXHYkJj
	t48Ob7TzaaHG9Ff8czNbz00EKLFDujD9S82xHqBAWs2IW1ngcPmvR41ToQvPOyXYvLK46AjuvNH
	44LcpStDqzHwxzedzomJj1Jwq5D0bqU+fWEIlQuLxQzVRJJ+FDarDPAK3SGmQXzlCvEYeqXrRKX
	pjEI3rY8yl6G6cYtTr5CDzZvRfkP0bRHaOjyJNko0HNZkehY=
X-Google-Smtp-Source: AGHT+IGwoZGXfRfrijk5EbPVA9ERSXANckJYpJ0HgniSNhLa4G+DQiCotf5dit+V2clIYe7I//aTDA==
X-Received: by 2002:a05:6000:2385:b0:3a3:4ba4:f3cd with SMTP id ffacd0b85a97d-3a35c821e38mr588370f8f.1.1747327655957;
        Thu, 15 May 2025 09:47:35 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:b211:ad00:1096:2c00:b223:9747? ([2a01:4b00:b211:ad00:1096:2c00:b223:9747])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd594707sm2637355e9.33.2025.05.15.09.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 09:47:35 -0700 (PDT)
Message-ID: <732ff995-0e18-4e8c-a0a5-14da400d4078@gmail.com>
Date: Thu, 15 May 2025 17:47:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 15/05/2025 17:06, Lorenzo Stoakes wrote:

>> Its doing the same as KSM as suggested by David. Does KSM break these tests?
>> Is there some specific test you can point to that I can run that is breaking
>> with this patch and not without it?
> 
> They don't build, at all. I explain how you can attempt a build below.
> 

Ah yes, I initially thought by break you meant they were failing. I saw that,
will fix it.

> And no, KSM doesn't break the tests, because steps were taken to make them
> not break the tests :) I mean it's really easy - it's just adding some
> trivial stubs.
> 

Yes, will do Thanks!

> If you need help with it just ping me in whatever way helps and I can help!
> 
> It's understandable as it's not necessarily clear this is a thing (maybe we
> need self tests to build it, but that might break CI setups so unclear).
> 
> The merging is much more important!
> 
>>
>>
>>> I really feel this series needs to be an RFC until we can get some
>>> consensus on how to approach this.
>>
>> There was consensus in https://lore.kernel.org/all/97702ff0-fc50-4779-bfa8-83dc42352db1@redhat.com/
> 
> I disagree with this asssessment, that doesn't look like consensus at all,
> I think at least this is a very contentious or at least _complicated_ topic
> that we need to really dig into.
> 
> So in my view - it's this kind of situation that warrants an RFC until
> there's some stabilisation and agreement on a way forward.
> 

Sure will change next revision to RFC, unless hopefully maybe we can
get a consensus in this revision :)

>>
>>>
>>> On Thu, May 15, 2025 at 02:33:30PM +0100, Usama Arif wrote:
>>>> This is set via the new PR_SET_THP_POLICY prctl.
>>>
>>> What is?
>>>
>>> You're making very major changes here, including adding a new flag to
>>> mm_struct (!!) and the explanation/justification for this is missing.
>>>
>>
>> I have added the justification in your reply to the coverletter.
> 
> As stated there, you've not explained why alternatives are unworkable, I
> think we need this!
> 
> Sort of:
> 
> 1. Why not cgroups? blah blah blah
> 2. Why not process_madvise()? blah blah blah
> 3. Why not bpf? blah blah blah
> 4. Why not <something I've not thought of>? blah blah blah
> 

I will add this in the next cover letter.


>>
>>>> This will set the MMF2_THP_VMA_DEFAULT_HUGE process flag
>>>> which changes the default of new VMAs to be VM_HUGEPAGE. The
>>>> call also modifies all existing VMAs that are not VM_NOHUGEPAGE
>>>> to be VM_HUGEPAGE. The policy is inherited during fork+exec.
>>>
>>> So you can only set this flag?
>>>
>>
>> ??
> 
> This patch is only allowing the setting of this flag. I am asking 'so you
> can only set this flag?'
> 
> To which it appears the answer is, yes I think :)
> 
> An improved cover letter could say something like:
> 
> "
> Here we implement the first flag intended to allow the _overriding_ of huge
> page policy to ensure that, when
> /sys/kernel/mm/transparent_hugepage/enabled is set to madvise, we are able
> to maintain fine-grained control of individual processes, including any
> fork/exec'd, by setting this flag.
> 
> In subsequent commits, we intend to permit further such control.
> "
> 
>>
>>>>
>>>> This allows systems where the global policy is set to "madvise"
>>>> to effectively have THPs always for the process. In an environment
>>>> where different types of workloads are stacked on the same machine,
>>>> this will allow workloads that benefit from always having hugepages
>>>> to do so, without regressing those that don't.
>>>
>>> Again, this explanation really makes no sense at all to me, I don't really
>>> know what you mean, you're not going into what you're doing in this change,
>>> this is just a very unclear commit message.
>>>
>>
>> I hope this is answered in my reply to your coverletter.
> 
> You still need to improve the cover letter here I think, see above for a
> suggestion!
> 

Sure, will do in the next revision, Thanks!
>>
>>>>
>>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>>> ---
>>>>  include/linux/huge_mm.h                       |  3 ++
>>>>  include/linux/mm_types.h                      | 11 +++++++
>>>>  include/uapi/linux/prctl.h                    |  4 +++
>>>>  kernel/fork.c                                 |  1 +
>>>>  kernel/sys.c                                  | 21 ++++++++++++
>>>>  mm/huge_memory.c                              | 32 +++++++++++++++++++
>>>>  mm/vma.c                                      |  2 ++
>>>>  tools/include/uapi/linux/prctl.h              |  4 +++
>>>>  .../trace/beauty/include/uapi/linux/prctl.h   |  4 +++
>>>>  9 files changed, 82 insertions(+)
>>>>
>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>> index 2f190c90192d..e652ad9ddbbd 100644
>>>> --- a/include/linux/huge_mm.h
>>>> +++ b/include/linux/huge_mm.h
>>>> @@ -260,6 +260,9 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
>>>>  	return orders;
>>>>  }
>>>>
>>>> +void vma_set_thp_policy(struct vm_area_struct *vma);
>>>
>>> This is a VMA-specific function but you're putting it in huge_mm.h? Why
>>> can't
>> this be in vma.h or vma.c?
>>>
>>
>> Sure can move it there.
>>
>>>> +void process_vmas_thp_default_huge(struct mm_struct *mm);
>>>
>>> 'vmas' is redundant here.
>>>
>>
>> Sure.
>>>> +
>>>>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>>>  					 unsigned long vm_flags,
>>>>  					 unsigned long tva_flags,
>>>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>>>> index e76bade9ebb1..2fe93965e761 100644
>>>> --- a/include/linux/mm_types.h
>>>> +++ b/include/linux/mm_types.h
>>>> @@ -1066,6 +1066,7 @@ struct mm_struct {
>>>>  		mm_context_t context;
>>>>
>>>>  		unsigned long flags; /* Must use atomic bitops to access */
>>>> +		unsigned long flags2;
>>>
>>>
>>> Ugh, god really??
>>>
>>> I really am not a fan of adding flags2 just to add a prctl() feature like
>>> this. This is crazy.
>>>
>>> Also this is a TERRIBLE name. I mean, no please PLEASE no.
>>>
>>> Do we really have absolutely no choice but to add a new flags field here?
>>>
>>> It again doesn't help that you don't mention nor even try to justify this
>>> in the commit message or cover letter.
>>>
>>
>> And again, I hope my reply to your email has given you the justification.
> 
> No :) I understood why you did this though of course.
> 
>>
>>> If this is a 32-bit kernel vs. 64-bit kernel thing so we 'ran out of bits',
>>> let's just go make this flags field 64-bit on 32-bit kernels.
>>>
>>> I mean - I'm kind of insisting we do that to be honest. Because I really
>>> don't like this.
>>
>>
>> If the maintainers want this, I will make it a 64 bit only feature. We
>> are only using it for 64 bit servers. But it will probably mean ifdef
>> config 64 bit in a lot of places.
> 
> I'm going to presume you are including me in this category rather than
> implying that you are deferring only to others :)
> 

Yes ofcourse! I mean all maintainers :)

And hopefully everyone else as well :)

> So, there's another option:
> 
> Have a prerequisite series that makes mm_struct->flags 64-bit on 32-bit
> kernels, which solves this problem everywhere and avoids us wasting a bunch
> of memory for a very specific usecase, splitting flag state across 2 fields
> (which are no longer atomic as a whole of course), adding confusion,
> possibly subtly breaking anywhere that assumes mm->flags completely
> describes mm-granularity flag state etc.
> 

This is probably a very basic question, but by make mm_struct->flags 64-bit on 32-bit
do you mean convert flags to unsigned long long when !CONIFG_64BIT?

> The RoI here is not looking good, otherwise.
> 
>>
>>>
>>> Also if we _HAVE_ to have this, shouldn't we duplicate that comment about
>>> atomic bitops?...
>>>
>>
>> Sure
>>
>>>>
>>>>  #ifdef CONFIG_AIO
>>>>  		spinlock_t			ioctx_lock;
>>>> @@ -1744,6 +1745,11 @@ enum {
>>>>  				 MMF_DISABLE_THP_MASK | MMF_HAS_MDWE_MASK |\
>>>>  				 MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK)
>>>>
>>>> +#define MMF2_THP_VMA_DEFAULT_HUGE		0
>>>
>>> I thought the whole idea was to move away from explicitly refrencing 'THP'
>>> in a future where large folios are implicit and now we're saying 'THP'.
>>>
>>> Anyway the 'VMA' is totally redundant here.
>>>
>>
>> Sure, I can remove VMA.
>> I see THP everywhere in the kernel code.
>> Its mentioned 108 times in transhuge.rst alone :)
>> If you have any suggestion to rename this flag, happy to take it :)
> 
> Yeah I mean it's a mess man, and it's not your fault... Again naming is
> hard, I put a suggestion in reply to cover letter anyway...
> 
>>
>>>> +#define MMF2_THP_VMA_DEFAULT_HUGE_MASK		(1 << MMF2_THP_VMA_DEFAULT_HUGE)
>>>
>>> Do we really need explicit trivial mask declarations like this?
>>>
>>
>> I have followed the convention that has existed in this file, please see below
>> links :)
>> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1645
>> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1623
>> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1603
>> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1582
> 
> Ack, yuck but ack.
> 
>>
>>
>>>> +
>>>> +#define MMF2_INIT_MASK		(MMF2_THP_VMA_DEFAULT_HUGE_MASK)
>>>
>>>> +
>>>>  static inline unsigned long mmf_init_flags(unsigned long flags)
>>>>  {
>>>>  	if (flags & (1UL << MMF_HAS_MDWE_NO_INHERIT))
>>>> @@ -1752,4 +1758,9 @@ static inline unsigned long mmf_init_flags(unsigned long flags)
>>>>  	return flags & MMF_INIT_MASK;
>>>>  }
>>>>
>>>> +static inline unsigned long mmf2_init_flags(unsigned long flags)
>>>> +{
>>>> +	return flags & MMF2_INIT_MASK;
>>>> +}
>>>> +
>>>>  #endif /* _LINUX_MM_TYPES_H */
>>>> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
>>>> index 15c18ef4eb11..325c72f40a93 100644
>>>> --- a/include/uapi/linux/prctl.h
>>>> +++ b/include/uapi/linux/prctl.h
>>>> @@ -364,4 +364,8 @@ struct prctl_mm_map {
>>>>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>>>>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
>>>>
>>>> +#define PR_SET_THP_POLICY		78
>>>> +#define PR_GET_THP_POLICY		79
>>>> +#define PR_THP_POLICY_DEFAULT_HUGE	0
>>>> +
>>>>  #endif /* _LINUX_PRCTL_H */
>>>> diff --git a/kernel/fork.c b/kernel/fork.c
>>>> index 9e4616dacd82..6e5f4a8869dc 100644
>>>> --- a/kernel/fork.c
>>>> +++ b/kernel/fork.c
>>>> @@ -1054,6 +1054,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>>>>
>>>>  	if (current->mm) {
>>>>  		mm->flags = mmf_init_flags(current->mm->flags);
>>>> +		mm->flags2 = mmf2_init_flags(current->mm->flags2);
>>>>  		mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
>>>>  	} else {
>>>>  		mm->flags = default_dump_filter;
>>>> diff --git a/kernel/sys.c b/kernel/sys.c
>>>> index c434968e9f5d..1115f258f253 100644
>>>> --- a/kernel/sys.c
>>>> +++ b/kernel/sys.c
>>>> @@ -2658,6 +2658,27 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>>>>  			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
>>>>  		mmap_write_unlock(me->mm);
>>>>  		break;
>>>> +	case PR_GET_THP_POLICY:
>>>> +		if (arg2 || arg3 || arg4 || arg5)
>>>> +			return -EINVAL;
>>>> +		if (!!test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2))
>>>
>>> I really don't think we need the !!? Do we?
>>
>> I have followed the convention that has existed in this file already,
>> please see:
>> https://elixir.bootlin.com/linux/v6.14.6/source/kernel/sys.c#L2644
> 
> OK, but please don't, I don't see why this is necessary. if (truthy) is
> fine.
> 
> Unless somebody has a really good reason why this is necessary, it's just
> ugly ceremony.
> 

Agreed :)

>>
>>>
>>> Shouldn't we lock the mm when we do this no? Can't somebody change this?
>>>
>>
>> It wasn't locked in PR_GET_THP_DISABLE
>> https://elixir.bootlin.com/linux/v6.14.6/source/kernel/sys.c#L2644
>>
>> I can acquire do mmap_write_lock_killable the same as PR_SET_THP_POLICY
>> in the next series.
>>
>> I can also add the lock in PR_GET_THP_DISABLE.
> 
> Well, the issue I guess is... if the flags field is atomic, and we know
> over this call maybe we can rely on mm sticking around, then we probalby
> don't need an mmap lock actually.
> 
>>
>>>> +			error = PR_THP_POLICY_DEFAULT_HUGE;
> 
> Wait, error = PR_THP_POLICY_DEFAULT_HUGE? Is this the convention for
> returning here? :)

I see a few of the PR_GET_.. setting the return value. I hope I didnt
misinterpret that.

> 
>>>> +		break;
>>>> +	case PR_SET_THP_POLICY:
>>>> +		if (arg3 || arg4 || arg5)
>>>> +			return -EINVAL;
>>>> +		if (mmap_write_lock_killable(me->mm))
>>>> +			return -EINTR;
>>>> +		switch (arg2) {
>>>> +		case PR_THP_POLICY_DEFAULT_HUGE:
>>>> +			set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
>>>> +			process_vmas_thp_default_huge(me->mm);
>>>> +			break;
>>>> +		default:
>>>> +			return -EINVAL;
> 
> Oh I just noticed - this is really broken - you're not unlocking the mmap()
> here on error... :) you definitely need to fix this.
> 

Ah yes, will do Thanks!

>>>> +		}
>>>> +		mmap_write_unlock(me->mm);
>>>> +		break;
>>>>  	case PR_MPX_ENABLE_MANAGEMENT:
>>>>  	case PR_MPX_DISABLE_MANAGEMENT:
>>>>  		/* No longer implemented: */
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index 2780a12b25f0..64f66d5295e8 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -98,6 +98,38 @@ static inline bool file_thp_enabled(struct vm_area_struct *vma)
>>>>  	return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
>>>>  }
>>>>
>>>> +void vma_set_thp_policy(struct vm_area_struct *vma)
>>>> +{
>>>> +	struct mm_struct *mm = vma->vm_mm;
>>>> +
>>>> +	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
>>>> +		vm_flags_set(vma, VM_HUGEPAGE);
>>>> +}
>>>> +
>>>> +static void vmas_thp_default_huge(struct mm_struct *mm)
>>>> +{
>>>> +	struct vm_area_struct *vma;
>>>> +	unsigned long vm_flags;
>>>> +
>>>> +	VMA_ITERATOR(vmi, mm, 0);
>>>
>>> This is a declaration, it should be grouped with declarations...
>>>
>>
>> Sure, will make the change in next version.
>>
>> Unfortunately checkpatch didn't complain.
> 
> Checkpatch actually complains the other way :P it doesn't understand
> macros.
> 
> So you'll start getting a warning here, which you can ignore. It sucks, but
> there we go. Making checkpatch.pl understand that would be a pain, probs.
> 
>>
>>>> +	for_each_vma(vmi, vma) {
>>>> +		vm_flags = vma->vm_flags;
>>>> +		if (vm_flags & VM_NOHUGEPAGE)
>>>> +			continue;
>>>
>>> Literally no point in you putting vm_flags as a separate variable here.
>>>
>>
>> Sure, will make the change in next version.
> 
> Thanks!
> 
>>
>>> So if you're not overriding VM_NOHUGEPAGE, the whole point of this exercise
>>> is to override global 'never'?
>>>
>>
>> Again, I am not overriding never.
>>
>> hugepage_global_always and hugepage_global_enabled will evaluate to false
>> and you will not get a hugepage.
> 
> Yeah, again ack, but I kind of hate that we set VM_HUGEPAGE everywhere even
> if the policy is never.
> 
> And we now get into realms of:
> 
> 'Hey I set prctl() to make everything huge pages, and PR_GET_THP_POLICY
> says I've set that, but nothing is huge? BUG???'
> 
> Of course then you get into - if somebody sets it to never, do we go around
> and remove VM_HUGEPAGE and this MMF_ flag?
> 
>>
>>
>>> I'm really concerned about this.
>>>
>>>> +		vm_flags_set(vma, VM_HUGEPAGE);
>>>> +	}
>>>> +}
>>>
>>> Do we have an mmap write lock established here? Can you confirm that? Also
>>> you should add an assert for that here.
>>>
>>
>> Yes I do, its only called in PR_SET_THP_POLICY where mmap_write lock was taken.
>> I can add an assert if it helps.
> 
> It not only helps, it's utterly critical :)
> 
> 'It's only called in xxx()' is famous last words for a programmer, because
> later somebody (maybe even your good self) calls it from somewhere else
> and... we've all been there...
> 

Thanks! Will do.
>>
>>>> +
>>>> +void process_vmas_thp_default_huge(struct mm_struct *mm)
>>>> +{
>>>> +	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
>>>> +		return;
>>>> +
>>>> +	set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2);
>>>> +	vmas_thp_default_huge(mm);
>>>> +}
>>>> +
>>>> +
>>>>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>>>  					 unsigned long vm_flags,
>>>>  					 unsigned long tva_flags,
>>>> diff --git a/mm/vma.c b/mm/vma.c
>>>> index 1f2634b29568..101b19c96803 100644
>>>> --- a/mm/vma.c
>>>> +++ b/mm/vma.c
>>>> @@ -2476,6 +2476,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
>>>>  	if (!vma_is_anonymous(vma))
>>>>  		khugepaged_enter_vma(vma, map->flags);
>>>>  	ksm_add_vma(vma);
>>>> +	vma_set_thp_policy(vma);
>>>
>>> You're breaking VMA merging completely by doing this here...
>>>
>>> Now I can map one VMA with this policy set, then map another immediately
>>> next to it and - oops - no merge, ever, because the VM_HUGEPAGE flag is not
>>> set in the new VMA on merge attempt.
>>>
>>> I realise KSM is just as broken (grr) but this doesn't justify us
>>> completely breaking VMA merging here.
>>
>> I think this answers it. Its doing the same as KSM.
> 
> Yes, but as I said there, it's not acceptable, at all.
> 
> You're making it so litearlly VMA merging _does not happen at all_. That's
> unacceptable and might even break some workloads.
> 
> You'll certainly cause very big kernel metadata usage.
> 
> Consider:
> 
> |-----------------------------|..................|
> | some VMA flags, VM_HUGEPAGE | proposed new VMA |
> |-----------------------------|..................|
> 
> Now, because you set VM_HUGEPAGE _after any merge is attempted_, this will
> _always_ be fragmented, forever.
> 

So if __mmap_new_vma and do_brk_flags are called after merge attempt,
is it possible to vma_set_thp_policy (or do something similar) before
the merge attempt?


Actually I just read your reply to the next block, so I think its ok?
Added more to the next block.

I dont have any preference on where its put, so happy with putting this
earlier.


> That's just not... acceptable.
> 
> The fact KSM is broken this way doesn't make that OK.
> 
> Especially on brk(), which now will _always_ allocate new VMAs for every
> brk() expansion which doesn't seem very efficient.
> 
> It may also majorly degrade performance.
> 
> That makes me think we need some perf testing for this ideally...
> 
>>
>>>
>>> You need to set earlier than this. Then of course a driver might decide to
>>> override this, so maybe then we need to override that.
>>>
>>> But then we're getting into realms of changing fundamental VMA code _just
>>> for this feature_.
>>>
>>> Again I'm iffy about this. Very.
>>>
>>> Also you've broken the VMA userland tests here:
>>>
>>> $ cd tools/testing/vma
>>> $ make
>>> ...
>>> In file included from vma.c:33:
>>> ../../../mm/vma.c: In function ‘__mmap_new_vma’:
>>> ../../../mm/vma.c:2486:9: error: implicit declaration of function ‘vma_set_thp_policy’; did you mean ‘vma_dup_policy’? [-Wimplicit-function-declaration]
>>>  2486 |         vma_set_thp_policy(vma);
>>>       |         ^~~~~~~~~~~~~~~~~~
>>>       |         vma_dup_policy
>>> make: *** [<builtin>: vma.o] Error 1
>>>
>>> You need to create stubs accordingly.
>>>
>>
>> Thanks will do.
> 
> Thanks!
> 
>>
>>>>  	*vmap = vma;
>>>>  	return 0;
>>>>
>>>> @@ -2705,6 +2706,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
>>>>  	mm->map_count++;
>>>>  	validate_mm(mm);
>>>>  	ksm_add_vma(vma);
>>>> +	vma_set_thp_policy(vma);
>>>
>>> You're breaking merging again... This is quite a bad case too as now you'll
>>> have totally fragmented brk VMAs no?
>>>
>>
>> Again doing it the same as KSM.
> 
> That doesn't make it ok. Just because KSM is broken doesn't make this ok. I
> mean grr at KSM :) I'm going to look into that and see about
> investigating/fixing that behaviour.
> 
> obviously I can't accept anything that will fundamentally break VMA
> merging.
> 

Ofcourse!

> The answer really is to do this earlier, but you risk a driver overriding
> it, but that's OK I think (I don't even think any in-tree ones do actually
> _anywhere_ - and yes I was literally reading through _every single_ .mmap()
> callback lately because I am quite obviously insane ;)
> 
> Again I can help with this.
> 

Appreaciate it!

I am actually not familiar with the merge code. I will try and have a look,
but if you could give a pointer to the file:line after which its not acceptable
to have and I can move vma_set_thp_policy to before it or try and do something
similar to that.

>>
>>> We can't have it implemented this way.
>>>
>>>>  out:
>>>>  	perf_event_mmap(vma);
>>>>  	mm->total_vm += len >> PAGE_SHIFT;
>>>> diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
>>>> index 35791791a879..f5945ebfe3f2 100644
>>>> --- a/tools/include/uapi/linux/prctl.h
>>>> +++ b/tools/include/uapi/linux/prctl.h
>>>> @@ -328,4 +328,8 @@ struct prctl_mm_map {
>>>>  # define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
>>>>  # define PR_PPC_DEXCR_CTRL_MASK		0x1f
>>>>
>>>> +#define PR_SET_THP_POLICY		78
>>>> +#define PR_GET_THP_POLICY		79
>>>> +#define PR_THP_POLICY_DEFAULT_HUGE	0
>>>> +
>>>>  #endif /* _LINUX_PRCTL_H */
>>>> diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
>>>> index 15c18ef4eb11..325c72f40a93 100644
>>>> --- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
>>>> +++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
>>>> @@ -364,4 +364,8 @@ struct prctl_mm_map {
>>>>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>>>>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
>>>>
>>>> +#define PR_SET_THP_POLICY		78
>>>> +#define PR_GET_THP_POLICY		79
>>>> +#define PR_THP_POLICY_DEFAULT_HUGE	0
>>>> +
>>>>  #endif /* _LINUX_PRCTL_H */
>>>> --
>>>> 2.47.1
>>>>
>>

