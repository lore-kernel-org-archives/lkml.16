Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0BA23AE84
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702300; cv=none; b=t/paIpzNBK6/iIBxKRR89xY1QvCHC7AmRUHSIbKFQN3mkxqxY7p6JjhM1zHWmtzjgkqxutE+aj79J8NApkn/KWbD3wojRmoq3+ZX2aMUDK69e3EDMYYboDRHWcL29Tftf1MASlPxJpuIrDe07p3rK6gMObeOdJbaT/83ovVx+ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702300; c=relaxed/simple;
	bh=FeboX94B0oMTsV97kXP6oDoUBSCS06FozQ4iBzK7mq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1GcenNlxaAKw3+WdzFr7NNk05UTwv6rTNjMaPYYGx/uUhwwQ/SeRFAdpLjVER1sQzD4+OG11RJCR0/zbCcDs3vg0jNON7OeEUvXpQmMpGluedq40hzQ3oNFFWELXmeJ3a8WLV530XtIzDqEqW/f3aCs5DpQOGSMqpu4B+wWyxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Pw+HfVcv; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=jXx7qJIL; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ai4uKrr5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=vzIxxA8n; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Pw+HfVcv";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="jXx7qJIL";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ai4uKrr5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="vzIxxA8n"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E72F521169;
	Tue, 15 Apr 2025 07:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744702297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNPnsm1kvkLtfdZ8E6p7ofQ2IOjvWRNrS9OTpnJbE0I=;
	b=Pw+HfVcv2Vi3My9vu+79IJWEAWMxb9tfueduSn/oVnwhUpZH25hkd0fnU7nNWkvn0TM9Cq
	uO7vpP4mSN3IPn4f5w+oKgtP7MsLWvqZS0G6DEFQxl4gN3+2cAC4MMFyQkigcE0joq1+Te
	9VVJKggVd03j40LvBDZL022OO3fPrlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744702297;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNPnsm1kvkLtfdZ8E6p7ofQ2IOjvWRNrS9OTpnJbE0I=;
	b=jXx7qJILoALG+rtKcUOKadICGCRbUVxH1pw3l6LSPWiqAszaaC1yQK3aqTOWDOb4n33r03
	YpbiH5vTGirjobBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=ai4uKrr5;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=vzIxxA8n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744702296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNPnsm1kvkLtfdZ8E6p7ofQ2IOjvWRNrS9OTpnJbE0I=;
	b=ai4uKrr5qg5jwdd19FqriM709aZeB/IWHpNTbGUD0QuHhq4jhW7s2JqrQyvkXA5cttVDlp
	obxlgXCoYutdtookKdz4yVl3m2lXYO8wymAYzDQUyefFc3A4ffOSK2sjyjGB/yLmJeRjI6
	0vjUmCT651XTGnClAlZbCIIBfPuSFSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744702296;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNPnsm1kvkLtfdZ8E6p7ofQ2IOjvWRNrS9OTpnJbE0I=;
	b=vzIxxA8n0/b4Z8+/6yIELPKPr52WgUXv5Mjpd+z0UggQkvMDwucNCLukz7cZIPJ2a6btAa
	suyHOWoU8JHjQmAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3399139A1;
	Tue, 15 Apr 2025 07:31:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +FWoMlgL/mduMQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 15 Apr 2025 07:31:36 +0000
Message-ID: <56245588-640d-471a-9e72-ce1288b7b81e@suse.cz>
Date: Tue, 15 Apr 2025 09:31:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] mm: page_alloc: defrag_mode kswapd/kcompactd
 watermarks
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
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250413022058.GF366747@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E72F521169
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

I missed that revert to order-0 and that without it the current code also
wouldn't make sense. But I agree with the fix.

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

NP!

