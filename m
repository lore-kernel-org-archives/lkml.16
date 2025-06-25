Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E73F50F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841540; cv=none; b=XB4TEb/hLo5kmj7NjVV98AhazDpYRPWvb1befR8twd5mtIUl/wSSMh9pyr2Fhl5Rl4bd6ct1KRZiIOpO2/+zLuWUEGI+CyOZlamC/Q9TlgRYgChaVYfj26DE9c0QCPJB6/fjBkw9dSrLtzdQEh2mHZXDrmYRbImQ+jnQ21Z4WIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841540; c=relaxed/simple;
	bh=4C89RP3ZG0A4Ej7e2QGiktJ4IBTDZuAQFp3Zc6bH9a8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMLRImlUIKNMsbywWd+F0g0z1+wIqfUDPISWyUFUQZ53JNjQCF6AOw6ayQbGrWN1o1aIPN9sObspzzkG0bLB3Kdub8Po/WUTam8fRp9Nm2DMiy1XnsZ/jITFkkFJxAnlJxFuj910RpBo5gBCcKjcPk4O4NLiZiW25UZZYDUR7NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=sR2rWfdF; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="sR2rWfdF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750841527; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Jdk7MOIYN3yseBOY4jjLY6dw7calfP5EQ2cuWW/TLEA=;
	b=sR2rWfdFIiYHRrL8m0y6fsB61pkT5sxPwBvddNjje21ykfhQLxTIt8Lv3Wv/iIC6hDYd18D1XLHlCNHh6f2rZu3xPK7WmKZwoafL7YXTERvOtua5oHzLKGDsk/X9YPVCwgUiaapRUl1uBXg+lmseFWoMVYFy730GwmoLLYwSrq8=
Received: from 30.74.144.110(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WevRTcD_1750841524 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Jun 2025 16:52:06 +0800
Message-ID: <a877b2b7-382b-498b-9b4a-188a0845d630@linux.alibaba.com>
Date: Wed, 25 Jun 2025 16:52:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: Hugh Dickins <hughd@google.com>, akpm@linux-foundation.org,
 ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
 <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
 <01d679f2-fd64-472c-b9dc-ebe87268ce82@lucifer.local>
 <a16071e5-ae97-4e1a-9df8-f353f6b319c7@lucifer.local>
 <23b8ad10-cd1f-45df-a25c-78d01c8af44f@redhat.com>
 <decbae07-0c84-4379-9f9d-6e2bd6dbad6e@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <decbae07-0c84-4379-9f9d-6e2bd6dbad6e@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/25 16:37, Lorenzo Stoakes wrote:
> On Wed, Jun 25, 2025 at 10:24:53AM +0200, David Hildenbrand wrote:
>> On 25.06.25 10:12, Lorenzo Stoakes wrote:
>>> On Wed, Jun 25, 2025 at 08:55:28AM +0100, Lorenzo Stoakes wrote:
>>>> I suppose the least awful way of addressing Baolin's concerns re: mTHP
>>>> while simultaneosly keeping existing semantics is:
>>>>
>>>> 1. Introduce deny to mean what never should have meant.
>>>
>>> To fix Baolin's issue btw we'd have to add 'deny' to both 'global' settings
>>> _and_ each page size setting.
>>>
>>> Because otherwise we'd end up in a weird case where say:
>>>
>>> global 'deny'
>>>
>>>    2 MiB 'never'
>>> 64 KiB 'inherit'
>>>
>>> And err... get 2 MiB THP pages from MADV_COLLAPSE :)
>>>
>>> Or:
>>>
>>> global 'deny'
>>>
>>>    2 MiB 'never'
>>> 64 KiB 'always'
>>>
>>> Or:
>>>
>>> global 'never'
>>>
>>>    2 MiB 'never'
>>> 64 KiB 'always'
>>>
>>> Or:
>>>
>>> global 'never'
>>>
>>>    2 MiB 'madvise'
>>> 64 KiB 'always'
>>>
>>> All doing the same. Not very clear is it?
>>>
>>> We have sowed the seeds of something terrible here, truly.
>>
>> Fully agreed. "Deny" is nasty. Maybe if we really need a way to disable
>> "madv_collapse", it should be done differently, not using this toggle here.
> 
> Yeah maybe the best way is to just have another tunable for this?
> 
> /sys/kernel/mm/transparent_hugepage/disable_collapse perhaps?
> 
> What do you think Hugh, Baolin?

