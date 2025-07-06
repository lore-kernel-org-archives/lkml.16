Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DF62E36F7
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 02:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751767370; cv=none; b=fQMiAz5m2HtPzhzqnJ9N+fxnoB60oYM4mRtJRB8+vqx0OzJ+IMJfxKt4SZG7tTwXVFnbUrengqxLkftz7gd8K3FYUpWICbmGUQF+wAJ1wlVf7zs7l7HD7L758hxzy64h9gP4csn96AfsMvwXhXU9jkikrmuR1C3DPe9k7+4gFac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751767370; c=relaxed/simple;
	bh=zyw48Pb28uomgfngxmw37ECuUBQIpAcx0E2IZegK+MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzdj6vV/P6/UHHPeOQy+zc6XhW1Zy9nBCuS6c71mEqJAPdeSToMbGk94BKgMmNZgkgvZ7d36Yx74O3YPvsUP1kXO+fhmTnkeqM38LNyv9EbX9rT/6AtFxsqWGmo2IN3FKEIpoFErXGqZD+aXw1YOex+DOkjnik8gP90Nplhcqjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=hPoNrRwl; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="hPoNrRwl"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751767359; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=vKqkCgAf7cYzIMgHnnwt59iT3vK6UK8KUiIkhUoH3to=;
	b=hPoNrRwlGXYIWkTpsFImUk0cNTovAMPfGrIhnoy8DVXTZujXLjQuF9ekb4wc19hOQDVDpvrWhJsOkx/XUBQ4eDOOCgAW3dITiDgMB4sPwXen8TgrZeCK6Rtm8JmhvSy7mAWbFyBtVIhhnVcKj7ie4WnY4d3q8eDl3w+MLYyI2RU=
Received: from 30.134.69.216(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Whi6eBO_1751767356 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 06 Jul 2025 10:02:37 +0800
Message-ID: <4c055849-d7dd-4b9f-9666-fcb0bccf8681@linux.alibaba.com>
Date: Sun, 6 Jul 2025 10:02:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: fault in complete folios instead of individual
 pages for tmpfs
To: Andrew Morton <akpm@linux-foundation.org>
Cc: hughd@google.com, david@redhat.com, ziy@nvidia.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <440940e78aeb7430c5cc8b6d2088ae98265b9809.1751599072.git.baolin.wang@linux.alibaba.com>
 <20250704151858.73d35a24b4c2f53bdb0c1b85@linux-foundation.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250704151858.73d35a24b4c2f53bdb0c1b85@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/7/5 06:18, Andrew Morton wrote:
> On Fri,  4 Jul 2025 11:19:26 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> 
>> After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs"),
>> tmpfs can also support large folio allocation (not just PMD-sized large
>> folios).
>>
>> However, when accessing tmpfs via mmap(), although tmpfs supports large folios,
>> we still establish mappings at the base page granularity, which is unreasonable.
>>
>> We can map multiple consecutive pages of a tmpfs folios at once according to
>> the size of the large folio. On one hand, this can reduce the overhead of page
>> faults; on the other hand, it can leverage hardware architecture optimizations
>> to reduce TLB misses, such as contiguous PTEs on the ARM architecture.
>>
>> Moreover, tmpfs mount will use the 'huge=' option to control large folio
>> allocation explicitly. So it can be understood that the process's RSS statistics
>> might increase, and I think this will not cause any obvious effects for users.
>>
>> Performance test:
>> I created a 1G tmpfs file, populated with 64K large folios, and write-accessed it
>> sequentially via mmap(). I observed a significant performance improvement:
> 
> That doesn't sound like a crazy thing to do.
> 
>> Before the patch:
>> real	0m0.158s
>> user	0m0.008s
>> sys	0m0.150s
>>
>> After the patch:
>> real	0m0.021s
>> user	0m0.004s
>> sys	0m0.017s
> 
> And look at that.
> 
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 0f9b32a20e5b..9944380e947d 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -5383,10 +5383,10 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>>   
>>   	/*
>>   	 * Using per-page fault to maintain the uffd semantics, and same
>> -	 * approach also applies to non-anonymous-shmem faults to avoid
>> +	 * approach also applies to non shmem/tmpfs faults to avoid
>>   	 * inflating the RSS of the process.
>>   	 */
>> -	if (!vma_is_anon_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
>> +	if (!vma_is_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
>>   	    unlikely(needs_fallback)) {
>>   		nr_pages = 1;
>>   	} else if (nr_pages > 1) {
> 
> and that's it?
> 
> I'm itching to get this into -stable, really.  What LTS user wouldn't
> want this?  

This is an improvement rather than a bugfix, so I don't think it needs 
to go into LTS.

Could it be viewed as correcting an oversight in
> acd7ccb284b8?

Yes, I should have added this optimization in the series of the commit 
acd7ccb284b8. But obviously, I missed this :(.
