Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE1F1372
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746972492; cv=none; b=npx7fe2wsudqXOhICTPpYudf37FYJQwmOGi+OqHHjpvOR2q4uiH2yLdsqWGEYQKdzfoeFcDBy0Y66qmVHRc28sGBCuSTvKouGmHcOkA94nzZgSmcNjBNnjNX80PfVbc+QkY6g5zWWOQU5IyKlwKWtz8toG4mHRVZvaFuXTGvPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746972492; c=relaxed/simple;
	bh=HMZRcXLWNkIKNIKkP5PEX4TkY9RAl0NuOM2GUuhli5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F61GatZsCu9TbkB0j0Td+5SDjdL5L0I3yVxJGW/IWZ7yYNwmoHRJDo44PSk1jfmia/zfw1Mf9g8JxnRZ9DqKFCiHL1qUZQTxTVmtSCMtlkKyOmYySDKO+My3ppX1v+MzByY/fInLJdYx99BbFm8dl3rl3m9x9NtDTvCtW2UFZEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKp9HPcc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKp9HPcc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf680d351so26671045e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 07:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746972488; x=1747577288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8axzo8yOdCmehlpZ/NfVBO0iMmQJTUTX8U3nxV5mbN4=;
        b=jKp9HPccDJudBPkZagwoo6Cg3jX93POMLns3TJs1HZhBsF7y5PZdl4Y0YO08D5m/n3
         xRahzZTkPKdDqTCOrShOGCEvp2tuYtQfTn0d+vpDLbfLHIiRqJh+nwM+5BKk8TC4DWQU
         1M7WC4uN0Gpt/KEipsHDYWjTDPSTMcQ+lQDXs7XsqsMbozBFd43LWIc+Ze6w+8m3UEqL
         gFrGLbAfNqzOqjCSYg2SciXohBKfIX/EAgwW2GQMtFkJBmZZAChtc07jpEMUwBilnQ3i
         u7ZlrkPgVW4G9U6zMVAa8Bd/DU6YcxSq8cTsv8Cr7ShwJqSPVf+xZz7Sa0cAu5UjODtZ
         tvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746972488; x=1747577288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8axzo8yOdCmehlpZ/NfVBO0iMmQJTUTX8U3nxV5mbN4=;
        b=PTgWDuIcfvXBLmR+y3gsLgC+2DiHAevJvzTnD+JmEzYTxAAgpc+54tUsb7L/binyRi
         F2eYifOzQcgB8yVqtFzoUgfIL1KxEheN+kFvK1SkhRwZp9erRs62E4/VjvMQKUpQH+kJ
         UJrwO6//J4cgukYkRVJTCTYROdJHSvfppcsh+PAfwZcpAxTrHd7gbBv7uWbHJqVWuAFb
         DEQrcV3Hi/WQ7Nf/pnt1QpHKtwe/6C5X5bzXpA3koy2bKY4AKx1WOWItNE1kjJppfKOb
         JXhUtRyRIPQ0SpaA3ZKlbWnqqAzimyRBjPfAx4WKTDiNu8NCjU1QdHvCH+8iFCm8uWu3
         WE9g==
X-Forwarded-Encrypted: i=1; AJvYcCVprdKAyEZZGoVF9XGv80YlZeEEU+1HiI3YIk7KuBcpMyuIQUM7FA8SdHN14/3DGztd57OUs8hDuQcxg1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnBVPVsoQOyseQNES/SUeJK8Ji7bcW9Psi3dhC8bMV5il3IuWt
	XZoBMlKMo8eu+0w1u9xTIkLuskFZb2LE+9uZOeMAzI6GGD8ujpfj
X-Gm-Gg: ASbGncsR9fEzZCv74dC2wJOOMnDH+227lgjWCfvthWrp9AC3GRTJ3d2T6vnz6hxfMtk
	tyOUVdWO31B1cPHZc38xByk8aG1Y8DXQumjMw01Z5o4Zvn3IXfKAhe9TkwamP/gw/AW6/o4w1Bg
	uE/Qd4g3q00m0Lu8E8xHff7hHxWB7OKQ5Tl3qaEYfKeK6jFoB9YSO8en0WXlQBpV0Aj8iUySORU
	U0v0RP3j2t1TnD9LdOj+f8rLK15TqA5xSkpGn6N6FGV/zniY79flh1PpjcxdtjlCnXqnIEYiVFT
	1ySO11I/4QoGbRTj2G/pEHnO2pm2O3dmya4MZP3SMaBLmPoYSfNVGEvEoHs4gpR/bS9NDgtajcJ
	RJA2cL3BvSL6eDC/tVwHiS3ncjOIksuIyC6zfup/LvjCU
