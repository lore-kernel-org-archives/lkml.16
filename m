Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD92153EA
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749032467; cv=none; b=cYq6yIW3xup0l7hv+JDWsrEc4LGqmBmzBlqmsUtI4sbtEOIPRDVVNVZRZCPvxA3+X5jvP95aZe3x0KpQy/fMxjNsffAHkLP7JjMhAiFC0UeU5+cBDxDvgt4rF0E6X3YMEXitXO87Xsy+0BsEPXlHxQYTc0dgvtWNavM762ierTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749032467; c=relaxed/simple;
	bh=fr2U+QjdTUfwEtNfL8gz/GPmo2b3XjHY/ERjpu0d+HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cqr5ERiOmYMgyHpArIOsrJqYgHu1xVWD/ucWHLcpia+dGyZgWBsUpirPwU08B05RLhisaIYhv2/JobRPQZJCuk2RhT7Bk2/Uq3TknTt4WHCrzjcNTuzihy+ebe7dNLSQict2RQ8ZTmzkydbefWzJJ+fZMlQkXtYc610micdpnU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=nDm4AHKU; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=WHdEUh1n; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=nDm4AHKU; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=WHdEUh1n; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="nDm4AHKU";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="WHdEUh1n";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="nDm4AHKU";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="WHdEUh1n"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 565BA5F993;
	Wed,  4 Jun 2025 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749031002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1jjyZmVb2kI0wJ/xwBd+UN6NcrjIdsAAEgibBT83Kx4=;
	b=nDm4AHKUVbsQhlSq/U90NBb1bblcevUHw4674wIXVoEjVtlYPEN07cOI/0cAHk0SaziQgs
	Msacas3qAilmtwhwGocAhgupoEg5S4SHjexOhy0vxhh2XelNBoNl4Y01LFlhaLlLZV1ACN
	xTK/3B5kN9vezkH4a54aO2NA+gbSi5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749031002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1jjyZmVb2kI0wJ/xwBd+UN6NcrjIdsAAEgibBT83Kx4=;
	b=WHdEUh1nWrWg3bcwwuBdeF+QRyGtFm9jDfeWDb3u3jgh4ls9UM7ai8UcJw8DeIP+jupdnB
	ADVbo4Cfps0ImPCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=nDm4AHKU;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=WHdEUh1n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749031002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1jjyZmVb2kI0wJ/xwBd+UN6NcrjIdsAAEgibBT83Kx4=;
	b=nDm4AHKUVbsQhlSq/U90NBb1bblcevUHw4674wIXVoEjVtlYPEN07cOI/0cAHk0SaziQgs
	Msacas3qAilmtwhwGocAhgupoEg5S4SHjexOhy0vxhh2XelNBoNl4Y01LFlhaLlLZV1ACN
	xTK/3B5kN9vezkH4a54aO2NA+gbSi5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749031002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1jjyZmVb2kI0wJ/xwBd+UN6NcrjIdsAAEgibBT83Kx4=;
	b=WHdEUh1nWrWg3bcwwuBdeF+QRyGtFm9jDfeWDb3u3jgh4ls9UM7ai8UcJw8DeIP+jupdnB
	ADVbo4Cfps0ImPCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35C1113AD9;
	Wed,  4 Jun 2025 09:56:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +cLEDFoYQGjAHAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 04 Jun 2025 09:56:42 +0000
