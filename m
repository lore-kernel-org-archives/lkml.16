Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C71DF974
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744359612; cv=none; b=ejIRXnrxacGovn+wrDQZQ8yAbPMRMUAXBA7nktLlbpEsz8zg18aPPOSClpZWTnC/WhXTFSl3jHJ4hyKvdxztcN2rvS2J3DHtcUtEHTNbK33GCQFjMlnCCdIh2R6DLYMkLQQHv4Gt7qDRIjz69F2B0e3ApWFCNpL3K75zqrLvq+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744359612; c=relaxed/simple;
	bh=NSoVjssChjGggdjRvAFj7g6shTGoplucBdOvE8N0weE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7HE5AzDsplMfu/YHKawOUKmnLdl542dVwzsyd5Z1jwU6T+qdxE/C9QRvRdOetQ2FKEDXQeXc8KdT2e0pV9vuNma6rUEYnEwKH9OUjriAH5Vy2lGOaEEwvh5yXzlHOKWQWMHpERTP0sG3+4Gzl6MWqN/gc8XMyfqAlMMovhzBk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=qUVcdaNb; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZCpRk7IZ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=qUVcdaNb; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZCpRk7IZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="qUVcdaNb";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZCpRk7IZ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="qUVcdaNb";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZCpRk7IZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 616A12118D;
	Fri, 11 Apr 2025 08:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744359602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyQNMXsx/7biSZpgr9ECkef08gFaliwEObKTEz/k6NU=;
	b=qUVcdaNb3Ya3sUNeSIPxMOZVlYeQOC87VI0F9ZHv05bYUDMlcVac10wA4pnLsCji/tNOL6
	h7f7GgwHtoeDKN/r7Glt/rHrqTWvdbcgaIcGfL9PAJqaKqju81IFDFRxaw0mIdI6UcKBMh
	4mUbcEU/kpXm7UOK7eqnMWc2L1lE3w0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744359602;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyQNMXsx/7biSZpgr9ECkef08gFaliwEObKTEz/k6NU=;
	b=ZCpRk7IZL0PKYlnYAbSNhXGxA1V+hX16sGF0Z32cIfLKn0RQoult5APlI+aEwjJrKCseId
	BdoaiuT2Rsy2wzDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=qUVcdaNb;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=ZCpRk7IZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744359602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyQNMXsx/7biSZpgr9ECkef08gFaliwEObKTEz/k6NU=;
	b=qUVcdaNb3Ya3sUNeSIPxMOZVlYeQOC87VI0F9ZHv05bYUDMlcVac10wA4pnLsCji/tNOL6
	h7f7GgwHtoeDKN/r7Glt/rHrqTWvdbcgaIcGfL9PAJqaKqju81IFDFRxaw0mIdI6UcKBMh
	4mUbcEU/kpXm7UOK7eqnMWc2L1lE3w0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744359602;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyQNMXsx/7biSZpgr9ECkef08gFaliwEObKTEz/k6NU=;
	b=ZCpRk7IZL0PKYlnYAbSNhXGxA1V+hX16sGF0Z32cIfLKn0RQoult5APlI+aEwjJrKCseId
	BdoaiuT2Rsy2wzDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F3C7136A4;
	Fri, 11 Apr 2025 08:20:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T9/jErLQ+Ge3EQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 11 Apr 2025 08:20:02 +0000
Message-ID: <46f1b2ab-2903-4cde-9e68-e334a0d0df22@suse.cz>
Date: Fri, 11 Apr 2025 10:19:58 +0200
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
To: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250313210647.1314586-1-hannes@cmpxchg.org>
 <20250313210647.1314586-6-hannes@cmpxchg.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250313210647.1314586-6-hannes@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 616A12118D
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 3/13/25 22:05, Johannes Weiner wrote:
> The previous patch added pageblock_order reclaim to kswapd/kcompactd,
> which helps, but produces only one block at a time. Allocation stalls
> and THP failure rates are still higher than they could be.
> 
> To adequately reflect ALLOC_NOFRAGMENT demand for pageblocks, change
> the watermarking for kswapd & kcompactd: instead of targeting the high
> watermark in order-0 pages and checking for one suitable block, simply
> require that the high watermark is entirely met in pageblocks.

