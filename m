Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4EC225A32
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564836; cv=none; b=EQzP0Ku1g5ZfqO/qSV21Ns6/6EOND4J7RiSu5wjHj84TBlRFPYV4O9Flssjdu5qmeypFtw4724sizh8yVP57im8YATryKoHEYpK2o0L2XfJAFBzDLn4e8OrRlmV5FLc0AP642AEidvm0wWm0TT/u8sNg7zu553SpcBXQizc7jx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564836; c=relaxed/simple;
	bh=mCi2Lk1ZS1odoDUcbstUDUsvqfLqxYiCBM41SWzjhLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1rx/FQXR4K6U2hphZZ2O+iOWe2y8Ok19TvJXqjBTUqLBUia1rWNHSmDVu9qy7HA2qnK+L9KVKlU9V47f7nDQArdB7uW6UScQhTe1ZSdy0hzJD8M79+Rfn+bNhCQ1y823U59BRgN1HbMgLeuxH12UE3uE+8vyOTo1I/29b6vYr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UIYK7eHB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w0XR/JIU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C9hvL1E+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Gm7jUAe6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UIYK7eHB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w0XR/JIU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C9hvL1E+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gm7jUAe6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EEEB11F76B;
	Tue, 10 Jun 2025 14:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749564832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1MQSXXafvP/LLujHfyD/l7INR/OL5srFwLiZqmlLeww=;
	b=UIYK7eHB0AF9rpEztfwaWmAqGLJ/lMc1jm8teffNbo5hIr+hpjhM/Xq7p3bkqsZJ5pePRL
	BGod60gQpIKzmVkNGySgGqls4ea9KjQTZw4ccdh7TT1/7KGhFX12y2YtnzUnD0bgWUFV7K
	PZFoCHmvSYs7j85Wt959OYiyVLCBfxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749564832;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1MQSXXafvP/LLujHfyD/l7INR/OL5srFwLiZqmlLeww=;
	b=w0XR/JIUTDWdcy8kCxYLuuLdNBG+ekiJ8+EL2keuBdlgJiWFOYZGJByacAeRzlIRO9US/M
	m+1QSDHZtdG+irBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=C9hvL1E+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Gm7jUAe6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749564831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1MQSXXafvP/LLujHfyD/l7INR/OL5srFwLiZqmlLeww=;
	b=C9hvL1E+2HIk8OagG9rvR6rflGt2gg3GY7VeJAkv/DU0QFmGG78fJD0q8niZtv1GCK9QVV
	wa9xxkzx4VDzE+CJcMcWGiGhUXgxbzimDnDDdk3CTvqv5EI0FrEYHug7CI8YqEvzrod0Y3
	vJQjWnZCzd0dGoL0iHyBH+0lBNB5UlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749564831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1MQSXXafvP/LLujHfyD/l7INR/OL5srFwLiZqmlLeww=;
	b=Gm7jUAe6YI8zWx0kaLtiFebWapGhfZfXSscjgRwmHFKTFmEhyslcbNk3tihMs/fZLx/Y+T
	bTves1OV2m3xb7CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77D57139E2;
	Tue, 10 Jun 2025 14:13:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id efZnGp89SGiwNQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 10 Jun 2025 14:13:51 +0000
Date: Tue, 10 Jun 2025 16:13:45 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Peter Xu <peterx@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	James Houghton <jthoughton@google.com>,
	Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] mm, hugetlb: Clean up locking in hugetlb_fault
 and hugetlb_wp
Message-ID: <aEg9mTDDA1TXJ9by@localhost.localdomain>
References: <20250602141610.173698-1-osalvador@suse.de>
 <20250602141610.173698-2-osalvador@suse.de>
 <aD2_0qoh1Os6srsA@x1.local>
 <aD4NyEmRc50OCUBy@localhost.localdomain>
 <aD4X68QSmrvI4P_D@x1.local>
 <aD79vg-jQQU69raX@localhost.localdomain>
 <aD8NUSUV5zA4yNY3@x1.local>
 <aD8_c9uEMn6NXXAX@x1.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD8_c9uEMn6NXXAX@x1.local>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: EEEB11F76B
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
X-Spam-Level: 

