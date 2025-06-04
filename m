Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7895A13AD1C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749040689; cv=none; b=BMAPLfqgwjxnr7RaP6x9tlem05VXaGEQMED/+1NaYitPwUERpZ4/w/ploU/SI6erYTTYmbuh4htplLwAMx4sKZynqnLwcsmmkonJMpKkrb6SmOC/PGbWIaSGjFf3r9DY3ddnEP5FRkajI0psGqX/lbtSS1XtGRt8BxVlobum76Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749040689; c=relaxed/simple;
	bh=7uNXIwV/i1nPAy/jNobUr42qsAtwGK0nGFPoE7RIFZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHCh3KS2/ogSGToC7W6BlvzMf8fXszXfCk/aG/Kj6R9M5wSMxf2gJo+kISIr3I9sAwj2+nF7HNFg8Zlqq0RrKajAEq7OJ77+UojM0l+OPfrP1uptx3KidpB3KFwWzYwTUCeRl7AsEviD9hEhvXvzO5lnFsdxAKlaH9d9U/J+Y9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2PCQSYk1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e2Iho95T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2PCQSYk1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e2Iho95T; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2PCQSYk1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e2Iho95T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2PCQSYk1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e2Iho95T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8569A21170;
	Wed,  4 Jun 2025 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749040685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sK4fJiQQfbJ0KUB/pSNHrTq2CqbwKDdWTRAtN+ykQpA=;
	b=2PCQSYk1LNb4l1OOxs1xP5+n7ldYg4wxBW1dAXAU+3OS0O2EmleGpgnTxuJ+bxMibjDhv/
	xHpQW09cr1Vni0yzpse18LqWze9w1lXNYfZDJEmA2X04UTKEIiGl7EK8yPcYkc0+wbD6lQ
	Dg6eVYaNI6Dec3G33SPq9lH90i4gf8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749040685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sK4fJiQQfbJ0KUB/pSNHrTq2CqbwKDdWTRAtN+ykQpA=;
	b=e2Iho95T/pGji/VS2o+oHEEtFSYBe9KEQFwfJn9Q85g6hpg+hSscz7klso4Q7oPd0El25+
	+iOMKu1EvJx6VuDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2PCQSYk1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=e2Iho95T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749040685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sK4fJiQQfbJ0KUB/pSNHrTq2CqbwKDdWTRAtN+ykQpA=;
	b=2PCQSYk1LNb4l1OOxs1xP5+n7ldYg4wxBW1dAXAU+3OS0O2EmleGpgnTxuJ+bxMibjDhv/
	xHpQW09cr1Vni0yzpse18LqWze9w1lXNYfZDJEmA2X04UTKEIiGl7EK8yPcYkc0+wbD6lQ
	Dg6eVYaNI6Dec3G33SPq9lH90i4gf8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749040685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sK4fJiQQfbJ0KUB/pSNHrTq2CqbwKDdWTRAtN+ykQpA=;
	b=e2Iho95T/pGji/VS2o+oHEEtFSYBe9KEQFwfJn9Q85g6hpg+hSscz7klso4Q7oPd0El25+
	+iOMKu1EvJx6VuDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF70F13A63;
	Wed,  4 Jun 2025 12:38:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K6e8Nyw+QGjuUQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 04 Jun 2025 12:38:04 +0000
Date: Wed, 4 Jun 2025 14:38:03 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mm,memory_hotplug: Implement numa node notifier
Message-ID: <aEA-K3hTvhtdUxuA@localhost.localdomain>
References: <20250603110850.192912-1-osalvador@suse.de>
 <20250603110850.192912-3-osalvador@suse.de>
 <ddcdd8b9-566c-4f6c-b1f7-861e93a80fbb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddcdd8b9-566c-4f6c-b1f7-861e93a80fbb@redhat.com>
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8569A21170
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

