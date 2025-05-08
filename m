Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147DC2836BE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746722114; cv=none; b=qiAVZRB5N2KzU9FzMjW6FOj8aij4l35s5+hXpkbRW4gdN7qVJo/5tM47zQ/xhcwthAdB+4PS+C/Ys0g5YdMsmIE4ht/SmJPFd4WNb1HMMgYtLIvSJvjr/oDlQ8GAUQdw0godg/Y5cKXnX+oOFR8njoknNuhzJfYSG/rzLCsZHqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746722114; c=relaxed/simple;
	bh=BTWMxiw7rvqrLaRjZ4NkbSbWPk2f46TuEVVrGDeWemM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lyC5+KN85FYW7U836v+zYkDupvtxyseT6c/AQewvGGeQ3nvcWWLEfIEz4L5ZE1OH/ab+cyI9hWPjj4OfSz87gg0S6qSbXmNiPhfzWiN57pOxy0W35/Dym2+jcF0ajHFfQtjB2DQXwNnqXqOJ2g+xGIEAdySRd3I6JiSCol4RXbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G36bsQfO; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G36bsQfO"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad1b94382b8so62893566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746722111; x=1747326911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jHyGHBJUaXvF+9cY/pYLHudacCmJqYOcWmvQRbveR/A=;
        b=G36bsQfOI0C544D7OZQ28UXYvUE+7OhDwJFHoK1sb3o1AbzL14kM/dUv1ForCzC8MI
         upy96VxRxeS/ZCVOVlGpqiPZy4FNUYgyJdngFQycc57++Wm90ok52w/wjO2wRyeempLs
         tJvQ4WavVoQ/ox7cjLknbGAcyiuMwkTArXdi6zadqp+B/R8P+E4n5aobI7uzgcyOy/QA
         GIgyT+0enwQ1yKIEpFkIvxLmavdlmF9pkoXAhLCYyMUCK0YTqB8z9puxmsR2dquO6Jsj
         T85YJLFApxTDbiFMl0IBAQ03BYhkQxpQCNtixGl3ytzOr5Ek++Ohsn0rSz+2PJnQ9uUE
         owag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746722111; x=1747326911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jHyGHBJUaXvF+9cY/pYLHudacCmJqYOcWmvQRbveR/A=;
        b=vVw9lNeB4sW9yLpUoNl5Tj5SHLZ60ZpR5yc7kOrtGjv2AJFukVYeonIm9KWGw89lHA
         uP7kJJQFHCMkYzwKqz7LPdCXgC3s/EIT1w2FkT7heJrp+d09VUltq7nNIjZ8eAjlsnOP
         XmdgfOYnfeCOwkUGmB5sTpxBkYOr6DAAunS2SVtAtFyTI2zS5Z/dpXhlS+VR+WwaWl5o
         t4WVnGc97TkDE5Go6B0DVCrN/VRmMjfrjdORpuDpf+RNVvnyuUey7GUeGV8E26JQrPMP
         AQwsg+rAUTPGVquRxD+UM+4dAxuJSg+LQNgm9+jzCZILckguaENbKKhDOfY/J59MHDSi
         Jq3g==
X-Forwarded-Encrypted: i=1; AJvYcCWwUPw77v62gyYKx+omkZFCAV2HoepNqMv7oRf1hkBtd+NFTSZNgqyXxPnPAvkvmj8ZQFrY4O2zzvexKWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpUTci+I29vcQ3b3no3qC/WhhPxx34d0lotQfuKUF5kFcKudQC
	pKuNWeUsjk8X7BWs/pHTZBk9QQ57N7FyEJEvxpdMpJ72CtVmCg/q
X-Gm-Gg: ASbGnct+Dn0/xHFZ+BMZEFhx93iGKDSbtPrSBSnJowFe6S7mkhmqhvK9+3SDldyT95y
	rCVEN9LXQA2OAX0TrbvXBl4pjTQN8K9dnn+UKiikCNcvFt0A1iCLvrPjakHmT8Mjwkck2H73r2r
	byVVCWFA0JVZiD8g0HV76V2a0gR+CnpgCyKwUZevtfTAfQoUuFJvDr7BLo9eY82VUurM7xuLziC
	aD4wQmF7bxOCGl3Uea+QvsDrziRwojRWJULJQCDpAlH901QGECBtwpjo+mmNQ9sytVDosjjXXiR
	injb6Ncdfg5H4K/7Ixtv47o+6AslB3vS1XGICsdqtOK/rSr3yEtU1Y2tFRYxPC+WMl0jJHtZ7f4
	2I7ow3NALJ1er7e5RjMckIXU/
