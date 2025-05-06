Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB124278759
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522989; cv=none; b=hjJQT1h2F5tEzTehmTJD88m5YpFBOVTXkpFVnjXG7jZTBdy2ssMO8VGknPmgapJ5IXTMexpQiT3ptSlbEm4iX+x3JUyeqAHYkRNHcANGXC9gBHX76F0uXjt7U0s6y2Q99HoZBUc6bsvlo+kh46dzlDyy3mhGZ2LlQ2KQRPiaybI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522989; c=relaxed/simple;
	bh=qPFHgHnT4BdXsfQjhuHPGPviCnIRn4Xp2l8althg+MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d92zG8b/f3QfmF6M84D7yjKVgIuIMdeBPDz2JYyLM6mDRor+iqFGaXKvXYZE8LYZm4D40qFYoTrtn/EXGyZZ3ndpkXXFQUJ9NrT9fhH9g3VOw8/Ht9Xp07DIL4whVtKty9h58avNV1k5Dbor1EqSg6miWfnsRftBbug8k+89gA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4569F113E;
	Tue,  6 May 2025 02:16:17 -0700 (PDT)
Received: from [10.163.54.208] (unknown [10.163.54.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FC403F5A1;
	Tue,  6 May 2025 02:16:19 -0700 (PDT)
Message-ID: <b26480a7-ea81-408a-b287-7cd52571a1d0@arm.com>
Date: Tue, 6 May 2025 14:46:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Optimize mremap() by PTE-batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250506050056.59250-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/25 10:30, Dev Jain wrote:
> Use PTE batching to optimize mremap().
> 
> Mapping 512K of memory, memsetting it, remapping it to src + 512K, and
> munmapping it 10,000 times, the average execution time reduces from 1.9 to
> 1.2 seconds, giving a 37% performance optimization. (Apple M3)

That's impressive improvement. But could you please re-organize the test
description into a pseudo code format or better provide the test program
itself (which should be compact anyways) just to be more clear about the
scenario where this helps.

> 
> Dev Jain (3):
>   mm: Call pointers to ptes as ptep
>   mm: Add generic helper to hint a large folio
>   mm: Optimize mremap() by PTE batching
> 
>  include/linux/pgtable.h | 16 +++++++++++++++
>  mm/mremap.c             | 44 +++++++++++++++++++++++++++--------------
>  2 files changed, 45 insertions(+), 15 deletions(-)
> 