On Tue, Jun 03, 2025 at 02:31:15PM -0400, Peter Xu wrote:
> > There're actually three places this patch touched, the 3rd one is
> > hugetlb_no_page(), in which case I also think we should lock it, not only
> > because file folios normally does it (see do_fault(), for example), but
> > also that's exactly what James mentioned I believe on possible race of
> > !uptodate hugetlb folio being injected by UFFDIO_CONTINUE, along the lines:
> > 
> > 		folio = alloc_hugetlb_folio(vma, vmf->address, false);
> >                 ...
> > 		folio_zero_user(folio, vmf->real_address);
> > 		__folio_mark_uptodate(folio);
> 
> I think I was wrong here at least partly..  So what this patch changed is
> only the lookup of the no_page path, hence what I said here doesn't apply.
> This patch also mentioned in the commit message on why James's concern was
> ok - the fault mutex was held.  Yes I agree. Actually even without fault
> mutex, the folio is only injected into page cache after mark uptodate.. so
> it looks fine even without the mutex.
> 
> Though it's still true there're three paths to be discussed, which should
> include no_page, and it's still needed to be discussed when any of us like
> to remove folio lock even in the lookup path.
> 
> For example, I'm not sure whether it's always thread safe to do
> folio_test_hwpoison() when without it, even with the fault mutex.
> 
> Sorry for the confusion, Oscar.

So, I'm having another go at this.
I started with replacing the check for cow-on-private-mappings [1].

I'm still to figure out how to approach the other locks though.
The thing is, we only need the lock in two cases:

1) folio is the original folio in the pagecache: We need to lock it to
   copy it over to another page (do_fault->do_cow_page locks the folio
   via filemap_fault).
   Although, the truth be told, we even lock the folio on read-fault in
   do_read_fault. Maybe that is just because __do_fault() ends up
   calling filemap_fault (so it doesn't differentiate?).
   But that is not a problem, just a note.
   So it is ok for hugetlb_no_page() to also take the lock when
   read-faulting.
   We need to take the lock here.

2) folio is anonymous: We need to take the lock when we want to check
   if we can re-use the folio in hugetlb_wp.
   Normal faulting path does it in wp_can_reuse_anon_folio().

Now, the scope for them is different.
Normal faulting path only locks the anonymous folio when calling
wp_can_reuse_anon_folio() (so, it isn't hold during the copy), while we
lock folios from the pagecache in filemap_fault() and keep the lock until
we have a) mapped it into our pagetables (read-fault) b) or we have
copied it over to another page.

Representing this difference of timespan in hugetlb is rather tricky as
is.
Maybe it could be done if we refactor hugetlb_{fault,no_page,wp} to look
more alike to the non-hugetlb faulting path.
E.g: hugetlb_fault could directly call hugetlb_wp if it sees that
FAULT_FLAG_WRITE is on, instead of doing a first pass to
hugetlb_no_page, and leave hugetlb_no_page for only RO stuff.
Not put much though on it, but just an idead of how do_fault() handles
it.

(In an ideal world hugetlb could be re-routed to generic faulting path
but we would need to sort out somehow the need to allocate folios,
reserves etc. so that is still far future)

Anyway, as I said, representing this different of timespan file vs
anonymous in hugetlb is tricky, so I think the current state of locks,
with [1] applied is fine.

hugetlb_fault:
               - locks the folio mapped in pte_orig
hugetlb_no_page:
               - locks the folio from the pagecache
	       - or allocates a new folio
	         - and inserts it into the pagecache and locks it
	         - and locks it (anonymous)

So, hugetlb_wp() already gets the folio locked and doesn't have to
bother about anything else.

Of course, while I think that locks can be keep as they are, I plan to
document them properly so the next poor soul that comes along doesn't
have to spend time trying to figure out why we do what we do.

Another thing of keeping the locks is that for the future we can
potentially rely less on the faulting mutex.


[1] https://github.com/leberus/linux/commit/b8e10b854fc3e427fd69d61d065798c7f31ebd55

 

-- 
Oscar Salvador
SUSE Labs
