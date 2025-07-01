Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEE2212FB3;
	Tue,  1 Jul 2025 19:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751399615; cv=none; b=XPtmasFuK89v2KfT6EX8PI518aljo6ymPfWR29j6zwdrQuUC1Lie9dKkH6UP3MAmH9+DyLJsSfJo1brwk0v4khWhfoznKWYpDWkKhiBgZxjdPlapJerkR3kkY+BD/vMLIv/rA5hPnEwogezy2qrfHEg1HiII8DPwGSQZPCSUAvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751399615; c=relaxed/simple;
	bh=wLAMVDwApIvZdLGiFGiLSuAWtAB0+hrY+2DtjIyZJ9w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d2N4yxK4Gn5JdACZvdubwKELXAuehx6TH+PpzlJ7zRlEcVGJ+jPQujG2OaZpCdzBgVrOzOpDAqOiL1NnGR/rJnDKBvOkYiIIwrKTnZ5yGFPu2stI/eKeimKwJkcTLudC4QqxTEZOkhivWmRfRkNF6LF7d7m+kanswQJfyQfO/x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QgndKRvi; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QgndKRvi"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4AB44406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751399613; bh=y0sLUQ1C5YQs1dUp/IT5tY58RMmgyjuJ+9hflrM8yMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QgndKRvi38RE8TaqBdFQ+QjbFu0wA1qni3mUAOnDIeSX81fz6NjZbuJ9DAH0uK7bp
	 DY8DknLvFl/xjJFz5LsMEon1S6FTCGw9OlgQ3uWEd2EVKH72SGtaplIY4mOlDPLbN4
	 kle7ADc1Zmqig+/MvQCAQzkpaO26l849eLz8NUOB1YdzPYQqOEoRuIK2KVfSvKFext
	 orcbfooIxhfx2CRZOHy+i5L6vd6Xp+Vxvt9LwJs7rXc4c+bfp0nD+uJrVIj1W7jE91
	 v4pFFNd9ywq5oEw2xrF8e6tZL7bs+HPA2xQ7k6yk/pQlKB+QkO4xUpV1tcoj7eagYS
	 15HzI4jFkKZFQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4AB44406FC;
	Tue,  1 Jul 2025 19:53:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Petr Tesarik <ptesarik@suse.com>, Randy Dunlap <rdunlap@infradead.org>,
 Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Keith Busch
 <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Bagas Sanjaya
 <bagasdotme@gmail.com>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, Petr Tesarik
 <ptesarik@suse.com>
Subject: Re: [PATCH v2 0/8] update DMA API documentation
In-Reply-To: <20250627101015.1600042-1-ptesarik@suse.com>
References: <20250627101015.1600042-1-ptesarik@suse.com>
Date: Tue, 01 Jul 2025 13:53:32 -0600
Message-ID: <87cyajr8lf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Petr Tesarik <ptesarik@suse.com> writes:

> A few documentation updates:
>
> * remove outdated and confusing parts
> * reduce duplicates
> * update streaming DMA API expectations
>
> Changes from v1:
>
> * move DMA Pools to dma-api.rst
> * improve streaming DMA addressing constraints
>
> Petr Tesarik (8):
>   docs: dma-api: use "DMA API" consistently throughout the document
>   docs: dma-api: replace consistent with coherent
>   docs: dma-api: remove remnants of PCI DMA API
>   docs: dma-api: add a kernel-doc comment for dma_pool_zalloc()
>   docs: dma-api: remove duplicate description of the DMA pool API
>   docs: dma-api: clarify DMA addressing limitations
>   docs: dma-api: update streaming DMA physical address constraints
>   docs: dma-api: clean up documentation of dma_map_sg()

OK, I have applied these - thanks.

jon
