Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F24C1ACED1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519591; cv=none; b=mA+cvjcX8qJmZqZ0O3CMBiS/IxGzJIonjFKXJHQz1x8E/fen17oCrU5J9rCCDgqGUqB/B7Vn/RS0xCX2yw280sAn2pupBbfIGUkzzZ/ry9kOd+aFEO4OkZPT4wjOkPLMVMDoIGjU9uFG0MvTimpeQbKmhQBNboOKY1uiDrDAjh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519591; c=relaxed/simple;
	bh=lprDaWk3zI5WWMw94+KomU7E0idRc+BVB9KB4ccVC1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdXunzeM0sByv24CRG6XBRZIE2klMWDIsbUuHbGwEjHntmy6+zn/ZQ+PTP8cXqu1W2OCWGk8wBzC7Lralcoa0KzWtwgVqYxT2x9vgpob77tb4Mkl3szL9JGRhvErWkrLpCfMi33qsAp2QoKDyCopHu9nMFl5dBWjewDIUkju7hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OmppCscZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HZpNmdYj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OmppCscZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HZpNmdYj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OmppCscZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HZpNmdYj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OmppCscZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HZpNmdYj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3761B1F44E;
	Tue,  1 Apr 2025 14:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743519588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sn7HQhKP7/bRmZz7GRU0jPXRaQniQpsxx87tw1YDLhI=;
	b=OmppCscZlqx8mj6qX5aSpE9HGrWUIiE5S1JzJ8kab+fVHBei+gygLCPzCkLwNJE4J6vewr
	xQwzUFxdASZa2xohHVTnCC8xPHuL7nLzIx/fTor9r4V3OWyUm/2C82usQVYj27NTUUr8KZ
	byTkyPPmZqsytfXptqzTnMAfLFdvX7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743519588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sn7HQhKP7/bRmZz7GRU0jPXRaQniQpsxx87tw1YDLhI=;
	b=HZpNmdYj7+UBk4hg1XmFnxhJVhxweTweDIeZYF4bsgIWMx73Fz/ZebkOOwGTron+3OYuxu
	+kTTTBOd/y5W+NBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OmppCscZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HZpNmdYj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743519588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sn7HQhKP7/bRmZz7GRU0jPXRaQniQpsxx87tw1YDLhI=;
	b=OmppCscZlqx8mj6qX5aSpE9HGrWUIiE5S1JzJ8kab+fVHBei+gygLCPzCkLwNJE4J6vewr
	xQwzUFxdASZa2xohHVTnCC8xPHuL7nLzIx/fTor9r4V3OWyUm/2C82usQVYj27NTUUr8KZ
	byTkyPPmZqsytfXptqzTnMAfLFdvX7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743519588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sn7HQhKP7/bRmZz7GRU0jPXRaQniQpsxx87tw1YDLhI=;
	b=HZpNmdYj7+UBk4hg1XmFnxhJVhxweTweDIeZYF4bsgIWMx73Fz/ZebkOOwGTron+3OYuxu
	+kTTTBOd/y5W+NBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC1D913691;
	Tue,  1 Apr 2025 14:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xZcjL2P/62ejcAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 01 Apr 2025 14:59:47 +0000
Date: Tue, 1 Apr 2025 16:59:46 +0200
From: Oscar Salvador <osalvador@suse.de>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, muchun.song@linux.dev,
	Miaohe Lin <linmiaohe@huawei.com>
Subject: Re: [PATCH] mm/compaction: Fix bug in hugetlb handling pathway
Message-ID: <Z-v_YnBV_XJ89NnO@localhost.localdomain>
References: <20250401021025.637333-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401021025.637333-1-vishal.moola@gmail.com>
X-Rspamd-Queue-Id: 3761B1F44E
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, Mar 31, 2025 at 07:10:24PM -0700, Vishal Moola (Oracle) wrote:
> The compaction code doesn't take references on pages until we're certain
> we should attempt to handle it.
> 
> In the hugetlb case, isolate_or_dissolve_huge_page() may return -EBUSY
> without taking a reference to the folio associated with our pfn. If our
> folio's refcount drops to 0, compound_nr() becomes unpredictable, making
> low_pfn and nr_scanned unreliable.
> The user-visible effect is minimal - this should rarely happen (if ever).

So, with compound_order() we either return the real order of the
compound page or '0', right?

> Fix this by storing the folio statistics earlier on the stack (just like
> the THP and Buddy cases).
> 
> Also revert commit 66fe1cf7f581 ("mm: compaction: use helper compound_nr
> in isolate_migratepages_block")
> to make backporting easier.
> 
> Fixes: 369fa227c219 ("mm: make alloc_contig_range handle free hugetlb pages")
> Cc: Miaohe Lin <linmiaohe@huawei.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
