Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF931F153C;
	Thu, 15 May 2025 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320652; cv=none; b=nyafX9e2Ql8FoWmcJe4HXHth0lGlqlFLsEgnz97m7ru4nNpWb0FJFNeXujGooBuVxMreVab1au+z/2FQ+06SaSDa8OI0RzYQ2LXQaxK4/5I/bmgjESmxJAomDzPjoIC+2SXl5naeXevBJ93Jc5H2e2RONWQe8kgpRGGOcDRquWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320652; c=relaxed/simple;
	bh=zTVUkT9H/eI878W4CE2bnmENuoMXQB32THJXF04sy1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hz5uXsNKpfZSoduTHlaqksHn5L/Kk9gas9nxpLKL1xMwUp4ahVhsRgiIQ7/9QGhtUXqJ8AM3xOnYK9DpVxavUAz8uiuKm0PWvNeN05SDEQnolyyZ/Ui8Hayr3lNorvfyHw5cmlboQ8YURceiXdEbkgmyCVIUZ1kBLDa4geQlSZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZwVit9I; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZwVit9I"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso11096245e9.0;
        Thu, 15 May 2025 07:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747320648; x=1747925448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GuVrR218OTIKMuet6zzIKhyiz67c2WUQNm8GReKqZo=;
        b=QZwVit9ILscyw/M9JMRpp+u1pWE7/tp0jpet10PSSU5XGyGV/9iXB4ggTH44gmEbNk
         uO+AexTWqtA4ipZjqGrDMSjpgqltD0rluDKM7WnYIqkvAfnNov4HrWXX5dwKV4N5fJHS
         XOwHnlgSvW8f9r8fxPp5LFd6v6iOonA3yZbss5yYKqeaiEBKstFDgJqjgzBmkgFvXFE1
         /JKTWMSbwaj9mjVZKHEN3WWGYSX3ZHSk4N6oNJV84epziV62OI72or3qyBp/drH17nWs
         jzq0YYaZ1WGNqgck4oQ613qEtj5P+63+18TvlMr/ysSWUkj1cuSUss7cdsDS3I5Mhyrz
         v7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320648; x=1747925448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GuVrR218OTIKMuet6zzIKhyiz67c2WUQNm8GReKqZo=;
        b=C7jgYZhENYjkUIPnhJtPxYAVmuTCbZ6RulcOcsLAgQhXXJSTshKthndYcb1oGk4SNp
         j+DnK/RT8Xuk7KyFHnHQ1Z/HrJx14FWsWtJr4Eva/KnpUMPD/dCyHf2BPLxB2O2/dwyo
         bUGFjrPWcRE16yZAKYtD4TB2vHajHM8lG/T+7H4ZGka+xPx37PLtJ1o9+nF1COj9v95t
         cXUwcsTZyEWZmkQ22jFxdyFW0r+f+e0WlNEpkpHCooD8Bk7fOM3ynguzvIAdPLPah8h1
         xbt1vbUGwV1Epnc9uVOdKIUPegdQo9BwKKLiKGaw1lvScLKUvTfy4bjkt+2Z2CxP8sLm
         mOXg==
X-Forwarded-Encrypted: i=1; AJvYcCWbjRm2DJzfCL9lxX1Obm1dLE9MG7lWbY9E6sS+wpQBWJJ9DQhQ0hpTnI7zo8IW0XH65sYZ8e5Yhc8=@vger.kernel.org, AJvYcCWrWhyGPNT87yTbiPS43RAGWNjWBfoMu28XT/9nbKhyRgWeoeavUU0lmVBLf3Ql9cXuDwBcwGJxc1ya1iqx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgwk4NEtXoRLNmgY95COGXX+n2cnUOPP72/Q8223Wi17ZuXVmc
	BhRtjgRa2FnT9dNsi5h+LzMdxxsEuObuQwAR/8UsjjAFhoB1bG2q
X-Gm-Gg: ASbGncuscM9F6ZQfK/kKBNUZHkjxhmVbpro/MwdpGQ+qqYz7GWQa/X58r6rutsB87+A
	9S7SRUQqqzXU8IqZ2o6mRS3836GcF0pbjzIKmdn0WiKaet4khIbP/s+GnBNQMZcw+Na6kPkgG/I
	cX7fDtl9tabo/z10johMUPAgzhqizTcjmuwjpVh0TmFm4hS5BYXjGRzSzMUgvqTvX1mEbdQsVJM
	bpJa8IDHuxoEbAbHN2Md8GqXPNUqb/pzY/7olaH9GPIr2qMAu2nQ6BIFsTS+spjFgGgESjCrhY9
	nskpT49iS+v0by1FAmFquX7rD2R56sj0im98rEgsEsmVhxgVCiRnr2rpjwrf/OziMdGCxoPpiOu
	enmMzYc5z3MC+9bunwsK98fLibvVIoQyGIxUTkQuYOdcNCfI=