I think it's not necessary to find a way to disable madvise_collapse. 
Essentially, it's a conflict between the semantics of madvise_collapse 
and the '/sys/kernel/mm/transparent_hugepage/enabled' interface. We 
should reach a consensus on the semantics first:

Semantic 1: madv_collapse() should ignore any THP system settings, 
meaning we need to update the 'never' semantics in 
'/sys/kernel/mm/transparent_hugepage/enabled', which would only disable 
page fault and khugepaged, not including madvise_collapse. If we agree 
on this, then the 'never' for per-sized mTHP would have the same 
semantics, i.e., when I set 64K mTHP to 'always' and 2M mTHP to 'never', 
madvise_collapse would still allow the collapse of 2M THP. We should 
document this clearly in case users still want 64K mTHP from 
madvise_collapse.


Semantic 2: madv_collapse() needs to respect THP system settings, which 
is what my patch does. Never means never, and we would need to update 
the documentation of madv_collapse() to make it clearer.

>> Regarding MADV_COLLAPSE, I strongly assume that we should not change it to
>> collapse smaller mTHPs as part of the khugepaged mTHP work. For now, it will
>> simply always collapse to PMD THPs.
> 
> Yeah thinking about it maybe this is the best way. And we can then update
> the man page to make this ABUNDANTLY clear (am happy to do this).
> 
> This keeps things simple.

Yes, agree.

> (One side note on PMD-sized MADV_COLLAPSE - this is basically completely
> useless for 64 KB page size arm64 systems where PMD's are 512 MB :)
> 
> Thoughts Baolin?

We should not collapse 512MB THP on 64K pagesize kernel. So seems 
madv_collapse() can not work on 64K pagesize kernel.

>> Once we want to support other sizes, likely MADV_COLLAPSE users want to have
>> better control over which size to use, at which point it all gets nasty.
> 
> madvise2() this time with extra parameters? ;)
> 
> I sort of wish we had added a flags parameter there.
> 
> But lacking a time machine... :)
> 
>>
>> --
>> Cheers,
>>
>> David / dhildenb
>>
> 
> To summarise:
> 
> Drop series:
> 
> * Might degrade performance for very specific users using
>    never/MADV_COLLAPSE (quite possibly via process_madvise() + a remote
>    process).
> 
> * Matches 'de jure' interpretation of documentation.
> 
> Keep series:
> 
> * Provides no means whatsoever to have a 'manual only' collapse mode,
>    though does provide for manual khugepaged THP.
> 
> * MADV_COLLAPSE automatically gets mTHP support based on obeying 'never'.
> 
> * Matches likely 'de facto' understanding system admins have about THP
>    usage.
> 
> Action items:
> 
> * Either way, I (Lorenzo) will improve documentation.

Great. Thanks.

> * If we drop the series, provide another means to disable
>    MADV_COLLAPSE. But not using existing sysfs toggles, something new. We
>    will document MADV_COLLAPSE as PMD only.
> 
> * If we drop the series, also consider how we might provide mTHP-compatible
>    MADV_COLLAPSE.

Yes. Agree. Will be another mess I guess :)

> 
> * Totally and completely refactor the hell out of the THP implementation
>    from top-to-bottom (over time this is becoming more and more of a me
>    thing... as I'm getting ever more frustrated with the implementation ;)

Yes.
