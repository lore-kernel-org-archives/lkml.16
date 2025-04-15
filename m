Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC78027A922
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703082; cv=none; b=mm7iWvEFWwtEGtLmBjSZSyzuwV0EWK37Zr9bWV2vg/GjNUj+LKxtsdRZfHayI2ByB3fUscI+fUwu19xbv52h+wbuewFgtC3Eytd58/pE4TEWi6gL4IdIwMXEB4APNBb7DKDM22XuDppcVCAdTeSCwTGLRKH1GlM7z9rv/Er/tWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703082; c=relaxed/simple;
	bh=qr0mzP7K68UVGzl6TsKFGdHPG4m8fmUfGelSwHpSlzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXU1p2GHhGuZsx9DnHqktpTcDNbnuCBT+MI5FvTmVy8q8yWVvj6Obg9oKWbduG2hwhjr2RTGUIzVfpw/OWuV2MHn+LZirMZ3a65b1mLZZk/OQy5DQO5BU2rQyc/FhrT8KXDyOc+/uBvTSbjtxHJuak5LWrlbMS/zj5ODDbpMFcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=BAM04JmP; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=TeN7BPPD; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=BAM04JmP; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=TeN7BPPD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="BAM04JmP";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="TeN7BPPD";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="BAM04JmP";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="TeN7BPPD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0E5511F38A;
	Tue, 15 Apr 2025 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744703079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kswn6+EPXyRkGx8GjnxbITr+fl6+f7fqIS+lS0wyBAY=;
	b=BAM04JmPHo3XrpOLbZnGHv/1bCGM6MJY4Jeyx1puYMd3H9aqAZIT0+nTh82WfcXZb0Ms0o
	nr1xH2ftE022gp7bF86Qx4bAvIydS5PwxK/C1TKkNlL2CW7qzXoRggGLvieKTYdXqdQkQw
	5sSL46LKhVkvOK3IqX3poC2Qsm9GNm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744703079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kswn6+EPXyRkGx8GjnxbITr+fl6+f7fqIS+lS0wyBAY=;
	b=TeN7BPPD1HVFyuaqIpOU6VfmP2oJkJoo+xbRa1Xx9Ch36aL6iX+6sms3Zzz7knXoKhVxDe
	MU14liTg3rye2kAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744703079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kswn6+EPXyRkGx8GjnxbITr+fl6+f7fqIS+lS0wyBAY=;
	b=BAM04JmPHo3XrpOLbZnGHv/1bCGM6MJY4Jeyx1puYMd3H9aqAZIT0+nTh82WfcXZb0Ms0o
	nr1xH2ftE022gp7bF86Qx4bAvIydS5PwxK/C1TKkNlL2CW7qzXoRggGLvieKTYdXqdQkQw
	5sSL46LKhVkvOK3IqX3poC2Qsm9GNm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744703079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kswn6+EPXyRkGx8GjnxbITr+fl6+f7fqIS+lS0wyBAY=;
	b=TeN7BPPD1HVFyuaqIpOU6VfmP2oJkJoo+xbRa1Xx9Ch36aL6iX+6sms3Zzz7knXoKhVxDe
	MU14liTg3rye2kAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3AFB139A1;
	Tue, 15 Apr 2025 07:44:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sZUsO2YO/mdnNQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 15 Apr 2025 07:44:38 +0000
