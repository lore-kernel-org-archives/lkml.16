Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB41C8603
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748625332; cv=none; b=grGrgXoAzwLQCkK134A+c3YAGOLEeqUuZVYeBMl47xfo76SNdCT4yVMxU0+RA2Xswv87jSuvGxnoKBeUoA0FTzlm9eKB29zKuIm54VYDPkh7CCDo/BVsz49vfgMo7JJXZ5B7Z5i/+UHhzhJboCD0sieyJ2PkG+yL1Qvg7dmBTLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748625332; c=relaxed/simple;
	bh=DeYhzEVQDfm1xyP4HGZLgDrM75o8pI0/lh+moIW7FK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SEKZcgwU53ixys/4IDgmrO4HVZclih1Hoph9T40an3EehbjvW+gA4uWM3cRvP3ijTj2tBVFkTJNCoF/hMDrJF3/XXaHDLGrq1K0LNpUeISPhZDbuDQNStsSuI0ncTy2g+8Nxsai5m7UhvMdPF/FKK1kRclsh+jMoXSlFgjkK25A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Xr0yE8m4; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=YJL10iW2; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Xr0yE8m4; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=YJL10iW2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Xr0yE8m4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="YJL10iW2";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Xr0yE8m4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="YJL10iW2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 76CDF1FC04;
	Fri, 30 May 2025 17:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748625328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eiw/GS8ThlNEcX/3M+eYi1TQLQDYRrpqra1otZl/wr4=;
	b=Xr0yE8m4TZY8crl1qiPobL836sSOgJV4vqkwdDEVBZlTiYerEgJNgmHwVsesHSMIzC5D/G
	S5o7AI+lkGIQYvFLTdL5k9Ih8fXZ0Ed6KK8Qvc6qg2TLZ0ZNh/xqEh0WB2cczFm3sgx56I
	UALL2JYNvVlt3Wpi1JgWo3nwvBAIPTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748625328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eiw/GS8ThlNEcX/3M+eYi1TQLQDYRrpqra1otZl/wr4=;
	b=YJL10iW26IqObgGa+kQeW0MJ8s36xka0Be7WMzQOGydvHwdtyEnH/Rfh5xU16Z3/EjOREj
	qWjUTUgFykISO3Bw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Xr0yE8m4;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=YJL10iW2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748625328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eiw/GS8ThlNEcX/3M+eYi1TQLQDYRrpqra1otZl/wr4=;
	b=Xr0yE8m4TZY8crl1qiPobL836sSOgJV4vqkwdDEVBZlTiYerEgJNgmHwVsesHSMIzC5D/G
	S5o7AI+lkGIQYvFLTdL5k9Ih8fXZ0Ed6KK8Qvc6qg2TLZ0ZNh/xqEh0WB2cczFm3sgx56I
	UALL2JYNvVlt3Wpi1JgWo3nwvBAIPTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748625328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eiw/GS8ThlNEcX/3M+eYi1TQLQDYRrpqra1otZl/wr4=;
	b=YJL10iW26IqObgGa+kQeW0MJ8s36xka0Be7WMzQOGydvHwdtyEnH/Rfh5xU16Z3/EjOREj
	qWjUTUgFykISO3Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 581DA132D8;
	Fri, 30 May 2025 17:15:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nuwnFbDnOWh9dwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 30 May 2025 17:15:28 +0000
Message-ID: <3dd2385d-fa1b-4af3-93d8-6c88110b19d4@suse.cz>
Date: Fri, 30 May 2025 19:15:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
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
 <20250530162227.715551-7-ziy@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250530162227.715551-7-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 76CDF1FC04
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:dkim,suse.cz:email];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -4.51
X-Spam-Level: 

On 5/30/25 18:22, Zi Yan wrote:
> migratetype is no longer overwritten during pageblock isolation,
> start_isolate_page_range(), has_unmovable_pages(), and
> set_migratetype_isolate() no longer need which migratetype to restore
> during isolation failure.
> 
> For has_unmoable_pages(), it needs to know if the isolation is for CMA
> allocation, so adding CMA_ALLOCATION to provide the information. At the
> same time change isolation flags to enum pb_isolate_mode
> (PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
> PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
> MEMORY_OFFLINE instead, since only PB_ISOLATE_MODE_MEM_OFFLINE reports
> isolation failures.
> 
> alloc_contig_range() no longer needs migratetype. Replace it with
> enum acr_flags_t to tell if an allocation is for CMA. So does
> __alloc_contig_migrate_range().
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  drivers/virtio/virtio_mem.c    |  2 +-
>  include/linux/gfp.h            |  9 ++++-
>  include/linux/page-isolation.h | 20 ++++++++--
>  include/trace/events/kmem.h    | 14 ++++---
>  mm/cma.c                       |  2 +-
>  mm/memory_hotplug.c            |  6 +--
>  mm/page_alloc.c                | 27 ++++++-------
>  mm/page_isolation.c            | 70 +++++++++++++++-------------------
>  8 files changed, 82 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> index 56d0dbe62163..6bce70b139b2 100644
> --- a/drivers/virtio/virtio_mem.c
> +++ b/drivers/virtio/virtio_mem.c
> @@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio_mem *vm, unsigned long pfn,
>  		if (atomic_read(&vm->config_changed))
>  			return -EAGAIN;
>  
> -		rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
> +		rc = alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
>  					GFP_KERNEL);
>  		if (rc == -ENOMEM)
>  			/* whoops, out of memory */
> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> index be160e8d8bcb..51990d571e3e 100644
> --- a/include/linux/gfp.h
> +++ b/include/linux/gfp.h
> @@ -423,9 +423,16 @@ static inline bool gfp_compaction_allowed(gfp_t gfp_mask)
>  extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
>  
>  #ifdef CONFIG_CONTIG_ALLOC
> +
> +enum acr_flags_t {
> +	ACR_CMA,	// CMA allocation
> +	ACR_OTHER,	// other allocation
> +};
> +
>  /* The below functions must be run on a range from a single zone. */
>  extern int alloc_contig_range_noprof(unsigned long start, unsigned long end,
> -			      unsigned migratetype, gfp_t gfp_mask);
> +				     enum acr_flags_t alloc_flags,
> +				     gfp_t gfp_mask);

Nit: when used this way I think it's also rather a "mode" than "flags". It's
probably sufficient though, I don't expect we'll be adding more and want to
combine them in a flags way. So it's just about the enum's name.

>  #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(__VA_ARGS__))
>  
