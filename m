Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACC918C933
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208097; cv=none; b=eeGohUkE7xsukxvxIFDD1ugljUFfo7IZrVEeq4xdzHBTi22ngAUu7MVV1BX2B3fE+2JP03BJIEpxDPzjFQz6VYyNkoBVDDicYeKkTT80CvAI6nwu/TdvOOFxl42DwWM2iF7OvqRxRfCSU5gOHAMD3ApbiGeA4FwJC1SLjwM7Ie8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208097; c=relaxed/simple;
	bh=7yW4WrNRAHlTEKT+4uJXZgcGsjxGRiwJzdTrb3JGf20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CfEoEKB2uXei0gNqovdiv+ay+rjocp6NOnEy0vFKDtT34Jt0NnwAE80qnMD1KyA0gnh05bK1yvYSbPU6Z/u+kWG/TzQfHNgbYgoOXUPCd08SZGteRkioxMMLqtFyWj8YFeXKP5YGQd577MFdocQG7jrzC5zoVpBNpXAG5hBKXYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=VbVGqfEI; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=TDnrd/r4; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=VbVGqfEI; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=TDnrd/r4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VbVGqfEI";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="TDnrd/r4";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VbVGqfEI";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="TDnrd/r4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7182C1F391;
	Wed, 14 May 2025 07:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747208093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KS3aU0qJJVbZ+ME4NZIiBhcPWXR6SL4fbwbExuTv34c=;
	b=VbVGqfEIKQhGrJKfJ9vp/iVe3sr0C2895wlH3Wrj9iYrq7GEoFyy0RmgYFei3YhJ/iHnVN
	v6reGDe+zIIOFN6rWWKvyyxxn6/JNIFcVaAUqkX+syjYItSFFzxSf+d82nUep69IgozuGp
	yKvtIC47cM/9aqLQMwoRBuIZpS0bGDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747208093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KS3aU0qJJVbZ+ME4NZIiBhcPWXR6SL4fbwbExuTv34c=;
	b=TDnrd/r4YBpeQnetOGbw8P5iu/gFUVqBmm2LAvb3nlBL6IHEfScZrS/j1rkZ1FKNGr1GZS
	KSEq2QUVaSoXxIAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=VbVGqfEI;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="TDnrd/r4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747208093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KS3aU0qJJVbZ+ME4NZIiBhcPWXR6SL4fbwbExuTv34c=;
	b=VbVGqfEIKQhGrJKfJ9vp/iVe3sr0C2895wlH3Wrj9iYrq7GEoFyy0RmgYFei3YhJ/iHnVN
	v6reGDe+zIIOFN6rWWKvyyxxn6/JNIFcVaAUqkX+syjYItSFFzxSf+d82nUep69IgozuGp
	yKvtIC47cM/9aqLQMwoRBuIZpS0bGDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747208093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KS3aU0qJJVbZ+ME4NZIiBhcPWXR6SL4fbwbExuTv34c=;
	b=TDnrd/r4YBpeQnetOGbw8P5iu/gFUVqBmm2LAvb3nlBL6IHEfScZrS/j1rkZ1FKNGr1GZS
	KSEq2QUVaSoXxIAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F27713306;
	Wed, 14 May 2025 07:34:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I/38Ep1HJGi3AwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 14 May 2025 07:34:53 +0000
Message-ID: <e783c311-2f3c-42ba-b0ba-734a206cf04c@suse.cz>
Date: Wed, 14 May 2025 09:34:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by cpuset
 race
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>,
 Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Zi Yan <ziy@nvidia.com>
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
 <aAYXP4f417_bx6Is@harry> <025e3f51-2ab5-bc58-5475-b57103169a82@loongson.cn>
 <20250422171116.f3928045a13205dc1b9a46ea@linux-foundation.org>
 <CAJuCfpHbXmjAr2Rt0Mo_i32hpGOyXnVtXUd4qFjXriH9eYFDkQ@mail.gmail.com>
 <20250510200740.b7de2408e40be7ad5392fed9@linux-foundation.org>
 <CAJuCfpFdC6hgFSPy3M2sagkFobWeCuxLdcWiyV5pnzB55dgjZg@mail.gmail.com>
 <20250513121609.a9741e49a0e865f25f966de1@linux-foundation.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250513121609.a9741e49a0e865f25f966de1@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7182C1F391
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,nvidia.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -4.51

