Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7791D9A70
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624498; cv=none; b=K+V0FY9NCRPhmLQOLq74YzJMmdCLTubAD6MxvJ0xU1WyPSWmb46i2riAb8ROvJEsfk1Bo+0GMIARcYf4BK/RoNZsEx6V3FIVpkG5p81Wv+yzJuZJdllEwyz9yNvJo+SwHAUGhInGR9K5d4cELFnR77y972DJJpdo1OVJfnmcz68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624498; c=relaxed/simple;
	bh=/j20YDx6/u0Hc6MNV2xBB7dR6U4SsZ/xwXQgsoBmLqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GddQ2lFKxu8liQaNDoC0vsne+bkJGtrf77yHTNm/XktNJrSOMkMjN0jubflffJ0JQoxPEbNIh58ueFmkhiflUW9BUKetQ+HmzeMQ+KST/98NVL/xNIUflHmcRBVraVcxSaviHogcHaLdTkfVTaJy7S56EQvP/SrR/se6uiuwGwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=1uEMCwOB; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=1IXkqgnR; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=iJUx8tYA; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=MKxrrwe8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="1uEMCwOB";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="1IXkqgnR";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="iJUx8tYA";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="MKxrrwe8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D56FE1F791;
	Fri, 30 May 2025 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748624495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ymdsCR0pKY6HSQ9CuQV9AYd5gUmWQC2uN53vMh4nSpI=;
	b=1uEMCwOBMDzzElxYwnC0SUMpyRmkwwvrpCFGfyu1KXV77iaP0AxjrGGR1gQsPfziOfuWTR
	6I99tBZmJa6+oM4DAjYlLf7rrdIdMai7XEZK0GLlAwyjo2QaZnjV/SEdkmUe6NpA8Rjff4
	hafOan8YiGEsI5hAB9XcxbpklwE9r54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748624495;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ymdsCR0pKY6HSQ9CuQV9AYd5gUmWQC2uN53vMh4nSpI=;
	b=1IXkqgnRZlH4+7HP3ttnhcHB8RiJZkTcxTCop8S1pXASSFYQ/c+m9NX0qXC2uv0/wUCyk9
	7CgyjumnoEqJjBCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748624494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ymdsCR0pKY6HSQ9CuQV9AYd5gUmWQC2uN53vMh4nSpI=;
	b=iJUx8tYAtA37+XcAcW8/0mQRnMLK7crwuHweiGf0f3Uku5RS+w55xWmnHjUlwmXj0phuEP
	S0n74oSjGJB8r/qGDlAKkt1hIg+ZTwtlHI82utYqyEO23aiFzKr4AUGE8ZKblLOGAmWpa/
	TknxYMp4oVQEPTfTp36UC7DF+nqU5dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748624494;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ymdsCR0pKY6HSQ9CuQV9AYd5gUmWQC2uN53vMh4nSpI=;
	b=MKxrrwe8Hcvp8ESmusvbXEIUSeIeHMCNh7jh4xATaoPwUHkVtyE3W7sICuxJIcsk9cweTx
	1ryUZRPgtlTrCuDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B99AE132D8;
	Fri, 30 May 2025 17:01:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Zeb+LG7kOWijcwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 30 May 2025 17:01:34 +0000
Message-ID: <988b3664-057a-4e24-815f-6fa01efb87d5@suse.cz>
Date: Fri, 30 May 2025 19:01:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] mm/page_alloc: pageblock flags functions clean up.
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
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-2-ziy@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250530162227.715551-2-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On 5/30/25 18:22, Zi Yan wrote:
> No functional change is intended.
> 
> 1. Add __NR_PAGEBLOCK_BITS for the number of pageblock flag bits and use
>    roundup_pow_of_two(__NR_PAGEBLOCK_BITS) as NR_PAGEBLOCK_BITS to take
>    right amount of bits for pageblock flags.
> 2. Rename PB_migrate_skip to PB_compact_skip.
> 3. Add {get,set,clear}_pfnblock_bit() to operate one a standalone bit,
>    like PB_compact_skip.
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

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