Message-ID: <6fffd2fe-0cee-405f-af78-b57b5e5d02e8@suse.cz>
Date: Wed, 4 Jun 2025 11:56:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmstat: Fix build with MEMCG=y and VM_EVENT_COUNTERS=n
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, muchun.song@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Konstantin Khlebnikov <koct9i@gmail.com>
References: <20250604095111.533783-1-kirill.shutemov@linux.intel.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250604095111.533783-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 565BA5F993
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[oracle.com,kernel.org,google.com,suse.com,cmpxchg.org,linux.dev,kvack.org,vger.kernel.org,infradead.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -4.51
X-Spam-Level: 

On 6/4/25 11:51, Kirill A. Shutemov wrote:
> When compiling with MEMCG enabled but VM_EVENT_COUNTERS disabled,
> BUILD_BUG_ON() is triggered in vmstat_start because the vmstat_text
> array is larger than NR_VMSTAT_ITEMS.
> 
> This issue arises because some elements of the vmstat_text array are
> present when either MEMCG or VM_EVENT_COUNTERS is enabled, but
> NR_VMSTAT_ITEMS only accounts for these elements if VM_EVENT_COUNTERS is
> enabled.
> 
> The recent change in the BUILD_BUG_ON() check made it more strict,
> disallowing extra elements in the array, which revealed the issue.
> 
> Instead of adjusting the NR_VMSTAT_ITEMS definition to account for
> MEMCG, make MEMCG select VM_EVENT_COUNTERS. VM_EVENT_COUNTERS is
> enabled in most configurations anyway.
> 
> There is no need to backport this fix to stable trees. Without the
> strict BUILD_BUG_ON(), the issue is not harmful. The elements in
> question would only be read by the memcg code, not by /proc/vmstat.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: ebc5d83d0443 ("mm/memcontrol: use vmstat names for printing statistics")

Well in that case I think we should put Fixes: to the BUILD_BUG_ON() change.
And if it's not yet a stable sha1, squash that together with this?
It doesn't seem ebc5d83d0443 alone needs this fix.

> Cc: Konstantin Khlebnikov <koct9i@gmail.com>

Otherwise,
Acked-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  include/linux/vmstat.h | 4 ++--
>  init/Kconfig           | 1 +
>  mm/vmstat.c            | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
> index b2ccb6845595..c287998908bf 100644
> --- a/include/linux/vmstat.h
> +++ b/include/linux/vmstat.h
> @@ -507,7 +507,7 @@ static inline const char *lru_list_name(enum lru_list lru)
>  	return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>  }
>  
> -#if defined(CONFIG_VM_EVENT_COUNTERS) || defined(CONFIG_MEMCG)
> +#if defined(CONFIG_VM_EVENT_COUNTERS)
>  static inline const char *vm_event_name(enum vm_event_item item)
>  {
>  	return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> @@ -516,7 +516,7 @@ static inline const char *vm_event_name(enum vm_event_item item)
>  			   NR_VM_STAT_ITEMS +
>  			   item];
>  }
> -#endif /* CONFIG_VM_EVENT_COUNTERS || CONFIG_MEMCG */
> +#endif /* CONFIG_VM_EVENT_COUNTERS */
>  
>  #ifdef CONFIG_MEMCG
>  
> diff --git a/init/Kconfig b/init/Kconfig
> index ab83abe0fd9d..dd332cac6036 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -989,6 +989,7 @@ config MEMCG
>  	select PAGE_COUNTER
>  	select EVENTFD
>  	select SLAB_OBJ_EXT
> +	select VM_EVENT_COUNTERS
>  	help
>  	  Provides control over the memory footprint of tasks in a cgroup.
>  
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index 27dc37168cfd..c3114b8826e4 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1301,7 +1301,7 @@ const char * const vmstat_text[] = {
>  	[I(NR_MEMMAP_BOOT_PAGES)]		= "nr_memmap_boot_pages",
>  #undef I
>  
> -#if defined(CONFIG_VM_EVENT_COUNTERS) || defined(CONFIG_MEMCG)
> +#if defined(CONFIG_VM_EVENT_COUNTERS)
>  	/* enum vm_event_item counters */
>  #define I(x) (NR_VM_ZONE_STAT_ITEMS + NR_VM_NUMA_EVENT_ITEMS + \
>  	     NR_VM_NODE_STAT_ITEMS + NR_VM_STAT_ITEMS + x)
> @@ -1498,7 +1498,7 @@ const char * const vmstat_text[] = {
>  #endif
>  #endif
>  #undef I
> -#endif /* CONFIG_VM_EVENT_COUNTERS || CONFIG_MEMCG */
> +#endif /* CONFIG_VM_EVENT_COUNTERS */
>  };
>  #endif /* CONFIG_PROC_FS || CONFIG_SYSFS || CONFIG_NUMA || CONFIG_MEMCG */
>  

