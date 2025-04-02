Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0E833993
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743613073; cv=none; b=AZuMNvWSg9VWHdj/EzvY3Ucs7q3JBpBigllchzoBoX9bdlernjB06hnrVX6i9UxqK4GHIi2nu/bJ2vG8R5f/aSnRRiR+rhW+7kra0vyunWCDJZxwsp5SBRthQWUsAjBQoyBN8knp1uCBqn54riMwfOBoH9zwz5m1SOncSLgClwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743613073; c=relaxed/simple;
	bh=JtkhWY8oep2L3lCWXuKdjzcoHGjfQ4f666mfDDlbMrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wt/1acOSCxZvpLRiPvR6asgrpeQYpOojzDI5Keqvg5g7t78z/ms7/Xuurn7huQCMyHWl3W41mdkTMa/SAlR1+wwyP+myvUZK7UiaIYZUZYOK92xB3qFzGRFtvpCSzEjuka0Mm/RE/PTaSPOYhDA79xNPM6bwo4/wdLVklJCLbEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CTPID6ph; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HbLBLcMN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CTPID6ph; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HbLBLcMN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CTPID6ph";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HbLBLcMN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CTPID6ph";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HbLBLcMN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 249D82116B;
	Wed,  2 Apr 2025 16:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743613069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RL4hdWDVJm0RZEPEN+8GKW+oid18vTX/PiiZ3tkNRhg=;
	b=CTPID6phM97SkeGz1qsxPBRUTzjF/1+SOv1ya1RUf0hp4UT5uM6VtEDSWRobFjKF+3hg7B
	pkuFF01pzA0F/LNs60+AWpIxF0vfVYwUlDyz0MF1q8dFJ529vUfZa7zRUaygDnkn9p283x
	v+lF937X88dhjsfUaNP3yxhtXpEHAGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743613069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RL4hdWDVJm0RZEPEN+8GKW+oid18vTX/PiiZ3tkNRhg=;
	b=HbLBLcMNDlmGliVd6d8o/sSR+aveZg+5dKAQ5EwYaf80GzjghSGRRYtM6hslagU0OhmlHd
	pVE3s9ZNVgpMTgCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CTPID6ph;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HbLBLcMN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743613069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RL4hdWDVJm0RZEPEN+8GKW+oid18vTX/PiiZ3tkNRhg=;
	b=CTPID6phM97SkeGz1qsxPBRUTzjF/1+SOv1ya1RUf0hp4UT5uM6VtEDSWRobFjKF+3hg7B
	pkuFF01pzA0F/LNs60+AWpIxF0vfVYwUlDyz0MF1q8dFJ529vUfZa7zRUaygDnkn9p283x
	v+lF937X88dhjsfUaNP3yxhtXpEHAGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743613069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RL4hdWDVJm0RZEPEN+8GKW+oid18vTX/PiiZ3tkNRhg=;
	b=HbLBLcMNDlmGliVd6d8o/sSR+aveZg+5dKAQ5EwYaf80GzjghSGRRYtM6hslagU0OhmlHd
	pVE3s9ZNVgpMTgCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92E1F137D4;
	Wed,  2 Apr 2025 16:57:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AiqKIIxs7WerXQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 02 Apr 2025 16:57:48 +0000
Date: Wed, 2 Apr 2025 18:57:42 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	mkoutny@suse.com, Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 1/2] mm,memory_hotplug: Implement numa node notifier
Message-ID: <Z-1shl4h4fpfKyxb@localhost.localdomain>
References: <20250401092716.537512-1-osalvador@suse.de>
 <20250401092716.537512-2-osalvador@suse.de>
 <4e122668-6f6a-4874-85df-e6869b9ccb24@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e122668-6f6a-4874-85df-e6869b9ccb24@suse.cz>
X-Rspamd-Queue-Id: 249D82116B
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
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,redhat.com,kvack.org,vger.kernel.org,gmail.com,suse.com,intel.com,huawei.com];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,localhost.localdomain:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, Apr 02, 2025 at 06:03:04PM +0200, Vlastimil Babka wrote:
> On 4/1/25 11:27, Oscar Salvador wrote:
> > -	arg.start_pfn = pfn;
> > -	arg.nr_pages = nr_pages;
> > -	node_states_check_changes_online(nr_pages, zone, &arg);
> > +	mem_arg.start_pfn = pfn;
> > +	mem_arg.nr_pages = nr_pages;
> > +	node_states_check_changes_online(nr_pages, zone, &node_arg);
> >  
> > -	ret = memory_notify(MEM_GOING_ONLINE, &arg);
> > +	if (node_arg.status_change_nid >= 0) {
> 
> Hmm, don't we need to add "|| node_arg.status_change_nid_normal >= 0"? Or we
> fail to notify addition of normal memory to a node that already has !normal
> memory?

Ah, I think you are right, nice catch.
Yes, if we add normal (<= ZONE_NORMAL) memory to a node that only has ZONE_MOVABLE,
status_change_nid_normal will change, but status_change_nid will not.

So yes, we need a "|| node_arg.status_change_nid_normal >= 0".

> > -	memory_notify(MEM_CANCEL_ONLINE, &arg);
> > +	if (cancel_node_notifier_on_err)
> > +		node_notify(NODE_CANCEL_MEM_AWARE, &node_arg);
> > +	if (cancel_mem_notifier_on_err)
> > +		memory_notify(MEM_CANCEL_ONLINE, &mem_arg);
> 
> Switch the order of those just for symmetry? :)

Will do.

> > -	arg.start_pfn = start_pfn;
> > -	arg.nr_pages = nr_pages;
> > -	node_states_check_changes_offline(nr_pages, zone, &arg);
> > +	mem_arg.start_pfn = start_pfn;
> > +	mem_arg.nr_pages = nr_pages;
> > +	node_states_check_changes_offline(nr_pages, zone, &node_arg);
> > +
> > +	if (node_arg.status_change_nid >= 0) {
> 
> Ditto.

Yap.

> >  failed_removal_isolated:
> >  	/* pushback to free area */
> >  	undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
> > -	memory_notify(MEM_CANCEL_OFFLINE, &arg);
> > +	if (cancel_node_notifier_on_err)
> > +		node_notify(NODE_CANCEL_MEMORYLESS, &node_arg);
> > +	if (cancel_mem_notifier_on_err)
> > +		memory_notify(MEM_CANCEL_OFFLINE, &mem_arg);
> 
> Ditto.

Copy that.

Thanks Vlastimil!

-- 
Oscar Salvador
SUSE Labs
