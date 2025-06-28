Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A34D2586EE;
	Sat, 28 Jun 2025 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751137141; cv=none; b=d/PsR/nJ7PgTSq9wLVrujR7UcemLMWXgMRrxTr/tg3JDMMxBuXYNgAYsZ8SLNekX1fMZhfMIx0Khwym8XT7HsjoBe/VqSr25Wrzi/2YRfNyII8XwJgQLslcFgYUhQ0H5QbcDLMBMpYMQc9IlHi9gKBCUFwHMe4inNtJVKQvPGC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751137141; c=relaxed/simple;
	bh=qMQBAzTXxBjsXYlGhKevEso+JjBuQ72DfUAdeX4bFgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GKGJmxAO6qEMBNfeXCPGw6unQvJiU/5Wbc1fnfU8o9vDIVNKAX7bbpJIj1g7mbh1sY605I56rq4XOzEmW1lAiGJcJ7o1KBRUTFngrt2En2FjmFAHaxqXdAUAw0C1cAoTZK93Tav6h3ZT/IKMcH4J3ul7cztfIXnHOWxv6tjO9Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hBtKZEdi; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hBtKZEdi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oA2jHaW6+CJOzNjSaXU3VpNLWqFmvE+xVZ3Wrn3GAbo=; b=hBtKZEdiItL4RXCnEM/iUx6SGo
	2UxnkpxJUlb1IDaEdlxbe27QcNxWrufZYhUupqRp+54G6DRKGAyAiApTkNGqCwzJMGt0QQafN30eq
	LIQDBa9SFL4CBgT+76aYGm2457x1HOOs06B/oc9IwNu2Lg0AqY1d+pXPTwPiXfWsUJaIPkPeHnyXp
	3ZGr0VyxSXUsyjyCp5IseljfZu1/BOglwKvKQRD7mSAO0PylPD4F7SwtPajnmLEddMWQQwweOfYsc
	85pt8XgJchWLLne+TijUJlq171r5Zv3TJxwCvfOHOmjSwLKOBJS/BbH77j7fkLVlZJEXSTqPIGVRk
	StDXuDkw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uValM-0000000H7rb-1MKn;
	Sat, 28 Jun 2025 18:58:56 +0000
Message-ID: <0e66cd54-fd37-40d6-8a22-b191938bf53f@infradead.org>
Date: Sat, 28 Jun 2025 11:58:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] docs: dma-api: clarify DMA addressing limitations
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
 <20250627101015.1600042-7-ptesarik@suse.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250627101015.1600042-7-ptesarik@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/27/25 3:10 AM, Petr Tesarik wrote:
> Move the description of DMA mask from the documentation of dma_map_single()
> to Part Ic - DMA addressing limitations and improve the wording.
> 
> Explain when a mask setting function may fail, and do not repeat this
> explanation for each individual function.
> 
> Clarify which device parameters are updated by each mask setting function.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/core-api/dma-api.rst | 35 +++++++++++++++---------------
>  1 file changed, 18 insertions(+), 17 deletions(-)

-- 
~Randy
