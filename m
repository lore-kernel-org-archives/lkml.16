Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36154322B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083205; cv=none; b=sX9rnHdTwq5Yc9hwNrjodwJbm07I188jme8QnMbkkUn6Sb2s0diVy9F+/4Xy8sflSoNz8tvfm6duLvrNk4zNYr7f4bCV2wpzl9XbStoVWrbdo7BXdL6TOLjVjMlWcDDt9aotR5pXVTMW5braevy82bK0WTBl7yGRzdI1nU2+FxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083205; c=relaxed/simple;
	bh=XSvt4u2E8Y7gS+WaK0nHAJ6/lGFIQo6Ki7abGpuMRcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRnvZsZM56r1KU2SGxLsFs1MA05UH8DW1I1x5AE6vYXRGF17B9QAieWtxb+eN4hHXvK7sWyXoXH7ZaQW+U4V/jKCLbaBC91zsWfGMFt8k22bwH47RnMnnWmPSy3St2c4Ry7prqssWol3tmnOie1oDbrDVh5eWnjRRtU0cXflBog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40BA91063;
	Thu, 27 Mar 2025 06:46:47 -0700 (PDT)
Received: from [10.57.86.146] (unknown [10.57.86.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D86D3F63F;
	Thu, 27 Mar 2025 06:46:37 -0700 (PDT)
Message-ID: <5582c321-9297-4d92-9e1f-497afa17f8be@arm.com>
Date: Thu, 27 Mar 2025 09:46:35 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] Perf improvements for hugetlb and vmalloc on
 arm64
Content-Language: en-GB
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>, David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <Z-VBgcl9LJGlEzy2@pc636>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z-VBgcl9LJGlEzy2@pc636>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 08:16, Uladzislau Rezki wrote:
> On Tue, Mar 04, 2025 at 03:04:30PM +0000, Ryan Roberts wrote:
>> Hi All,
>>
>> This is v3 of a series to improve performance for hugetlb and vmalloc on arm64.
>> Although some of these patches are core-mm, advice from Andrew was to go via the
>> arm64 tree. Hopefully I can get some ACKs from mm folks.
>>
>> The 2 key performance improvements are 1) enabling the use of contpte-mapped
>> blocks in the vmalloc space when appropriate (which reduces TLB pressure). There
>> were already hooks for this (used by powerpc) but they required some tidying and
>> extending for arm64. And 2) batching up barriers when modifying the vmalloc
>> address space for upto 30% reduction in time taken in vmalloc().
>>
>> vmalloc() performance was measured using the test_vmalloc.ko module. Tested on
>> Apple M2 and Ampere Altra. Each test had loop count set to 500000 and the whole
>> test was repeated 10 times.
>>
> I will have a look and review just give me some time :)

Thanks for the reviews - appreciate it!

> 
> --
> Uladzislau Rezki

