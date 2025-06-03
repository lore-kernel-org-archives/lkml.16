Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889967081F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748984391; cv=none; b=jCbBT3MFPIFxvUVy9raZ+4nShgUO3YBhD/QO/DmC2pA4rUaUS2q0KTGA2E4s+QQqriUZQ4ha/nUZkEL6h/zVC+FksOjwwU6K3WdI7GfWfTKj+xOquOaA5KJJVWOFey3Hhihtx0JqJS5U9Udnp1X6d+b+Mq1hyQW4TOLVjxKwWsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748984391; c=relaxed/simple;
	bh=HskaPhgOZtUmrCR0dK7cbyBrVTpX1LUwwk3mr/058yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEviP480NpojqSja96ksh3aMz0/5fww9hFjV8i99sqirOA4+E4O28cC8CISdkHkzyOIBeQKF/g9Cr/q8XF43hoFgelUEAP5l8+q+CgzNV5ine09shXanjWo8ItGKmqHOiq8rc/kQhV81s0c29Nm8kUvKWeY5VoGzctUFGvaw/80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a8VhylAd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RZsHFvqs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a8VhylAd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RZsHFvqs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a8VhylAd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RZsHFvqs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a8VhylAd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RZsHFvqs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5322F21C25;
	Tue,  3 Jun 2025 20:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748984387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbh/wSI18MgZkL0lNSZSfVY7UbYTbmhbITCCvYgLRSk=;
	b=a8VhylAd/iR4bokazEEmD2YvoNRPwofTT94bxIw3DM5XpP2Tojo6GsaSnZ/kQwdAIik83Z
	X/iTZPZDbClKOlSGLFYcWNnJ+TfZQXPznvqE0fHi9umjSSx7vv9ChYg8zWVwhfUO6lbF6n
	ynDFUe2xvMzNcoi2RSYNDwee+uPruoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748984387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbh/wSI18MgZkL0lNSZSfVY7UbYTbmhbITCCvYgLRSk=;
	b=RZsHFvqsiqbegcvpCXl4VFK3KcYyLW3Fq+NCy2bUCuOMp5BqE1nWeq3NJ9gk6JhdhWUIrX
	yHoYjdHicmf9jZDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=a8VhylAd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RZsHFvqs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748984387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbh/wSI18MgZkL0lNSZSfVY7UbYTbmhbITCCvYgLRSk=;
	b=a8VhylAd/iR4bokazEEmD2YvoNRPwofTT94bxIw3DM5XpP2Tojo6GsaSnZ/kQwdAIik83Z
	X/iTZPZDbClKOlSGLFYcWNnJ+TfZQXPznvqE0fHi9umjSSx7vv9ChYg8zWVwhfUO6lbF6n
	ynDFUe2xvMzNcoi2RSYNDwee+uPruoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748984387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbh/wSI18MgZkL0lNSZSfVY7UbYTbmhbITCCvYgLRSk=;
	b=RZsHFvqsiqbegcvpCXl4VFK3KcYyLW3Fq+NCy2bUCuOMp5BqE1nWeq3NJ9gk6JhdhWUIrX
	yHoYjdHicmf9jZDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78D6D13A1D;
	Tue,  3 Jun 2025 20:59:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tvIpGkJiP2iDGwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 03 Jun 2025 20:59:46 +0000
Date: Tue, 3 Jun 2025 21:59:46 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <hafjpizztpwazia2ubkieavxw375pb3ziwhd7bfq24i4gv5ayn@ah4zz2zy2lhv>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local>
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,kvack.org,vger.kernel.org,oppo.com,oracle.com,redhat.com,suse.cz,google.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5322F21C25
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.01

On Tue, Jun 03, 2025 at 07:43:04PM +0100, Lorenzo Stoakes wrote:
> Hi Barry,
> 
> As promised, I enclose a patch to give a sense of how I think we might
> thread state through this operation.
> 
> There's a todo on the untagged stuff so you can figure that out. This is
> based on the v1 so it might not encompass everything you addressed in the
> v2.
> 
> Passing in madv_behavior to madvise_walk_vmas() twice kinda sucks, I
> _despise_ the void *arg function ptr stuff there added just for the anon
> vma name stuff (ughhh) so might be the only sensible way of threading
> state.
> 
> I don't need any attribution, so please use this patch as you see
> fit/adapt/delete/do whatever with it, just an easier way for me to show the
> idea!
> 
> I did some very basic testing and it seems to work, but nothing deeper.
> 
> Cheers, Lorenzo
> 
> ----8<----
> >From ff4ba0115cb31a0630b6f8c02c68f11b3fb71f7a Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Tue, 3 Jun 2025 18:22:55 +0100
> Subject: [PATCH] mm/madvise: support VMA read locks for MADV_DONTNEED[_LOCKED]
> 
> Refactor the madvise() code to retain state about the locking mode utilised
> for traversing VMAs.
> 
> Then use this mechanism to permit VMA locking to be done later in the
> madvise() logic and also to allow altering of the locking mode to permit
> falling back to an mmap read lock if required.
> 

Just as a quick drive-by comment: I was playing around with using per-vma locks
for GUP and mm_populate a few weeks ago. I never actually finished the work (and I
still plan on getting around doing it Eventually(tm)), but my final concept of an
approach was to simply read-lock every VMA in a range (if that fails, go back
to the mmap_lock).

I *think* it works, and doesn't have the same limitation for single VMAs.

I understand this is a super handwavy suggestion, but I know this discussion has
been happening and I just wanted to get this idea out of obscure IRC logs :)

-- 
Pedro
