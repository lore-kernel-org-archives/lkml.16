Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4FCE55B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206958; cv=none; b=ONUsN540xZqX3jQ/X25IX3C+GwPWrNKYXRg5nR4Up2If+BadRc2bcCbxw6g1w6y0+lTjdm5oZecsdO71Y80GagOQR5tWdVcwzfsUtm9Kqe+BypvEwqL5m+60GqYBfYydqYf34e4Mlfqq3tFxjVagZRHolULJOTamnxMzgPmQ9TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206958; c=relaxed/simple;
	bh=QNxYsDdtVJxXA7DY5q3/CD6uCTu2B9H40wnW7YqhmlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jXoU9vmyfNsCkHyqTyoB5qIsdx3GN99KAm9JZVInDyzLFAB/I1hLOrTp6iBujzOft7wjI4WHvrSPlEXgsl65tfGwmblGHgkm+M0467HMOlzFFAx512sKtZHzBP2LlyrZDTri8DWtcDdM0X/p65qqe4o1mGxyswZoEuCjaTfRAxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bL36fq2v; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=My4ww7F0; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bL36fq2v; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=My4ww7F0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bL36fq2v";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="My4ww7F0";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bL36fq2v";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="My4ww7F0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 401E32120B;
	Wed, 14 May 2025 07:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747206954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNNsM2otBIapJvDtDIEhDKuncaLsTnOAU18oNqRgHlA=;
	b=bL36fq2vXuzEmI7oJ/xJVpVbeBPJyRjH7zEuZk3359DIMUczBjOe4/s+tPVAVWfjpfV6Oi
	Sa1vy/cg+cgcECWg4XEy4/hROsTlGom+Edy9jqF2fNQmiwmkKCISsofY4/R3SNoxeLZGJS
	Bgsb4hStELSKkjNeYu/HxLIRqx5zuZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747206954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNNsM2otBIapJvDtDIEhDKuncaLsTnOAU18oNqRgHlA=;
	b=My4ww7F0511KAVQDoI6uPihxd58h+jTWyB39zUCQQ65FW6OzoeLs9xj3QnTX758jmmLPjq
	1cRRJnPhu7mwDzDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=bL36fq2v;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=My4ww7F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747206954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNNsM2otBIapJvDtDIEhDKuncaLsTnOAU18oNqRgHlA=;
	b=bL36fq2vXuzEmI7oJ/xJVpVbeBPJyRjH7zEuZk3359DIMUczBjOe4/s+tPVAVWfjpfV6Oi
	Sa1vy/cg+cgcECWg4XEy4/hROsTlGom+Edy9jqF2fNQmiwmkKCISsofY4/R3SNoxeLZGJS
	Bgsb4hStELSKkjNeYu/HxLIRqx5zuZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747206954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNNsM2otBIapJvDtDIEhDKuncaLsTnOAU18oNqRgHlA=;
	b=My4ww7F0511KAVQDoI6uPihxd58h+jTWyB39zUCQQ65FW6OzoeLs9xj3QnTX758jmmLPjq
	1cRRJnPhu7mwDzDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27AD6137E8;
	Wed, 14 May 2025 07:15:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p82pBypDJGjGfAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 14 May 2025 07:15:54 +0000
Message-ID: <1e3507ab-eee0-4812-9acc-33e3499299a1@suse.cz>
Date: Wed, 14 May 2025 09:15:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by cpuset
 race
To: Suren Baghdasaryan <surenb@google.com>,
 Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: Harry Yoo <harry.yoo@oracle.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
 <aAYXP4f417_bx6Is@harry>
 <CAJuCfpGEm04Eebt7FK=keu3ZF_34GTTmxMWVCiA1q3RQAVwAOA@mail.gmail.com>
 <f7f831bc-8887-4974-a869-f5f473d3040c@loongson.cn>
 <CAJuCfpHBB+0HG_2ZJ4h683TYJEz__c+L3Z6RZUbzX+7R1_VSNg@mail.gmail.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CAJuCfpHBB+0HG_2ZJ4h683TYJEz__c+L3Z6RZUbzX+7R1_VSNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 401E32120B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -4.51

On 4/23/25 17:35, Suren Baghdasaryan wrote:
>> >> There's a new 'MEMORY MANAGEMENT - PAGE ALLOCATOR' entry (only in
>> >> Andrew's mm.git repository now).
>> >>
>> >> Let's Cc the page allocator folks here!
>> >>
>> >> --
>> >> Cheers,
>> >> Harry / Hyeonggon
>> >>
>> >>>   mm/page_alloc.c | 8 ++++++++
>> >>>   1 file changed, 8 insertions(+)
>> >>>
>> >>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> >>> index fd6b865cb1ab..1e82f5214a42 100644
>> >>> --- a/mm/page_alloc.c
>> >>> +++ b/mm/page_alloc.c
>> >>> @@ -4530,6 +4530,14 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
>> >>>        }
>> >>>
>> >>>   retry:
>> >>> +     /*
>> >>> +      * Deal with possible cpuset update races or zonelist updates to avoid
>> >>> +      * infinite retries.
>> >>> +      */
>> >>> +     if (check_retry_cpuset(cpuset_mems_cookie, ac) ||
>> >>> +         check_retry_zonelist(zonelist_iter_cookie))
>> >>> +             goto restart;
>> >>> +
>> > We have this check later in this block:
>> > https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4652,
>> > so IIUC you effectively are moving it to be called before
>> > should_reclaim_retry(). If so, I think you should remove the old one
>> > (the one I linked earlier) as it seems to be unnecessary duplication
>> > at this point.
>> In my understanding, the code in
>>
>> https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4652
>>
>> was introduced to prevent unnecessary OOM (Out-of-Memory) conditions
>> in__alloc_pages_may_oom.
>>
>> If old code is removed, the newly added code (on retry loop entry)
>> cannot guarantee that the cpuset
>>
>> remains valid when the flow reaches in__alloc_pages_may_oom, especially
>> if scheduling occurs during this section.
> 
> Well, rescheduling can happen even between
> https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4652
> and https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4657
> but I see your point. Also should_reclaim_retry() does not include

I think the rescheduling isn't a problem because what we're testing is "we
are about to oom, could it have been because we raced?" and the race would
have affected the code before #L4652. If we didn't race and yet determined
it's time for oom, a race between #L4652 and #L4657 shouldn't matter. The
get_page_from_freelist() in __alloc_pages_may_oom() isn't that important for
preventing premature oom AFAICS, given it uses high wmark.

That said, I think the newly added check could be more logically placed
above the call to should_reclaim_retry() instead of right after the retry:
label, but it's not critical.

> zonelist change detection, so keeping the checks at
> https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4652
> sounds like a good idea.
> 
>>
>> Therefore, I think retaining the original code logic is necessary to
>> ensure correctness under concurrency.
>>
>> >
>> >
>> >>>        /* Ensure kswapd doesn't accidentally go to sleep as long as we loop */
>> >>>        if (alloc_flags & ALLOC_KSWAPD)
>> >>>                wake_all_kswapds(order, gfp_mask, ac);
>> >>> --
>> >>> 2.20.1
>> >>>
>> >>>
>> Thanks
>>

