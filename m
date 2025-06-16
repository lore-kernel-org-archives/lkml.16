Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339881E89C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750107900; cv=none; b=AlXEqvR0gWx7r2HpzPp9r1zIvS9ZWZ4WTxmBb5QhHRUc12LL4c9XrU2oQEjH04Ra/jbudK2wdKaOeApsNxMowgKhQqVe3Y5SJSgaR6dnHBSJxdKs01SDjgsI+S9ZN3q7Mp0soQF9zgpOH1Ez6L5c0jQsQ2E1zM00n0VnZ4rnmVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750107900; c=relaxed/simple;
	bh=nYaEYN227K6YpIf8VDVu8+1doLEoUJgywiwdWDHeB9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reVla2kaLdCv4r8xBTbuPhldeqZ2+8Zxc4zBgCntkg9GzpYLdZkCC9ISFZ8xuJa7xrICnxWl0GEdOWAE9FvWqve91qLqexdzOrF9bEZ2xn8fN9DPkREGT+3bIO9J9qoFf5x/KqlicHJDiXdhAJnfunRoVFMcKddyy0GgSemgMwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p8DGSqsc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1N7koLaV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p8DGSqsc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1N7koLaV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p8DGSqsc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1N7koLaV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p8DGSqsc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1N7koLaV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 49E1D211F3;
	Mon, 16 Jun 2025 21:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750107896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdDbZrzcL9G0bDigJineNhZ4KLiEbQRq0D0ScXGgqEM=;
	b=p8DGSqsc2CftckQ2nvzSWoOQLibQLlL3wwFOr8nKvXRZ3VNV0tfEOhuuiopXojaUrFJ7G3
	hftFc/Vlt+SbWMDdc4pzi1BO2ZP0Q36Q/EG31t1cMByO5n/GuKBPbrJk4huVhzH8jILUP9
	czAtB91OCqXpcyKHc7BcDyXuJgv+XKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750107896;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdDbZrzcL9G0bDigJineNhZ4KLiEbQRq0D0ScXGgqEM=;
	b=1N7koLaVg2jRSmZIrGjqYIcqCa3lpxVPQg7HxhBIMZYWM1niJDis3q8d4qcKHFhggCFGAw
	YV4kHDP0rs2OgGBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750107896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdDbZrzcL9G0bDigJineNhZ4KLiEbQRq0D0ScXGgqEM=;
	b=p8DGSqsc2CftckQ2nvzSWoOQLibQLlL3wwFOr8nKvXRZ3VNV0tfEOhuuiopXojaUrFJ7G3
	hftFc/Vlt+SbWMDdc4pzi1BO2ZP0Q36Q/EG31t1cMByO5n/GuKBPbrJk4huVhzH8jILUP9
	czAtB91OCqXpcyKHc7BcDyXuJgv+XKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750107896;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdDbZrzcL9G0bDigJineNhZ4KLiEbQRq0D0ScXGgqEM=;
	b=1N7koLaVg2jRSmZIrGjqYIcqCa3lpxVPQg7HxhBIMZYWM1niJDis3q8d4qcKHFhggCFGAw
	YV4kHDP0rs2OgGBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D5AF139E2;
	Mon, 16 Jun 2025 21:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ci3LIveGUGhSQQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 16 Jun 2025 21:04:55 +0000
Date: Mon, 16 Jun 2025 22:04:54 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	David Hildenbrand <david@redhat.com>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH] MAINTAINERS: add additional mmap-related files to mmap
 section
Message-ID: <sskcpsimubcpf6uq5dtoiklp23ese3psxgl75r75saxwqpvxgw@m5cf2kfxgqav>
References: <20250616203503.565448-1-lorenzo.stoakes@oracle.com>
 <cxwmebrnmrhnlzk4n4w5r5zlv5jwzsqfejgmsqup5fljg6jeee@vo377ihsh76r>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cxwmebrnmrhnlzk4n4w5r5zlv5jwzsqfejgmsqup5fljg6jeee@vo377ihsh76r>
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-mm.org:url,kvack.org:email,oracle.com:email]
X-Spam-Level: 

(adding a few people on CC)

On Mon, Jun 16, 2025 at 09:49:52PM +0100, Pedro Falcato wrote:
> On Mon, Jun 16, 2025 at 09:35:03PM +0100, Lorenzo Stoakes wrote:
> > msync and nommu are directly related to memory mapping, memfd and mincore
> > are less so but are roughly speaking operating on virtual memory mappings
> > from the point of view of the user so this seems the most appropriate place
> > for them.
> > 
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  MAINTAINERS | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4523a6409186..a5d1ff923a62 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15735,7 +15735,6 @@ F:	Documentation/admin-guide/mm/
> >  F:	Documentation/mm/
> >  F:	include/linux/gfp.h
> >  F:	include/linux/gfp_types.h
> > -F:	include/linux/memfd.h
> >  F:	include/linux/memory_hotplug.h
> >  F:	include/linux/memory-tiers.h
> >  F:	include/linux/mempolicy.h
> > @@ -15974,12 +15973,17 @@ L:	linux-mm@kvack.org
> >  S:	Maintained
> >  W:	http://www.linux-mm.org
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > +F:	include/linux/memfd.h
> >  F:	include/trace/events/mmap.h
> > +F:	mm/memfd.c
> 
> memfd is a big stretch, no? I think it would feel more at home with shmem, or even VFS people. 
> 
> > +F:	mm/mincore.c
> >  F:	mm/mlock.c
> >  F:	mm/mmap.c
> >  F:	mm/mprotect.c
> >  F:	mm/mremap.c
> >  F:	mm/mseal.c
> > +F:	mm/msync.c
> > +F:	mm/nommu.c
> >  F:	mm/vma.c
> >  F:	mm/vma.h
> >  F:	mm/vma_exec.c
> 
> the rest obviously LGTM.
> 

This reminds me: now that we're at it, could we cross-own madvise.c? Now that
we know it can be done. It's the only mmap-related syscall (i think?) we're
missing.

Also possibly mmap_lock.c.

-- 
Pedro
