Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0BB238D53
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750921780; cv=none; b=Hr0DolHM8cksOcuJiJde/4QWPxVsIPbpeGGbeLGo6dF3s36R7BDSiAt7ue/5jENEffGz8w1QqrC19li+v/qbiYXVZJQFkPdBDWt7jyxrFSNXlinQAT7V1RQSd1AJwcAtwqf6svJCZtuJl9cL4Ut8cX6jmFdOE6ZNzZk4CMFbB40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750921780; c=relaxed/simple;
	bh=2/5DC7I+Tq8EAb98n+XCp/8dexd1E/pb7+MGae+4FX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=uw8h8XM5+1YbcRrg7C66N9JmrZ+w3sqdHqXQ8uc6kcLPmmPzvqVXHNKjKMOTBWtzdBrPXTOqXC9MiCrN2Gghk7Pl/2I4HqHYfBuxT7lAu3LsufZyXJGMoevsZg1dGIbAxyyZgNdp9leAw2Gc1MK8wQKYnIAaHr02g/xgDXdqWDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=sPriQ8ui; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sPriQ8ui"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250626070936euoutp018e8ef13119d54cb0f0d4511cf6d7bf98~MhhQxW83d1045810458euoutp01H
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:09:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250626070936euoutp018e8ef13119d54cb0f0d4511cf6d7bf98~MhhQxW83d1045810458euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750921776;
	bh=xyLppUH/lMf7fJn9j7xcwn6KMqgflVkKpFIhS2f2+MA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=sPriQ8uiqRTWXPcO3E9/f9ZPX7sQvaGrCdH0LNTXFAQLXl+/dNgMT8IXqDvW4sQix
	 uAGIkuKgIVCgcVqZ80TjHl0mKh4VheRZKFKJiYRv5M6+22JVK8LMaK4mcCv8VMYjf7
	 rF+v9C2sA3EYhlHM9F0DX/Z/xXySFBQPkBwJkAkQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250626070936eucas1p20acd53ee81a9da902daa980525b59c0a~MhhQYGeyR1269612696eucas1p2o;
	Thu, 26 Jun 2025 07:09:36 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250626070934eusmtip291f59cac2130b379c3567425bb69fabb~MhhPUlpnb2273122731eusmtip2o;
	Thu, 26 Jun 2025 07:09:34 +0000 (GMT)
Message-ID: <1312ef41-1f7c-4b6a-9d04-aa49faaf9b17@samsung.com>
Date: Thu, 26 Jun 2025 09:09:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] docs: dma-api: update streaming DMA API physical
 address constraints
To: Petr Tesarik <ptesarik@suse.com>, Robin Murphy <robin.murphy@arm.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky
	<leon@kernel.org>, Keith Busch <kbusch@kernel.org>, Caleb Sander Mateos
	<csander@purestorage.com>, Sagi Grimberg <sagi@grimberg.me>, Jens Axboe
	<axboe@kernel.dk>, John Garry <john.g.garry@oracle.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>, "open list:MEMORY MANAGEMENT"
	<linux-mm@kvack.org>, iommu@lists.linux.dev
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250626070602.3d42b607@mordecai.tesarici.cz>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250626070936eucas1p20acd53ee81a9da902daa980525b59c0a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250626050612eucas1p166c9c423aa791a0f3f65ae6140e3e807
X-EPHeader: CA
X-CMS-RootMailID: 20250626050612eucas1p166c9c423aa791a0f3f65ae6140e3e807
References: <20250624133923.1140421-1-ptesarik@suse.com>
	<20250624133923.1140421-8-ptesarik@suse.com> <aFynHWAYtKPFT55P@archie.me>
	<CGME20250626050612eucas1p166c9c423aa791a0f3f65ae6140e3e807@eucas1p1.samsung.com>
	<20250626070602.3d42b607@mordecai.tesarici.cz>

On 26.06.2025 07:06, Petr Tesarik wrote:
> On Thu, 26 Jun 2025 08:49:17 +0700
> Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
>> On Tue, Jun 24, 2025 at 03:39:22PM +0200, Petr Tesarik wrote:
>>> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
>>> index cd432996949c..65132ec88104 100644
>>> --- a/Documentation/core-api/dma-api.rst
>>> +++ b/Documentation/core-api/dma-api.rst
>>> @@ -210,18 +210,12 @@ DMA_BIDIRECTIONAL	direction isn't known
>>>   	this API should be obtained from sources which guarantee it to be
>>>   	physically contiguous (like kmalloc).
>>>   
>>> -	Further, the DMA address of the memory must be within the dma_mask of
>>> -	the device.  To ensure that the memory allocated by kmalloc is within
>>> -	the dma_mask, the driver may specify various platform-dependent flags
>>> -	to restrict the DMA address range of the allocation (e.g., on x86,
>>> -	GFP_DMA guarantees to be within the first 16MB of available DMA
>>> -	addresses, as required by ISA devices).
>>> -
>>> -	Note also that the above constraints on physical contiguity and
>>> -	dma_mask may not apply if the platform has an IOMMU (a device which
>>> -	maps an I/O DMA address to a physical memory address).  However, to be
>>> -	portable, device driver writers may *not* assume that such an IOMMU
>>> -	exists.
>>> +	Mapping may also fail if the memory is not within the DMA mask of the
>>> +	device.  However, this constraint does not apply if the platform has
>>> +	an IOMMU (a device which maps an I/O DMA address to a physical memory
>>> +	address), or the kernel is configured with SWIOTLB (bounce buffers).
>>> +	It is reasonable to assume that at least one of these mechanisms
>>> +	allows streaming DMA to any physical address.
> Now I realize this last sentence may be contentious...
>
> @Marek, @Robin Do you agree that device drivers should not be concerned
> about the physical address of a buffer passed to the streaming DMA API?
>
> I mean, are there any real-world systems with:
>    * some RAM that is not DMA-addressable,
>    * no IOMMU,
>    * CONFIG_SWIOTLB is not set?
>
> FWIW if _I_ received a bug report that a device driver fails to submit
> I/O on such a system, I would politely explain the reporter that their
> kernel is misconfigured, and they should enable CONFIG_SWIOTLB.

What about the systems with legacy 16/24bit ZONE_DMA (i.e. ISA bus)? 
AFAIR they don't use SWIOTLB and probably they won't be able to use 
streaming DMA API for all system RAM.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