X-Google-Smtp-Source: AGHT+IGLlYxUOv3wMLNiKWUkaDJQTkJgIA/yeIbbcT3MiDxc+AeU9uYZmu24kvdmZnnE9FDI9YerxA==
X-Received: by 2002:a05:600c:1986:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-442f4735b63mr71905045e9.12.1747320648103;
        Thu, 15 May 2025 07:50:48 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:b211:ad00:1096:2c00:b223:9747? ([2a01:4b00:b211:ad00:1096:2c00:b223:9747])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380615sm71009705e9.16.2025.05.15.07.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 07:50:47 -0700 (PDT)
Message-ID: <5e4c107f-9db8-4212-99b6-a490406fec77@gmail.com>
Date: Thu, 15 May 2025 15:50:47 +0100
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
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <6502bbb7-e8b3-4520-9547-823207119061@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15/05/2025 14:55, Lorenzo Stoakes wrote:
> On Thu, May 15, 2025 at 02:33:29PM +0100, Usama Arif wrote:
>> This allows to change the THP policy of a process, according to the value
>> set in arg2, all of which will be inherited during fork+exec:
> 
> This is pretty confusing.
> 
> It should be something like 'add a new prctl() option that allows...' etc.
> 
>> - PR_THP_POLICY_DEFAULT_HUGE: This will set the MMF2_THP_VMA_DEFAULT_HUGE
>>   process flag which changes the default of new VMAs to be VM_HUGEPAGE. The
>>   call also modifies all existing VMAs that are not VM_NOHUGEPAGE
>>   to be VM_HUGEPAGE.
> 
> This is referring to implementation detail that doesn't matter for an overview,
> just add a summary here e.g.
> 
> PR_THP_POLICY_DEFAULT_HUGE - set VM_HUGEPAGE flag in all VMAs by default,
> including after fork/exec, ignoring global policy.
> 
> PR_THP_POLICY_DEFAULT_NOHUGE - clear VM_HUGEPAGE flag in all VMAs by default,
> including after fork/exec, ignoring global policy.
> 
> PR_THP_POLICY_DEFAULT_SYSTEM - Eliminate any policy set above.

Hi Lorenzo,

Thanks for the review. I will make the cover letter clearer in the next revision.

> 
>>   This allows systems where the global policy is set to "madvise"
>>   to effectively have THPs always for the process. In an environment
>>   where different types of workloads are stacked on the same machine
>>   whose global policy is set to "madvise", this will allow workloads
>>   that benefit from always having hugepages to do so, without regressing
>>   those that don't.
> 
> So does this just ignore and override the global policy? I'm not sure I'm
> comfortable with that.

No. The decision making of when and what order THPs are allowed is not
changed, i.e. there are no changes in __thp_vma_allowable_orders and
thp_vma_allowable_orders. David has the same concern as you and this
current series is implementing what David suggested in
https://lore.kernel.org/all/3f7ba97d-04d5-4ea4-9f08-6ec3584e0d4c@redhat.com/

It will change the existing VMA (NO)HUGE flags according to
the prctl. For e.g. doing PR_THP_POLICY_DEFAULT_HUGE will not give
a THP when global policy is never. 

> 
> What about if the the policy is 'never'? Does this override that? That seems
> completely wrong.

No, it won't override it. hugepage_global_always and hugepage_global_enabled
will still evaluate to false and you wont get a hugepage no matter what prctl
is set.

> 
>> - PR_THP_POLICY_DEFAULT_NOHUGE: This will set the MMF2_THP_VMA_DEFAULT_NOHUGE
>>   process flag which changes the default of new VMAs to be VM_NOHUGEPAGE.
>>   The call also modifies all existing VMAs that are not VM_HUGEPAGE
>>   to be VM_NOHUGEPAGE.
>>   This allows systems where the global policy is set to "always"
>>   to effectively have THPs on madvise only for the process. In an
>>   environment where different types of workloads are stacked on the
>>   same machine whose global policy is set to "always", this will allow
>>   workloads that benefit from having hugepages on an madvise basis only
>>   to do so, without regressing those that benefit from having hugepages
>>   always.
> 
> Wait, so 'no huge' means 'madvise'? What? This is confusing.


I probably made the cover letter confusing :) or maybe need to rename the flags.

This flag work as follows: 

a) Changes the default flag of new VMAs to be VM_NOHUGEPAGE

b) Modifies all existing VMAs that are not VM_HUGEPAGE to be VM_NOHUGEPAGE

c) Is inherited during fork+exec

I think maybe I should add VMA to the flag names and rename the flags to
PR_THP_POLICY_DEFAULT_VMA_(NO)HUGE ??