X-Google-Smtp-Source: AGHT+IGd3t5Amh1IYTJLjTaFBg9C15cPdTcmpiT7qwduWhY4t2d5syNN0VOstJT64FKbbGlhjwO/RA==
X-Received: by 2002:a05:600c:1808:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-442d02ca7c1mr77164435e9.5.1746972487773;
        Sun, 11 May 2025 07:08:07 -0700 (PDT)
Received: from ?IPV6:2a02:6b67:d752:5f00:c46:86ac:45ea:7590? ([2a02:6b67:d752:5f00:c46:86ac:45ea:7590])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67ee33bsm93351155e9.20.2025.05.11.07.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 07:08:06 -0700 (PDT)
Message-ID: <13b68fa0-8755-43d8-8504-d181c2d46134@gmail.com>
Date: Sun, 11 May 2025 15:08:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yafang Shao <laoar.shao@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 shakeel.butt@linux.dev, riel@surriel.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com>
 <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
 <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com>
 <ebfca8f2-40e5-485a-a060-621aa3a22376@gmail.com>
 <CALOAHbDesDGyokKFSSr3hA1_WnFciQPXe_nboPq9v8OUPLv47g@mail.gmail.com>
 <20250509051328.GF323143@cmpxchg.org>
 <CALOAHbA617417UtcwMBJ9Zm_8BbAth57=ngN=tknw8h7nvCwNw@mail.gmail.com>
 <41e60fa0-2943-4b3f-ba92-9f02838c881b@redhat.com>
 <CALOAHbAvQDee2=5vsDqj77g5gAGdGpXFBbsC7tpKnCYEDZS3vw@mail.gmail.com>
 <20250509164654.GA608090@cmpxchg.org>
 <f691d2e0-5919-4581-8a24-1b543d798ae4@redhat.com>
 <8A18FB29-CC41-456F-A80E-807984691F0F@nvidia.com>
 <913bdc9b-a3c2-401c-99d0-18799850db9e@redhat.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <913bdc9b-a3c2-401c-99d0-18799850db9e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/05/2025 09:15, David Hildenbrand wrote:
> On 10.05.25 01:34, Zi Yan wrote:
>> On 9 May 2025, at 18:42, David Hildenbrand wrote:
>>
>>>>>>> - madvise
>>>>>>>     The sysadmin gently encourages the use of THP, but it is only
>>>>>>> enabled when explicitly requested by the application.
>>>>
>>>> And this "user mode" or "manual mode", where applications self-manage
>>>> which parts of userspace they want to enroll.
>>>>
>>>> Both madvise() and unprivileged prctl() should work here as well,
>>>> IMO. There is no policy or security difference between them, it's just
>>>> about granularity and usability.
>>>>
>>>>>>> - never
>>>>>>>      The sysadmin discourages the use of THP, and "its use is only permitted
>>>>>>> with explicit approval" .
>>>>
>>>> This one I don't quite agree with, and IMO conflicts with what David
>>>> is saying as well.
>>>
>>> Yeah ... "never" does not mean "sometimes" in my reality :)
>>>
>>>>
>>>>>> "never" so far means "no thps, no exceptions". We've had serious THP
>>>>>> issues in the past, where our workaround until we sorted out the issue
>>>>>> for affected customers was to force-disable THPs on that system during boot.
>>>>>
>>>>> Right, that reflects the current behavior. What we aim to enhance is
>>>>> by adding the requirement that "its use is only permitted with
>>>>> explicit approval."
>>>>
>>>> I think you're conflating a safety issue with a security issue.
>>>>
>>>> David is saying there can be cases where the kernel is broken, and
>>>> "never" is a production escape hatch to disable the feature until a
>>>> kernel upgrade for the fix is possible. In such a case, it doesn't
>>>> make sense to override this decision based on any sort of workload
>>>> policy, privileged or not.
>>>>
>>>> The way I understand you is that you want enrollment (and/or
>>>> self-management) only for blessed applications. Because you don't
>>>> generally trust workloads in the wild enough to switch the global
>>>> default away from "never", given the semantics of always/madvise.
>>>
>>> Assuming "never" means "never" and "always" means "always" ( crazy, right? :) ), could be make use of "madvise" mode, which essentially means "VM_HUGEPAGE" takes control?
>>>
>>> We'd need
>>>
>>> a) A way to enable THP for a process. Changing the default/vma settings to VM_HUGEPAGE as discussed using a prctl could work.
>>>
>>> b) A way to ignore VM_HUGEPAGE for processes. Maybe the existing prctl to force-disable THPs could work?
>>
>> This means process level control overrides VMA level control, which
>> overrides global control, right?
>>
>> Intuitively, it should be that VMA level control overrides process level
>> control, which overrides global control, namely finer granularly control
>> precedes coarse one. But some apps might not use VMA level control
>> (e.g., madvise) carefully, we want to override that. Maybe ignoring VMA
>> level control is what we want?
> 
> Let's take a step back:
> 
> Current behavior is
> 
> 1) If anybody (global / process / VM) says "never" (never/PR_SET_THP_DISABLE/VM_NOHUGEPAGE), the behavior is "never".

