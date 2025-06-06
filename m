Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BE0288508
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212936; cv=none; b=qFYQryX3kmiyMO70Lh6nKsmveDhR1uQVwHAQiyZAGIy3jAHDe8lhyZyfsDpeDzFRoLYFioZdUpVp5zGcBhRcsx/aUFVqn8AKzE5l6cq8i7Mbcbzdn8B3BtFJDgjXE46mqPPgDgGhMkROEakOU1iS1Gab5qBo0PU8W0esfB96Sbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212936; c=relaxed/simple;
	bh=VdugDXsJC+MySYLUkZ+jaVZRS+xfYRsyvBkvIOugRw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUf0KIKxn23h5Wkr2z66x5WqIzPtJj+7Ca6xFIZbvLVzARwZ4t/Khr558s8nqMwZYHsMOugk4sin1d15U8iNMVEKaexepX28A6wsi7ps2QzbQ6cDkx62rOWQp2dcZ9K8UZR2Lqi4S7fqzQ40q1nAjSekyKyPkNmzkOlbJxmtRG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m0Tqyx7l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TupEVE61; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m0Tqyx7l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TupEVE61; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m0Tqyx7l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TupEVE61";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m0Tqyx7l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TupEVE61"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7123321114;
	Fri,  6 Jun 2025 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749212932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqICevuKoP0IJLpCka+29EYHI1p+jaoZS/6X28IIxdU=;
	b=m0Tqyx7lrrlQgV4nYGpP1zIy5aYr8pdM7BZbJIMBFDW/0ldzBITpicmeCTtoT+wULeWu94
	LsjTCIfhAF6/IzKqHC5OFGDdeDnSO7qdUCPH04DBgzukifaXTrB4Lyun7eOb3Cf3twLSlU
	FM+l/7mya7GOStvYJkxM4HwHwov9eqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749212932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqICevuKoP0IJLpCka+29EYHI1p+jaoZS/6X28IIxdU=;
	b=TupEVE61L1YpQIEe5C8YHYMwU4SKGD6E0FgkwkiMdTnKNF9+1eDiAjv9oZMVAl6R71fumJ
	noODCVmyuCdo7jAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749212932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqICevuKoP0IJLpCka+29EYHI1p+jaoZS/6X28IIxdU=;
	b=m0Tqyx7lrrlQgV4nYGpP1zIy5aYr8pdM7BZbJIMBFDW/0ldzBITpicmeCTtoT+wULeWu94
	LsjTCIfhAF6/IzKqHC5OFGDdeDnSO7qdUCPH04DBgzukifaXTrB4Lyun7eOb3Cf3twLSlU
	FM+l/7mya7GOStvYJkxM4HwHwov9eqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749212932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqICevuKoP0IJLpCka+29EYHI1p+jaoZS/6X28IIxdU=;
	b=TupEVE61L1YpQIEe5C8YHYMwU4SKGD6E0FgkwkiMdTnKNF9+1eDiAjv9oZMVAl6R71fumJ
	noODCVmyuCdo7jAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E11E31369F;
	Fri,  6 Jun 2025 12:28:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ei86NAPfQmicYwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 06 Jun 2025 12:28:51 +0000
Date: Fri, 6 Jun 2025 14:28:50 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/10] mm,slub: Use node-notifier instead of
 memory-notifier
Message-ID: <aELfAo3RgIU0CV-5@localhost.localdomain>
References: <20250605142305.244465-1-osalvador@suse.de>
 <20250605142305.244465-5-osalvador@suse.de>
 <0ca963af-8dc9-4cb4-9142-04497c359b81@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ca963af-8dc9-4cb4-9142-04497c359b81@redhat.com>
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Fri, Jun 06, 2025 at 01:56:15PM +0200, David Hildenbrand wrote:
> > @@ -6217,15 +6217,12 @@ static int slab_memory_callback(struct notifier_block *self,
> >   	int ret = 0;
> >   	switch (action) {
> > -	case MEM_GOING_ONLINE:
> > +	case NODE_ADDING_FIRST_MEMORY:
> >   		ret = slab_mem_going_online_callback(arg);
> 
> In slab_mem_going_online_callback we will cast arg to "struct
> memory_notify", no?

Uhm... not sure if I understood this correctly but slab_mem_going_online_callback looks
like this:

 static int slab_mem_going_online_callback(void *arg)
 {
         struct kmem_cache_node *n;
         struct kmem_cache *s;
         struct node_notify *narg = arg;
         int nid = narg->nid;
         int ret = 0;



> Probably needs to get fixed.
> 
> ... and probably best to pass marg directly.

You mean to cast it directly in slab_memory_callback and pass 'narg'
to slab_mem_going_online_callback?


> >   		break;
> > -	case MEM_GOING_OFFLINE:
> > +	case NODE_REMOVING_LAST_MEMORY:
> >   		ret = slab_mem_going_offline_callback(arg);
> 
> slab_mem_going_offline_callback() doesn't even look at arg, so likely we can
> drop that parameter?

Sure.

Thanks for the feedback!

 

-- 
Oscar Salvador
SUSE Labs
