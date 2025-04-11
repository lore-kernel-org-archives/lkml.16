Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC99F1A9B32
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744390324; cv=none; b=PGY7zF1ljOwzUIQBgKhHAAV5ODFDj8m93KOXZ1EsX7VRszPv3Vj744pVl6jDJlH7reingZik7NzvM38EGeZ4Rg38ps2Yn5ljb+r2/TLcNwGsUSZ2kzdNzTZyo2d0WOS+qwx9t/62CyUVaOeWyvTHGw+M1XIMrbWRCj3ZKT05As4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744390324; c=relaxed/simple;
	bh=GzDoZV5DAe+2cewuVnSyfybg8VmBmwqXZru7qi/VSr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/qMLe2p/2GLy83xiMAn0mnh0l0sKudU6tjvl0h92wNUJTW0Nxxgkgn9fffYUjlC4FGetpf5XgjTgjcJyqmMDvrN1rSq9Rycdg52t3nlkw2bhxlBQfZN0ymkpENRXHDnI6L/PtF0vKWHZLAc48tgCQBz9KSixMBHB3yVfOnn2+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ToXoF9uA; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ofZSV5fw; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=w75t9Xnx; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9efgZ9wb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ToXoF9uA";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ofZSV5fw";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="w75t9Xnx";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9efgZ9wb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AAA351F458;
	Fri, 11 Apr 2025 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744390320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q80RCPjkG4IQCtL1wTZMFaoC3BKbl1/pCtwR2CS8Bsk=;
	b=ToXoF9uAN+Aw+zXkXUEmfCHOYPuQFYujVacIH4tXwIZhYS9QZqLk+tx2pQunB3aLZERDPi
	NRfglWmw+pkOLTbDBEkH6+eGvy9ou3GcS3ks+FpRf3ugHiKLzCX2J8SEAtDYBIsypzGPdg
	jFsrLFvFViI2W08oupzwSoBne1tnzBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744390320;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q80RCPjkG4IQCtL1wTZMFaoC3BKbl1/pCtwR2CS8Bsk=;
	b=ofZSV5fwQjA7rHq6pt1N/6ut8ycK59gvqnw7CcH12lJOnt4rLtw7Ekb+Mg7xTUw3t3ceg9
	9HADu4FYydqpguCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744390319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q80RCPjkG4IQCtL1wTZMFaoC3BKbl1/pCtwR2CS8Bsk=;
	b=w75t9XnxBk5u/cYcN25zOkGuFNX836/i5UuBzGjAFywxEL3maEt3XR0UmkJolh9YYoDRLE
	IOG4IasXzfipQ+kMNV32mbHDIOIwSwcrxAREWQyTJ0uySObr8KrvtpVe6dia5SWo1XU0WA
	89hzIPocQ4H69d7HQBirwlfqcFprWe4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744390319;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q80RCPjkG4IQCtL1wTZMFaoC3BKbl1/pCtwR2CS8Bsk=;
	b=9efgZ9wbQcU6K7O79i3uN4Xl9oDTE0zFxZRlVSzE54aRmkQ+vZCvYO3/Z7fzrlGyMbIe4h
	A8XvjnWl3IS9nDCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95EE7136A4;
	Fri, 11 Apr 2025 16:51:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id u6bwI69I+We0NgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 11 Apr 2025 16:51:59 +0000
Message-ID: <efa6eb69-cff3-421d-94c7-e37a9a1e26f8@suse.cz>
Date: Fri, 11 Apr 2025 18:51:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] mm: page_alloc: defrag_mode kswapd/kcompactd
 watermarks
Content-Language: en-US
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250313210647.1314586-1-hannes@cmpxchg.org>
 <20250313210647.1314586-6-hannes@cmpxchg.org>
 <46f1b2ab-2903-4cde-9e68-e334a0d0df22@suse.cz>
 <20250411153906.GC366747@cmpxchg.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250411153906.GC366747@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On 4/11/25 17:39, Johannes Weiner wrote:
