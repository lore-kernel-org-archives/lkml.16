Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5E21DD9AD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184873; cv=none; b=tf7VWvb5MYtmDQlRd8Nya4CTO2KUhag2DJ7DhYWRJ3VL0xbfj3Nr4/cy6YfjoQfpwwFFBIoddnkyPCNrxM0JpETA4IYXvBJC3ncnejR1m/s4L61/isBujnMjxB7UQQTBhgnQLCDoulkUNfApCAC8nZNH4mJCGpEu4aF6ugThW1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184873; c=relaxed/simple;
	bh=minVKcCyBMXJQ7KkMfYiiYXhdFIjS0goR5TovDBQYPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnY32RzFM2RIMAiuuI3ABtwQHwMJZRCUmhpTJoiNaqJkRZ0gH3xzBR6gI7oPLa3kS5PBfBv9W5AkqEsqfplYXcrSI/IrYaARELZ7MU37wM5n8+DKH4f621v1jxzRbCl2EGxtLxBbVG6Ufq/nIPwYvbJnuLe6K7e6iidFP1W1UH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tRynlPlO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L2v61w+1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jNU4c1QH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HoKK+z0P; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tRynlPlO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L2v61w+1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jNU4c1QH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HoKK+z0P"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B7D91F388;
	Wed,  9 Apr 2025 07:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744184869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=90MK+irpo/1NrJ2v//Z0/aUKi6mvSl/+9YGuQGvtMj8=;
	b=tRynlPlOIkBgbtlLrAX+C/I5K5U5I6U56ECwufmx77PUvdl0URL22LIcSuNoPA8xOCE38j
	e60jXUT5XOCqyeSvy7PHQGtogICoiPKiKxCss7spHHqCVmEMvU4ZBEaMZ41eeKU9XvcA3q
	LJrMrHHSeZ9fVra4Lo+tmv83Hlix/ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744184869;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=90MK+irpo/1NrJ2v//Z0/aUKi6mvSl/+9YGuQGvtMj8=;
	b=L2v61w+1yYoBsIuABbt0IjXvrOmkm4TJeKmYzyC9RL4509v7OphaQaD1VzzCMRI5NAnU63
	kWdAeUDvN4dTsICA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jNU4c1QH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HoKK+z0P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744184867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=90MK+irpo/1NrJ2v//Z0/aUKi6mvSl/+9YGuQGvtMj8=;
	b=jNU4c1QHM1/sw7aKJ/1ZsVWDbhKoXnjahVEy4GXKoW2Zt6nvbQGAupCHpbIoyqkBeJyg77
	0nlTp5ACmvGAtoxNteAw3kAe+Lc72Q7fVIpVRbOmA1d8Jc0ZtNl7VJzhMYCvzPF5frjci3
	rSG85GO/digkZ+9mVg9+TZgXx0BRbNo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744184867;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=90MK+irpo/1NrJ2v//Z0/aUKi6mvSl/+9YGuQGvtMj8=;
	b=HoKK+z0PM0xfwiTjpGCXwks+UGzg0XI/BZl/mDcAeyRBh43I9CFUgQ9SGvcLmxQIG3AjA2
	K8HxYzvMLVn2/DBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06E3F137AC;
	Wed,  9 Apr 2025 07:47:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id W8N5OiIm9mcWUQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 09 Apr 2025 07:47:46 +0000
Date: Wed, 9 Apr 2025 09:47:45 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Frank van der Linden <fvdl@google.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, david@redhat.com, luizcap@redhat.com
Subject: Re: [PATCH] mm/hugetlb: use separate nodemask for bootmem allocations
Message-ID: <Z_YmIRpBIBtIAdfu@localhost.localdomain>
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
X-Rspamd-Queue-Id: 7B7D91F388
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

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
> 
> Fixes: de55996d7188 ("mm/hugetlb: use online nodes for bootmem allocation")
> Signed-off-by: Frank van der Linden <fvdl@google.com>

This looks good to me

Reviewed-by: Oscar Salvador <osalvador@suse.de>

The only think I was pondering whether it would be a way
to keep hugetlb_bootmem_set_nodes() confined in hugetlb code
and not having to export that to hugetlb_cma.

But then again, you would have to create a function that calls
hugetlb_bootmem_set_nodes() earlier and would be churn for churn.


-- 
Oscar Salvador
SUSE Labs