> 
>> - PR_THP_POLICY_DEFAULT_SYSTEM: This will clear the MMF2_THP_VMA_DEFAULT_HUGE
>>   and MMF2_THP_VMA_DEFAULT_NOHUGE process flags.
>>
>> These patches are required in rolling out hugepages in hyperscaler
>> configurations for workloads that benefit from them, where workloads are
>> stacked anda single THP global policy is likely to be used across the entire
>> fleet, and prctl will help override it.
> 
> I don't understand this justification whatsoever. What does 'stacked' mean? And
> you're not justifying why you'd override the policy?

By stacked I just meant different types of workloads running on the same machine.
Lets say we have a single server whose global policy is set to madvise.
You can have a container on that server running some database workload that best
works with madvise.
You can have another container on that same server running some AI workload that would
benefit from having VM_HUGEPAGE set on all new VMAs. We can use prctl
PR_THP_POLICY_DEFAULT_HUGE to get VM_HUGEPAGE set by default on all new VMAs for that
container.

> 
> This series has no actual justificaiton here at all? You really need to provide one.
> 

There was a discussion on the usecases in
https://lore.kernel.org/all/13b68fa0-8755-43d8-8504-d181c2d46134@gmail.com/

I tried (and I guess failed :)) to summarize the justification from that thread.

I will try and rephrase it here.

In hyperscalers, we have a single THP policy for the entire fleet.
We have different types of workloads (e.g. AI/compute/databases/etc)
running on a single server (this is what I meant by 'stacked').
Some of these workloads will benefit from always getting THP at fault (or collapsed
by khugepaged), some of them will benefit by only getting them at madvise.

This series is useful for 2 usecases:

1) global system policy = madvise, while we want some workloads to get THPs
at fault and by khugepaged :- some processes (e.g. AI workloads) benefits from getting
THPs at fault (and collapsed by khugepaged). Other workloads like databases will incur
regression (either a performance regression or they are completely memory bound and
even a very slight increase in memory will cause them to OOM). So what these patches
will do is allow setting prctl(PR_THP_POLICY_DEFAULT_HUGE) on the AI workloads,
(This is how workloads are deployed in our (Meta's/Facebook) fleet at this moment).

2) global system policy = always, while we want some workloads to get THPs
only on madvise basis :- Same reason as 1). What these patches
will do is allow setting prctl(PR_THP_POLICY_DEFAULT_NOHUGE) on the database
workloads.
(We hope this is us (Meta) in the near future, if a majority of workloads show that they
benefit from always, we flip the default host setting to "always" across the fleet and
workloads that regress can opt-out and be "madvise".
New services developed will then be tested with always by default. "always" is also the
default defconfig option upstream, so I would imagine this is faced by others as well.)

Hope this makes the justification for the patches clearer :)

>>
>> v1->v2:
> 
> Where was the v1? Is it [0]?
> 
> This seems like a massive change compared to that series?
> 
> You've renamed it and not referenced the old series, please make sure you link
> it or somehow let somebody see what this is against, because it makes review
> difficult.
> 

Yes its the patch you linked below. Sorry should have linked it in this series.
Its a big change, but it was basically incorporating all feedback from David,
while trying to achieve a similar goal. Will link it in future series.

> [0]: https://lore.kernel.org/linux-mm/20250507141132.2773275-1-usamaarif642@gmail.com/
> 
>> - change from modifying the THP decision making for the process, to modifying
>>   VMA flags only. This prevents further complicating the logic used to
>>   determine THP order (Thanks David!)
>> - change from using a prctl per policy change to just using PR_SET_THP_POLICY
>>   and arg2 to set the policy. (Zi Yan)
>> - Introduce PR_THP_POLICY_DEFAULT_NOHUGE and PR_THP_POLICY_DEFAULT_SYSTEM
>> - Add selftests and documentation.
>>
>> Usama Arif (6):
>>   prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the process
>>   prctl: introduce PR_THP_POLICY_DEFAULT_NOHUGE for the process
>>   prctl: introduce PR_THP_POLICY_SYSTEM for the process
>>   selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_NOHUGE
>>   selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_HUGE
>>   docs: transhuge: document process level THP controls
>>
>>  Documentation/admin-guide/mm/transhuge.rst    |  40 +++
>>  include/linux/huge_mm.h                       |   4 +
>>  include/linux/mm_types.h                      |  14 +
>>  include/uapi/linux/prctl.h                    |   6 +
>>  kernel/fork.c                                 |   1 +
>>  kernel/sys.c                                  |  35 +++
>>  mm/huge_memory.c                              |  56 ++++
>>  mm/vma.c                                      |   2 +
>>  tools/include/uapi/linux/prctl.h              |   6 +
>>  .../trace/beauty/include/uapi/linux/prctl.h   |   6 +
>>  tools/testing/selftests/prctl/Makefile        |   2 +-
>>  tools/testing/selftests/prctl/thp_policy.c    | 286 ++++++++++++++++++
>>  12 files changed, 457 insertions(+), 1 deletion(-)
>>  create mode 100644 tools/testing/selftests/prctl/thp_policy.c
>>
>> --
>> 2.47.1
>>