X-Google-Smtp-Source: AGHT+IF/vnEgyoZA4S7VuuJSjHpkb42qJGtYJlNelnZudTkzK2HCSDBh7frfbj0eBA5f/Yop6ipwzg==
X-Received: by 2002:a17:907:7251:b0:acb:b864:829c with SMTP id a640c23a62f3a-ad218e5778bmr37505966b.10.1746722110966;
        Thu, 08 May 2025 09:35:10 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:14f7:eab6:23d5:4cab? ([2620:10d:c092:500::7:80fe])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197466adsm8949266b.92.2025.05.08.09.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 09:35:10 -0700 (PDT)
Message-ID: <e706e2fc-201f-4e45-8dd9-e2e17c269466@gmail.com>
Date: Thu, 8 May 2025 17:35:10 +0100
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
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <3b5d929f-ec2f-4444-825f-81e71f804033@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/05/2025 12:06, David Hildenbrand wrote:
> On 07.05.25 16:00, Usama Arif wrote:
>> Allowing override of global THP policy per process allows workloads
>> that have shown to benefit from hugepages to do so, without regressing
>> workloads that wouldn't benefit. This will allow such types of
>> workloads to be run/stacked on the same machine.
>>
>> It also helps in rolling out hugepages in hyperscaler configurations
>> for workloads that benefit from them, where a single THP policy is
>> likely to be used across the entire fleet, and prctl will help override it.
>>
>> An advantage of doing it via prctl vs creating a cgroup specific
>> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabled) is
>> that this will work even when there are no cgroups present, and my
>> understanding is there is a strong preference of cgroups controls being
>> hierarchical which usually means them having a numerical value.
>>
>>
>> The output and code of test program is below:
>>
>> [root@vm4 vmuser]# echo madvise > /sys/kernel/mm/transparent_hugepage/enabled
>> [root@vm4 vmuser]# echo inherit > /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
>> [root@vm4 vmuser]# ./a.out
>> Default THP setting:
>> THP is not set to 'always'.
>> PR_SET_THP_ALWAYS = 1
>> THP is set to 'always'.
>> PR_SET_THP_ALWAYS = 0
>> THP is not set to 'always'.
> 
> Some quick feedback:
> 
> (1) The "always" in PR_SET_THP_ALWAYS does not look future proof. Why wouldn't someone want to force-disable them for a process (-> "never") or set it to some other new mode ("-> defer" that is currently on the list).

Yes agree with this, I think there are 3 different possible ways forward for this which I outlined in [1] in reply to Zi Yan.
I like flags2 approach, but let me know what you think.

[1] https://lore.kernel.org/all/9ed673ad-764f-4f46-84a7-ef98b19d22ec@gmail.com/
> 
> (2) In your example, is the toggle specific to 2M THP or the global toggle ...? Unclear. And that makes this interface also suboptimal.

In this approach you would overwrite inherit folio sizes, and I think thats the right approach. So if you have for e.g. 2M and 16K set to inherit,
and the global one is set to madvise, doing PR_SET_THP_ALWAYS would change those folio to always.

> 
> (3) I'm a bit concerned about interaction with per-VMA settings (the one we already have, and order-specific ones that people were discussing). It's going to be a mess if we have global, per-process, per-vma and then some other policies (ebpf? whatever else?) on top.
> 
> 
> The low-hanging fruit would be a per-process toggle that only controls the existing per-VMA toggle: for example, with the semantics that
> 
> (1) All new (applicable) VMAs start with VM_HUGEPAGE
> (2) All existing (applicable) VMAs that are *not* VM_NOHUGEPAGE become VM_HUGEPAGE.
> 
> 
> We did something similar with PR_SET_MEMORY_MERGE.
> 

For this you mean the prctl command would do for_each_vma and set VM_HUGEPAGE to implement point 2.
For having point 1, I think we will still need extra mm->flags, i.e. MMF_VM_THP_MADVISE/DEFER/ALWAYS/NEVER.

I think it would have the same affect as what this patch is trying to do? But would be just more
expensive in terms of both code changes and the cost of the actual call as you now have to walk
all vmas. On the other hand you wont need the below diff in from v1. I do feel the current approach
in the patch is simpler? But if your point 3 is better in terms of code maintainability, happy to make
it the change to it in v2. 


diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 2f190c90192d..0587dc4b8e2d 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -293,7 +293,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
                if (vm_flags & VM_HUGEPAGE)
                        mask |= READ_ONCE(huge_anon_orders_madvise);
                if (hugepage_global_always() ||
-                   ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
+                   ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()) ||
+                   test_bit(MMF_THP_ALWAYS, &vma->vm_mm->flags))
                        mask |= READ_ONCE(huge_anon_orders_inherit);
 
                orders &= mask; 
