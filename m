Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3B327BF6F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499520; cv=none; b=iXyfqfgnXKvZZrDCwbje8KsnXvvqzkkz4nfF/CiC9piL1TqKDu+jBgr9OscQHFdyZYOeU5rHnOXNnVV3r/kCu1Lo6hKoI3yRwwLpkVWTmOzSOj1WRnLJqplpLUCI2bbmoZZlLx7KMm1dreTol/7Z1fc2U0m75zt+338vuFmhnoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499520; c=relaxed/simple;
	bh=9Pck/qOkeoVbLpDjN5c3w8O28U47VhX4gvzlwejs/vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOl36/pz/hk4TpP8W6IXgQhPN0hf8hxqnm9D5VgCwlSS6R4mlWfAS1mGC9KWC0rEQsle4fdmUNTX04qxBb3YpdwtTZUjnzu3XIqTqDTbDQseUMjTCy9DmEayHn3nSYr+F9kYT4gBDZNPk1ficaFw4wCkL+9KZ8CivaeJ0yCeWZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83EDA1063;
	Thu, 24 Apr 2025 05:58:32 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8AC73F66E;
	Thu, 24 Apr 2025 05:58:36 -0700 (PDT)
Message-ID: <841c417b-c61a-4c3a-a9ed-236634d78331@arm.com>
Date: Thu, 24 Apr 2025 13:58:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] swiotlb: Make IO_TLB_SEGSIZE Configurable
To: "Li, Hua Qian" <HuaQian.Li@siemens.com>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
Cc: "Kiszka, Jan" <jan.kiszka@siemens.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "Su, Bao Cheng" <baocheng.su@siemens.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20250422063734eucas1p2561ad6f847f6824c9c79a842fa458e41@eucas1p2.samsung.com>
 <20250422063719.121636-1-huaqian.li@siemens.com>
 <fc2e30eb-2ec7-4795-a2a4-077b7fde7fd5@samsung.com>
 <dc6f299b18f7870c7bffecca25cee9e436a32c7b.camel@siemens.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <dc6f299b18f7870c7bffecca25cee9e436a32c7b.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/04/2025 6:12 am, Li, Hua Qian wrote:
> On Tue, 2025-04-22 at 15:36 +0200, Marek Szyprowski wrote:
>> On 22.04.2025 08:37, huaqian.li@siemens.com wrote:
>>> From: Li Hua Qian <huaqian.li@siemens.com>
>>>
>>> This patchset introduces a change to make the IO_TLB_SEGSIZE
>>> parameter
>>> configurable via a new kernel configuration option
>>> (CONFIG_SWIOTLB_SEGSIZE).
>>>
>>> In certain applications, the default value of IO_TLB_SEGSIZE (128)
>>> may
>>> not be sufficient for memory allocation, leading to runtime errors.
>>> By
>>> making this parameter configurable, users can adjust the segment
>>> size to
>>> better suit their specific use cases, improving flexibility and
>>> system
>>> stability.
>>
>> Could You elaborate a bit more what are those certain applications
>> that
>> require increasing IO_TLB_SEGSIZE? I'm not against it, but such
>> change
>> should be well justified and described, while the above cover-letter
>> doesn't provide anything more than is written in the patch
>> description.
> Thank you for your feedback, Marek.
> 
> To provide more context, one specific application that requires
> increasing IO_TLB_SEGSIZE is the Hailo 8 PCIe AI card. This card uses
> dma_alloc_coherent to allocate descriptor lists, as seen in the Hailo
> driver implementation here:
> https://github.com/hailo-ai/hailort-drivers/blob/7161f9ee5918029bd4497f590003c2f87ec32507/linux/vdma/memory.c#L322
> The maximum size (nslots) for these allocations can reach 160, which
> exceeds the current default value of IO_TLB_SEGSIZE (128).
> 
> Since IO_TLB_SEGSIZE is defined as a constant in the kernel:
> 
> `#define IO_TLB_SEGSIZE 128`
> 
> 
> this limitation causes swiotlb_search_pool_area,
> https://github.com/torvalds/linux/blame/v6.15-rc2/kernel/dma/swiotlb.c#L1085,
> (or swiotlb_do_find_slots in older kernels) to fail when attempting to
> allocate contiguous physical memory (CMA). This results in runtime
> errors and prevents the Hailo 8 card from functioning correctly in
> certain configurations.

Hmm, dma_alloc_coherent() should really not be trying to allocate from 
SWIOTLB in the first place - how is that happening?

If you're using restricted DMA for a device which wants significant 
coherent allocations, then it wants to have it's own shared-dma-pool for 
those *as well* as the restricted-dma-pool for bouncing streaming DMA.

Thanks,
Robin.

> By making IO_TLB_SEGSIZE configurable via a kernel configuration option
> (CONFIG_SWIOTLB_SEGSIZE), users can adjust the segment size to
> accommodate such use cases. This change improves flexibility and
> ensures that systems can be tailored to meet the requirements of
> specific hardware, such as the Hailo 8 PCIe AI card, without requiring
> kernel source modifications.
> 
> I hope this example clarifies the need for this change. Please let me
> know if further details or additional examples are required.
> 
> Best Regards,
> Li Hua Qian
>>
>>
>>> Li Hua Qian (1):
>>>     swiotlb: Make IO_TLB_SEGSIZE configurable
>>>
>>>    include/linux/swiotlb.h | 2 +-
>>>    kernel/dma/Kconfig      | 7 +++++++
>>>    2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>> Best regards
> 
