Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BCA1F8753
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526969; cv=none; b=ZddoI7i/mkIp778XMt9fBXs/RPmA20/3OO8TKibG7rr2NTP13+Ws5C0yHXi4ej3WRDmS7La01QD5z1JIdhOiW1q9mt+GBMPNB1/AFv4mYFrg0JixBLN9sgTy0hJEhtuKwdIUumXXDwJ583HcC2iT9cR+/B6sWwZtz1/lyX7RfhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526969; c=relaxed/simple;
	bh=DUz8cgfAij/6+9pbRXpcnooNjfeQS+0aVub5YN0Zc/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vzq7kx8AzFJJLyKTOjss+0vLKF8Gw54tcLH6zlXyz4ZAFrwpwcmsSHq9gp51shUBJ4Zk/Yyh6Bu8R82PFtY4rRlJR6D3qqkaM9pEqZYbVhROV5zNh3T3xRAH9ompEgbMFYUXp5+pUqB5aI4pUEmKUlRsNNkWmoSZ567wPZUd/5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 046AE113E;
	Tue,  6 May 2025 03:22:38 -0700 (PDT)
Received: from [10.162.43.13] (K4MQJ0H1H2.blr.arm.com [10.162.43.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F2883F5A1;
	Tue,  6 May 2025 03:22:41 -0700 (PDT)
Message-ID: <c7c75d9d-4d5b-4bfe-b69e-dedb4b0d73fb@arm.com>
Date: Tue, 6 May 2025 15:52:39 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Optimize mremap() by PTE-batching
To: Anshuman Khandual <anshuman.khandual@arm.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <b26480a7-ea81-408a-b287-7cd52571a1d0@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <b26480a7-ea81-408a-b287-7cd52571a1d0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/05/25 2:46 pm, Anshuman Khandual wrote:
> On 5/6/25 10:30, Dev Jain wrote:
>> Use PTE batching to optimize mremap().
>>
>> Mapping 512K of memory, memsetting it, remapping it to src + 512K, and
>> munmapping it 10,000 times, the average execution time reduces from 1.9 to
>> 1.2 seconds, giving a 37% performance optimization. (Apple M3)
> 
> That's impressive improvement. But could you please re-organize the test
> description into a pseudo code format or better provide the test program
> itself (which should be compact anyways) just to be more clear about the
> scenario where this helps.

Sure.

> 
>>
>> Dev Jain (3):
>>    mm: Call pointers to ptes as ptep
>>    mm: Add generic helper to hint a large folio
>>    mm: Optimize mremap() by PTE batching
>>
>>   include/linux/pgtable.h | 16 +++++++++++++++
>>   mm/mremap.c             | 44 +++++++++++++++++++++++++++--------------
>>   2 files changed, 45 insertions(+), 15 deletions(-)
>>

