Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9B32253E0
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746727521; cv=none; b=u/NHBaWL9DB3arH9sXmR9tv+Y+yvot32Yy3gAgR8dH2spOmIntR89w5emi2C1wHD6zB5JVq3akH5LaRSzStF5tQDXW/tzTm/25EN2rQf2cDvZDnfATC5EYQ6iR8RADhBvzgxhjCuSCHzHbYRJAmB3QYBH+hGyYDuLP12US7UNUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746727521; c=relaxed/simple;
	bh=6lyNsx0n0oCa0zuPkywtGEH0b2NSWO9F2p7n98GsI58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bILya4cAHr0xf8WaejBWQdYH4SreBJk3nFESXwLXQE41cf9xE/6RKLyrzfaOQb4gTPcFVwuoXjpdT2A8y1wpNfI9qfzbjhfmX/KrhH/62RZJb3Dn0s23AY4T7m31wluOG+az3D2b0RuEB+CVOOFB90uxACUKVfi6HIa+//OUvBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNEtVYpI; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNEtVYpI"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb5ec407b1so216785566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746727518; x=1747332318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7hbLN/6f2Sh/M0mcYIBWUh9AjjCpvmSzUgBLIeIAR0=;
        b=HNEtVYpIysX+Tkx/5JNQTxGCrYuV6uFcqWKfXQqfcdn69nKC9PkwVMUyCBUJy9CTgJ
         fXX7ctozN9BW1bAZ/XGYOaF9+VWWgsCL5mO8OGf7ewZdNvbJUd79HuG5+oeJObtvStfB
         RBsqTG8Xbjin8o5UyF+l07/eCgTdtmlS6EiTX1zwn646CsRNX2fXzFBqL5eztJ9+u/Vj
         CLp2ImfSUb94+zyvq/Hu3fJKhwhF6cdd6SYOqOi+7bmtQTj2rI4TmvE0v3AmP9mP4rsX
         mz5I1n+w1RFj4gLyY8RqtTM1VW2crepoFrA6X/0JRylu5hGpud8AqBXjc5k6DmhWjQZP
         9gqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746727518; x=1747332318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7hbLN/6f2Sh/M0mcYIBWUh9AjjCpvmSzUgBLIeIAR0=;
        b=YnOImfJ4CIXXcHu5DnmzszTn/+c3dd2nuA8xmTm6ySVcyhbrBdlYNB/rLZ8VW6J/TF
         he3eayQGGScoxzzQ0NoAxG0I4/SuKYBW3l+U8kQK2ofltoDvtBYR6w0SF58kh+22nk/4
         B78eGVFBaT5GXLPtJ+bHuiSxSt35zyjpNcfQA9xfSYqr/h5OqnE9lFtml6D2mUwJg/R/
         mUBwAVR92ew3mMFFSXiwMx3jwSAHBUdjz87ee5AXbHpBk/4J4xaDVUqhuBkX0CZP/fMA
         0snzM7yrfNFZ8u28QJ9tkDohGjUNJF+VJvVZsgyHBYu94felANLSRU632zThQwEfjzDs
         ia5w==
X-Forwarded-Encrypted: i=1; AJvYcCXytrPUatgzKySbYuR2M/e4+sZcapbRdGL2wWEL/baOWdznwgo+KnF/TCEd3BPDH89AG4NKeaZtZTKD2I4=@vger.kernel.org
X-Gm-Message-State: AOJu0YynTBI9lKxAPUr8LcnweHgLYhd/NubBqqmvdi//vbn4lw+vZMNS
	1ouVRw/elr4vdytVRAUAzn2Ew9GoCYAQNUMqZ7UaQKXLLnkf9EbW
X-Gm-Gg: ASbGncvdAuTKUvEUKyxTWYUtkSdRbzblTpmIwK56+RLfdVvMjygAGQvPoIUy95VamDJ
	p6GlyWFaY6tNfM6eNKC1S+EvdiD+YmHcJ+xM6ot275V+Jqax9Yvnvc4VBzIII4mFsTekHZ3skeo
	VikVhw1nQH+OfN1NYjTSf5HtFnaO5jkmarnQ2PPrYsyUwanTcho29hY/akngY1L5zH1kOd1vUM/
	yL2u58GyhvKXYqCIOCx5TOJ8+IH32+uzRMRnryatXl6PoOPK7h+zpLNmVofB5Yr2tYyfUWpHhRo
	6e6mKFoppydJF4QZFrh2uTgwhtXhjb10obQ0DIpohH7sTm/Dop8xkxPm3trxp+VKcTTgKa2fbD5
	iLg0PFja1ptdXyPxM1EkHsGiGqA==
X-Google-Smtp-Source: AGHT+IFSbSzd1mKaH5gakwmdcCdpcWo+Wwbka7XYFXUOkAB0Q9AqaWPX9ZxwaQwOnuQs7wVgTXG0Og==
X-Received: by 2002:a17:907:3cd4:b0:ac4:169:3664 with SMTP id a640c23a62f3a-ad218fa9075mr63541266b.33.1746727518000;
        Thu, 08 May 2025 11:05:18 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:1c6a:8675:ac47:a9d0? ([2620:10d:c092:500::4:d248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21988d43asm19420566b.178.2025.05.08.11.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 11:05:17 -0700 (PDT)
Message-ID: <e971dcf1-9ea4-4a20-bbc2-7ffc1ff15d37@gmail.com>
Date: Thu, 8 May 2025 19:05:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <3b5d929f-ec2f-4444-825f-81e71f804033@redhat.com>
 <e706e2fc-201f-4e45-8dd9-e2e17c269466@gmail.com>
 <3f7ba97d-04d5-4ea4-9f08-6ec3584e0d4c@redhat.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <3f7ba97d-04d5-4ea4-9f08-6ec3584e0d4c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/05/2025 18:39, David Hildenbrand wrote:
>>> We did something similar with PR_SET_MEMORY_MERGE.
>>>
>>
>> For this you mean the prctl command would do for_each_vma and set VM_HUGEPAGE to implement point 2.
> 
> Yes. The expectation would be that the prctl is either a) triggered early when there are not that many VMAs yet or b) inherited during fork+exec such that the target process immediately gets it enabled for all VMAs.

Yes that is the case for us as well, For us its mostly going to be a, i.e. exec_invoke called by systemd. But b will be good as well.
> 
>> For having point 1, I think we will still need extra mm->flags, i.e. MMF_VM_THP_MADVISE/DEFER/ALWAYS/NEVER.
> 
> Yes, and it's unclear what we really want here.

Let me make a v2 and we might be able to have a better discussion once its done. I will move it to RFC.
> 
>>
>> I think it would have the same affect as what this patch is trying to do? But would be just more
>> expensive in terms of both code changes and the cost of the actual call as you now have to walk
>> all vmas. On the other hand you wont need the below diff in from v1. I do feel the current approach
>> in the patch is simpler? But if your point 3 is better in terms of code maintainability, happy to make
>> it the change to it in v2.
> 
> Yes. Having a toggle that
> 
> a) Changes the default of new VMAs to be VM_HUGEPAGE
> 
> b) Modifies all existing VMAs that are not VM_NOHUGEPAGE to be VM_HUGEPAGE
> 
> c) Is inherited during fork+exec
> 
> Would not add any additional checks in our already-complicated THP allocation logic, it simply changes the default/value of VM_HUGEPAGE.
> 
> 
> At least to me, this sounds like better semantics. Would that make your use case happy?
> 

Yes, this would work for us. Let me try and make this work in the way you described and also make it work for
MADVISE and NEVER, will send that in v2.

Thanks for the feedback!!