Message-ID: <c5db03d5-d934-4d7d-abbc-f989b1c58389@suse.cz>
Date: Tue, 15 Apr 2025 09:44:38 +0200
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
 <efa6eb69-cff3-421d-94c7-e37a9a1e26f8@suse.cz>
 <20250411182156.GE366747@cmpxchg.org> <20250413022058.GF366747@cmpxchg.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250413022058.GF366747@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	URIBL_BLOCKED(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Flag: NO
X-Spam-Level: 

On 4/13/25 04:20, Johannes Weiner wrote:
> On Fri, Apr 11, 2025 at 02:21:58PM -0400, Johannes Weiner wrote:
>> On Fri, Apr 11, 2025 at 06:51:51PM +0200, Vlastimil Babka wrote:
>> > [*] now when checking the code between kswapd and kcompactd handover, I
>> > think I found a another problem?
>> > 
>> > we have:
>> > kswapd_try_to_sleep()
>> >   prepare_kswapd_sleep() - needs to succeed for wakeup_kcompactd()
>> >    pgdat_balanced() - needs to be true for prepare_kswapd_sleep() to be true
>> >     - with defrag_mode we want high watermark of NR_FREE_PAGES_BLOCKS, but
>> >       we were only reclaiming until now and didn't wake up kcompactd and
>> >       this actually prevents the wake up?
> 
> Coming back to this, there is indeed a defrag_mode issue. My
> apologies, I misunderstood what you were pointing at.
> 
> Like I said, kswapd reverts to order-0 in some other place to go to
> sleep and trigger the handoff. At that point, defrag_mode also needs
> to revert to NR_FREE_PAGES.
> 
> It's curious that this didn't stand out in testing. On the contrary,
> kcompactd was still doing the vast majority of the compaction work. It
> looks like kswapd and direct workers on their own manage to balance
> NR_FREE_PAGES_BLOCK every so often, and then kswapd hands off. Given
> the low number of kcompactd wakeups, the consumers keep it going.
> 
> So testing with this:
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index cc422ad830d6..c2aa0a4b67de 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -6747,8 +6747,11 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
>  		/*
>  		 * In defrag_mode, watermarks must be met in whole
>  		 * blocks to avoid polluting allocator fallbacks.
> +		 *
> +		 * When kswapd has compact gap, check regular
> +		 * NR_FREE_PAGES and hand over to kcompactd.
>  		 */
> -		if (defrag_mode)
> +		if (defrag_mode && order)
>  			item = NR_FREE_PAGES_BLOCKS;
>  		else
>  			item = NR_FREE_PAGES;
> 
> I'm getting the following results:
> 
>                                 fallbackspeed/STUPID-DEFRAGMODE fallbackspeed/DEFRAGMODE
> Hugealloc Time mean                       79381.34 (    +0.00%)    88126.12 (   +11.02%)
> Hugealloc Time stddev                     85852.16 (    +0.00%)   135366.75 (   +57.67%)
> Kbuild Real time                            249.35 (    +0.00%)      226.71 (    -9.04%)
> Kbuild User time                           1249.16 (    +0.00%)     1249.37 (    +0.02%)
> Kbuild System time                          171.76 (    +0.00%)      166.93 (    -2.79%)
> THP fault alloc                           51666.87 (    +0.00%)    52685.60 (    +1.97%)
> THP fault fallback                        16970.00 (    +0.00%)    15951.87 (    -6.00%)
> Direct compact fail                         166.53 (    +0.00%)      178.93 (    +7.40%)
> Direct compact success                       17.13 (    +0.00%)        4.13 (   -71.69%)
> Compact daemon scanned migrate          3095413.33 (    +0.00%)  9231239.53 (  +198.22%)
> Compact daemon scanned free             2155966.53 (    +0.00%)  7053692.87 (  +227.17%)

However this brings me back to my concern with __compact_finished()
requiring high watermark of NR_FREE_PAGES_BLOCKS. IMHO it can really easily
lead to situations where all free memory is already contiguous, but because
of one or two THP concurrent allocations we're below the high watermark (but
not yet low watermark to wake kswapd again) so further compaction by
kcompactd is simply wasting cpu cycles at that point.
Again I think a comparison of NR_FREE_PAGES_BLOCKS to NR_FREE_PAGES would in
theory work better for determining if all free space is as defragmented as
possible?

> Compact direct scanned migrate           265642.47 (    +0.00%)    68388.33 (   -74.26%)
> Compact direct scanned free              130252.60 (    +0.00%)    55634.87 (   -57.29%)
> Compact total migrate scanned           3361055.80 (    +0.00%)  9299627.87 (  +176.69%)
> Compact total free scanned              2286219.13 (    +0.00%)  7109327.73 (  +210.96%)
> Alloc stall                                1890.80 (    +0.00%)     6297.60 (  +232.94%)
> Pages kswapd scanned                    9043558.80 (    +0.00%)  5952576.73 (   -34.18%)
> Pages kswapd reclaimed                  1891708.67 (    +0.00%)  1030645.00 (   -45.52%)
> Pages direct scanned                    1017090.60 (    +0.00%)  2688047.60 (  +164.29%)
> Pages direct reclaimed                    92682.60 (    +0.00%)   309770.53 (  +234.22%)
> Pages total scanned                    10060649.40 (    +0.00%)  8640624.33 (   -14.11%)
> Pages total reclaimed                   1984391.27 (    +0.00%)  1340415.53 (   -32.45%)
> Swap out                                 884585.73 (    +0.00%)   417781.93 (   -52.77%)
> Swap in                                  287106.27 (    +0.00%)    95589.73 (   -66.71%)
> File refaults                            551697.60 (    +0.00%)   426474.80 (   -22.70%)
> 
> Work has shifted from direct to kcompactd. In aggregate there is more
> compaction happening. Meanwhile aggregate reclaim and swapping drops
> quite substantially. %sys is down, so this is just more efficient.
> 
> Reclaim and swapping are down substantially, which is great. But the
> reclaim work that remains has shifted somewhat to direct reclaim,
> which is unfortunate. THP delivery is also a tad worse, but still much
> better than !defrag_mode, so not too concerning. That part deserves a
> bit more thought.
> 
> Overall, this looks good, though. I'll send a proper patch next week.
> 
> Thanks for the review, Vlastimil.

