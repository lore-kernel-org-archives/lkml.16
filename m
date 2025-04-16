Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E94D1FFC55
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787313; cv=none; b=SOHdpFOTJrJsCXtFxKJ3qXLvRD/wQL74x2L0uzCjsDLatA5JyU5YnZdLAyAiMb7TXkxFhK/X9UohBhtu4TQBHcX8nMkT5adlrs92R0vSFwc19L2XwKQ1VUDhafxXaHUUnBBxS/jqHE2PfgFy8JJou6hqVtonx2GDYtMQpDKUULo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787313; c=relaxed/simple;
	bh=RdDrEp1YaDrch6xCuBXhV1ZjDR6OxRQB9b88W1eLJX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqChF8F0vPxm7DHzekZVx5CmeHJeuRDWZQG9oczt598uEarCWOpYUXUh0ST4nDAYPDnwE6dB5DdNT6u7ZwvFVcUT/Hc0iU+lPDuy1YYo941aK2YYiJIJcz8LcQerWImRzCqBa85yzRsFkiTaenpl0K8HvyjPOMOiVnteSeJJmXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=K9Kay7tF; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=cv3oDNpU; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=K9Kay7tF; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=cv3oDNpU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="K9Kay7tF";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="cv3oDNpU";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="K9Kay7tF";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="cv3oDNpU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3DD3B211A0;
	Wed, 16 Apr 2025 07:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744787310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hkTgZOTiamfrHb9IMLMbFPWdmy++E0DoEdHWknt0ss=;
	b=K9Kay7tF7WsWBRYANBzMvleoDeU8WyDfwCbx+KLQlmOJjN9RZLOd88cLaljulrnWBdXjwm
	idloLV1ul+RBHpW/Ls68XUrWJPx6jxFcqnbyYnkHzaGF0VRioBC+dc3P9YhPfdWFMP+WFA
	zDUhbXYwySXci0Z/oSCwDog3vspSCfc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744787310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hkTgZOTiamfrHb9IMLMbFPWdmy++E0DoEdHWknt0ss=;
	b=cv3oDNpU4eF8W8mVVnNZFlPc5ZSX/OqQ9Wj0aOuDtlDovG/YuJAl9Sy/GESD/ksRw/Bmva
	35HdAlo/Ko8/J6Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744787310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hkTgZOTiamfrHb9IMLMbFPWdmy++E0DoEdHWknt0ss=;
	b=K9Kay7tF7WsWBRYANBzMvleoDeU8WyDfwCbx+KLQlmOJjN9RZLOd88cLaljulrnWBdXjwm
	idloLV1ul+RBHpW/Ls68XUrWJPx6jxFcqnbyYnkHzaGF0VRioBC+dc3P9YhPfdWFMP+WFA
	zDUhbXYwySXci0Z/oSCwDog3vspSCfc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744787310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hkTgZOTiamfrHb9IMLMbFPWdmy++E0DoEdHWknt0ss=;
	b=cv3oDNpU4eF8W8mVVnNZFlPc5ZSX/OqQ9Wj0aOuDtlDovG/YuJAl9Sy/GESD/ksRw/Bmva
	35HdAlo/Ko8/J6Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BA1813976;
	Wed, 16 Apr 2025 07:08:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ue9kB25X/2epRgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 16 Apr 2025 07:08:30 +0000
Message-ID: <9f5c4c8e-bdb4-433a-8d1b-855cbebfe88d@suse.cz>
Date: Wed, 16 Apr 2025 09:08:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, hugetlb: Avoid passing a null nodemask when there is
 mbind policy
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, David Hildenbrand
 <david@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250415121503.376811-1-osalvador@suse.de>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250415121503.376811-1-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 4/15/25 14:15, Oscar Salvador wrote:
> Before trying to allocate a page, gather_surplus_pages() sets up a nodemask
> for the nodes we can allocate from, but instead of passing the nodemask
> down the road to the page allocator, it iterates over the nodes within that
> nodemask right there, meaning that the page allocator will receive a preferred_nid
> and a null nodemask.
> 
> This is a problem when using a memory policy, because it might be that
> the page allocator ends up using a node as a fallback which is not
> represented in the policy.
> 
> Avoid that by passing the nodemask directly to the page allocator, so it can
> filter out fallback nodes that are not part of the nodemask.

It will also try the fallbacks using numa distance and not incrementing nid.

> Signed-off-by: Oscar Salvador <osalvador@suse.de>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  mm/hugetlb.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index ccc4f08f8481..5e1cba0f835f 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2419,7 +2419,6 @@ static int gather_surplus_pages(struct hstate *h, long delta)
>  	long i;
>  	long needed, allocated;
>  	bool alloc_ok = true;
> -	int node;
>  	nodemask_t *mbind_nodemask, alloc_nodemask;
>  
>  	mbind_nodemask = policy_mbind_nodemask(htlb_alloc_mask(h));
> @@ -2443,21 +2442,12 @@ static int gather_surplus_pages(struct hstate *h, long delta)
>  	for (i = 0; i < needed; i++) {
>  		folio = NULL;
>  
> -		/* Prioritize current node */
> -		if (node_isset(numa_mem_id(), alloc_nodemask))
> -			folio = alloc_surplus_hugetlb_folio(h, htlb_alloc_mask(h),
> -					numa_mem_id(), NULL);
> -
> -		if (!folio) {
> -			for_each_node_mask(node, alloc_nodemask) {
> -				if (node == numa_mem_id())
> -					continue;
> -				folio = alloc_surplus_hugetlb_folio(h, htlb_alloc_mask(h),
> -						node, NULL);
> -				if (folio)
> -					break;
> -			}
> -		}
> +		/*
> +		 * It is okay to use NUMA_NO_NODE because we use numa_mem_id()
> +		 * down the road to pick the current node if that is the case.
> +		 */
> +		folio = alloc_surplus_hugetlb_folio(h, htlb_alloc_mask(h),
> +						    NUMA_NO_NODE, &alloc_nodemask);
>  		if (!folio) {
>  			alloc_ok = false;
>  			break;