> On Fri, Apr 11, 2025 at 10:19:58AM +0200, Vlastimil Babka wrote:
>> On 3/13/25 22:05, Johannes Weiner wrote:
>> > The previous patch added pageblock_order reclaim to kswapd/kcompactd,
>> > which helps, but produces only one block at a time. Allocation stalls
>> > and THP failure rates are still higher than they could be.
>> > 
>> > To adequately reflect ALLOC_NOFRAGMENT demand for pageblocks, change
>> > the watermarking for kswapd & kcompactd: instead of targeting the high
>> > watermark in order-0 pages and checking for one suitable block, simply
>> > require that the high watermark is entirely met in pageblocks.
>> 
>> Hrm.
> 
> Hrm!
> 
>> > @@ -2329,6 +2329,22 @@ static enum compact_result __compact_finished(struct compact_control *cc)
>> >  	if (!pageblock_aligned(cc->migrate_pfn))
>> >  		return COMPACT_CONTINUE;
>> >  
>> > +	/*
>> > +	 * When defrag_mode is enabled, make kcompactd target
>> > +	 * watermarks in whole pageblocks. Because they can be stolen
>> > +	 * without polluting, no further fallback checks are needed.
>> > +	 */
>> > +	if (defrag_mode && !cc->direct_compaction) {
>> > +		if (__zone_watermark_ok(cc->zone, cc->order,
>> > +					high_wmark_pages(cc->zone),
>> > +					cc->highest_zoneidx, cc->alloc_flags,
>> > +					zone_page_state(cc->zone,
>> > +							NR_FREE_PAGES_BLOCKS)))
>> > +			return COMPACT_SUCCESS;
>> > +
>> > +		return COMPACT_CONTINUE;
>> > +	}
>> 
>> Wonder if this ever succeds in practice. Is high_wmark_pages() even aligned
>> to pageblock size? If not, and it's X pageblocks and a half, we will rarely
>> have NR_FREE_PAGES_BLOCKS cover all of that? Also concurrent allocations can
>> put us below high wmark quickly and then we never satisfy this?
> 
> The high watermark is not aligned, but why does it have to be? It's a
> binary condition: met or not met. Compaction continues until it's met.

What I mean is, kswapd will reclaim until the high watermark, which would be
32.7 blocks, wake up kcompactd [*] but that can only create up to 32 blocks
of NR_FREE_PAGES_BLOCKS so it has already lost at that point? (unless
there's concurrent freeing pushing it above the high wmark)

> NR_FREE_PAGES_BLOCKS moves in pageblock_nr_pages steps. This means
> it'll really work until align_up(highmark, pageblock_nr_pages), as
> that's when NR_FREE_PAGES_BLOCKS snaps above the (unaligned) mark. But
> that seems reasonable, no?

How can it snap if it doesn't have enough free pages? Unlike kswapd,
kcompactd doesn't create them, only defragments.

> The allocator side is using low/min, so we have the conventional
> hysteresis between consumer and producer.

Sure but we cap kswapd at high wmark and the hunk quoted above also uses
high wmark so there's no hysteresis happening between kswapd and kcompactd?

> For illustration, on my 2G test box, the watermarks in DMA32 look like
> this:
> 
>   pages free     212057
>         boost    0
>         min      11164		(21.8 blocks)
>         low      13955		(27.3 blocks)
>         high     16746		(32.7 blocks)
>         promo    19537
>         spanned  456704
>         present  455680
>         managed  431617		(843.1 blocks)
> 
> So there are several blocks between the kblahds wakeup and sleep. The
> first allocation to cut into a whole free block will decrease
> NR_FREE_PAGES_BLOCK by a whole block. But subsequent allocs that fill
> the remaining space won't change that counter. So the distance between
> the watermarks didn't fundamentally change (modulo block rounding).
> 
>> Doesn't then happen that with defrag_mode, in practice kcompactd basically
>> always runs until scanners met?
> 
> Tracing kcompactd calls to compaction_finished() with defrag_mode:
> 
> @[COMPACT_CONTINUE]: 6955
> @[COMPACT_COMPLETE]: 19
> @[COMPACT_PARTIAL_SKIPPED]: 1
> @[COMPACT_SUCCESS]: 17
> @wakeuprequests: 3

OK that doesn't look that bad.

> Of course, similar to kswapd, it might not reach the watermarks and
> keep running if there is a continuous stream of allocations consuming
> the blocks it's making. Hence the ratio between wakeups & continues.
> 
> But when demand stops, it'll balance the high mark and quit.

Again, since kcompactd can only defragment free space and not create it, it
may be trying in vain?

[*] now when checking the code between kswapd and kcompactd handover, I
think I found a another problem?

we have:
kswapd_try_to_sleep()
  prepare_kswapd_sleep() - needs to succeed for wakeup_kcompactd()
   pgdat_balanced() - needs to be true for prepare_kswapd_sleep() to be true
    - with defrag_mode we want high watermark of NR_FREE_PAGES_BLOCKS, but
      we were only reclaiming until now and didn't wake up kcompactd and
      this actually prevents the wake up?

