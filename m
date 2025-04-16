Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0074220681
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789577; cv=none; b=SNYz+bR0M1QjYP5rWVbwh1qzs9LxnKF5AX5K1H0w4nJrRzbiVOEm+rDkqFp4Ylrf9zCUBsVzok7KJZI202/tYcy/ExUqpMmwL0Kig85L2aH3hJXwxVI4EAO1k39OunQ87OpOoDhB/9TDgpTCIkAiB09+OtbVjz65J3D44U+2Dlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789577; c=relaxed/simple;
	bh=VOcMqzMdMh9rCFIRtQ9EKg+I7M7b/mTUi/Sqo809uuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4MoMVCt5OSMDzlxJ88A5QblHi4OGz892bW+/rpG224TnV09SJ89jE8vMkgV74sea9tXSWViIn651C8/ZUDNYJwAcaGFv8uuRm0cmgE4ZBzA8g7yTmwrVr3WFBGG0Or8jAOhpIoljh3k5Dufym7j+vWnQAkqIEQxbFCOKyFcd6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qWyiueii; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vKhkAg2H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DKWK4vcs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Te7u7FZq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qWyiueii";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vKhkAg2H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DKWK4vcs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Te7u7FZq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E14561F445;
	Wed, 16 Apr 2025 07:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744789574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R73xuxwY1VYBD1D6OPjf8S0w7H765xR6uCfIjbAaInk=;
	b=qWyiueii58M4ZoeYnM6SQnt5xhhYcSXVQ8QsBqRaev4HtSmJ3vx6d04H/BcM1MedQBJoKO
	ICQW6UdVx8cqjb17/GVVqp9hafsRIB1mLAbUYGSxQ2hIOoUQbbLM1Id4KgJgc/Km5Smafx
	xLEqOybAqWLfhdSLwke5ktIhKHK05ao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744789574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R73xuxwY1VYBD1D6OPjf8S0w7H765xR6uCfIjbAaInk=;
	b=vKhkAg2H4U3CcJskdYGsZrEAOU4dN7/vqbOAzi9YRmihFFSKpcWi7wjz0lOp9Z4fZaYnUR
	RLTz4wRMFU9PUoDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744789573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R73xuxwY1VYBD1D6OPjf8S0w7H765xR6uCfIjbAaInk=;
	b=DKWK4vcsW/AiDoWXMUkn17+m6dbWMR6K2FBZnbHAvKvfQ4OQ/qeBnaOM2uO2/y+d5ek9pe
	KAPsLrJAfmeNZBQQF2o9OCABb6oueuhzFCg6iUovELHNb0YWVnE2/R6fUucMfjBo2a3rkR
	Z+gTKzCE0QdQ7iluZ635S+VWUH6BlkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744789573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R73xuxwY1VYBD1D6OPjf8S0w7H765xR6uCfIjbAaInk=;
	b=Te7u7FZqDoADWsnaOpNR6cVdm+DTCaYxNjOar/AjzI9VMawP0D0qV8ljaPNXtoVkGnVTtH
	eAlf1pYDH81bqmDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B9DD139A1;
	Wed, 16 Apr 2025 07:46:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RwxfG0Vg/2dCUgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 16 Apr 2025 07:46:13 +0000
Date: Wed, 16 Apr 2025 09:46:03 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	syzbot+5e8feb543ca8e12e0ede@syzkaller.appspotmail.com,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v1] mm/memory: move sanity checks in do_wp_page() after
 mapcount vs. refcount stabilization
Message-ID: <Z_9gO5KljRA3Rss8@localhost.localdomain>
References: <20250415095007.569836-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415095007.569836-1-david@redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[5e8feb543ca8e12e0ede];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On Tue, Apr 15, 2025 at 11:50:07AM +0200, David Hildenbrand wrote:
> In __folio_remove_rmap() for RMAP_LEVEL_PMD/RMAP_LEVEL_PUD and with
> CONFIG_PAGE_MAPCOUNT we first decrement the folio mapcount (and
> recompute mapped shared vs. mapped exclusively) to then adjust the
> entire mapcount.
> 
> This means that another process might stumble in do_wp_page() over a
> PTE-mapped PMD folio that is indicated as "exclusively mapped", but still
> has an entire mapcount (PMD mapping), because it is racing with the process
> that is unmapping the folio (PMD mapping). Note that do_wp_page() will
> back off once it detects the remaining folio reference from the process
> that is in the process of unmapping the folio.
> 
> This will trigger the early VM_WARN_ON_ONCE(folio_entire_mapcount(folio))
> check in do_wp_page(), that can easily be reproduced by looping a couple
> of times over allocating a PMD THP, forking a child where we immediately
> unmap it again, and writing in the parent concurrently to the THP.
> 
> [  252.738129][T16470] ------------[ cut here ]------------
> [  252.739267][T16470] WARNING: CPU: 3 PID: 16470 at mm/memory.c:3738 do_wp_page+0x2a75/0x2c00
> [  252.740968][T16470] Modules linked in:
> [  252.741958][T16470] CPU: 3 UID: 0 PID: 16470 Comm: ...
> ...
> [  252.765841][T16470]  <TASK>
> [  252.766419][T16470]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  252.767558][T16470]  ? rcu_is_watching+0x12/0x60
> [  252.768525][T16470]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  252.769645][T16470]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  252.770778][T16470]  ? lock_acquire+0x33/0x80
> [  252.771697][T16470]  ? __handle_mm_fault+0x5e8/0x3e40
> [  252.772735][T16470]  ? __handle_mm_fault+0x5e8/0x3e40
> [  252.773781][T16470]  __handle_mm_fault+0x1869/0x3e40
> [  252.774839][T16470]  handle_mm_fault+0x22a/0x640
> [  252.775808][T16470]  do_user_addr_fault+0x618/0x1000
> [  252.776847][T16470]  exc_page_fault+0x68/0xd0
> [  252.777775][T16470]  asm_exc_page_fault+0x26/0x30
> 
> While we could adjust the sequence in __folio_remove_rmap(), let's rater
> move the mapcount sanity checks after the mapcount vs. refcount
> stabilization phase. With this fix, a simple reproducer is happy.
> 
> While at it, convert the two VM_WARN_ON_ONCE() we are moving to
> VM_WARN_ON_ONCE_FOLIO().
> 
> Reported-by: syzbot+5e8feb543ca8e12e0ede@syzkaller.appspotmail.com
> Closes: https://lkml.kernel.org/r/67fab4fe.050a0220.2c5fcf.0011.GAE@google.com
> Fixes: 1da190f4d0a6 ("mm: Copy-on-Write (COW) reuse support for PTE-mapped THP")
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs
