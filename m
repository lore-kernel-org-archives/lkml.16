Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A43C1F4CAC;
	Thu, 15 May 2025 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324486; cv=none; b=UGtOxUKFShvg3E8nicwLgm3LFFjK/O3VpaN2g0480S/+V394cX8IGK7xR2J5bhttqejgXXzIXaG+RFjkZxqQKPbAO9RUfJ6vMlmTKMhhjpUti1zHvhI3BgzGo3NLGvXP50wfbEV5UgEy+w9lIJvBIYeL7gfBB4WyNtsqmT7AzzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324486; c=relaxed/simple;
	bh=OEwbex4P1f0qPb8f+HVQXMr/nLkBccC6zV4riaLOphU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsjIWjr4WsRT8M9M981Mc3Zc/9t8CGePKoax9ns01tzxL80T5ceb2hDqPSmbWehhk2MlD8Jf8/5CiApeQB6GzfuuzfA9nwhF6HlX3dD7yTnQQSOrwpQllZuClpmUstTxxQhTCXk/qHSRHg8G4uPbCa7+01nFg1Qy2l88AqBKGJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMkK+K6K; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMkK+K6K"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a108684f90so732463f8f.1;
        Thu, 15 May 2025 08:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747324482; x=1747929282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YqGwytIKGGFw4F/Ptebu/zaf1C8GiOkuTgkNzw3NWj0=;
        b=GMkK+K6K1mD3/wXEXWnjOECnzAB4QwZhfHSRJwFdbcmtAyMgVeZtTpipQlHNVXAjJt
         VR+329scmv3f9isQzna0Ky7isScKEsbatQt1hhdkKQtOinpTDVenZGzB1CJAkxN1R5Ev
         dNKeSMXNt/is1zUySUusSjIzClkBKRRDSZ2CRk7kzh4imN4gSd8fKDEaYvElSJVxomhF
         JTDXxlQ0iUhjibzJ2AWWpa7Fvd7NTmoY2UDDfoE3rI8SpzBlZrjdqk9fMcHJXBxhgjlY
         EMA5XDz4ndoWIA25cpBxsCvTimxIW6M7pw9E5P7jP7ssZwFUKS+P4NaBKZpuBN7zVvkz
         +FAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324482; x=1747929282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqGwytIKGGFw4F/Ptebu/zaf1C8GiOkuTgkNzw3NWj0=;
        b=TtQZ7YRRvfXHcDXgyCHTqNd7e9bRItFamwqzkqp2djqFoEItabCbgZs43M0DkGg9m0
         kSviLcSAzjlpGFLIroMOBskkDFpEWF0SU/NyfkKemdrcCnNig40PCyJXzAKtG8MGHeRs
         orpwPrQFE69gnQrOyJG9FAocxO4YUVNCgD3qQroHU9VO0wscOhmn+8MHsXy/pI8OVKqq
         cpst+Sjn+TcZ26/+RrBfx13G3jBbsePtfPPO5eD3voGMBDX3IZ7qMAz+GVvnC18eDxZJ
         3JaoNbZ56NSmvsKVJfSIEOgY7iVO0gpPMWh+DNc6pYK8+VXbBC0fWmwyVtJ1dYEe0vQp
         gu8g==
X-Forwarded-Encrypted: i=1; AJvYcCUhd9dziffRDfsKHuFmzCRYrruUPxzqRHXlyWxwsdmse5Q3imuoUv1wnEraj8CJFozJpoaia/Hy2NE=@vger.kernel.org, AJvYcCWZlYU/mpAPe+nlmp4dku2p+A2qkD3Cs9FtbuDX/6j0SNDmjsM/RE4NEKmhG4xrEEZRpI11cPuqi0H02sZ/@vger.kernel.org
X-Gm-Message-State: AOJu0YxCPoO9eKYGyN4gvsObtr/ln3qO8Tc9s7gvJ57GghU2NbXpdcLq
	P8cBrz7MejXgsxITchB8EznaDmo5i8JGqyxSCNGYFo1PF60ufWk1VITq
X-Gm-Gg: ASbGncsvuynV4C3cqQ8RvvrY2K8eu2Vgz0Z5OBUC5fl1MXw89F0yLKE0kHz0h5COZYG
	5O31eVIi3VT/oWzJL+TGfN3PGMwk1UxH9tvhxZNSGyQ9o8CrsOki/WZnTpWvtXAq6d9lDoEMHT1
	x+Ct/sGI537+LI5zdo6PfA7HzlA7iIOaCrZcUVHyedDaQ/cUinsH9fyfZyN0e2aCsof5dyRSbNH
	Af44111V68KSgU/KhzsBBwiDHKlv4t3JYT5NXjozAdzuoLVz+/o+suHQj6LKOH9tRO/NxuNPj1S
	n1195RoXjZFU/imYj23ZJuAQ6p4PFvAX9qt1XJrlz2D1dUCoflfH9XYEiCnwSQg/UsXmD6ZapZH
	HDKysM5WXuuRZmawFE28x3BQ1dDFk81gH0aFU57M4znJc8qc=
X-Google-Smtp-Source: AGHT+IESAoLieylo0dTRqovlru1XqKC+yKIafAefBwyIVhVUE0tbBFMijuC2ez+sboZHSSkONH7yUw==
X-Received: by 2002:a05:6000:430a:b0:3a1:f537:94d0 with SMTP id ffacd0b85a97d-3a35c853129mr221714f8f.41.1747324481186;
        Thu, 15 May 2025 08:54:41 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:b211:ad00:1096:2c00:b223:9747? ([2a01:4b00:b211:ad00:1096:2c00:b223:9747])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d961sm23551020f8f.62.2025.05.15.08.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:54:40 -0700 (PDT)
Message-ID: <ef6c91e8-19e5-4e86-be1d-dd066a141ec6@gmail.com>
Date: Thu, 15 May 2025 16:54:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] prctl: introduce PR_SET/GET_THP_POLICY
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <6502bbb7-e8b3-4520-9547-823207119061@lucifer.local>
 <5e4c107f-9db8-4212-99b6-a490406fec77@gmail.com>
 <e3efdfb7-d309-43c8-be39-c02d886c5b45@lucifer.local>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <e3efdfb7-d309-43c8-be39-c02d886c5b45@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15/05/2025 16:15, Lorenzo Stoakes wrote:
> Thanks for coming back to me so quickly, appreciated :)
> 
> I am reacting in a 'WTF' way here, but it's in proportion to the (at least
> perceived) magnitude of this change. We really need to be sure this is
> right.
> 

Lol I had to rewrite my replies a few times to tone them down.
Hopefully I don't come across as aggressive :)


> On Thu, May 15, 2025 at 03:50:47PM +0100, Usama Arif wrote:
>>
>>
>> On 15/05/2025 14:55, Lorenzo Stoakes wrote:
>>> On Thu, May 15, 2025 at 02:33:29PM +0100, Usama Arif wrote:
>>>> This allows to change the THP policy of a process, according to the value
>>>> set in arg2, all of which will be inherited during fork+exec:
>>>
>>> This is pretty confusing.
>>>
>>> It should be something like 'add a new prctl() option that allows...' etc.
>>>
>>>> - PR_THP_POLICY_DEFAULT_HUGE: This will set the MMF2_THP_VMA_DEFAULT_HUGE
>>>>   process flag which changes the default of new VMAs to be VM_HUGEPAGE. The
>>>>   call also modifies all existing VMAs that are not VM_NOHUGEPAGE
>>>>   to be VM_HUGEPAGE.
>>>
>>> This is referring to implementation detail that doesn't matter for an overview,
>>> just add a summary here e.g.
>>>
>>> PR_THP_POLICY_DEFAULT_HUGE - set VM_HUGEPAGE flag in all VMAs by default,
>>> including after fork/exec, ignoring global policy.
>>>
>>> PR_THP_POLICY_DEFAULT_NOHUGE - clear VM_HUGEPAGE flag in all VMAs by default,
>>> including after fork/exec, ignoring global policy.
>>>
>>> PR_THP_POLICY_DEFAULT_SYSTEM - Eliminate any policy set above.
>>
>> Hi Lorenzo,
>>
>> Thanks for the review. I will make the cover letter clearer in the next revision.
> 
> The next version should emphatically be an RFC also, please. Your cover letter
> should mention you're fundamentally changing mm_struct and VMA logic, and
> explain why your use cae is so important that that is justified.
> 

Thanks, will make it RFC and add that I am making changes to mm_struct and VMA logic.

>>
>>>
>>>>   This allows systems where the global policy is set to "madvise"
>>>>   to effectively have THPs always for the process. In an environment
>>>>   where different types of workloads are stacked on the same machine
>>>>   whose global policy is set to "madvise", this will allow workloads
>>>>   that benefit from always having hugepages to do so, without regressing
>>>>   those that don't.
>>>
>>> So does this just ignore and override the global policy? I'm not sure I'm
>>> comfortable with that.
>>
>> No. The decision making of when and what order THPs are allowed is not
>> changed, i.e. there are no changes in __thp_vma_allowable_orders and
>> thp_vma_allowable_orders. David has the same concern as you and this
>> current series is implementing what David suggested in
>> https://lore.kernel.org/all/3f7ba97d-04d5-4ea4-9f08-6ec3584e0d4c@redhat.com/
>>
>> It will change the existing VMA (NO)HUGE flags according to
>> the prctl. For e.g. doing PR_THP_POLICY_DEFAULT_HUGE will not give
>> a THP when global policy is never.
> 
> Umm...
> 
> +       case PR_SET_THP_POLICY:
> +               if (arg3 || arg4 || arg5)
> +                       return -EINVAL;
> +               if (mmap_write_lock_killable(me->mm))
> +                       return -EINTR;
> +               switch (arg2) {
> +               case PR_THP_POLICY_DEFAULT_HUGE:
> +                       set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
> +                       process_vmas_thp_default_huge(me->mm);
> +                       break;
> +               default:
> 
> 
> Where's the check against never? You're unconditionally setting VM_HUGEPAGE?

So this was from the discussion with David. My initial implementation in v1,
messed with the policy evaluation in thp_vma_allowable_orders and __thp_vma_allowable_orders.

The whole point of doing it this way is that you dont mess with the policy evaluation.

hugepage_global_always and hugepage_global_enabled will still evaluate to false
when never is set and you will not get a hugepage. But more on it below.

> 
> You're relying on VM_HUGEPAGE being ignored in this instance? But you're still:
> 
> 1. Setting VM_HUGEPAGE everywhere (and breaking VMA merging everywhere).
> 
> 2. Setting MMF2_THP_VMA_DEFAULT_HUGE and making it so PR_GET_THP_POLICY says it
>    has a policy of default huge even if policy is set to never?
> 
> I'm not ok with that. I'd much rather we do the never check here...
> 

I am ok with that. I can add a check over here that wraps this in:
if (hugepage_global_enabled())
	...

> Also see hugepage_madvise(). There's arch-specific code that overrides
> that, and you're now bypassing that (yes it's for one arch of course but
> it's still a thing)
> 

Thanks, I will put 
		if (mm_has_pgste(vma->vm_mm))
			return 0;
at the start.

>>
>>>
>>> What about if the the policy is 'never'? Does this override that? That seems
>>> completely wrong.
>>
>> No, it won't override it. hugepage_global_always and hugepage_global_enabled
>> will still evaluate to false and you wont get a hugepage no matter what prctl
>> is set.
> 
> Ack ok I see as above, you're relying on VM_HUGEPAGE enforcing htis.
> 
> You really need to put stuff like this in the cover letter though!!
> 

Sure will do in the next revision, Thanks.
>>
>>>
>>>> - PR_THP_POLICY_DEFAULT_NOHUGE: This will set the MMF2_THP_VMA_DEFAULT_NOHUGE
>>>>   process flag which changes the default of new VMAs to be VM_NOHUGEPAGE.
>>>>   The call also modifies all existing VMAs that are not VM_HUGEPAGE
>>>>   to be VM_NOHUGEPAGE.
>>>>   This allows systems where the global policy is set to "always"
>>>>   to effectively have THPs on madvise only for the process. In an
>>>>   environment where different types of workloads are stacked on the
>>>>   same machine whose global policy is set to "always", this will allow
>>>>   workloads that benefit from having hugepages on an madvise basis only
>>>>   to do so, without regressing those that benefit from having hugepages
>>>>   always.
>>>
>>> Wait, so 'no huge' means 'madvise'? What? This is confusing.
>>
>>
>> I probably made the cover letter confusing :) or maybe need to rename the flags.
>>
>> This flag work as follows:
>>
>> a) Changes the default flag of new VMAs to be VM_NOHUGEPAGE
>>
>> b) Modifies all existing VMAs that are not VM_HUGEPAGE to be VM_NOHUGEPAGE
>>
>> c) Is inherited during fork+exec
>>
>> I think maybe I should add VMA to the flag names and rename the flags to
>> PR_THP_POLICY_DEFAULT_VMA_(NO)HUGE ??
> 
> Please no :) 'VMA' is implicit re: mappings. If you're touching memory
> mappings you're necessarily touching VMAs.
> 
> I know some prctl() (a pathway to many abilities some consider to be
> unnatural) uses 'VMA' in some of the endpoints but generally when referring
> to specific VMAs no?
> 
> These namesa are already kinda horrible (yes naming is hard, for everyone,
> ask me about MADV_POISON/REMEDY) but I think something like:
> 
> PR_DEFAULT_MADV_HUGEPAGE
> PR_DEFAULT_MADV_NOHUGEPAGE
> 
> -ish :)
> 

Sure, happy with that, Thanks.
>>
>>>
>>>> - PR_THP_POLICY_DEFAULT_SYSTEM: This will clear the MMF2_THP_VMA_DEFAULT_HUGE
>>>>   and MMF2_THP_VMA_DEFAULT_NOHUGE process flags.
>>>>
>>>> These patches are required in rolling out hugepages in hyperscaler
>>>> configurations for workloads that benefit from them, where workloads are
>>>> stacked anda single THP global policy is likely to be used across the entire
>>>> fleet, and prctl will help override it.
>>>
>>> I don't understand this justification whatsoever. What does 'stacked' mean? And
>>> you're not justifying why you'd override the policy?
>>
>> By stacked I just meant different types of workloads running on the same machine.
>> Lets say we have a single server whose global policy is set to madvise.
>> You can have a container on that server running some database workload that best
>> works with madvise.
>> You can have another container on that same server running some AI workload that would
>> benefit from having VM_HUGEPAGE set on all new VMAs. We can use prctl
>> PR_THP_POLICY_DEFAULT_HUGE to get VM_HUGEPAGE set by default on all new VMAs for that
>> container.
>>
>>>
>>> This series has no actual justificaiton here at all? You really need to provide one.
>>>
>>
>> There was a discussion on the usecases in
>> https://lore.kernel.org/all/13b68fa0-8755-43d8-8504-d181c2d46134@gmail.com/
>>
>> I tried (and I guess failed :)) to summarize the justification from that thread.
> 
> It's fine, I have most definitely not been as clear as I could be in series
> too :>) just need to add a bigger summary.
> 
> Don't afraid to waffle on... (I know I am not... ;)
> 
>>
>> I will try and rephrase it here.
>>
>> In hyperscalers, we have a single THP policy for the entire fleet.
>> We have different types of workloads (e.g. AI/compute/databases/etc)
>> running on a single server (this is what I meant by 'stacked').
>> Some of these workloads will benefit from always getting THP at fault (or collapsed
>> by khugepaged), some of them will benefit by only getting them at madvise.
>>
>> This series is useful for 2 usecases:
>>
>> 1) global system policy = madvise, while we want some workloads to get THPs
>> at fault and by khugepaged :- some processes (e.g. AI workloads) benefits from getting
>> THPs at fault (and collapsed by khugepaged). Other workloads like databases will incur
>> regression (either a performance regression or they are completely memory bound and
>> even a very slight increase in memory will cause them to OOM). So what these patches
>> will do is allow setting prctl(PR_THP_POLICY_DEFAULT_HUGE) on the AI workloads,
>> (This is how workloads are deployed in our (Meta's/Facebook) fleet at this moment).
>>
>> 2) global system policy = always, while we want some workloads to get THPs
>> only on madvise basis :- Same reason as 1). What these patches
>> will do is allow setting prctl(PR_THP_POLICY_DEFAULT_NOHUGE) on the database
>> workloads.
>> (We hope this is us (Meta) in the near future, if a majority of workloads show that they
>> benefit from always, we flip the default host setting to "always" across the fleet and
>> workloads that regress can opt-out and be "madvise".
>> New services developed will then be tested with always by default. "always" is also the
>> default defconfig option upstream, so I would imagine this is faced by others as well.)
> 
> Right, but I'm not sure you're explaining why prctl(), one of the most cursed,
> neglected and frankly evil (maybe exaggerating :P) APIs in the kernel is the way
> to do this?
> 
> You do need to summarise why the suggested idea re: BPF, or cgroups, or whatnot
> is _totally unworkable_.
> 
> And why not process_madvise() with MADV_HUGEPAGE?
> 
> I'm also not sure fork/exec is a great situation to have, because are you sure
> the workloads stay the same across all fork/execs that you're now propagating?
> 
> It feels like this should be a cgroup thing, really.
> 

So I actually dont mind the cgroup implementation (that was actually my first
prototype and after that I saw there was someone who had posted it earlier).
It was shot down because it wont be hierarchical and doesnt solve it when
its not being done in a cgroup.

A large proportion of the thread in v1 was discussion with David, Johannes, Zi and
Yafang (the bpf THP policy author) on different ways of doing this.

>>
>> Hope this makes the justification for the patches clearer :)
> 
> Sure, please add this kind of thing to the cover letter to get fewer 'wtf'
> reactions :)
> 
> You're doing something really _big_ and _opinonated_ here though, that's
> basically fundamentally changing core stuff, so an extended discussion of why
> you feel it's so important, why other approaches are not workable, why the
> Sauron-spawned Mordor dwelling prctl() API is the way to go, etc.
> 
>>
>>>>
>>>> v1->v2:
>>>
>>> Where was the v1? Is it [0]?
>>>
>>> This seems like a massive change compared to that series?
>>>
>>> You've renamed it and not referenced the old series, please make sure you link
>>> it or somehow let somebody see what this is against, because it makes review
>>> difficult.
>>>
>>
>> Yes its the patch you linked below. Sorry should have linked it in this series.
>> Its a big change, but it was basically incorporating all feedback from David,
>> while trying to achieve a similar goal. Will link it in future series.
> 
> Yeah, again, this should have been an RFC on that basis :)
> 
>>
>>> [0]: https://lore.kernel.org/linux-mm/20250507141132.2773275-1-usamaarif642@gmail.com/
>>>
>>>> - change from modifying the THP decision making for the process, to modifying
>>>>   VMA flags only. This prevents further complicating the logic used to
>>>>   determine THP order (Thanks David!)
>>>> - change from using a prctl per policy change to just using PR_SET_THP_POLICY
>>>>   and arg2 to set the policy. (Zi Yan)
>>>> - Introduce PR_THP_POLICY_DEFAULT_NOHUGE and PR_THP_POLICY_DEFAULT_SYSTEM
>>>> - Add selftests and documentation.
>>>>
>>>> Usama Arif (6):
>>>>   prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the process
>>>>   prctl: introduce PR_THP_POLICY_DEFAULT_NOHUGE for the process
>>>>   prctl: introduce PR_THP_POLICY_SYSTEM for the process
>>>>   selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_NOHUGE
>>>>   selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_HUGE
>>>>   docs: transhuge: document process level THP controls
>>>>
>>>>  Documentation/admin-guide/mm/transhuge.rst    |  40 +++
>>>>  include/linux/huge_mm.h                       |   4 +
>>>>  include/linux/mm_types.h                      |  14 +
>>>>  include/uapi/linux/prctl.h                    |   6 +
>>>>  kernel/fork.c                                 |   1 +
>>>>  kernel/sys.c                                  |  35 +++
>>>>  mm/huge_memory.c                              |  56 ++++
>>>>  mm/vma.c                                      |   2 +
>>>>  tools/include/uapi/linux/prctl.h              |   6 +
>>>>  .../trace/beauty/include/uapi/linux/prctl.h   |   6 +
>>>>  tools/testing/selftests/prctl/Makefile        |   2 +-
>>>>  tools/testing/selftests/prctl/thp_policy.c    | 286 ++++++++++++++++++
>>>>  12 files changed, 457 insertions(+), 1 deletion(-)
>>>>  create mode 100644 tools/testing/selftests/prctl/thp_policy.c
>>>>
>>>> --
>>>> 2.47.1
>>>>
>>