On 5/13/25 21:16, Andrew Morton wrote:
> On Tue, 13 May 2025 09:26:53 -0700 Suren Baghdasaryan <surenb@google.com> wrote:
> 
>> > > > This has been in mm-hotfixes-unstable for six days.  Hopefully we'll
>> > > > see some review activity soon (please).
>> > >
>> > > I reviewed and provided my feedback but saw neither a reply nor a
>> > > respin with proposed changes.
>> >
>> > OK, thanks.  Do you have time to put together a modified version of this?
>> 
>> I think the code is fine as is. Would be good to add Fixes: tag but it
>> will require some investigation to find the appropriate patch to
>> reference here.
> 
> Below is what is in mm-hotfixes.  It doesn't actually have any
> acked-by's or reviewed-by's.
> 
> So... final call for review, please.
> 
> 
> From: Tianyang Zhang <zhangtianyang@loongson.cn>
> Subject: mm/page_alloc.c: avoid infinite retries caused by cpuset race
> Date: Wed, 16 Apr 2025 16:24:05 +0800
> 
> __alloc_pages_slowpath has no change detection for ac->nodemask in the
> part of retry path, while cpuset can modify it in parallel.  For some
> processes that set mempolicy as MPOL_BIND, this results ac->nodemask
> changes, and then the should_reclaim_retry will judge based on the latest
> nodemask and jump to retry, while the get_page_from_freelist only
> traverses the zonelist from ac->preferred_zoneref, which selected by a
> expired nodemask and may cause infinite retries in some cases
> 
> cpu 64:
> __alloc_pages_slowpath {
>         /* ..... */
> retry:
>         /* ac->nodemask = 0x1, ac->preferred->zone->nid = 1 */
>         if (alloc_flags & ALLOC_KSWAPD)
>                 wake_all_kswapds(order, gfp_mask, ac);
>         /* cpu 1:
>         cpuset_write_resmask
>             update_nodemask
>                 update_nodemasks_hier
>                     update_tasks_nodemask
>                         mpol_rebind_task
>                          mpol_rebind_policy
>                           mpol_rebind_nodemask
> 		// mempolicy->nodes has been modified,
> 		// which ac->nodemask point to
> 
>         */
>         /* ac->nodemask = 0x3, ac->preferred->zone->nid = 1 */
>         if (should_reclaim_retry(gfp_mask, order, ac, alloc_flags,
>                                  did_some_progress > 0, &no_progress_loops))
>                 goto retry;
> }
> 
> Simultaneously starting multiple cpuset01 from LTP can quickly reproduce
> this issue on a multi node server when the maximum memory pressure is
> reached and the swap is enabled
> 
> Link: https://lkml.kernel.org/r/20250416082405.20988-1-zhangtianyang@loongson.cn
> Fixes: 902b62810a57 ("mm, page_alloc: fix more premature OOM due to race with cpuset update").

After the discussion in this thread, Suren retracted this Fixes: suggestion.
I think it actually goes back to this one which introduced the
preferred_zoneref caching.

Fixes: c33d6c06f60f ("mm, page_alloc: avoid looking up the first zone in a
zonelist twice")

> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Brendan Jackman <jackmanb@google.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

I would have placed the check bit further down, just above the
should_reclaim_retry() call, but it's not that important to hold up a fix
and can be done later.

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
> 
>  mm/page_alloc.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> --- a/mm/page_alloc.c~mm-page_allocc-avoid-infinite-retries-caused-by-cpuset-race
> +++ a/mm/page_alloc.c
> @@ -4562,6 +4562,14 @@ restart:
>  	}
>  
>  retry:
> +	/*
> +	 * Deal with possible cpuset update races or zonelist updates to avoid
> +	 * infinite retries.
> +	 */
> +	if (check_retry_cpuset(cpuset_mems_cookie, ac) ||
> +	    check_retry_zonelist(zonelist_iter_cookie))
> +		goto restart;
> +
>  	/* Ensure kswapd doesn't accidentally go to sleep as long as we loop */
>  	if (alloc_flags & ALLOC_KSWAPD)
>  		wake_all_kswapds(order, gfp_mask, ac);
> _
> 

