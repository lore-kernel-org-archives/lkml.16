Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743454B1E78
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746701622; cv=none; b=Vh/mQaUeykgw/A3K/F9/lIRzZQJP7zI/4f7VcWKoGtuihb5B7QjBSE8kTMGk4dQfyb4FXqssMNnLIuz3dDEQVjh5uTwxCHGUTFluWb9+yk6jiQZED/oRAb0Gk52C0ZKKt1zyguIjaaJ16SNM4LoqfIdAVaKouEr6iDlv9Ep/EM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746701622; c=relaxed/simple;
	bh=Nd9SQQsuBkJ/suaTHvC3idgyOuA/CQ3UdVj1wze3OJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXIgXmEgDC4Xy89LFm55gX/54Pkdwy/+1j3Vn077Y4x1r4ZDlmf/NhU1VOVjohmCUEBB09sXawJDnHNRSnQfgccWdH90zIXU/Ytzbbvhhv+5x5ikFF0KI32JeUFvZp3vlBe2vnqieAmVri7lUUU9fvwoA+mAq46mBbcjXU6dU3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=An1WkWR4; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="An1WkWR4"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5fbee322ddaso1650860a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746701619; x=1747306419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwPQ+gg+wPg5YjTheQ7VpOalbImlERYLgEeoV5yWBRo=;
        b=An1WkWR4hyPlgCzQInucbvbQjDOYpJsdrWG6amfpPRNdSguP30DpJvwsvJwtWyB6UB
         E45DR8B6gWuNuHq6HAki1YlppGt/J5wKJrYFsnmC/ns+qeZ0q7gR/O/mD41zbtvtqEkt
         9OrnPewUVZQIGw+kuimWWfzOzHEgzxdMtsOGoT2PWtohUuxdQi+vXf3KHaVDQVvaWhZL
         ge7onL3SjajWRalwE7m4RFvg9wiFbqudtMPfGjDvHZL2gYscaAJe0CToGiE94pwhJvg6
         owdNio0lE3K4uy9ilthx6Q9BeOftoYM5VndTCVIvaZ2EI2BqjHmCY2Pra8JS1SCgOkSE
         Colg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746701619; x=1747306419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwPQ+gg+wPg5YjTheQ7VpOalbImlERYLgEeoV5yWBRo=;
        b=SZ3UVRBVW8lOpZh36FZ3dpDNRLVboLUDDab/CMQ4UVKM4srOPwMXN3jeLu3C9frUBh
         mNZKBBbF9yx0FbK7kbs09zVfiGzLw4RNmDGX9WhcvC1XGJTLC3qSDBuG+T4NXKoz6w4U
         3G7sozWdcYrLP77ScVP+RD4WdswAA5ucdMuDJImPEhlf3RsLSBotOO3mMenCUivIbcqS
         KH16MUX8qH3ZLqJAo1mUTg3IuYmw8GfduuxgDl/CXsP+H6/i0ywj7hxtwL1ykoMKAxl8
         9W6TdzlIdWBqpBc+E0Q9aT1nqaqz3J9MK+z9xz74g196Z2XWjKr199ZgVxqVFby57XQn
         SAXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpm1YypsaQdZy7PqLwrwyB44C4psdXbAk36p+PA6NIkIOkxwmX76u33u8UsuhCGSd6bo1WbcLz7fxseok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+/p4MabeobXbi+Pq+XhaxeMHAfDcKZINyOBvBhUj4MXOYq6WE
	G0laXVZ3JFGEQrlteB5SGANu2vxG8QJ7znaqjdYvSHZwQo/ZmrMt
X-Gm-Gg: ASbGncvxYIDkiCA+F6ArRo5d4G0U/eMCHyQztQ2mELHxa2oVdRocr68Bzvylve6x5+v
	dPSCxyzJwuMpA0pRVKBtHURaI24E7/Kz0KkOSz5AG/LnYjOCNq5rQfaWGqpLkuDlixCv0VOvtvB
	NFE9hxwE19kBG+DGM/qsapOEKbHBKzv5cUtCTsJfnsS0BgqdLmv7C55O4D4E1wfuAwaW465+f5U
	IiyCixfigVz+wYUFbXWxCcPwzB5EcvD6Kyrd9bnYhwfij3RvAzcUqDB2ThL3KzWeCGLfTJTCq5d
	sHV12jD43Uh2G4BW7jvFtJgbQ3ugmYS7OhEg52L53SgJl+TeYFg6Mt/lya6SMfEZ6n2LEgQT3VI
	Dn23OvgV9seXpTewUfHY=
