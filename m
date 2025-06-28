Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F98445C14;
	Sat, 28 Jun 2025 19:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751137460; cv=none; b=ojNMgpXfBH1co6sYo6bFK4chk0eEYDG/rBs0uDL+gCZxowFIquvW32rs6JRRtyqvnEh9+XH6dIAtCjZMgB5gy1tANw0NRx+hs3Aa8mkS7CXFEtEAVt14EQ0bRcVwEYTCK7CgI0ulmD90w15Eyh9wkHTSkT8a8LG7Ujxj9R0ReOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751137460; c=relaxed/simple;
	bh=EOVkOpZulGRieuVaIQ/dEKEgVLuHFbOFjDuEaPVLFag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXPGhXgoBdJWbzewEy4aTy5nT3Q0eQ+aGUv6D11Lp/wJXB1iQDMtIXtuov1FJovDvqTNkNTHbu9oCvPhM+FCC5tlUxQ33j971HvOKL8ys9IH2Qso31FOzOlUiv4Qn8XMlLiXCj+xD97MHHWVoRjmN+lbZy7zfN/4yU7kqNHfTzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QjHPWTmp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QjHPWTmp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Nxz4kNnt/9AKFCXpu4ru2YmjSRfXH33QiY//BZtaPNU=; b=QjHPWTmprCZU8ViCBaOUFC2UTB
	p90n+CFv8iCkFdxe9yqU6SvG80RnR9aqR0/nx1RjudgVzoqn/lHHFzPI6A3uQq+UdOnz/6JXDYZ4y
	Vhq6afuVBlddfrIqIjabDm6r9HoLy2IEt8tgiJ3oKwUSaYiHuzbtm07q/wvuZiAKxzHf81QPZgLBe
	Z653Bzp+SpC9SqaTxtXqkQd4k7Vuyzu4i1M4VUAVD8xSuH+g/yINhhpbjC7bBcUrl9ML1D4Tlx8R1
	r+eFwaFQuBHT+LejmE0nTKWLESIHeKYaYPfH3Mvt9cRxPwwRoscz0wdzdEwkwYlljAZwmnEA+ZXC/
	UJc7XRqQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVaqS-0000000H8Ou-1u3X;
	Sat, 28 Jun 2025 19:04:12 +0000
Message-ID: <5a997777-fd14-40e1-919b-2e61a6e8d570@infradead.org>
Date: Sat, 28 Jun 2025 12:04:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] docs: dma-api: add a kernel-doc comment for
 dma_pool_zalloc()
To: Petr Tesarik <ptesarik@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Keith Busch
 <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
References: <20250627101015.1600042-1-ptesarik@suse.com>
 <20250627101015.1600042-5-ptesarik@suse.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250627101015.1600042-5-ptesarik@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/27/25 3:10 AM, Petr Tesarik wrote:
> Document the dma_pool_zalloc() wrapper.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> ---
>  Documentation/core-api/mm-api.rst | 2 ++
>  include/linux/dmapool.h           | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
> index af8151db88b28..a61766328ac06 100644
> --- a/Documentation/core-api/mm-api.rst
> +++ b/Documentation/core-api/mm-api.rst
> @@ -97,6 +97,8 @@ DMA pools
>  .. kernel-doc:: mm/dmapool.c
>     :export:
>  
> +.. kernel-doc:: include/linux/dmapool.h
> +
>  More Memory Management Functions
>  ================================
>  
> diff --git a/include/linux/dmapool.h b/include/linux/dmapool.h
> index 06c4de602b2f3..c0c7717d3ae7b 100644
> --- a/include/linux/dmapool.h
> +++ b/include/linux/dmapool.h
> @@ -60,6 +60,14 @@ static inline struct dma_pool *dma_pool_create(const char *name,
>  				    NUMA_NO_NODE);
>  }
>  
> +/**
> + * dma_pool_zalloc - Get a zero-initialized block of DMA coherent memory.
> + * @pool: dma pool that will produce the block
> + * @mem_flags: GFP_* bitmask
> + * @handle: pointer to dma address of block
> + *
> + * Same as @dma_pool_alloc, but the returned memory is zeroed.

    * Same as dma_pool_alloc(), but ...

'@' is for function arguments.

With that change:

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.


> + */
>  static inline void *dma_pool_zalloc(struct dma_pool *pool, gfp_t mem_flags,
>  				    dma_addr_t *handle)
>  {

-- 
~Randy
