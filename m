Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D418641
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750729463; cv=none; b=U9FAKF7Jq03pFeAIFPE40FDW8Lu5XqRIe7gijPEUlvi6JGI53H45skHD3VQ42PznVJsI1RCOVP9XMfxSv1K8lC+E7o6no8flEhEwRgnK5FM9osdsE0Cm82sq9G7fdaA8HfQ8lvnPD0WfCh2q0qE/+Rf+b1mJphCoMhiHdS3H95o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750729463; c=relaxed/simple;
	bh=FmI7Pvi2S/VWMt5surE3jm0RzIxZPGXcGqhhkIsUgK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVDiqYEMyE2OzTSuiQJRphnhXghZGBKaGu7F/K8CW2v4UmSKovisZ3tZQDpiCZVH7lZvINUjkkax0KlpJMbtz6e9mz2zAPHwqWKm221J9QlU31SBLzMSszPTpqK6ie3WW0TSHe1AM7gpJaQb3zGmuQBivZ+MOdA2HMODmMZu+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=SaXSMPnC; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="SaXSMPnC"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750729456; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=bXzLG3qEfg6SUTPkxvvaO8P1W2oF5qK0rvfgE/cq0gA=;
	b=SaXSMPnCXUg7sAS38XMy501xCZHVqC5q2oKJEh831Hz/w+VpXyZnwZtWe+k2+Citjlr3rjN9AarE1EJxMVDY/iT+M6qhGEb/amO7sxlIiP99Oa81UImoTv0WrroqPXw+9h+qQoftlhCrN2DFv2drlXJNq/1Ji/6Gqc7aawlWPcI=
Received: from 30.74.144.102(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeeL9rz_1750729455 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Jun 2025 09:44:15 +0800
Message-ID: <c6a531e7-f9ff-4e2a-8a28-c45cbfbc71fa@linux.alibaba.com>
Date: Tue, 24 Jun 2025 09:44:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
 ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4x4=eJQx9Tyt93hBqx4Q5ORnVUyWO5ddX8f5MEYQGO+AQ@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4x4=eJQx9Tyt93hBqx4Q5ORnVUyWO5ddX8f5MEYQGO+AQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/23 19:08, Barry Song wrote:
> On Mon, Jun 23, 2025 at 8:28 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>> When invoking thp_vma_allowable_orders(), the TVA_ENFORCE_SYSFS flag is not
>> specified, we will ignore the THP sysfs settings. Whilst it makes sense for the
>> callers who do not specify this flag, it creates a odd and surprising situation
>> where a sysadmin specifying 'never' for all THP sizes still observing THP pages
>> being allocated and used on the system.
>>
>> The motivating case for this is MADV_COLLAPSE. The MADV_COLLAPSE will ignore
>> the system-wide Anon THP sysfs settings, which means that even though we have
>> disabled the Anon THP configuration, MADV_COLLAPSE will still attempt to collapse
>> into a Anon THP. This violates the rule we have agreed upon: never means never.
>>
> 
> Should we update the man page for madv_collapse ?
> https://man7.org/linux/man-pages/man2/madvise.2.html
> 
>                MADV_COLLAPSE is independent of any sysfs (see sysfs(5))
>                setting under /sys/kernel/mm/transparent_hugepage, both in
>                terms of determining THP eligibility, and allocation
>                semantics.  See Linux kernel source file
>                Documentation/admin-guide/mm/transhuge.rst for more
>                information.  MADV_COLLAPSE also ignores huge= tmpfs mount
>                when operating on tmpfs files.  Allocation for the new
>                hugepage may enter direct reclaim and/or compaction,
>                regardless of VMA flags (though VM_NOHUGEPAGE is still
>                respected).
> 
> So this effectively changes the uABI, right?

Good point. Will update the man page.

>> Currently, besides MADV_COLLAPSE not setting TVA_ENFORCE_SYSFS, there is only
>> one other instance where TVA_ENFORCE_SYSFS is not set, which is in the
>> collapse_pte_mapped_thp() function, but I believe this is reasonable from its
>> comments:
>>
>> "
>> /*
>>   * If we are here, we've succeeded in replacing all the native pages
>>   * in the page cache with a single hugepage. If a mm were to fault-in
>>   * this memory (mapped by a suitably aligned VMA), we'd get the hugepage
>>   * and map it by a PMD, regardless of sysfs THP settings. As such, let's
>>   * analogously elide sysfs THP settings here.
>>   */
>> if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
>> "
>>
>> Another rule for madvise, referring to David's suggestion: “allowing for
>> collapsing in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>
>> To address this issue, the current strategy should be:
>>
>> If no hugepage modes are enabled for the desired orders, nor can we enable them
>> by inheriting from a 'global' enabled setting - then it must be the case that
>> all desired orders either specify or inherit 'NEVER' - and we must abort.
>>
>> Meanwhile, we should fix the khugepaged selftest for MADV_COLLAPSE by enabling
>> THP.
> 
> It’s a bit odd that the old test case expects collapsing to succeed
> even when we’ve set it
> to ‘never’.
> Setting it to ‘always’ doesn’t seem to test anything as a counterpart.
> 
> I assume the goal is to test that setting it to ‘never’ prevents collapsing?

The original logic will prevent khugepaged by setting THP_NEVER, 
allowing only madvise_collapse() to perform THP collapse. And this is 
the logic this patchset tries to fix, which is to also prevent 
madvise_collapse() from performing THP collapse when system-wide THP 
sysfs settings are disabled.

Therefore, it should be changed to THP_ALWAYS here to allow 
madvise_collapse() to perform THP collapse.

Of course, the current logic cannot completely disable khugepaged, but I 
haven't found a better way to modify it. As David suggested, changing to 
MADVISE mode would cause some test cases to fail because some tests 
previously set MADV_NOHUGEPAGE, and now there is no other way to clear 
the MADV_NOHUGEPAGE flag except for setting MADV_HUGEPAGE. As a result, 
khugepaged cannot be completely disabled either.

So I think we should introduce a new method to clear MADV_NOHUGEPAGE 
flag without setting MADV_HUGEPAGE in the future.
