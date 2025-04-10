Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC114884C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298354; cv=none; b=n8jLRme27mO8G9iSXhJB31hJQi+3BWNHEuT+6ZC90y8IO7rHGcOxN0iNaBSGu4DTfsJCkxrwxGW8eKi7hGWsCMJ8tg4y4poDyYZ8kNLNasgC/hUW0f368ledqTw8m4CuvwbZGbiy5slFpTmzHKTeQP+MMduTc132dI3OIpbV2R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298354; c=relaxed/simple;
	bh=eiDPE9dtrkAuj/AosZO9UE4UdrM28nqCE1asNsofubo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SvkqHbCas4WFqgvJA5GWZaM7VnOwwbXoemqHR1czulsseFW+v3VN48TRYd3cj53BSb32uHnne/U6FHznqHRQlQI59zsejQMupU8leDYjF3QqJ1EvRcaEHG62YXi+7LMmhImtHYQUQJ7iHTCDzL7MnhMAfskFhOYRpOy5tn7Q2/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=PiV4a3YK; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=rwEhiuOC; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=PiV4a3YK; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=rwEhiuOC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="PiV4a3YK";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="rwEhiuOC";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="PiV4a3YK";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="rwEhiuOC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 694AC1F444;
	Thu, 10 Apr 2025 15:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744298350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnRe2lXGIvTI/8saZS3JDgYMhiPgHnRNLOQzRSK+CgQ=;
	b=PiV4a3YKSG5ndTPkYH1NFFNKAtTaFkACl9C9hECkCTenFEVEHYUWJ0H3oTiPbw2ryo2EDV
	Qt70MSX/OyhnlLtTubMtCNqkfHi2J3p9iKqXkvGA7h8taWHKtfYalIC0NS9GnskQ2F8pJQ
	e9XjfHox1rkr47j3jb+oJbgce6J92go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744298350;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnRe2lXGIvTI/8saZS3JDgYMhiPgHnRNLOQzRSK+CgQ=;
	b=rwEhiuOCRPlIZc8xBKNKHWvGY9WsyR7GaNVXK6YpOI4dwquFXPqBGpK71n3yE2fSiPutEK
	LC9CHuxaea/WqHDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=PiV4a3YK;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=rwEhiuOC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744298350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnRe2lXGIvTI/8saZS3JDgYMhiPgHnRNLOQzRSK+CgQ=;
	b=PiV4a3YKSG5ndTPkYH1NFFNKAtTaFkACl9C9hECkCTenFEVEHYUWJ0H3oTiPbw2ryo2EDV
	Qt70MSX/OyhnlLtTubMtCNqkfHi2J3p9iKqXkvGA7h8taWHKtfYalIC0NS9GnskQ2F8pJQ
	e9XjfHox1rkr47j3jb+oJbgce6J92go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744298350;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnRe2lXGIvTI/8saZS3JDgYMhiPgHnRNLOQzRSK+CgQ=;
	b=rwEhiuOCRPlIZc8xBKNKHWvGY9WsyR7GaNVXK6YpOI4dwquFXPqBGpK71n3yE2fSiPutEK
	LC9CHuxaea/WqHDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55F1513886;
	Thu, 10 Apr 2025 15:19:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id u7mkFG7h92d7DAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 10 Apr 2025 15:19:10 +0000
Message-ID: <2025de6c-a25b-42f2-8ff2-da2bad0e0aa0@suse.cz>
Date: Thu, 10 Apr 2025 17:19:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] mm: compaction: push watermark into
 compaction_suitable() callers
Content-Language: en-US
To: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250313210647.1314586-1-hannes@cmpxchg.org>
 <20250313210647.1314586-2-hannes@cmpxchg.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250313210647.1314586-2-hannes@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 694AC1F444
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 3/13/25 22:05, Johannes Weiner wrote:
> compaction_suitable() hardcodes the min watermark, with a boost to the
> low watermark for costly orders. However, compaction_ready() requires
> order-0 at the high watermark. It currently checks the marks twice.
> 
> Make the watermark a parameter to compaction_suitable() and have the
> callers pass in what they require:
> 
> - compaction_zonelist_suitable() is used by the direct reclaim path,
>   so use the min watermark.
> 
> - compact_suit_allocation_order() has a watermark in context derived
>   from cc->alloc_flags.
> 
>   The only quirk is that kcompactd doesn't initialize cc->alloc_flags
>   explicitly. There is a direct check in kcompactd_do_work() that
>   passes ALLOC_WMARK_MIN, but there is another check downstack in
>   compact_zone() that ends up passing the unset alloc_flags. Since
>   they default to 0, and that coincides with ALLOC_WMARK_MIN, it is
>   correct. But it's subtle. Set cc->alloc_flags explicitly.
> 
> - should_continue_reclaim() is direct reclaim, use the min watermark.
> 
> - Finally, consolidate the two checks in compaction_ready() to a
>   single compaction_suitable() call passing the high watermark.
> 
>   There is a tiny change in behavior: before, compaction_suitable()
>   would check order-0 against min or low, depending on costly
>   order. Then there'd be another high watermark check.
> 
>   Now, the high watermark is passed to compaction_suitable(), and the
>   costly order-boost (low - min) is added on top. This means
>   compaction_ready() sets a marginally higher target for free pages.
> 
>   In a kernelbuild + THP pressure test, though, this didn't show any
>   measurable negative effects on memory pressure or reclaim rates. As
>   the comment above the check says, reclaim is usually stopped short
>   on should_continue_reclaim(), and this just defines the worst-case
>   reclaim cutoff in case compaction is not making any headway.
> 
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>

<snip>

> @@ -2513,13 +2516,13 @@ compaction_suit_allocation_order(struct zone *zone, unsigned int order,
>  	 */
>  	if (order > PAGE_ALLOC_COSTLY_ORDER && async &&
>  	    !(alloc_flags & ALLOC_CMA)) {
> -		watermark = low_wmark_pages(zone) + compact_gap(order);
> -		if (!__zone_watermark_ok(zone, 0, watermark, highest_zoneidx,
> -					   0, zone_page_state(zone, NR_FREE_PAGES)))
> +		if (!__zone_watermark_ok(zone, 0, watermark + compact_gap(order),
> +					 highest_zoneidx, 0,
> +					 zone_page_state(zone, NR_FREE_PAGES)))
>  			return COMPACT_SKIPPED;

The watermark here is no longer recalculated as low_wmark_pages() but the
value from above based on alloc_flags is reused.
It's probably ok, maybe it's even more correct, just wasn't mentioned in the
changelog as another tiny change of behavior so I wanted to point it out.

