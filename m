Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E7A1C5D59;
	Wed, 25 Jun 2025 02:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750819492; cv=none; b=HRV24GOPt3fuppkVIn3ROcQNwDE0bXH7OP3+ftsNUWjqNpoWC/a+/O3D8g3r1YRQf4dqDUdk+xnF9T+a0wo7a6SUvzq2SnsaJybEwdCpnQP9S0eCqYjNb2B1D7VSC2cOuIlL4EJtdBYnDhxjIkb/FmjXtRztnnlwPAXt0v8vU8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750819492; c=relaxed/simple;
	bh=KMalwzn3BoF9rtZrZXblBqSJlr49R7PWwYfW/jcTElw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtkorZbg+k4twXeeK09Uf1+8akdkUUMoag1f/C003F7C74j772jml20PQkinMGazviB+ZyTc7423Xfh/abFUjcRL2AEHhEFaQ0A8VPB/VcFwPXRkz4FwKOE/3Wmc0+5q5aEYymdeGuFdN/fl7J/r4KIs8hMQbf65bsGV1GoBxS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=V3AWpWLV; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V3AWpWLV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=QhOKuwEXUK6jChw5nZdyTrOBXqUWrLJ8kphrotwMKFI=; b=V3AWpWLVWaDzC98R8eWDkEMmoz
	AivrGnORKy304ztblnzcBMPzXPxEKXGbdH99j4qF7S78JSwFp/LBJTkOJUcUr0az22YhbpTQ0EnFj
	M4v5NR7/fHmsLvQ8Efnak0zRQJWT2hIkvbsmV81xmvoZKIBBlYevYE09dT/LDqdcPM5d0HIKogOTU
	Oi+Dhq3ob5GW4Sb9eK7nGqnUXfDESXfJn28csgxoEOAPUebMAiw3Otb3c54ZV9BrnvS53zNflGn7k
	FFtoKWYgye7s2OhG3/9GybXhfOH1gljjpQmjG9p/cmUnOGPxbynQBMuW1/JItCzc4HEu4SrFFXgjw
	FFJDi9IQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUG40-00000008GCY-2IGy;
	Wed, 25 Jun 2025 02:40:40 +0000
Message-ID: <5ea93880-72fa-46c7-b69b-82e2021aa567@infradead.org>
Date: Tue, 24 Jun 2025 19:40:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] docs: dma-api: remove duplicate description of the
 DMA pool API
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
 <20250624133923.1140421-6-ptesarik@suse.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624133923.1140421-6-ptesarik@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/24/25 6:39 AM, Petr Tesarik wrote:
> The DMA pool API is documented in Memory Management APIs. Do not duplicate
> it in DMA API documentation.
> 

This looks like it works (from just visual inspection), but I'm wondering
why not just move all DMA API interfaces to dma-api.rst and don't have any
in mm-api.rst... ?

Thanks.

> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> ---
>  Documentation/core-api/dma-api.rst | 62 +-----------------------------
>  Documentation/core-api/mm-api.rst  |  2 +
>  2 files changed, 4 insertions(+), 60 deletions(-)
> 
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index 3e89e3b0ecfd..f7fddaf7510c 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -83,66 +83,8 @@ much like a struct kmem_cache, except that they use the DMA-coherent allocator,
>  not __get_free_pages().  Also, they understand common hardware constraints
>  for alignment, like queue heads needing to be aligned on N-byte boundaries.
>  
> -
> -::
> -
> -	struct dma_pool *
> -	dma_pool_create(const char *name, struct device *dev,
> -			size_t size, size_t align, size_t alloc);
> -
> -dma_pool_create() initializes a pool of DMA-coherent buffers
> -for use with a given device.  It must be called in a context which
> -can sleep.
> -
> -The "name" is for diagnostics (like a struct kmem_cache name); dev and size
> -are like what you'd pass to dma_alloc_coherent().  The device's hardware
> -alignment requirement for this type of data is "align" (which is expressed
> -in bytes, and must be a power of two).  If your device has no boundary
> -crossing restrictions, pass 0 for alloc; passing 4096 says memory allocated
> -from this pool must not cross 4KByte boundaries.
> -
> -::
> -
> -	void *
> -	dma_pool_zalloc(struct dma_pool *pool, gfp_t mem_flags,
> -		        dma_addr_t *handle)
> -
> -Wraps dma_pool_alloc() and also zeroes the returned memory if the
> -allocation attempt succeeded.
> -
> -
> -::
> -
> -	void *
> -	dma_pool_alloc(struct dma_pool *pool, gfp_t gfp_flags,
> -		       dma_addr_t *dma_handle);
> -
> -This allocates memory from the pool; the returned memory will meet the
> -size and alignment requirements specified at creation time.  Pass
> -GFP_ATOMIC to prevent blocking, or if it's permitted (not
> -in_interrupt, not holding SMP locks), pass GFP_KERNEL to allow
> -blocking.  Like dma_alloc_coherent(), this returns two values:  an
> -address usable by the CPU, and the DMA address usable by the pool's
> -device.
> -
> -::
> -
> -	void
> -	dma_pool_free(struct dma_pool *pool, void *vaddr,
> -		      dma_addr_t addr);
> -
> -This puts memory back into the pool.  The pool is what was passed to
> -dma_pool_alloc(); the CPU (vaddr) and DMA addresses are what
> -were returned when that routine allocated the memory being freed.
> -
> -::
> -
> -	void
> -	dma_pool_destroy(struct dma_pool *pool);
> -
> -dma_pool_destroy() frees the resources of the pool.  It must be
> -called in a context which can sleep.  Make sure you've freed all allocated
> -memory back to the pool before you destroy it.
> +See :ref:`Documentation/core-api/mm-api.rst <dma_pools>` for a detailed
> +description of the DMA pools API.
>  
>  
>  Part Ic - DMA addressing limitations
> diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
> index a61766328ac0..de0bab6e3fdd 100644
> --- a/Documentation/core-api/mm-api.rst
> +++ b/Documentation/core-api/mm-api.rst
> @@ -91,6 +91,8 @@ Memory pools
>  .. kernel-doc:: mm/mempool.c
>     :export:
>  
> +.. _dma_pools:
> +
>  DMA pools
>  =========
>  

-- 
~Randy