Hrm.

> ---
>  include/linux/mmzone.h |  1 +
>  mm/compaction.c        | 37 ++++++++++++++++++++++++++++++-------
>  mm/internal.h          |  1 +
>  mm/page_alloc.c        | 29 +++++++++++++++++++++++------
>  mm/vmscan.c            | 15 ++++++++++++++-
>  mm/vmstat.c            |  1 +
>  6 files changed, 70 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index dbb0ad69e17f..37c29f3fbca8 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -138,6 +138,7 @@ enum numa_stat_item {
>  enum zone_stat_item {
>  	/* First 128 byte cacheline (assuming 64 bit words) */
>  	NR_FREE_PAGES,
> +	NR_FREE_PAGES_BLOCKS,
>  	NR_ZONE_LRU_BASE, /* Used only for compaction and reclaim retry */
>  	NR_ZONE_INACTIVE_ANON = NR_ZONE_LRU_BASE,
>  	NR_ZONE_ACTIVE_ANON,
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 036353ef1878..4a2ccb82d0b2 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -2329,6 +2329,22 @@ static enum compact_result __compact_finished(struct compact_control *cc)
>  	if (!pageblock_aligned(cc->migrate_pfn))
>  		return COMPACT_CONTINUE;
>  
> +	/*
> +	 * When defrag_mode is enabled, make kcompactd target
> +	 * watermarks in whole pageblocks. Because they can be stolen
> +	 * without polluting, no further fallback checks are needed.
> +	 */
> +	if (defrag_mode && !cc->direct_compaction) {
> +		if (__zone_watermark_ok(cc->zone, cc->order,
> +					high_wmark_pages(cc->zone),
> +					cc->highest_zoneidx, cc->alloc_flags,
> +					zone_page_state(cc->zone,
> +							NR_FREE_PAGES_BLOCKS)))
> +			return COMPACT_SUCCESS;
> +
> +		return COMPACT_CONTINUE;
> +	}

Wonder if this ever succeds in practice. Is high_wmark_pages() even aligned
to pageblock size? If not, and it's X pageblocks and a half, we will rarely
have NR_FREE_PAGES_BLOCKS cover all of that? Also concurrent allocations can
put us below high wmark quickly and then we never satisfy this?

Doesn't then happen that with defrag_mode, in practice kcompactd basically
always runs until scanners met?

Maybe the check could instead e.g. compare NR_FREE_PAGES (aligned down to
pageblock size, or even with some extra slack?) with NR_FREE_PAGES_BLOCKS?

> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -6724,11 +6724,24 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
>  	 * meet watermarks.
>  	 */
>  	for_each_managed_zone_pgdat(zone, pgdat, i, highest_zoneidx) {
> +		unsigned long free_pages;
> +
>  		if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
>  			mark = promo_wmark_pages(zone);
>  		else
>  			mark = high_wmark_pages(zone);
> -		if (zone_watermark_ok_safe(zone, order, mark, highest_zoneidx))

I think you just removed the only user of this _safe() function. Is the
cpu-drift control it does no longer necessary?

> +
> +		/*
> +		 * In defrag_mode, watermarks must be met in whole
> +		 * blocks to avoid polluting allocator fallbacks.
> +		 */
> +		if (defrag_mode)
> +			free_pages = zone_page_state(zone, NR_FREE_PAGES_BLOCKS);
> +		else
> +			free_pages = zone_page_state(zone, NR_FREE_PAGES);
> +
> +		if (__zone_watermark_ok(zone, order, mark, highest_zoneidx,
> +					0, free_pages))
>  			return true;
>  	}
>  
