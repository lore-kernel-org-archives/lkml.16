Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3992BCFB;
	Sat, 28 Jun 2025 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751137103; cv=none; b=AiORPTs4p6PgmnsNeqJRlvJ1zgKF50eeY1FfUbna4gDfQRNxzycDlj/LiacVxvLUceCVsb/sSNkAAP8DT3SByLapnCUSKkwPymcxtX+OgfVNprzxklsXwqHa6Op2ErgLYEAUdaUk1BkmjcjGrboNebfU0nevn0TpBkkS3/2r4g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751137103; c=relaxed/simple;
	bh=gyGvX5VhpMF7C5td3mJWg76WOm2wWnCvz7We7oIittc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gv04nSbzm7QyK0RjpIWjtZM3oOAiaboU2coqSQolj7d2Nx2oyX72oU49TvyNm1CISbNLSI/Pfr/N+kt8ShKMOqmDc0bq61WWvMYD1DllZzLsuhQHuaLie9ISTSs4MHnj/5OZgCq6bNiRjke4XPn3xyQIQ5iJE2WEpTnL/FW4/HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sgTV00gh; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sgTV00gh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=1XvlWuNp4gjBKcSdNzZU5KMUhpIwvZVJU4F+yvgKsxU=; b=sgTV00ghbPFAZXetQbmng4lo2s
	Kuh59y57uL4JGNrM5Pv+VbefBqyAKhNjPMUaIRemEMNdGP9+orVIBHtMjE/1mUrPvxDKr3B56VCWX
	DTBhdPyJKcEX0rUUYnkc+JRiDshMvgC5N6o60Ks8qgjjeUyNGMOQYUWnxDVznR6jPlG/n2tDjSIXD
	t24n6azfck+LxxBmIVG6pChucWOGlNBb5T3sVVGij+oZ3Xx2GWyKjSObS2FRsIGa7hHvCowS28x/U
	Jbc50NuYv7Ovm0KqBeE7gpSWXlWNDXdvY4egWy5XS6kKOnkT4eQ+zIzga5R5xNxMbw287JO50lSi6
	LpNE5rjA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVakh-0000000H7hU-1DZz;
	Sat, 28 Jun 2025 18:58:15 +0000
Message-ID: <7a31ca61-755b-46b6-9f49-ec1fe7f59451@infradead.org>
Date: Sat, 28 Jun 2025 11:58:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] docs: dma-api: remove remnants of PCI DMA API
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
 <20250627101015.1600042-4-ptesarik@suse.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250627101015.1600042-4-ptesarik@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/27/25 3:10 AM, Petr Tesarik wrote:
> The wording sometimes suggests there are multiple functions for an
> operation. This was in fact the case before PCI DMA API was removed, but
> since there is only one API now, the documentation has become confusing.
> 
> To improve readability:
> 
> * Remove implicit references to the PCI DMA API (plurals, use of "both",
>   etc.)
> 
> * Where possible, refer to an actual function rather than a more generic
>   description of the operation.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/core-api/dma-api.rst | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)

-- 
~Randy