On Wed, Jun 04, 2025 at 02:03:23PM +0200, David Hildenbrand wrote:
> > diff --git a/include/linux/memory.h b/include/linux/memory.h
> > index 5ec4e6d209b9..8c5c88eaffb3 100644
> > --- a/include/linux/memory.h
> > +++ b/include/linux/memory.h
> > @@ -99,6 +99,14 @@ int set_memory_block_size_order(unsigned int order);
> >   #define	MEM_PREPARE_ONLINE	(1<<6)
> >   #define	MEM_FINISH_OFFLINE	(1<<7)
> > +/* These states are used for numa node notifiers */
> > +#define NODE_BECOMING_MEM_AWARE		(1<<0)
> > +#define NODE_BECAME_MEM_AWARE		(1<<1)
> > +#define NODE_BECOMING_MEMORYLESS	(1<<2)
> > +#define NODE_BECAME_MEMORYLESS		(1<<3)
> > +#define NODE_CANCEL_MEM_AWARE		(1<<4)
> > +#define NODE_CANCEL_MEMORYLESS		(1<<5)
> 
> Very nitpicky: MEM vs. MEMORY inconsistency. Also, I am not sure about
> "MEMORYLESS vs. MEMORY AWARE" terminology (opposite of aware is not less)
> and "BECOMING" vs. "CANCEL" ...

Heh, that is why I'm not in the marketing field :-)

> There must be something better ... but what is it. :)
> 
> NODE_ADDING_FIRST_MEMORY
> NODE_ADDED_FIRST_MEMORY
> NODE_CANCEL_ADDING_FIRST_MEMORY
> 
> NODE_REMOVING_LAST_MEMORY
> NODE_REMOVED_LAST_MEMORY
> NODE_CANCEL_REMOVING_LAST_MEMORY
> 
> Maybe something like that? I still don't quite like the "CANCEL" stuff.
> 
> NODE_ADDING_FIRST_MEMORY
> NODE_ADDED_FIRST_MEMORY
> NODE_NOT_ADDED_FIRST_MEMORY
> 
> NODE_REMOVING_LAST_MEMORY
> NODE_REMOVED_LAST_MEMORY
> NODE_NOT_REMOVED_LAST_MEMORY

If I were to pick one, I'd go with NODE_ADDING_FIRST_MEMORY/NODE_REMOVING_LAST_MEMORY.
I think those make it easier to grasp.


> Hm ...
> 
> > +
> >   struct memory_notify {
> >   	/*
> >   	 * The altmap_start_pfn and altmap_nr_pages fields are designated for
> > @@ -109,7 +117,10 @@ struct memory_notify {
> >   	unsigned long altmap_nr_pages;
> >   	unsigned long start_pfn;
> >   	unsigned long nr_pages;
> > -	int status_change_nid_normal;
> > +	int status_change_nid;
> > +};
> 
> Could/should that be a separate patch after patch #1 removed the last user?
> 
> Also, I think the sequence should be (this patch is getting hard to review
> for me due to the size):
> 
> #1 existing patch 1
> #2 remove status_change_nid_normal
> #3 introduce node notifier
> #4-#X: convert individual users to node notifier
> #X+1: change status_change_nid to always just indicate the nid, renaming
>       it on the way (incl current patch #3)

When you say #4-#X, you mean a separate patch per converting user?
So, one for memtier, one for cxl, one for hmat, etc.?


> > +
> > +struct node_notify {
> >   	int status_change_nid;
> 
> This should be called "nid" right from the start.

Copy that.

> > @@ -157,15 +168,34 @@ static inline unsigned long memory_block_advised_max_size(void)
> >   {
> >   	return 0;
> >   }
> > +
> 
> [...]
> 
> >   	 * {on,off}lining is constrained to full memory sections (or more
> > @@ -1194,11 +1172,22 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
> >   	/* associate pfn range with the zone */
> >   	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
> > -	arg.start_pfn = pfn;
> > -	arg.nr_pages = nr_pages;
> > -	node_states_check_changes_online(nr_pages, zone, &arg);
> > +	node_arg.status_change_nid = NUMA_NO_NODE;
> > +	if (!node_state(nid, N_MEMORY)) {
> > +		/* Node is becoming memory aware. Notify consumers */
> > +		cancel_node_notifier_on_err = true;
> > +		node_arg.status_change_nid = nid;
> > +		ret = node_notify(NODE_BECOMING_MEM_AWARE, &node_arg);
> > +		ret = notifier_to_errno(ret);
> > +		if (ret)
> > +			goto failed_addition;
> > +	}
> 
> I assume without NUMA, that code would never trigger? I mean, the whole
> notifier doesn't make sense without CONFIG_NUMA :)

So, glad you asked because it forced me to look again.
And I think we might have some divergences there, so I will sort it out
in the next respin.

Thanks for the feedback ;-)


-- 
Oscar Salvador
SUSE Labs
