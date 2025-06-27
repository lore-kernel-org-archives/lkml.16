Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715CB2ECEAE
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043819; cv=none; b=qVECDw/otpSyoIz5zi9rreObmdi1L5gUBvFLRncqDThDgNxcetRrBWu81SQr8iUxdU6Xx8Lczy0eqanWEHd5nAnJsc7csI64U+JRIF/l6xIqErgQAiZZfRh7moeVBIcu1ZauDdxTZ9zKHMRCUYeu+Q0ee4Dmi12eMc1bQi167fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043819; c=relaxed/simple;
	bh=Bl17nU32PYY0mfnqBUXkZugRBtosIRGebig5NgEArq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=onrV1uulkw52agCoZyVaPd+sa9WYwPH8lvRPwzNEl5W5CV6MuifFb1OuTGWf+4OKI8Wr9Xa9a1UJBUeytPGczkpN5Tt/TksNEm9Pha0f7TqtV5GPubM0c1EivKMfMdzyOvdr+WLUZEdyhtfK2EqKYSRHjtrGGlYLPW6p+je6TPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NzBeJhBt; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NzBeJhBt"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250627170335euoutp018eabefec087ff9e510004936d7b08372~M9RKpVIs_2993529935euoutp01d
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:03:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250627170335euoutp018eabefec087ff9e510004936d7b08372~M9RKpVIs_2993529935euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751043815;
	bh=EcYKeQ90MrmdmAbxLfcsOIQdKUS+o3TqNJwZyexyxds=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=NzBeJhBt90+oThbD66LNBOdMHMwJVILJx5QZ9HxsqzJiT3XPUy2rjYX9nfSVPW7bY
	 VnT9neIXW++YwH8dJvs7h9hriBNhSmowlZDHHGHzNCNgqcjEiIjPLyGXES4wbsJD8d
	 vX6VFpu54MmWKyWEHIJGU1lGhb8WdsA/wihkGUfo=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250627170335eucas1p2247120d3944e0632e15355f8440fc863~M9RKUtXit0185901859eucas1p20;
	Fri, 27 Jun 2025 17:03:35 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250627170334eusmtip2a88872059a6556eab5b71c9b57828f79~M9RJq11mQ3273132731eusmtip2D;
	Fri, 27 Jun 2025 17:03:34 +0000 (GMT)
Message-ID: <6de6c314-15a3-40df-ab67-95af7d4378c6@samsung.com>
Date: Fri, 27 Jun 2025 19:03:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] update DMA API documentation
To: Petr Tesarik <ptesarik@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Keith Busch
	<kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Bagas Sanjaya
	<bagasdotme@gmail.com>, "open list:DOCUMENTATION"
	<linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open
 list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250627101015.1600042-1-ptesarik@suse.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250627170335eucas1p2247120d3944e0632e15355f8440fc863
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250627101022eucas1p2f3715c9c9439ca986217e380d4d3e254
X-EPHeader: CA
X-CMS-RootMailID: 20250627101022eucas1p2f3715c9c9439ca986217e380d4d3e254
References: <CGME20250627101022eucas1p2f3715c9c9439ca986217e380d4d3e254@eucas1p2.samsung.com>
	<20250627101015.1600042-1-ptesarik@suse.com>

On 27.06.2025 12:10, Petr Tesarik wrote:
> A few documentation updates:
>
> * remove outdated and confusing parts
> * reduce duplicates
> * update streaming DMA API expectations

Thanks for this cleanup and documentation clarification! Feel free to 
add for the whole patchset:

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>


> Changes from v1:
>
> * move DMA Pools to dma-api.rst
> * improve streaming DMA addressing constraints
>
> Petr Tesarik (8):
>    docs: dma-api: use "DMA API" consistently throughout the document
>    docs: dma-api: replace consistent with coherent
>    docs: dma-api: remove remnants of PCI DMA API
>    docs: dma-api: add a kernel-doc comment for dma_pool_zalloc()
>    docs: dma-api: remove duplicate description of the DMA pool API
>    docs: dma-api: clarify DMA addressing limitations
>    docs: dma-api: update streaming DMA physical address constraints
>    docs: dma-api: clean up documentation of dma_map_sg()
>
>   Documentation/core-api/dma-api-howto.rst |  36 ++---
>   Documentation/core-api/dma-api.rst       | 191 ++++++++---------------
>   Documentation/core-api/mm-api.rst        |   6 -
>   include/linux/dmapool.h                  |   8 +
>   mm/dmapool.c                             |   6 +-
>   5 files changed, 97 insertions(+), 150 deletions(-)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

