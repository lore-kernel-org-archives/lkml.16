Received: from mailrelay2-3.pub.mailoutpod2-cph3.one.com (mailrelay2-3.pub.mailoutpod2-cph3.one.com [46.30.212.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167A82676CD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745438103; cv=none; b=rLaXe4qB9HBBWjhE/vsMXyOA/Jsv+hby7pt4QtRNGhfR7+OCji29++yn2d5FA4oWkHGZZXOxAAiVCWOvwYq5u+SouQVWFAKXUx7zhgYKIS2eyNgZ95JWyReh6OCPUZZPr2YaWDSXWBa51VQsr5iIQaDrd56aaBkiWL/ua6SlXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745438103; c=relaxed/simple;
	bh=FENHtUzLZxH66ML91Hoqcdgwfian12aB11KsrLhmvSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/7U1cgmaL1xD1ZzjO5v1rdD6yl23EJAl+UixHrnw+naUq/Ex5tNz7Alu5UK0MRS5LcyBUCqB3oqfRJKULdEtdCFtHM1Zt26+Ltl5FngYtLikhGvGPBYDi/YQHLXgNJW3S5CdiqJ1baDChZmyiGTXllzNUtkofzetIRgXGRJM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=FzYSIMOH; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=ouajgcZY; arc=none smtp.client-ip=46.30.212.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="FzYSIMOH";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="ouajgcZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1745438029; x=1746042829;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=qA+d6OUZ9bNJv97jT/8eGXPf4gfJm5aPw309Dk0gVRU=;
	b=FzYSIMOHEJIBwbrlQ+/LIkdNQgag36MUq1WDzNkxO/TT1CtGqNziVPJ39ef5InR3su57uidWCR9TB
	 bxRMqCus+Ts7ij7U6jv6lbRI3aVNVWHunkm4yr0NrmywsqAVH8E0yk59Ccho4FQJT0z3cVJ5IlaOG+
	 wweSSK9ORlLA1CT1KvgXa4teJQ839iFjIhKa46hPbOLiatSgVwt9HI+tFXkbkivPtsl4oa8AP0FZnb
	 wRyPtOOmjCZvELGQvdjr4UV8d+U7ue/AAze+afM/5yWxeqVns70G6W7E+iTWIoACokdcmII6YP194+
	 YiH4x6K52zaCo8eraz2924qy6iw34Gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1745438029; x=1746042829;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=qA+d6OUZ9bNJv97jT/8eGXPf4gfJm5aPw309Dk0gVRU=;
	b=ouajgcZYWzmj9qoZbAAvwpJk7klAZdzdemlpG/tu6s5AvydF9I+k9bsZ5MFYQGysU+s99MAfxwZFU
	 3fRYJjZDg==
X-HalOne-ID: abfa3abc-207c-11f0-bd4e-91f375301d21
Received: from [192.168.10.245] (host-90-233-218-222.mobileonline.telia.com [90.233.218.222])
	by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id abfa3abc-207c-11f0-bd4e-91f375301d21;
	Wed, 23 Apr 2025 19:53:48 +0000 (UTC)
Message-ID: <e764d05a-6a83-4563-9f28-3f1a3e28727b@konsulko.se>
Date: Wed, 23 Apr 2025 21:53:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm: add zblock allocator
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>,
 Igor Belousov <igor.b@beldev.am>, Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
 <aAdzjdv674Jn6G63@Asmaa.>
Content-Language: en-US
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aAdzjdv674Jn6G63@Asmaa.>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/25 12:46, Yosry Ahmed wrote:
> I didn't look too closely but I generally agree that we should improve
> zsmalloc where possible rather than add a new allocator. We are trying
> not to repeat the zbud/z3fold or slub/slob stories here. Zsmalloc is
> getting a lot of mileage from both zswap and zram, and is more-or-less
> battle-tested. Let's work toward building upon that instead of starting
> over.

The thing here is, zblock is using a very different approach to small 
object allocation. The idea is: we have an array of descriptors which 
correspond to multi-page blocks divided in chunks of equal size 
(block_size[i]). For each object of size x we find the descriptor n such as:
	block_size[n-1] < n < block_size[n]
and then we store that object in an empty slot in one of the blocks. 
Thus, the density is high, the search is fast (rbtree based) and there 
are no objects spanning over 2 pages, so no extra memcpy involved.

And with the latest zblock, we see that it has a clear advantage in 
performance over zsmalloc, retaining roughly the same allocation density 
for 4K pages and scoring better on 16K pages. E. g. on a kernel compilation:

* zsmalloc/zstd/make -j32 bzImage
	real	8m0.594s
	user	39m37.783s
	sys	8m24.262s
	Zswap:            200600 kB <-- after build completion
	Zswapped:         854072 kB <-- after build completion
	zswpin 309774
	zswpout 1538332

* zblock/zstd/make -j32 bzImage
	real	7m35.546s
	user	38m03.475s
	sys	7m47.407s
	Zswap:            250940 kB <-- after build completion
	Zswapped:         870660 kB <-- after build completion
	zswpin 248606
	zswpout 1277319

So what we see here is that zblock is definitely faster and at least not 
worse with regard to allocation density under heavy load. It has 
slightly worse _idle_ allocation density but since it will quickly catch 
up under load it is not really important. What is important is that its 
characteristics don't deteriorate over time. Overall, zblock is simple 
and efficient and there is /raison d'etre/ for it.

Now, it is indeed possible to partially rework zsmalloc using zblock's 
algorithm but this will be a rather substantial change, equal or bigger 
in effort to implementing the approach described above from scratch (and 
this is what we did), and with such drastic changes most of the testing 
that has been done with zsmalloc would be invalidated, and we'll be out 
in the wild anyway. So even though I see your point, I don't think it 
applies in this particular case.

~Vitaly
