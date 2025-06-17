Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E6421CC74
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750149270; cv=none; b=YPgoiaWMRhFlcEKYXmUG36MROa2+1YzEdOldt4/kjvipsb0LS9ORt3gZG1J4B1YHF8JaZyIitw8B6LfTvyvBkgHaJcS7qy8n1OuH3W0Ley3fPBgh0vql693m/sc5HGNJ3mabGi/MBsEqlytlAbUnPYujthIQnUaVQa9sz6slbnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750149270; c=relaxed/simple;
	bh=HKuVTkLlbcd22QZ6jrcw+nJehTlQ9kuyAcXyeQUszpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXbsmH7VtS4YjMyXu1YcDhEBdHCysVdcagf232YR7q6Ce8jVoEsmtqR7TRtOi5shlEZwBiRNcNH8clppzYfptNtXbogzxEvH9psiTAdwUFhYrPF4vf496/LiGOeu07SrTL36gdB+QGNBXpTG5cSxVnXnO9OBihYetA44ec5rqOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0ck4Q/F5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=miTE9ltY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L514i8N4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v80wN1rX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0ck4Q/F5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="miTE9ltY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L514i8N4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v80wN1rX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 56E1021167;
	Tue, 17 Jun 2025 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750149260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v0mmCPaQMbEkfA0unyPUw+wVSwuzYmJHSzmnf7b3Waw=;
	b=0ck4Q/F5ZFfM2le3kVL2BqSEcBlDDcCkIgWkX0D2CBSgYPn9EYqqNmxYo/rZAknwkqfEbq
	UE/ikKMxG9wKe0B6ySxcTWjgq4xv01TAmZegoR+rX8r3mpj6dBhNVSbMgcLdgYI8HYvpui
	gKnPfwttS2MTquYgu+sFJkQ6lL6a8UE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750149260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v0mmCPaQMbEkfA0unyPUw+wVSwuzYmJHSzmnf7b3Waw=;
	b=miTE9ltYQi8gGJMaTYGsZvvp5rsT+Pzx4criIUSHgXc9+NXmj/sdLQ2PPt+OuvawRlbu0E
	ywYaVpAitj/FDKAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=L514i8N4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=v80wN1rX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750149259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v0mmCPaQMbEkfA0unyPUw+wVSwuzYmJHSzmnf7b3Waw=;
	b=L514i8N4Z4wNUpFToMOgORvlG42pQYMuCHyywo56QjI4y8wYz0HSkxJvVrkD9htynUj2ky
	5DH5hceCPedSMsVr/jPnAnppjPT+55PLNT7AYePNIGPyTC08QXXOTchNqKwF4PSTcHKZAT
	OjHYMwSeroaqvJnMON/+vgY+SxdTapQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750149259;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v0mmCPaQMbEkfA0unyPUw+wVSwuzYmJHSzmnf7b3Waw=;
	b=v80wN1rX3wmQrONkQFz1I5pl/eEECWCojk/RcqJzteRBBbAaz5sv/5ZJiPBTL5+g2E6nZJ
	i9MhAn9DdXKk9YCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A64013A69;
	Tue, 17 Jun 2025 08:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Vm0xB4ooUWgHeQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 17 Jun 2025 08:34:18 +0000
Date: Tue, 17 Jun 2025 09:34:16 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Jakub Matena <matenajakub@gmail.com>, Wei Yang <richard.weiyang@gmail.com>, 
	Barry Song <baohua@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <76zi626uk53dtfzmezzt6cfz45ansam2gpcumddqxnipnw5jkh@qwfzoxgi255b>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
 <b65dd020-5e02-4863-8994-def576e3d3dd@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b65dd020-5e02-4863-8994-def576e3d3dd@redhat.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 56E1021167
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[oracle.com,linux-foundation.org,suse.cz,google.com,infradead.org,surriel.com,nvidia.com,linux.alibaba.com,redhat.com,arm.com,gmail.com,kernel.org,kvack.org,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.51
X-Spam-Level: 

On Mon, Jun 16, 2025 at 10:41:20PM +0200, David Hildenbrand wrote:
> On 16.06.25 22:24, David Hildenbrand wrote:
> > Hi Lorenzo,
> > 
> > as discussed offline, there is a lot going on an this is rather ... a
> > lot of code+complexity for something that is more a corner cases. :)
> > 
> > Corner-case as in: only select user space will benefit from this, which
> > is really a shame.
> > 
> > After your presentation at LSF/MM, I thought about this further, and I
> > was wondering whether:
> > 
> > (a) We cannot make this semi-automatic, avoiding flags.
> > 
> > (b) We cannot simplify further by limiting it to the common+easy cases
> > first.
> > 
> > I think you already to some degree did b) as part of this non-RFC, which
> > is great.
> > 
> > 
> > So before digging into the details, let's discuss the high level problem
> > briefly.
> > 
> > I think there are three parts to it:
> > 
> > (1) Detecting whether it is safe to adjust the folio->index (small
> >       folios)
> > 
> > (2) Performance implications of doing so
> > 
> > (3) Detecting whether it is safe to adjust the folio->index (large PTE-
> >       mapped  folios)
> > 
> > 
> > Regarding (1), if we simply track whether a folio was ever used for
> > COW-sharing, it would be very easy: and not only for present folios, but
> > for any anon folios that are referenced by swap/migration entries.
> > Skimming over patch #1, I think you apply a similar logic, which is good.
> > 
> > Regarding (2), it would apply when we mremap() anon VMAs and they happen
> > to reside next to other anon VMAs. Which workloads are we concerned
> > about harming by implementing this optimization? I recall that the most
> > common use case for mremap() is actually for file mappings, but I might

realloc() for mmapped allocations commonly calls mremap(), FYI (at least for
glibc, and musl; can't bother to look at the rest).

> > be wrong. In any case, we could just have a different way to enable this
> > optimization than for each and every mremap() invocation in a process.

/me thinks of prctl

:P


FWIW, with regards to the whole feature: While I do understand it's purpose (
relocating anon might be too much for most workloads, but great for some), I'm
uncomfortable with the amount of internals we're exposing here. Who's to say
this is how mm rmap looks in 20 years? And we're stuck maintaining the userspace
ABI until then.

Personally, I would prefer if we just had a flag 'MREMAP_HARDER' that would
vaguely be documented as "mremap but harder, even if have to do a little more
work". Then we could move things around without promising RELOCATE_ANON makes
conceptual sense, and userspace wouldn't have to think through the implications
of such a flag by reading Lorenzo's great book.

-- 
Pedro