X-Google-Smtp-Source: AGHT+IFL2P+YmhOEShrsrt8+S52mQxeSmRrDC4Ezhehe0KaI2QLRHd3VYQPAHXh8zr9RbxDh9u7tOg==
X-Received: by 2002:a05:6402:5244:b0:5fa:b131:f009 with SMTP id 4fb4d7f45d1cf-5fbe96b0e7fmr5822282a12.0.1746701618230;
        Thu, 08 May 2025 03:53:38 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:14f7:eab6:23d5:4cab? ([2620:10d:c092:500::4:ef16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faf540cb77sm8017775a12.80.2025.05.08.03.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 03:53:37 -0700 (PDT)
Message-ID: <9ed673ad-764f-4f46-84a7-ef98b19d22ec@gmail.com>
Date: Thu, 8 May 2025 11:53:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] prctl: allow overriding system THP policy to always
 per process
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <20250507141132.2773275-2-usamaarif642@gmail.com>
 <97FEC8A9-A8F6-4023-913F-5187062B0E3A@nvidia.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <97FEC8A9-A8F6-4023-913F-5187062B0E3A@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/05/2025 21:14, Zi Yan wrote:
> On 7 May 2025, at 10:00, Usama Arif wrote:
> 
>> Allowing override of global THP policy per process allows workloads
>> that have shown to benefit from hugepages to do so, without regressing
>> workloads that wouldn't benefit. This will allow such types of workloads
>> to be run/stacked on the same machine.
>>
>> It also helps in rolling out hugepages in hyperscaler configurations
>> for workloads that benefit from them, where a single THP policy is likely
>> to be used across the entire fleet, and prctl will help override it.
>>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>> ---
>>  include/linux/huge_mm.h                          |  3 ++-
>>  include/linux/mm_types.h                         |  7 ++-----
>>  include/uapi/linux/prctl.h                       |  3 +++
>>  kernel/sys.c                                     | 16 ++++++++++++++++
>>  tools/include/uapi/linux/prctl.h                 |  3 +++
>>  .../perf/trace/beauty/include/uapi/linux/prctl.h |  3 +++
>>  6 files changed, 29 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index 2f190c90192d..0587dc4b8e2d 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -293,7 +293,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>>  		if (vm_flags & VM_HUGEPAGE)
>>  			mask |= READ_ONCE(huge_anon_orders_madvise);
>>  		if (hugepage_global_always() ||
>> -		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
>> +		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()) ||
>> +		    test_bit(MMF_THP_ALWAYS, &vma->vm_mm->flags))
>>  			mask |= READ_ONCE(huge_anon_orders_inherit);
>>
>>  		orders &= mask;
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index e76bade9ebb1..9bcd72b2b191 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -1704,11 +1704,8 @@ enum {
>>  #define MMF_VM_MERGEABLE	16	/* KSM may merge identical pages */
>>  #define MMF_VM_HUGEPAGE		17	/* set when mm is available for khugepaged */
>>
>> -/*
>> - * This one-shot flag is dropped due to necessity of changing exe once again
>> - * on NFS restore
>> - */
>> -//#define MMF_EXE_FILE_CHANGED	18	/* see prctl_set_mm_exe_file() */
>> +/* override inherited page sizes to always for the entire process */
>> + #define MMF_THP_ALWAYS	18
> 
> Could we have something like MMF_THP_POLICY_SET and another field
> for "always"? Otherwise, how are we going to set MMF_THP_MADVISE if
> we want it in the future?
> 

So we actually need MMF_THP_MADVISE as well. If we have the entire fleet system
policy set to always, but if certain workloads regress with it, then we need to
prctl MADVISE them.

As you said, either we have:
- MMF_THP_MADVISE as another flag. The issue with this is we have run out
of bits in mm->flags for 32 bit machines. So either we introduce another member
in mm_struct (maybe mm_struct->flags2?), or we start using bits 32 and above of
flags field, limit this to 64 bit architectures and wrap the code with #ifdefs.
This is probably ugly, but if its ok for upstream, happy to do that.
- MMF_THP_POLICY_SET + another field to specify what the policy is, the issue
with this might be another field per mm_struct/process. Having an entire field
just for this might be wasteful, so I think I would prefer having just
mm_struct->flags2 and use up only 1 bit of it, and the rest can be used for
anything else in the future.

I think the flags2 approach is likely the best, but let me know what you think.

>>
>>  #define MMF_HAS_UPROBES		19	/* has uprobes */
>>  #define MMF_RECALC_UPROBES	20	/* MMF_HAS_UPROBES can be wrong */
>> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
>> index 15c18ef4eb11..22c526681562 100644
>> --- a/include/uapi/linux/prctl.h
>> +++ b/include/uapi/linux/prctl.h
>> @@ -364,4 +364,7 @@ struct prctl_mm_map {
>>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
>>
>> +#define PR_SET_THP_ALWAYS	78
>> +#define PR_GET_THP_ALWAYS	79
>> +
>>  #endif /* _LINUX_PRCTL_H */
>> diff --git a/kernel/sys.c b/kernel/sys.c
>> index c434968e9f5d..ee56b059ff1f 100644
>> --- a/kernel/sys.c
>> +++ b/kernel/sys.c
>> @@ -2658,6 +2658,22 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>>  			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
>>  		mmap_write_unlock(me->mm);
>>  		break;
>> +	case PR_GET_THP_ALWAYS:
>> +		if (arg2 || arg3 || arg4 || arg5)
>> +			return -EINVAL;
>> +		error = !!test_bit(MMF_THP_ALWAYS, &me->mm->flags);
>> +		break;
>> +	case PR_SET_THP_ALWAYS:
>> +		if (arg3 || arg4 || arg5)
>> +			return -EINVAL;
>> +		if (mmap_write_lock_killable(me->mm))
>> +			return -EINTR;
>> +		if (arg2)
>> +			set_bit(MMF_THP_ALWAYS, &me->mm->flags);
>> +		else
>> +			clear_bit(MMF_THP_ALWAYS, &me->mm->flags);
>> +		mmap_write_unlock(me->mm);
>> +		break;
> 
> prctl can take more than one arguments. Would it be better to add
> PR_SET_THP_POLICY and PR_GET_THP_POLICY and specify PR_THP_POLICY_ALWAYS
> in the second argument? So that in the future, if we want to add
> more THP policies, we do not need to keep piling up PR_{GET,SET}_THP_*?

I am ok with either, with prctl values there isnt any limit like MMF.
I went with how the other prctls are used, i.e. PR_SET_THP_DISABLE uses
arg2 to check if it needs to be enabled (non 0)/disabled (0 value).

I think having PR_GET/SET_THP_ALWAYS/MADVISE could be better as it would
work similar to how existing PR_* (PR_SET_THP_DISABLE) works with arg2
used for enabling/disabling and we dont have any limits for the number
of PR_* that can exist. But also happy to change it to PR_GET/SET_THP_POLICY.

> 
>>  	case PR_MPX_ENABLE_MANAGEMENT:
>>  	case PR_MPX_DISABLE_MANAGEMENT:
>>  		/* No longer implemented: */
>> diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
>> index 35791791a879..f5f6cff42b3f 100644
>> --- a/tools/include/uapi/linux/prctl.h
>> +++ b/tools/include/uapi/linux/prctl.h
>> @@ -328,4 +328,7 @@ struct prctl_mm_map {
>>  # define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
>>  # define PR_PPC_DEXCR_CTRL_MASK		0x1f
>>
>> +#define PR_GET_THP_ALWAYS	78
>> +#define PR_SET_THP_ALWAYS	79
>> +
>>  #endif /* _LINUX_PRCTL_H */
>> diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
>> index 15c18ef4eb11..680996d56faf 100644
>> --- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
>> +++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
>> @@ -364,4 +364,7 @@ struct prctl_mm_map {
>>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
>>
>> +#define PR_GET_THP_ALWAYS	78
>> +#define PR_SET_THP_ALWAYS	79
>> +
>>  #endif /* _LINUX_PRCTL_H */
>> -- 
>> 2.47.1
> 
> 
> --
> Best Regards,
> Yan, Zi

