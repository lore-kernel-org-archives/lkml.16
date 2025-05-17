Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1480E145355
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747513310; cv=none; b=FVWDyW4CA6f6vXwgp2vOG0+gITz0DnL6xU9b745Dq2SgV6xPwcsnrqmxXe342TaYTYc1eTSnQ8LKYkyI4gPJAC6O+LWLVCU1BWV+kG0cdFiOOg9PttVuy5whUpBKgyxwGwCzuirnORNMj81cMo7Arbqn6YZIOKlSmxLwlzqksqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747513310; c=relaxed/simple;
	bh=lnqeZhITVDFkCqJ1pg3Z8qhnpqxvcMsO00LuJu/sU2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGRVWKdTjVNAIPSqKA8evH4ILHJWBwB7hDbzXAB63cJHJOF2BFbyo01q8y0oFaJnjl1U0wanPLAOVfO2WOsH/KsaGNljavodPQ0sec0zXA0ptrzT7kh2KugNybqsD4arg75uqOe7BF9iuU0+UqD3BY7cX7DIf4LTl+V6JmGYt5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=wlQCTkRX; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZLTwommR; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jBlXuGoH; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Uu32mP+B; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="wlQCTkRX";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZLTwommR";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jBlXuGoH";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Uu32mP+B"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DB23C1FF3D;
	Sat, 17 May 2025 20:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747513307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kw0CpV37ybvRZaO1RGP6IG8fm4GRJXF9rmX9jolZzNk=;
	b=wlQCTkRX33y2vx0CHYnFZHQRcySLnal89IWQHfIU3ku1Qle+Znx+ZpjPMHHRYO0s5l42xU
	6u2Sbxi6XGw2FBhm3vbjD5QR4AAiRmDY4u5gd+oIZA30pMQR7/i9HnhDRhlJ+SMK06ygo4
	S+C3DKKyTiIq90sR1U/IbC9gMBq+WAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747513307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kw0CpV37ybvRZaO1RGP6IG8fm4GRJXF9rmX9jolZzNk=;
	b=ZLTwommRciZy5NlAh/fujmRGi80SAS69548Bc5aRN/yZUSPDiuhqb8too0h53mj8lUJMxF
	Bp0cZkAkvtdgwdDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747513306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kw0CpV37ybvRZaO1RGP6IG8fm4GRJXF9rmX9jolZzNk=;
	b=jBlXuGoHv+4wP9c2d7xmQ5xBSS0Ra1W5EMXqp0YRxdNPVYoaFbZSVQhYr46z17Z0WsTeml
	fMMLJXAVmFNclfyzqS0WaKD8a0FbwFQXHjAF/qDynOjs5c1E+f/CAnfDHLTA0YB2un7dI7
	U95y+JcZVipAnLs4u3rslm26feootlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747513306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kw0CpV37ybvRZaO1RGP6IG8fm4GRJXF9rmX9jolZzNk=;
	b=Uu32mP+BrXIkMX5Jmb4ZL/r3mlMW/l4e0G3FSSalKN7JjkWcnZ6Sk1/N450SZFR1JxvAoA
	W1cGbhihuOuZ4ADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B75631325F;
	Sat, 17 May 2025 20:21:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NOrSK9rvKGgrfQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Sat, 17 May 2025 20:21:46 +0000
Message-ID: <72e15406-ffd2-4344-8cc6-1d54005138ce@suse.cz>
Date: Sat, 17 May 2025 22:21:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] mm/page_isolation: remove migratetype parameter
 from more functions.
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-5-ziy@nvidia.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250509200111.3372279-5-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,nvidia.com:email,suse.cz:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

On 5/9/25 22:01, Zi Yan wrote:
> migratetype is no longer overwritten during pageblock isolation,
> start_isolate_page_range(), has_unmovable_pages(), and
> set_migratetype_isolate() no longer need which migratetype to restore
> during isolation failure.
> 
> For has_unmoable_pages(), it needs to know if the isolation is for CMA
> allocation, so adding CMA_ALLOCATION to isolation flags to provide the
> information.
> 
> alloc_contig_range() no longer needs migratetype. Replace it with
> a newly defined acr_flags_t to tell if an allocation is for CMA. So does
> __alloc_contig_migrate_range().
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>

AFAICS has_unmovable_pages() adds the flags parameter but doesn't use it.

But also, I think having both mode and flags is just unnecessary complexity
in this case? CMA_ALLOCATION could be just a new flag? Even if some flag
combinations wouldn't logicaly make sense, this has only so few users so we
don't have to care to make them exclusive with the mode thing.
Also I think REPORT_FAILURE is only used with MEMORY_OFFLINE so it could be
squashed?

