Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C8627BF64
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532451; cv=none; b=oIDR8U+VzBgZ8Z58H7A6kTsl3Wm11If8TyAF7awUIUxP/2aXd6D7qiyfwCFSXVSGeCLYoRomzJ2nqtvEYgkbQokVbIe9l5QWmYet126g7fNq0OMfENfZziFnaAHHWyg91I+J3w8QWO926EFAkp+xW8W2a/YoJZhQixN8B1Q0QVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532451; c=relaxed/simple;
	bh=tBFGjxwm7APxZTyaeEB/lNjpPlElDVIxU4hAatj5zds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1VRnj4lx4KuvMeOIffOHnzog69hbnJ7yh4WErhvkSRZiqvrbhinmIlXJQEI/BYQVay2q4pZoYnX70/D93DSNRMUgNndZxEk/rgyOWGQmYl8ou5pPg4nd4q+DGP4fgXM+TRVf7T1EYf/osX7DMVCIHey3uu4U3+0ZHCRugkjIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D31D113E;
	Tue,  6 May 2025 04:53:58 -0700 (PDT)
Received: from [10.163.80.199] (unknown [10.163.80.199])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 559E43F58B;
	Tue,  6 May 2025 04:53:58 -0700 (PDT)
Message-ID: <81fbf59b-7930-4ee5-94a8-3756a372c4e6@arm.com>
Date: Tue, 6 May 2025 17:23:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Optimize mremap() by PTE-batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com, pfalcato@suse.de,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, david@redhat.com,
 peterx@redhat.com, ryan.roberts@arm.com, mingo@kernel.org,
 libang.li@antgroup.com, maobibo@loongson.cn, zhengqi.arch@bytedance.com,
 baohua@kernel.org, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <b26480a7-ea81-408a-b287-7cd52571a1d0@arm.com>
 <c7c75d9d-4d5b-4bfe-b69e-dedb4b0d73fb@arm.com>
 <4210a878-7dce-40c2-bd0b-0c2e39cdd80e@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <4210a878-7dce-40c2-bd0b-0c2e39cdd80e@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/05/25 4:14 pm, Lorenzo Stoakes wrote:
> On Tue, May 06, 2025 at 03:52:39PM +0530, Dev Jain wrote:
>>
>>
>> On 06/05/25 2:46 pm, Anshuman Khandual wrote:
>>> On 5/6/25 10:30, Dev Jain wrote:
>>>> Use PTE batching to optimize mremap().
>>>>
>>>> Mapping 512K of memory, memsetting it, remapping it to src + 512K, and
>>>> munmapping it 10,000 times, the average execution time reduces from 1.9 to
>>>> 1.2 seconds, giving a 37% performance optimization. (Apple M3)
>>>
>>> That's impressive improvement. But could you please re-organize the test
>>> description into a pseudo code format or better provide the test program
>>> itself (which should be compact anyways) just to be more clear about the
>>> scenario where this helps.
>>
>> Sure.
> 
> I echo Ashuman's comment, definitely would like to see that.
> 
> And wrt to perf improvement, whether it's a microbenchmark or not, that's a
> great result so well done :) I echo this also!
> 
> However, it'd be good to see some more detail here also, you're kind of missing
> out - everything - about why this improvement happens - what the intent of the
> series is, anything about large folios, under what circumstances you'll see an
> improvement, etc. etc.
> 
> While this might duplicate comments you've made elsewhere, it's mandatory for a
> series, and Andrew is unlikely to take this without it.
> 
> In mm we place the contents of the cover letter in the first commit in the
> series, so it gets stored for posterity also!
> 
> Cheers, Lorenzo

Thanks for your feedback. I'll make the required changes.

> 
>>
>>>
>>>>
>>>> Dev Jain (3):
>>>>     mm: Call pointers to ptes as ptep
>>>>     mm: Add generic helper to hint a large folio
>>>>     mm: Optimize mremap() by PTE batching
>>>>
>>>>    include/linux/pgtable.h | 16 +++++++++++++++
>>>>    mm/mremap.c             | 44 +++++++++++++++++++++++++++--------------
>>>>    2 files changed, 45 insertions(+), 15 deletions(-)
>>>>
>>

