Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5989428033F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542582; cv=none; b=H5mMtQt0BiMf5rW6EwQYTogD0GTzhatu6wwkg0gKiRZREq6uvMkqVDUHyrPLp+BYyB5PbpWkC1tnuBfIjEZsXFuJDu/QURdBEjpDO8PQ652lTsJvUfIxlP3o6vn4x0mOnWbls4aFXiNfxRkKRlTCYE3u95maDetLmKDVDybPosM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542582; c=relaxed/simple;
	bh=KUFcHbVB19GrehSgQ4J9fIgC/c8Eov0/fRmHxoEE3E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQqhT0qvm9uZJtmV9qvYKXqO/41MtZuwWlIytcFTnF1RbLqOEdfA5X1nQNqeZ+KRVt+CpvtgPhjpQGc/7Wf/tTNvsXkDVB+yxj+OgSvKgw4qJ8BD20S7Y13zWrhB+b+/OtpoKyH1+MJhWOMPwjbI8PSxlO4GPyXBiHbtzqB7Bwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dJp4aQou; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/YTlastB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dJp4aQou; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/YTlastB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dJp4aQou";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/YTlastB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dJp4aQou";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/YTlastB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 666B02118A;
	Tue, 10 Jun 2025 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749542578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7O/Y7vxGEJ8azXIqfy5bhZNskz1ZctXO2NByaQBrfMA=;
	b=dJp4aQoukHMXwmzqTgAr3LBn6k0Sai3WyC6l/KXL3By+5cUsBaDeKdgA7LZlvxScmGYNpg
	sYbvwpDYKLPzTxNGeYxHz6tPfLOoqjBXT6AghNH+16DLOFhB6rrlNutixb0cfAXXbSN4cq
	OR8GjMFVYS3rkpeBRlTmwSXHZal89ws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749542578;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7O/Y7vxGEJ8azXIqfy5bhZNskz1ZctXO2NByaQBrfMA=;
	b=/YTlastBYkqNpOwhysEkxURyq+2W0V7QeYwIokXBXvGKdrlNJadvd++wvPdU4Wmvje+59c
	7bS57L4+EPa13/Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749542578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7O/Y7vxGEJ8azXIqfy5bhZNskz1ZctXO2NByaQBrfMA=;
	b=dJp4aQoukHMXwmzqTgAr3LBn6k0Sai3WyC6l/KXL3By+5cUsBaDeKdgA7LZlvxScmGYNpg
	sYbvwpDYKLPzTxNGeYxHz6tPfLOoqjBXT6AghNH+16DLOFhB6rrlNutixb0cfAXXbSN4cq
	OR8GjMFVYS3rkpeBRlTmwSXHZal89ws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749542578;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7O/Y7vxGEJ8azXIqfy5bhZNskz1ZctXO2NByaQBrfMA=;
	b=/YTlastBYkqNpOwhysEkxURyq+2W0V7QeYwIokXBXvGKdrlNJadvd++wvPdU4Wmvje+59c
	7bS57L4+EPa13/Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4216139E2;
	Tue, 10 Jun 2025 08:02:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id t1MoMbHmR2hzDwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 10 Jun 2025 08:02:57 +0000
Date: Tue, 10 Jun 2025 10:02:56 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/10] mm,memory_hotplug: Drop status_change_nid
 parameter from memory_notify
Message-ID: <aEfmsMSojARgm7FT@localhost.localdomain>
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-11-osalvador@suse.de>
 <f5eb2eb8-4eb7-4697-afc7-bd4a32785415@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5eb2eb8-4eb7-4697-afc7-bd4a32785415@redhat.com>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

On Tue, Jun 10, 2025 at 09:55:27AM +0200, David Hildenbrand wrote:
> > --- a/mm/page_ext.c
> > +++ b/mm/page_ext.c
> > @@ -369,25 +369,15 @@ static void __invalidate_page_ext(unsigned long pfn)
> >   }
> >   static int __meminit online_page_ext(unsigned long start_pfn,
> > -				unsigned long nr_pages,
> > -				int nid)
> > +				unsigned long nr_pages)
> >   {
> >   	unsigned long start, end, pfn;
> >   	int fail = 0;
> > +	int nid = pfn_to_nid(start_pfn);
> 
> Nit: Keep reverse xmas tree :)

Boh, I tend to, I guess this one slipped through the cracks :-(

> > @@ -436,7 +426,7 @@ static int __meminit page_ext_callback(struct notifier_block *self,
> >   	switch (action) {
> >   	case MEM_GOING_ONLINE:
> >   		ret = online_page_ext(mn->start_pfn,
> > -				   mn->nr_pages, mn->status_change_nid);
> > +				   mn->nr_pages);
> >   		break;
> >   	case MEM_OFFLINE:
> >   		offline_page_ext(mn->start_pfn,
> 
> I would have moved the page_ext stuff into a separate patch, including
> documenting why that is fine (e.g., memmap initialized before GOING_ONLINE
> call).

I guess I misunderstood you during the previous feedback.
I mean, there is no hurry so I can do another respin and split page_ext
stuff from this one if you think that is worth and will add clarity.

> Acked-by: David Hildenbrand <david@redhat.com>

thanks man!

 

-- 
Oscar Salvador
SUSE Labs
