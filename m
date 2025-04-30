Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D266184E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999289; cv=none; b=l2ZQyurmMXNSAk2RskESsNcR/o++vxXvmyNiveQ6bsIN48dkkJ/Lgynwjd115CjwoHY3wn0xr6Yyx1kHSMLwwASUio+EOOkXJYQypN8sn7ho78xNKBO6i7tUr9nJn2nL4rsHZW4ylxrbyxwbuT7yS1kF/qV1o8sCn5KtkHNnYyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999289; c=relaxed/simple;
	bh=JLVwhfni2gN/9VExVIwT0Jp6Xqdl3rdLZ4jlOOEoES0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBIgEy0XBkj4ppc/sPCXR1jCWoEJDotFi6UVM1PHMX/4phA8cYLTDxKyTuFaDGdvVFpSg2SiaIpnRfPKqnXVNtr3QIHonIPmrSQvTZZXaV9iG98U3hflJ0EnNU4mgya1f/uZeMoH4rX2lM0ERxWjy4elkOsann7soLAxs4kSG/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hXG1Ts0W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VcVA7e0s; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hXG1Ts0W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VcVA7e0s; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hXG1Ts0W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VcVA7e0s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hXG1Ts0W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VcVA7e0s"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3F3AE1F7BD;
	Wed, 30 Apr 2025 07:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745999284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=784amBfCV58CRKel//XxIbfiXvwlukaIbNyXHHSMyGQ=;
	b=hXG1Ts0Wgxzv8s2AJPQODebdHkhG9ERbR48Z7gV2cTqLdY+ScVO+WbVmI/i60dc6rX7eBv
	MgoYXTmWNOTo0/JWwqORbv7iQHdBpGH/Z3zlrXTjLdPfXXA9z1q9SNvhaP87q3Dr5zd221
	IUwpG+lJ54YtBjmIIWmdOUsn7oc1PcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745999284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=784amBfCV58CRKel//XxIbfiXvwlukaIbNyXHHSMyGQ=;
	b=VcVA7e0sAqCWvVJBxEgN/n3ZfSkHP9ItO1nUqc1M5liQHeZJt73lHILQ3dVaNB9NLkAFyy
	22rEU+0Pmhqmm5CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hXG1Ts0W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VcVA7e0s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745999284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=784amBfCV58CRKel//XxIbfiXvwlukaIbNyXHHSMyGQ=;
	b=hXG1Ts0Wgxzv8s2AJPQODebdHkhG9ERbR48Z7gV2cTqLdY+ScVO+WbVmI/i60dc6rX7eBv
	MgoYXTmWNOTo0/JWwqORbv7iQHdBpGH/Z3zlrXTjLdPfXXA9z1q9SNvhaP87q3Dr5zd221
	IUwpG+lJ54YtBjmIIWmdOUsn7oc1PcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745999284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=784amBfCV58CRKel//XxIbfiXvwlukaIbNyXHHSMyGQ=;
	b=VcVA7e0sAqCWvVJBxEgN/n3ZfSkHP9ItO1nUqc1M5liQHeZJt73lHILQ3dVaNB9NLkAFyy
	22rEU+0Pmhqmm5CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82F7B139E7;
	Wed, 30 Apr 2025 07:48:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rbxdHbPVEWiMAwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 30 Apr 2025 07:48:03 +0000
Date: Wed, 30 Apr 2025 09:48:01 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] driver/base: Remove unused functions
Message-ID: <aBHVsd21j45c2tjA@localhost.localdomain>
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
 <273649393600cb33ac3eec0e9a523c2d1853a47c.1745852397.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <273649393600cb33ac3eec0e9a523c2d1853a47c.1745852397.git.donettom@linux.ibm.com>
X-Rspamd-Queue-Id: 3F3AE1F7BD
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,linuxfoundation.org,linux-foundation.org,gmail.com,huawei.com,intel.com,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

On Mon, Apr 28, 2025 at 10:33:47PM +0530, Donet Tom wrote:
> The functions register_mem_block_under_node_early and get_nid_for_pfn
> are not used, as register_memory_blocks_under_node_early is now used
> to register memory blocks during early boot. Therefore, these unused
> functions have been removed.
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>  drivers/base/node.c | 54 +--------------------------------------------
>  1 file changed, 1 insertion(+), 53 deletions(-)
...

> @@ -895,10 +846,7 @@ void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>  {
>  	walk_memory_blocks_func_t func;
>  
> -	if (context == MEMINIT_HOTPLUG)
> -		func = register_mem_block_under_node_hotplug;
> -	else
> -		func = register_mem_block_under_node_early;
> +	func = register_mem_block_under_node_hotplug;
>  
>  	walk_memory_blocks(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn - start_pfn),
>  			   (void *)&nid, func);

So we have now:

register_memory_blocks_under_node - wrt. hotplug
register_memory_blocks_under_node_early - wrt. boot

AFAICS, we can drop the 'context' parameter from this function because
we do not need it anymore, right? The functions that get called
eventually, register_mem_block_under_node_hotplug() and
register_mem_block_under_node_early(), already know its context and pass
it on to do_register_memory_block_under_node().


-- 
Oscar Salvador
SUSE Labs
