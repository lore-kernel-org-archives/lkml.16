Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8CC78F2E;
	Sat, 28 Jun 2025 19:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751137317; cv=none; b=WEGptyi8EwGCdzngi3FuokY+Dwc5L6Lhb8HnyomWhZ4bsANInADQqnbiz5xl5Y7xMYnK+T9FKQfRWHL4VY6kmMO27ZRxgcpm7UfRyLHv+McRjSjfjdu36/0wjmeJtgydOJcrZwWKD3BCxsC0eknkI0LVGcs5apvGUlIAemsIJUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751137317; c=relaxed/simple;
	bh=+K/D9zxektbPV7/iF/5HCLdwm8I6n+bAErg+a+BOu7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kr2YkGaX0vZhBWyQRUXCXmrmqjyWObQMl8IGqOcU81B2InA1uakh7W6oqKDPY4o73WTfOkENWs+tpHzSADVtzQ27LqWK0g80sV3BR97oxM23EvL6IDoqb23mS4nJ6Av9PLg5ognUtUl1QJettg4UFkGWIBuMaQ8NIhOinKcThkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TRyNkUFS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TRyNkUFS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=6ycOmLaVvTvuyWA4nshMB7a3wiAY5zly0uelEAE1xnc=; b=TRyNkUFSdK+igWd4fg2qPgkpmY
	cBqTg2nCr6zzdveT6GX9wSzii/MGYcSGip/dga+ZVRrJvkORwSaF1fPfED5q7e+BgbnauBQJfd7j1
	FiCw3Zz3EDndvOw0DCS7oXeTJ7bTShGjtNvVtlFRksrYgu7otLI4Q+egTuEZnB01k8RyTUqIzARyy
	qr9M9yqnoqb3MsbU7lNIcVfFOoyIVa+lb4nSfvb1r6CVBdiIF1tU3LIldCoVh/6JQsT9bcQZi37Wn
	jnNitsJNI6ty/A0gGmyuw5Cj13X2K4qhtmkgz4nOkFonUupJ7feBaH1pSiSEk2q5Ga91qFDyvPXCp
	Ynzg2SCQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVaoC-0000000H8Au-1cyT;
	Sat, 28 Jun 2025 19:01:52 +0000
Message-ID: <9004d94c-b681-45cb-8df2-3281fb722276@infradead.org>
Date: Sat, 28 Jun 2025 12:01:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] docs: dma-api: remove duplicate description of the
 DMA pool API
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
 <20250627101015.1600042-6-ptesarik@suse.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250627101015.1600042-6-ptesarik@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/27/25 3:10 AM, Petr Tesarik wrote:
> Move the DMA pool API documentation from Memory Management APIs to
> dma-api.rst, replacing the outdated duplicate description there.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/core-api/dma-api.rst | 62 ++----------------------------
>  Documentation/core-api/mm-api.rst  |  8 ----
>  2 files changed, 3 insertions(+), 67 deletions(-)

-- 
~Randy