Just to add here to the current behavior for completeness, if we have the global system setting set to never,
but the global hugepage level setting set to madvise, we do still get a THP, i.e. if I have:

[root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/enabled
always madvise [never]
[root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
always inherit [madvise] never

And then MADV_HUGEPAGE some region, it still gives me a THP.

> 
> 2) In "madvise" mode, only "VM_HUGEPAGE" gets THP unless PR_SET_THP_DISABLE is set. So per-process overrides per-VMA.
> 
> 3) In "always" mode, everything gets THP unless per-VMA (VM_NOHUGEPAGE) or per-process (PR_SET_THP_DISABLE) disables it.
> 
> 
> Interestingly, PR_SET_THP_DISABLE used to mimic exactly what I proposed for the other direction (change default of VM_HUGEPAGE), except that it wouldn't modify already existing mappings. Worth looking at 1860033237d4. Not sure if that commit was the right call, but it's the semantics we have today.
> 
> That commit notes:
> 
> "It should be noted, that the new implementation makes PR_SET_THP_DISABLE master override to any per-VMA setting, which was not the case previously."
> 
> 
> Whatever we do, we have to be careful to not create more mess or inconsistency.
> 
> Especially, if anybody sets VM_NOHUGEPAGE or PR_SET_THP_DISABLE, we must not use THPs, ever.
> 


I thought I will also summarize what the real world usecases are that we want to solve:

1) global system policy=madvise, process wants "always" policy for itself: We can have different types of workloads stacked on the same host, some of them benefit from always having THPs,
others will incur a regression (either its a performance regression or they are completely memory bound and even a very slight increase in memory will cause them to OOM).
So we want to selectively have "always" set for just those workloads (processes). (This is how workloads are deployed in our (Metas) fleet at this moment.)

2) global system policy=always, process wants "madvise" policy for itself: Same reasoning as 1, just that the host has a different default policy and we don't want the workloads (processes) that regress with always getting THPs to do so.
(We hope this is us (meta) in the future, if a majority of workloads show that they benefit from always, we flip the default host setting to "always" and workloads that regress can opt-out and be "madvise".
New services developed will then be tested with always by default. Always is also the default defconfig option upstream, so I would imagine this is faced by others as well.)

3) global system policy=never, process wants "madvise" policy for itself: This is what Yafang mentioned in [1]. sysadmins dont want to switch the global policy to madvise, but are willing to accept certain processes to madvise.
But David mentioned in [2] that never means no thps, no exceptions and the only way to solve some issues in the past has been to disable THPs completely.

Please feel free to add to the above list. I thought it would be good to list them out so that the solution can be derived with them in mind.

In terms of doing this with prctl, I was able to make prototypes for the 2 approaches that have been discussed:

a) have prctl change how existing and new VMAs have VM_HUGEPAGE set for the process including after fork+exec, as proposed by David. This prototype is available at [3]. This will solve problem 1 discussed above, but I don't think this
approach can be used to solve problems 2 and 3? There isnt a way where we can have a process change VMA setting so that after prctl, all future allocations are on madvise basis and not global policy (even if always). IOW we will need
some change in thp_vma_allowable_orders to have it done on process level basis.

b) have prctl override global policy *only* for hugepages that "inherit" global and only if global is "madvise" or "always". This prototype is available at [4]. The way I did this will achieve usecase 1 and 2, but not 3 (It can very easily be modified to get 3, but didn't do it as there maybe still is a discussion on what should be allowed when global=never?). I do prefer this method as I think it might be simpler overall and achieves both usecases.

[1] https://lore.kernel.org/all/CALOAHbBAVELx-fwyoQUH_ypFvT_Zd5ZLjSkAPXxShgCua8ifpA@mail.gmail.com/
[2] https://lore.kernel.org/all/41e60fa0-2943-4b3f-ba92-9f02838c881b@redhat.com/
[3] https://github.com/uarif1/linux/commit/209373cdeda93a55a699e2eee29f88f4e64ac8a5
[4] https://github.com/uarif1/linux/commit/e85c8edbcb4165c00026f0058b71e85f77da23f4


Thanks,
Usama
