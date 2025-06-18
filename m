Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0AC2EF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750213549; cv=none; b=unBf8DsLgTfjbg9+p2hCLenjyNzKnniKFeKf5NjZJahyFdWveudl+SIJxTnWb2W4XHcrJN3gH1W+piGWRtl8syTrldsAUryWffUVQc7BlHoTvD7/h8RRjCmgwZ/wv+UGZOxuHWR2mYyj5P+YhkTBb1osTLfy4t2s2n2HuFZyjuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750213549; c=relaxed/simple;
	bh=OaHgiZazmyc06LjxYXLe7izja8CfrKabh/GxjNs2paw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onFa1WRPTc6m6tmiDvTWVvJ8DH+ZoPQqmdnauWnptkjQjuxWWMXlp++TH9+ixBk8hWIaUIb/mWtPywBBncCQMfsXIURHc/zywMW1gK/bmh0ajTzDl1UK2OVndeagPWQJ9QsfF71C31OD1SKem4rr+BjnwMBF5XpRDHLHHo6pN10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=olPnJ/Ft; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="olPnJ/Ft"
Message-ID: <f2a43ae1-6347-47e2-bcc4-845dc7e7ed87@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750213542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WRnT8oSN8k3lo5CGyLRxRbzv9ULV2vj8IJVFOUE6h9A=;
	b=olPnJ/FtjhUAXcFuf0XSpr3qb4c5xrdg+M22XKq4JMIybh8zteDsQ8Z2tnkY/S2cNc4ggi
	jlX4Ytm3vMiya30fLJ8CUlcma0UMwBVeduQoArL230FvZnplmF4DfSM9RsPneAuRe/uwzW
	EyjgsKfmraLTlrD1j/21rtXlKEvjUeg=
Date: Wed, 18 Jun 2025 10:25:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] mm: use per_vma lock for MADV_DONTNEED
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Lokesh Gidra <lokeshgidra@google.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Lance Yang <ioworker0@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Li <zi.li@linux.dev>
References: <20250607220150.2980-1-21cnbao@gmail.com>
 <309d22ca-6cd9-4601-8402-d441a07d9443@lucifer.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <309d22ca-6cd9-4601-8402-d441a07d9443@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi all,

Crazy, the per-VMA lock for madvise is an absolute game-changer ;)

On 2025/6/17 21:38, Lorenzo Stoakes wrote:
[...]
> 
> On Sun, Jun 08, 2025 at 10:01:50AM +1200, Barry Song wrote:
>> From: Barry Song <v-songbaohua@oppo.com>
>>
>> Certain madvise operations, especially MADV_DONTNEED, occur far more
>> frequently than other madvise options, particularly in native and Java
>> heaps for dynamic memory management.
>>
>> Currently, the mmap_lock is always held during these operations, even when
>> unnecessary. This causes lock contention and can lead to severe priority
>> inversion, where low-priority threads—such as Android's HeapTaskDaemon—
>> hold the lock and block higher-priority threads.
>>
>> This patch enables the use of per-VMA locks when the advised range lies
>> entirely within a single VMA, avoiding the need for full VMA traversal. In
>> practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
>>
>> Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
>> benefits from this per-VMA lock optimization. After extended runtime,
>> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
>> only 1,231 fell back to mmap_lock.
>>
>> To simplify handling, the implementation falls back to the standard
>> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
>> userfaultfd_remove().
>>
>> Many thanks to Lorenzo's work[1] on:
>> "Refactor the madvise() code to retain state about the locking mode
>> utilised for traversing VMAs.
>>
>> Then use this mechanism to permit VMA locking to be done later in the
>> madvise() logic and also to allow altering of the locking mode to permit
>> falling back to an mmap read lock if required."
>>
>> One important point, as pointed out by Jann[2], is that
>> untagged_addr_remote() requires holding mmap_lock. This is because
>> address tagging on x86 and RISC-V is quite complex.
>>
>> Until untagged_addr_remote() becomes atomic—which seems unlikely in
>> the near future—we cannot support per-VMA locks for remote processes.
>> So for now, only local processes are supported.

Just to put some numbers on it, I ran a micro-benchmark with 100
parallel threads, where each thread calls madvise() on its own 1GiB
chunk of 64KiB mTHP-backed memory. The performance gain is huge:

1) MADV_DONTNEED saw its average time drop from 0.0508s to 0.0270s (~47% 
faster)
2) MADV_FREE     saw its average time drop from 0.3078s to 0.1095s (~64% 
faster)

Thanks,
Lance
