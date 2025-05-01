Received: from mailrelay3-3.pub.mailoutpod3-cph3.one.com (mailrelay3-3.pub.mailoutpod3-cph3.one.com [46.30.212.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544701EEE6
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746103366; cv=none; b=QP9PsNUQ7+8VecLQqIH5nrE8uBCHxdB57BghAuqemfTnmwJUGV9sr2R7u8qt+2sWpWGaSGubeVXRmhP22GclFwNkKhUgf3YhmNCZGEmgzcpvNJ3r3VWstoEMO3KM5BjbJtzG/ejAPi7MUsLus5kIOSzhT9lDLxSttziEU8u2etY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746103366; c=relaxed/simple;
	bh=5BWScO4p1oGQf6FpMalCM1apggg7A8moneTgqodcGgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyCQLWRUlYOO/mE5xRDu7Bw3Q9D2JWHQVEZraFEK3uGYrz1T5h7s/iuIW2dLoA5D/DegA0+oNbNWw7KW3ENi4Z26N6jAUJZbm90gqV8IUqVQNjdJRZ33K9SpPjLU+Mf+SysbL7DxckURoLeK5BAeNbKWYhX0jJyB44ZnIqgA0Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=eH4J0JfP; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=C9nw4wtQ; arc=none smtp.client-ip=46.30.212.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="eH4J0JfP";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="C9nw4wtQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1746103290; x=1746708090;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=dqMbI5G+JrmEvic3IALCS+ZlRXR5dmjmpFvqeROmpro=;
	b=eH4J0JfP2d3wjgHQfWGln5JiptApWE0dkl/xpdgwvJ9tieEwZhUMHH1/TCg2JT5eSBRPe1fA+Z79v
	 LqwOBiuMFDY2BQIKYBqLgAb7MCU3NDGrLiMBHQqxkFieUbPJgU3qewXCK3i7HiQanHACqoOww4yiom
	 E+HsobVr4xAUAsIdBULWjXJIEniVcfuNj68oEUzxsJoVOKMcoa+59raaO4LHGrFPfXRIqjSwKtJXuc
	 /7YwiMZRivhdkVv1AOlcDYFLDiQDMFJ+lcRLFTuraFFSHEI8V91b7mRQR+qyVTVtb9bkXQcEPuIFw8
	 ISj5dLdl9//dhgAaTuRmETSLHuRH49g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1746103290; x=1746708090;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=dqMbI5G+JrmEvic3IALCS+ZlRXR5dmjmpFvqeROmpro=;
	b=C9nw4wtQjyDjFHdVcjzQI5Lq3MSV3qmEfVXPbzHq/rNt7kgkTeGBU3LCgcjVDGnI1vchwaqqhKX//
	 +0dvihnBA==
X-HalOne-ID: 99c77899-2689-11f0-a3f1-2b8368a4d5c5
Received: from [192.168.10.245] (host-90-233-217-8.mobileonline.telia.com [90.233.217.8])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 99c77899-2689-11f0-a3f1-2b8368a4d5c5;
	Thu, 01 May 2025 12:41:30 +0000 (UTC)
Message-ID: <c612aff8-1b07-43aa-b909-f555da511da2@konsulko.se>
Date: Thu, 1 May 2025 14:41:29 +0200
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
 <aAdzjdv674Jn6G63@Asmaa.> <e764d05a-6a83-4563-9f28-3f1a3e28727b@konsulko.se>
 <aBIXJrbxCmYSoCuz@Asmaa.>
Content-Language: en-US
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aBIXJrbxCmYSoCuz@Asmaa.>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yosry,

On 4/30/25 14:27, Yosry Ahmed wrote:
> On Wed, Apr 23, 2025 at 09:53:48PM +0200, Vitaly Wool wrote:
>> On 4/22/25 12:46, Yosry Ahmed wrote:
>>> I didn't look too closely but I generally agree that we should improve
>>> zsmalloc where possible rather than add a new allocator. We are trying
>>> not to repeat the zbud/z3fold or slub/slob stories here. Zsmalloc is
>>> getting a lot of mileage from both zswap and zram, and is more-or-less
>>> battle-tested. Let's work toward building upon that instead of starting
>>> over.
>>
>> The thing here is, zblock is using a very different approach to small object
>> allocation. The idea is: we have an array of descriptors which correspond to
>> multi-page blocks divided in chunks of equal size (block_size[i]). For each
>> object of size x we find the descriptor n such as:
>> 	block_size[n-1] < n < block_size[n]
>> and then we store that object in an empty slot in one of the blocks. Thus,
>> the density is high, the search is fast (rbtree based) and there are no
>> objects spanning over 2 pages, so no extra memcpy involved.
> 
> The block sizes seem to be similar in principle to class sizes in
> zsmalloc. It seems to me that there are two apparent differentiating
> properties to zblock:
> 
> - Block lookup uses an rbtree, so it's faster than zsmalloc's list
>    iteration. On the other hand, zsmalloc divides each class into
>    fullness groups and tries to pack almost full groups first. Not sure
>    if zblock's approach is strictly better.

If we free a slot in a fully packed block we put it on top of the list. 
zswap's normal operation pattern is that there will be more free slots 
in that block so it's roughly the same.

> - Zblock uses higher order allocations vs. zsmalloc always using order-0
>    allocations. I think this may be the main advantage and I remember
>    asking if zsmalloc can support this. Always using order-0 pages is
>    more reliable but may not always be the best choice.

There's a patch we'll be posting soon with "opportunistic" high order 
allocations (i. e. if try_alloc_pages fails, allocate order-0 pages 
instead). This will leverage the benefits of higher order allocations 
without putting too much stress on the system.

> On the other hand, zblock is lacking in other regards. For example:
> - The lack of compaction means that certain workloads will see a lot of
>    fragmentation. It purely depends on the access patterns. We could end
>    up with a lot of blocks each containing a single object and there is
>    no way to recover AFAICT.

We have been giving many variants of stress load on the memory subsystem 
and the worst compression ratio *after* the stress load was 2.8x using 
zstd as the compressor (and about 4x under load). With zsmalloc under 
the same conditions the ratio was 3.6x after and 4x under load.

With more normal (but still stressing) usage patterns the numbers 
*after* the stress load were around 3.8x and 4.1x, respectively.

Bottom line, ending up with a lot of blocks each containing a single 
object is not a real life scenario. With that said, we have a quite 
simple solution in the making that will get zblock on par with zsmalloc 
even in the cases described above.

> - Zblock will fail if a high order allocation cannot be satisfied, which
>    is more likely to happen under memory pressure, and it's usually when
>    zblock is needed in the first place.

See above, this issue will be addressed in the patch coming in a really 
short while.

> - There's probably more, I didn't check too closely, and I am hoping
>    that Minchan and Sergey will chime in here.
> 
>>
>> And with the latest zblock, we see that it has a clear advantage in
>> performance over zsmalloc, retaining roughly the same allocation density for
>> 4K pages and scoring better on 16K pages. E. g. on a kernel compilation:
>>
>> * zsmalloc/zstd/make -j32 bzImage
>> 	real	8m0.594s
>> 	user	39m37.783s
>> 	sys	8m24.262s
>> 	Zswap:            200600 kB <-- after build completion
>> 	Zswapped:         854072 kB <-- after build completion
>> 	zswpin 309774
>> 	zswpout 1538332
>>
>> * zblock/zstd/make -j32 bzImage
>> 	real	7m35.546s
>> 	user	38m03.475s
>> 	sys	7m47.407s
>> 	Zswap:            250940 kB <-- after build completion
>> 	Zswapped:         870660 kB <-- after build completion
>> 	zswpin 248606
>> 	zswpout 1277319
>>
>> So what we see here is that zblock is definitely faster and at least not
>> worse with regard to allocation density under heavy load. It has slightly
>> worse _idle_ allocation density but since it will quickly catch up under
>> load it is not really important. What is important is that its
>> characteristics don't deteriorate over time. Overall, zblock is simple and
>> efficient and there is /raison d'etre/ for it.
> 
> Zblock is performing better for this specific workload, but as I
> mentioned earlier there are other aspects that zblock is missing.
> Zsmalloc has seen a very large range of workloads of different types,
> and we cannot just dismiss this.

We've been running many different work loads with both allocators but 
posting all the results in the patch description will go well beyond the 
purpose of a patch submission. If there are some workloads you are 
interested in in particular, please let me know, odds are high we have 
some results for those too.

>> Now, it is indeed possible to partially rework zsmalloc using zblock's
>> algorithm but this will be a rather substantial change, equal or bigger in
>> effort to implementing the approach described above from scratch (and this
>> is what we did), and with such drastic changes most of the testing that has
>> been done with zsmalloc would be invalidated, and we'll be out in the wild
>> anyway. So even though I see your point, I don't think it applies in this
>> particular case.
> 
> 
> Well, we should start by breaking down the differences and finding out
> why zblock is performing better, as I mentioned above. If it's the
> faster lookups or higher order allocations, we can work to support that
> in zsmalloc. Similarly, if zsmalloc has unnecessary complexity it'd be
> great to get rid of it rather than starting over.
> 
> Also, we don't have to do it all at once and invalidate the testing that
> zsmalloc has seen. These can be incremental changes that get spread over
> multiple releases, getting incremental exposure in the process.

I believe we are a lot closer now to having a zblock without the initial 
drawbacks you have pointed out than a faster zsmalloc, retaining the 
code simplicity of the former.

~Vitaly

