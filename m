Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799911E3DF2
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748339227; cv=none; b=IAKpvBcoTWesBWofet9PBKzQBH3YsRS59lu0h4/Lmg3Y8Yei3D4M9YW6fF9h0PjEUhPJcAVmx9X0h/0BY/qzFUBzTGSA5QoGHEd4XnGTbaBjH9B2JerI+JKtq/vefd/4ajeqEvHMgULKOqrz8zldbD5ru/vJE0iBMLUgii2GnoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748339227; c=relaxed/simple;
	bh=eV9gIOawJQUSfFXCiXD/HUSJ/Uu/zjALkpTSzm4Oevo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjRn2zU+Zy1q01yc1DI4hSDrKGnGNanGpKNUrSrYjnVyL1jJrDlh3XLjjC89lyxCKqU082ery2+DZLSCVm1CaVoYdoVFLs+PDJMxVrJo9lkpE4xYK9blYlZFkPieXw+bhjLjdGe3rwb3at9tWoEa6FxjOCxOVWvE32quLtKghXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=rTGgEh11; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kqq1Jokd; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=rTGgEh11; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kqq1Jokd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="rTGgEh11";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kqq1Jokd";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="rTGgEh11";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kqq1Jokd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 654AF21ECD;
	Tue, 27 May 2025 09:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748339217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PbYMNW3aw0tGbqSf46ii26azdJZ/SSS27LswKrESOOU=;
	b=rTGgEh116oYx+3z62Ro9ih1Vi01uZYbF1yNF30Z0PdbkQly5lHmN5rt6TI6rppu2h4Dbqf
	54UYcUNTw23ewTs5jfmKVVaZIhcwXPsaqtI5Shgc4p4Mxw/Zp8k7SJngHoLMgLldf2D3uH
	ANHaCljlr8+ie6vXTHKSwZr6j7S3fzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748339217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PbYMNW3aw0tGbqSf46ii26azdJZ/SSS27LswKrESOOU=;
	b=kqq1JokdK0XusKXybu2hxNXNDXSjKLmSasCbDoznz9WeVw+d38OoBXYBr+3mK4Ulpqq9qX
	x8WERLAx9UMgsnAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=rTGgEh11;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=kqq1Jokd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748339217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PbYMNW3aw0tGbqSf46ii26azdJZ/SSS27LswKrESOOU=;
	b=rTGgEh116oYx+3z62Ro9ih1Vi01uZYbF1yNF30Z0PdbkQly5lHmN5rt6TI6rppu2h4Dbqf
	54UYcUNTw23ewTs5jfmKVVaZIhcwXPsaqtI5Shgc4p4Mxw/Zp8k7SJngHoLMgLldf2D3uH
	ANHaCljlr8+ie6vXTHKSwZr6j7S3fzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748339217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PbYMNW3aw0tGbqSf46ii26azdJZ/SSS27LswKrESOOU=;
	b=kqq1JokdK0XusKXybu2hxNXNDXSjKLmSasCbDoznz9WeVw+d38OoBXYBr+3mK4Ulpqq9qX
	x8WERLAx9UMgsnAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4380A136E0;
	Tue, 27 May 2025 09:46:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id toaiDhGKNWixXgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 27 May 2025 09:46:57 +0000
Message-ID: <bcfe80ec-b5ff-4daf-8183-ef7e2051b16f@suse.cz>
Date: Tue, 27 May 2025 11:46:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] mm/page_alloc: pageblock flags functions clean up.
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250523191258.339826-1-ziy@nvidia.com>
 <20250523191258.339826-2-ziy@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250523191258.339826-2-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,nvidia.com:email,suse.cz:mid,suse.cz:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 654AF21ECD
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.51

