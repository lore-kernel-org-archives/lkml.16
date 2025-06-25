Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2149B1A4E9E;
	Wed, 25 Jun 2025 02:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750819302; cv=none; b=PlM3CjBsGXiR9mJ2ATJpuILv4tpsWDW5roVyg7KXscf2+yKahj1ACJ81BCaDan+TGsw6O6Y46IGbMSnVHQ1glSsjAgsFWKAz7dDel15Tuut6em5NYS7iteCYMAwyw+4kSN+9zkBVkMOw+fCOHYLWOcSRBz8kX5Vy9PqsOayb0yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750819302; c=relaxed/simple;
	bh=BM18j/jSKaNiUI9qg/26vUGPAgDnxE7Wu64OlBKchy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kl18m0HkN8BYlxQPm0vuCa+u9ky0GwMzs5GGhrnAe85oTbvDYJY8Rw6QyP7mcsk254Vze9T6oveSRDGg/2cdNTUTm6qJIgki1ls1x/PWIY/fQ18Xry5w0sP4SGxvvd1bs6kPLxKwzrAn3QXuvcSFsObly7wz6LtuYCWvtm+Kgyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uJM6BLB6; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uJM6BLB6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=bqS8VBg7H0zTWw6zFLBSfLSl1NjJXNGmF0tzhS3Kfso=; b=uJM6BLB6B2t3Hd1d3c/bLLVmUJ
	WsX1a480WFy1MFsocTmD3mRD4/ClPRzuXYr8zdrxd9FaNSZLNS1AwU+fNGZ3o5Ao/RmNmsKBqGshd
	KVJ48+c6bEoIm1danbGhcUZ+UOFmNbC/BB3ZRiVq1v45VjL/pqrdxGEeAvPPtAOvK0Ae/pV1PWPoF
	7I+aGCrfnzrW20oA5LMe7a+PKmT9BayPtr8ml0/TggFcPVA/bM5tN1mV3K1VcWzFG92Z4qGPn3n7U
	2q8E4xUHfXSjA4C3vK7bFhg1J4XiL7TDrgxcj3zRsUCtN6R/jL+mQQcdhZBu9bewvdlPa7XKfYGRo
	PzRUad4g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUG4r-00000008GIU-2xCp;
	Wed, 25 Jun 2025 02:41:33 +0000
Message-ID: <ff155de3-7e7e-47ea-92ff-c14cc0a2dc1f@infradead.org>
Date: Tue, 24 Jun 2025 19:41:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] docs: dma-api: use "DMA API" consistently throughout
 the document
To: Petr Tesarik <ptesarik@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Morton <akpm@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Leon Romanovsky <leon@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Caleb Sander Mateos <csander@purestorage.com>,
 Sagi Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>,
 John Garry <john.g.garry@oracle.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
References: <20250624133923.1140421-1-ptesarik@suse.com>
 <20250624133923.1140421-2-ptesarik@suse.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624133923.1140421-2-ptesarik@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Petr,

On 6/24/25 6:39 AM, Petr Tesarik wrote:
> Make sure that all occurrences are spelled "DMA API" (all uppercase, no
> hyphen, no underscore).
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>

LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/core-api/dma-api.rst | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index 2ad08517e626..97f42c15f5e4 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -13,10 +13,10 @@ machines.  Unless you know that your driver absolutely has to support
>  non-consistent platforms (this is usually only legacy platforms) you
>  should only use the API described in part I.
>  
> -Part I - dma_API
> +Part I - DMA API
>  ----------------
>  
> -To get the dma_API, you must #include <linux/dma-mapping.h>.  This
> +To get the DMA API, you must #include <linux/dma-mapping.h>.  This
>  provides dma_addr_t and the interfaces described below.
>  
>  A dma_addr_t can hold any valid DMA address for the platform.  It can be
> @@ -76,7 +76,7 @@ may only be called with IRQs enabled.
>  Part Ib - Using small DMA-coherent buffers
>  ------------------------------------------
>  
> -To get this part of the dma_API, you must #include <linux/dmapool.h>
> +To get this part of the DMA API, you must #include <linux/dmapool.h>
>  
>  Many drivers need lots of small DMA-coherent memory regions for DMA
>  descriptors or I/O buffers.  Rather than allocating in units of a page
> @@ -247,7 +247,7 @@ Maps a piece of processor virtual memory so it can be accessed by the
>  device and returns the DMA address of the memory.
>  
>  The direction for both APIs may be converted freely by casting.
> -However the dma_API uses a strongly typed enumerator for its
> +However the DMA API uses a strongly typed enumerator for its
>  direction:
>  
>  ======================= =============================================
> @@ -775,19 +775,19 @@ memory or doing partial flushes.
>  	of two for easy alignment.
>  
>  
> -Part III - Debug drivers use of the DMA-API
> +Part III - Debug drivers use of the DMA API
>  -------------------------------------------
>  
> -The DMA-API as described above has some constraints. DMA addresses must be
> +The DMA API as described above has some constraints. DMA addresses must be
>  released with the corresponding function with the same size for example. With
>  the advent of hardware IOMMUs it becomes more and more important that drivers
>  do not violate those constraints. In the worst case such a violation can
>  result in data corruption up to destroyed filesystems.
>  
> -To debug drivers and find bugs in the usage of the DMA-API checking code can
> +To debug drivers and find bugs in the usage of the DMA API checking code can
>  be compiled into the kernel which will tell the developer about those
>  violations. If your architecture supports it you can select the "Enable
> -debugging of DMA-API usage" option in your kernel configuration. Enabling this
> +debugging of DMA API usage" option in your kernel configuration. Enabling this
>  option has a performance impact. Do not enable it in production kernels.
>  
>  If you boot the resulting kernel will contain code which does some bookkeeping
> @@ -826,7 +826,7 @@ example warning message may look like this::
>  	<EOI> <4>---[ end trace f6435a98e2a38c0e ]---
>  
>  The driver developer can find the driver and the device including a stacktrace
> -of the DMA-API call which caused this warning.
> +of the DMA API call which caused this warning.
>  
>  Per default only the first error will result in a warning message. All other
>  errors will only silently counted. This limitation exist to prevent the code
> @@ -834,7 +834,7 @@ from flooding your kernel log. To support debugging a device driver this can
>  be disabled via debugfs. See the debugfs interface documentation below for
>  details.
>  
> -The debugfs directory for the DMA-API debugging code is called dma-api/. In
> +The debugfs directory for the DMA API debugging code is called dma-api/. In
>  this directory the following files can currently be found:
>  
>  =============================== ===============================================
> @@ -882,7 +882,7 @@ dma-api/driver_filter		You can write a name of a driver into this file
>  
>  If you have this code compiled into your kernel it will be enabled by default.
>  If you want to boot without the bookkeeping anyway you can provide
> -'dma_debug=off' as a boot parameter. This will disable DMA-API debugging.
> +'dma_debug=off' as a boot parameter. This will disable DMA API debugging.
>  Notice that you can not enable it again at runtime. You have to reboot to do
>  so.
>  

-- 
~Randy
