Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3F42820A7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845785; cv=none; b=iR6UdMvH1WYX+BWxnj8s+V8l2wcdXqUEFdxSaYi5f4B/GQBivlqql0FwidWay/4wEpSmP4lvAdlVujKXYdW0Ae/75wvUpPjQFwQqs83piO+xqL5NzcYEUGIyITll77xgjLFBlvYDV7HXpNfiaIZOVlEcMZ6AwECSUFvuVDUVaUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845785; c=relaxed/simple;
	bh=Kk9QuwXeqHsh5m+WdFG3yfrYUrQof67Fj8u6Es2IJUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQtax+leRoGEC+DLNDGHJcbSdImjv70GGkVV2aTKoC3IYNsZH9ncAfpUfJy+rSdV/ymB3QG2RiXtk9ID3pkkbwwSyj1DDpXNld1OSLYkkImxqQURT0PZXqyYQOqK+evTAK+key42kSFS/pfXaQfjVdoXTrcewIXysV3HxyBiuYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=paYKpYi2; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="paYKpYi2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750845774; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Q2xEIG12L/x5PKgfFpP7sX4Fq2b51V9mENpLnQ81O2w=;
	b=paYKpYi2JaFFOB46wcSbB4cLOnfUxbJAx7hy9KMf7ZiE853LJKjz7rJNha5xycWj7gIfQdU9KM5IQRGmS42JZYj4MJ9F7EDTbF9qVAyHTSYeZNewKiBGfKTqLlE1WAw/W2KwQjKga0pwqwBlng8zNF2XZJ+kh1bpupxU2RyRn3w=
Received: from 30.74.144.110(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WewhO11_1750845771 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Jun 2025 18:02:53 +0800
Message-ID: <37fc3553-0d5a-4bdc-b473-cd740d47598e@linux.alibaba.com>
Date: Wed, 25 Jun 2025 18:02:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>,
 akpm@linux-foundation.org, ziy@nvidia.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, zokeefe@google.com, shy828301@gmail.com,
 usamaarif642@gmail.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
 <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
 <01d679f2-fd64-472c-b9dc-ebe87268ce82@lucifer.local>
 <a16071e5-ae97-4e1a-9df8-f353f6b319c7@lucifer.local>
 <23b8ad10-cd1f-45df-a25c-78d01c8af44f@redhat.com>
 <decbae07-0c84-4379-9f9d-6e2bd6dbad6e@lucifer.local>
 <a877b2b7-382b-498b-9b4a-188a0845d630@linux.alibaba.com>
 <ff3cc6bc-dd40-4b6b-a293-eedcc7c8eaf6@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ff3cc6bc-dd40-4b6b-a293-eedcc7c8eaf6@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/25 17:31, Lorenzo Stoakes wrote:
> On Wed, Jun 25, 2025 at 04:52:03PM +0800, Baolin Wang wrote:
>>
>>
>> On 2025/6/25 16:37, Lorenzo Stoakes wrote:
>>> Yeah maybe the best way is to just have another tunable for this?
>>>
>>> /sys/kernel/mm/transparent_hugepage/disable_collapse perhaps?
>>>
>>> What do you think Hugh, Baolin?
>>
>> I think it's not necessary to find a way to disable madvise_collapse.
>> Essentially, it's a conflict between the semantics of madvise_collapse and
>> the '/sys/kernel/mm/transparent_hugepage/enabled' interface. We should reach
>> a consensus on the semantics first:
>>
>> Semantic 1: madv_collapse() should ignore any THP system settings, meaning
>> we need to update the 'never' semantics in
>> '/sys/kernel/mm/transparent_hugepage/enabled', which would only disable page
>> fault and khugepaged, not including madvise_collapse. If we agree on this,
>> then the 'never' for per-sized mTHP would have the same semantics, i.e.,
>> when I set 64K mTHP to 'always' and 2M mTHP to 'never', madvise_collapse
>> would still allow the collapse of 2M THP. We should document this clearly in
>> case users still want 64K mTHP from madvise_collapse.
> 
> Right yeah, I mean this is in effect how things are now. So the task is
> documentation.
> 
>>
>>
>> Semantic 2: madv_collapse() needs to respect THP system settings, which is
>> what my patch does. Never means never, and we would need to update the
>> documentation of madv_collapse() to make it clearer.
> 
> Yes, and indeed this is the choice.
> 
> I think, as David said, it comes down to whether we have a legit use case that
> truly relies on this.
> 
>>> (One side note on PMD-sized MADV_COLLAPSE - this is basically completely
>>> useless for 64 KB page size arm64 systems where PMD's are 512 MB :)
>>>
>>> Thoughts Baolin?
>>
>> We should not collapse 512MB THP on 64K pagesize kernel. So seems
>> madv_collapse() can not work on 64K pagesize kernel.
> 
> Well I don't think anything would prevent this now right? So MADV_COLLAPSE is
> pretty problematic on 64K pagesize kernels in general.

Yes, I don't mean it will prevent madvise_collapse(), just as you said 
that it could be problematic (it's horrible to try to collapse 512MB).

> Anyway that's maybe a problem for another time :)

Yeah, should consider mTHP-compatible MADV_COLLAPSE.
