Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8061239594
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958668; cv=none; b=U/qMUXnX07gjtEzFDfwgrlMVBXyQacsF38pJ3kT7GbzLAzo2A1h3MzFl3ZmutO5UFla7QnX2wUpEoxUqj2qOoRR5WsT0iArf2mBHCoL6ahl1K7pxfVbZZmgB5sScMFecg4/JCJmbg7XJxaUyYoJgTCV9eYYGeT2HaYv3sZEuteU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958668; c=relaxed/simple;
	bh=gY2xUXw8qIhEQDjfRx/W+6z/XPsFw7sXOw7/r/iZeYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDe/4+Bc/Xjth0K/bxpvcS/JtwYgRxMbZuYLkhThzhNekUoDdY+TO5AeSy0GBfPmV+Lyp6OWLf36EgfEIM63XnHaqjneOFndxP3EABsPblNgiJYkyTiv8hbb+Q6SrciV5J8vBgIE+1YV3AtLH8e13AVWoi+2efTddRsUY5EA5IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UNL/7H5X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3lyZ9GBX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UNL/7H5X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3lyZ9GBX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UNL/7H5X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3lyZ9GBX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UNL/7H5X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3lyZ9GBX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B254B1F7B5;
	Tue,  3 Jun 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748958664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=22/+GF2KAA9m9tC5GoNVuilwMTd7DvHg3TACB80pfT0=;
	b=UNL/7H5XVAAAhLQUPM3Z8QxOmiYuV+wmQVVotxgRrdX881XF8yDy6D9XEwpAviy7cbnC1u
	u7RfCNXt4IRu/deo5YXFSQLM0pxp2kElXzzL1NqtcmW82nyScmmGvxG1Uv0pZtRl1OOfxm
	UaOfxuU7WaPTGSbKBoUwdN3D5o+wqeQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748958664;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=22/+GF2KAA9m9tC5GoNVuilwMTd7DvHg3TACB80pfT0=;
	b=3lyZ9GBX6PNzaGdenFVblDMD12InDgglN6MVxX8kNSBpJtdUTAvGDoUZO6L5vRDg0A2EL9
	IEVdKPRZFCdsByAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748958664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=22/+GF2KAA9m9tC5GoNVuilwMTd7DvHg3TACB80pfT0=;
	b=UNL/7H5XVAAAhLQUPM3Z8QxOmiYuV+wmQVVotxgRrdX881XF8yDy6D9XEwpAviy7cbnC1u
	u7RfCNXt4IRu/deo5YXFSQLM0pxp2kElXzzL1NqtcmW82nyScmmGvxG1Uv0pZtRl1OOfxm
	UaOfxuU7WaPTGSbKBoUwdN3D5o+wqeQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748958664;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=22/+GF2KAA9m9tC5GoNVuilwMTd7DvHg3TACB80pfT0=;
	b=3lyZ9GBX6PNzaGdenFVblDMD12InDgglN6MVxX8kNSBpJtdUTAvGDoUZO6L5vRDg0A2EL9
	IEVdKPRZFCdsByAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B6C913AAD;
	Tue,  3 Jun 2025 13:51:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZcyuC8j9Pmj/FgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 03 Jun 2025 13:51:04 +0000
Date: Tue, 3 Jun 2025 15:50:54 +0200
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
Message-ID: <aD79vg-jQQU69raX@localhost.localdomain>
References: <20250602141610.173698-1-osalvador@suse.de>
 <20250602141610.173698-2-osalvador@suse.de>
 <aD2_0qoh1Os6srsA@x1.local>
 <aD4NyEmRc50OCUBy@localhost.localdomain>
 <aD4X68QSmrvI4P_D@x1.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD4X68QSmrvI4P_D@x1.local>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On Mon, Jun 02, 2025 at 05:30:19PM -0400, Peter Xu wrote:
> Right, and thanks for the git digging as usual.  I would agree hugetlb is
> more challenge than many other modules on git archaeology. :)
> 
> Even if I mentioned the invalidate_lock, I don't think I thought deeper
> than that. I just wished whenever possible we still move hugetlb code
> closer to generic code, so if that's the goal we may still want to one day
> have a closer look at whether hugetlb can also use invalidate_lock.  Maybe
> it isn't worthwhile at last: invalidate_lock is currently a rwsem, which
> normally at least allows concurrent fault, but that's currently what isn't
> allowed in hugetlb anyway..
> 
> If we start to remove finer grained locks that work will be even harder,
> and removing folio lock in this case in fault path also brings hugetlbfs
> even further from other file systems.  That might be slightly against what
> we used to wish to do, which is to make it closer to others.  Meanwhile I'm
> also not yet sure the benefit of not taking folio lock all across, e.g. I
> don't expect perf would change at all even if lock is avoided.  We may want
> to think about that too when doing so.

Ok, I have to confess I was not looking things from this perspective,
but when doing so, yes, you are right, we should strive to find
replacements wherever we can for not using hugetlb-specific code.

I do not know about this case though, not sure what other options do we
have when trying to shut concurrent faults while doing other operation.
But it is something we should definitely look at.

Wrt. to the lock.
There were two locks, old_folio (taken in hugetlb_fault) and
pagecache_folio one.
The thing was not about worry as how much perf we leave on the table
because of these locks, as I am pretty sure is next to 0, but my drive
was to understand what are protection and why, because as the discussion
showed, none of us really had a good idea about it and it turns out that this
goes back more than ~20 years ago.

Another topic for the lock (old_folio, so the one we copy from),
when we compare it to generic code, we do not take the lock there.
Looking at do_wp_page(), we do __get__ a reference on the folio we copy
from, but not the lock, so AFAIU, the lock seems only to please
folio_move_anon_rmap() from hugetlb_wp.

Taking a look at do_wp_page()->wp_can_reuse_anon_folio() which also
calls folio_move_anon_rmap() in case we can re-use the folio, it only
takes the lock before the call to folio_move_anon_rmap(), and then
unlocks it.

Which, I think, hugetlb should also do.

 do_wp_page
  wp_can_reuse_anon_folio ?
   : yes: folio_lock ; folio_move_anon_rmap ; folio_unlock
     bail out
   : no: get a reference on the folio and call wp_page_copy

So, this should be the lead that hugetlb follows.
As I said, it is not about the performance, and I agree that relying on
finer granularity locks is the way to go, but we need to understand
where and why, and with the current code from upstream, that is not
clear at all.

That is why I wanted to reduce the scope of old_folio to what is
actually needed, which is the snippet:

  if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
           if (!PageAnonExclusive(&old_folio->page)) {
                    folio_move_anon_rmap(old_folio, vma);
                    SetPageAnonExclusive(&old_folio->page);
           }
           if (likely(!unshare))
                    set_huge_ptep_maybe_writable(vma, vmf->address,
                                                 vmf->pte);
  
           delayacct_wpcopy_end();
           return 0;
  }

I think it is important to 1) reduce it to wrap what actually needs to
be within the lock and 2) document why, so no one has to put the gloves
and start digging in the history again.

> Thanks!  I hope that'll also help whatever patch to land sooner, after it
> can be verified to fix the issue.

So, my plan is:

1) Fix pagecache folio issue in one patch (test for anon, still need to
   check but it should work)
2) implement the 'filemap_get_hugetlb_folio' thing to get a reference and not
   lock it
3) reduce scope of old_folio

I want to make it clear that while I still want to add filemap_get_hugetlb_folio
and stop using the lock version, the reason is not to give more power to the mutex,
but to bring it closer to what do_wp_page does.

What do you think about it?
 

-- 
Oscar Salvador
SUSE Labs