On 5/23/25 21:12, Zi Yan wrote:
> No functional change is intended.
> 
> 1. Add __NR_PAGEBLOCK_BITS for the number of pageblock flag bits and use
>    roundup_pow_of_two(__NR_PAGEBLOCK_BITS) as NR_PAGEBLOCK_BITS to take
>    right amount of bits for pageblock flags.
> 2. Add {get,set,clear}_pfnblock_bit() to operate one a standalone bit,
>    like PB_migrate_skip.
> 3. Make {get,set}_pfnblock_flags_mask() internal functions and use
>    {get,set}_pfnblock_migratetype() for pageblock migratetype operations.
> 4. Move pageblock flags common code to get_pfnblock_bitmap_bitidx().
> 3. Use MIGRATETYPE_MASK to get the migratetype of a pageblock from its
>    flags.
> 4. Use PB_migrate_end in the definition of MIGRATETYPE_MASK instead of
>    PB_migrate_bits.
> 5. Add a comment on is_migrate_cma_folio() to prevent one from changing it
>    to use get_pageblock_migratetype() and causing issues.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>

<snip>

> +/**
> + * __set_pfnblock_flags_mask - Set the requested group of flags for
> + * a pageblock_nr_pages block of pages
>   * @page: The page within the block of interest
> - * @flags: The flags to set
>   * @pfn: The target page frame number
> + * @flags: The flags to set
>   * @mask: mask of bits that the caller is interested in
>   */
> -void set_pfnblock_flags_mask(struct page *page, unsigned long flags,
> -					unsigned long pfn,
> -					unsigned long mask)
> +static void __set_pfnblock_flags_mask(struct page *page, unsigned long pfn,
> +				      unsigned long flags, unsigned long mask)
>  {
> -	unsigned long *bitmap;
> -	unsigned long bitidx, word_bitidx;
> +	unsigned long *bitmap_word;
> +	unsigned long bitidx;
>  	unsigned long word;
>  
> -	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
> -	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
> -
> -	bitmap = get_pageblock_bitmap(page, pfn);
> -	bitidx = pfn_to_bitidx(page, pfn);
> -	word_bitidx = bitidx / BITS_PER_LONG;
> -	bitidx &= (BITS_PER_LONG-1);
> -
> -	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
> +	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
>  
>  	mask <<= bitidx;
>  	flags <<= bitidx;
>  
> -	word = READ_ONCE(bitmap[word_bitidx]);
> +	word = READ_ONCE(*bitmap_word);
>  	do {
> -	} while (!try_cmpxchg(&bitmap[word_bitidx], &word, (word & ~mask) | flags));
> +	} while (!try_cmpxchg(bitmap_word, &word, (word & ~mask) | flags));
> +}
> +
> +/**
> + * set_pfnblock_bit - Set a standalone bit of a pageblock
> + * @page: The page within the block of interest
> + * @pfn: The target page frame number
> + * @pb_bit: pageblock bit to set
> + */
> +void set_pfnblock_bit(const struct page *page, unsigned long pfn,
> +		      enum pageblock_bits pb_bit)
> +{
> +	unsigned long *bitmap_word;
> +	unsigned long bitidx;
> +
> +	if (WARN_ON_ONCE(pb_bit <= PB_migrate_end ||
> +			 pb_bit >= __NR_PAGEBLOCK_BITS))
> +		return;

This check appears at 3 places, maybe worth wrapping it in a helper?

> +
> +	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
> +
> +	__set_bit(bitidx + pb_bit, bitmap_word);

I think it's wrong to use the __set_bit non-atomic variant because e.g.
compaction's PB_migrate_skip (actually a misnomer at this point I think,
e.g. PB_compact_skip would make more sense if you wanted to clean up things
some more) can be modified with no lock. It's why
__set_pfnblock_flags_mask() above uses try_cmpxchg() even though changes to
migratetype are normally done under zone lock.

> +}
> +
> +/**
> + * clear_pfnblock_bit - Clear a standalone bit of a pageblock
> + * @page: The page within the block of interest
> + * @pfn: The target page frame number
> + * @pb_bit: pageblock bit to clear
> + */
> +void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
> +			enum pageblock_bits pb_bit)
> +{
> +	unsigned long *bitmap_word;
> +	unsigned long bitidx;
> +
> +	if (WARN_ON_ONCE(pb_bit <= PB_migrate_end ||
> +			 pb_bit >= __NR_PAGEBLOCK_BITS))
> +		return;
> +
> +	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
> +
> +	__clear_bit(bitidx + pb_bit, bitmap_word);

Same here.

>  }
