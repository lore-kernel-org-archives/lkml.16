Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C950F1ADFFE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120464; cv=none; b=bTAkoZPG9ba3H2ef1VeZDwXsDzZO9z/hebbKA595v/tt0vhJWO1QFALnmqgIluWjLyay48YlRWD9hrmB6BiZWxtld6O2SgkRqWp3z4syc1UgdfzBapFAJ8anZYaUsTeBdlipVWvv7HNpK3DRc/wXTokZNpsDUQ0AyshaOFDRDM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120464; c=relaxed/simple;
	bh=np5UR4WUlfSkbJNtWYs6pHjfKKEJYLBwIY/aJ7Mlujo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eszs6UuaUPP1fRw+HuPG0Mho42l9NqGqQh7NIWkjneBXJtM76cLRkBJSzWqX+cvnMab6GySaBGNjp5GjvD99At5dhsRXiuOHl1d/PU44MBYHqevvXTewmf31BFIw1IIAUpMMDKawHFUS/wq0hXs34HIks8YT2xnLfdMa+dHV/Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r09DITqq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H6ybNsAU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r09DITqq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H6ybNsAU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r09DITqq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H6ybNsAU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r09DITqq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H6ybNsAU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D6CBB1F38D;
	Tue,  8 Apr 2025 13:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744120460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FLrxEWJYmUgKP6lcHFFafdBuMzOHBtJam10U8q12Uyc=;
	b=r09DITqqwNvvUMrEU5Lgdovl0t6CpkDfKrBUME429WRLnvQet5FovLv0yp/f0ZgBJYfeeW
	Gk7a5/qKRwY9DKQHBDJY+3XKprDhXGoJwI6bVpU1jV7lKM2ZyJdMMu5ImEug4HLIVZkWBW
	2UqTC53JPJfetM+3tGOLQJ95V0FBrG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744120460;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FLrxEWJYmUgKP6lcHFFafdBuMzOHBtJam10U8q12Uyc=;
	b=H6ybNsAUXX5tJhgIi4hdB7G4KAp+Rhh6Dpf5CfqvJ6t4G/cAL/l507E0rKE1HW6nCLoU22
	NWmcmKNPnX9cWEBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r09DITqq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=H6ybNsAU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744120460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FLrxEWJYmUgKP6lcHFFafdBuMzOHBtJam10U8q12Uyc=;
	b=r09DITqqwNvvUMrEU5Lgdovl0t6CpkDfKrBUME429WRLnvQet5FovLv0yp/f0ZgBJYfeeW
	Gk7a5/qKRwY9DKQHBDJY+3XKprDhXGoJwI6bVpU1jV7lKM2ZyJdMMu5ImEug4HLIVZkWBW
	2UqTC53JPJfetM+3tGOLQJ95V0FBrG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744120460;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FLrxEWJYmUgKP6lcHFFafdBuMzOHBtJam10U8q12Uyc=;
	b=H6ybNsAUXX5tJhgIi4hdB7G4KAp+Rhh6Dpf5CfqvJ6t4G/cAL/l507E0rKE1HW6nCLoU22
	NWmcmKNPnX9cWEBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D13313A1E;
	Tue,  8 Apr 2025 13:54:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Zuf6F4wq9Wd4OwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 08 Apr 2025 13:54:20 +0000
Date: Tue, 8 Apr 2025 15:54:18 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Frank van der Linden <fvdl@google.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, david@redhat.com, luizcap@redhat.com
Subject: Re: [PATCH] mm/hugetlb: use separate nodemask for bootmem allocations
Message-ID: <Z_Uqiu75bXhqpwm4@localhost.localdomain>
References: <20250402205613.3086864-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402205613.3086864-1-fvdl@google.com>
X-Rspamd-Queue-Id: D6CBB1F38D
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, Apr 02, 2025 at 08:56:13PM +0000, Frank van der Linden wrote:
> Hugetlb boot allocation has used online nodes for allocation since
> commit de55996d7188 ("mm/hugetlb: use online nodes for bootmem
> allocation"). This was needed to be able to do the allocations
> earlier in boot, before N_MEMORY was set.
> 
> This might lead to a different distribution of gigantic hugepages
> across NUMA nodes if there are memoryless nodes in the system.
> 
> What happens is that the memoryless nodes are tried, but then
> the memblock allocation fails and falls back, which usually means
> that the node that has the highest physical address available
> will be used (top-down allocation). While this will end up
> getting the same number of hugetlb pages, they might not be
> be distributed the same way. The fallback for each memoryless
> node might not end up coming from the same node as the
> successful round-robin allocation from N_MEMORY nodes.
> 
> While administrators that rely on having a specific number of
> hugepages per node should use the hugepages=N:X syntax, it's
> better not to change the old behavior for the plain hugepages=N
> case.
> 
> To do this, construct a nodemask for hugetlb bootmem purposes
> only, containing nodes that have memory. Then use that
> for round-robin bootmem allocations.
> 
> This saves some cycles, and the added advantage here is that
> hugetlb_cma can use it too, avoiding the older issue of
> pointless attempts to create a CMA area for memoryless nodes
> (which will also cause the per-node CMA area size to be too
> small).

Hi Frank,

Makes sense.

There something I do not quite understand though

> @@ -5012,7 +5039,6 @@ void __init hugetlb_bootmem_alloc(void)
>  
>  	for_each_hstate(h) {
>  		h->next_nid_to_alloc = first_online_node;
> -		h->next_nid_to_free = first_online_node;

Why are you unsetting next_nid_to_free? I guess it is because
we do not use it during boot time and you already set it to
first_memory_node further down the road in hugetlb_init_hstates.

And the reason you are leaving next_nid_to_alloc set is to see if
there is any chance that first_online_node is part of hugetlb_bootmem_nodes?


-- 
Oscar Salvador
SUSE Labs
