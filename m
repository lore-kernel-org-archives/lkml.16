Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38822DA761
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804913; cv=none; b=e8AusyVXo3KmrMY3JLZo6r4pfE0cYuSyqfEIh8zy1WvYwsS/+t5ETTcaY9F0drW4lh7MOGqevUP6gH+JIv3fD7U7NdtLE7GPe85096j/tZ9R4R1HYn+YdfNSGmNQwLL/BxuFp/XZVTxZOU0Fqoa/4iz05NlsanDMrkkp6k88b6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804913; c=relaxed/simple;
	bh=yQPco0V8zB1FNDfL3ECDeldfzREBdK8eTJplbWvxO0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cT0A7uZr7jwSHF5Gw1PsxRSiH8X4ZXhWdBpJb3fYMX0MFJLcp6xBD7sAKCerQ0UlQ9JAf2kpliLjLGaRl+t2zqA1zBG2f68msF9CO/qW9LSYcEUGcOytgSpdXA0cW0yS8Mn5sp2/XoZ/yJws7E3f67YKwiRpFAzCsGyU4aec8b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jZQqOHzX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CM/ltyGK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jZQqOHzX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CM/ltyGK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jZQqOHzX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CM/ltyGK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jZQqOHzX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CM/ltyGK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 258931F84C;
	Fri, 13 Jun 2025 08:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749804910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c5y82HogrTTA90h0Vyr5go8d6/BO1h3781RVLmsOTU0=;
	b=jZQqOHzXE7Z/b2l5VdMpSHZkRX7AWce+zrGWHs8KJjilmOLRIg0hjtSwEQZjGXMwzVALR6
	x44DzXbcxKkRKn1VZEOarU1o40Ftgi5QtZkLi8O4XO9stDobc9B/PbQmVFHdhPoRHLher8
	BkI+RD0KLhCKEpkyAcJtbZUrGXjqs0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749804910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c5y82HogrTTA90h0Vyr5go8d6/BO1h3781RVLmsOTU0=;
	b=CM/ltyGK/xwKApDFgjj3C+NIEGaVLtm0q6+kmIJ7LfRHhFYXR/rrGS+mdB5y0YxK+EzkCT
	IcPSrPCCCWG/ZzBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749804910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c5y82HogrTTA90h0Vyr5go8d6/BO1h3781RVLmsOTU0=;
	b=jZQqOHzXE7Z/b2l5VdMpSHZkRX7AWce+zrGWHs8KJjilmOLRIg0hjtSwEQZjGXMwzVALR6
	x44DzXbcxKkRKn1VZEOarU1o40Ftgi5QtZkLi8O4XO9stDobc9B/PbQmVFHdhPoRHLher8
	BkI+RD0KLhCKEpkyAcJtbZUrGXjqs0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749804910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c5y82HogrTTA90h0Vyr5go8d6/BO1h3781RVLmsOTU0=;
	b=CM/ltyGK/xwKApDFgjj3C+NIEGaVLtm0q6+kmIJ7LfRHhFYXR/rrGS+mdB5y0YxK+EzkCT
	IcPSrPCCCWG/ZzBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6E0313782;
	Fri, 13 Jun 2025 08:55:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id omoWJm3nS2jtMQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 13 Jun 2025 08:55:09 +0000
Date: Fri, 13 Jun 2025 10:55:08 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Misc rework on hugetlb_fault
Message-ID: <aEvnbO0n8lkYF9yI@localhost.localdomain>
References: <20250612134701.377855-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612134701.377855-1-osalvador@suse.de>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On Thu, Jun 12, 2025 at 03:46:56PM +0200, Oscar Salvador wrote:
> This is a new version of the RFC I sent a couple of weeks ago [1].
> It's the conclusion of the discussions that ocurred in that thread.
> 
> Patch#1 is the fix for the deadlock.
> Patch#2 is to document why we take the lock, so none of us have to spend
> time again in figuring that out.
> Patch#3-5 are a bit of cleanup (removing obsolete comments etc.)

Andrew told me that this is very vague for a coverletter, and while this patchset
is sort of a refactor/clenaup/fixup mix, I acknowledge that it is far
from optimal to get people some context.
So let me try again, and I apologyze.

"
 This patchset aims to give some love to the hugetlb faulting path, doing so
 by removing obsolete comments that are no longer true, documenting in a clear
 way the reason we take certain locks, and changing the mechanism we use to
 determine whether we are COWing a private mapping already.

 The most important patch of the series is #1, as it fixes a deadlock that
 was described in [1], where two processes were holding the same lock
 for the folio in the pagecache, and then deadlocked in the mutex.
 Looking up and locking the folio in the pagecache was done to check whether
 that folio was the same folio we had mapped in our pagetables, meaning that if it
 was different we knew that we already mapped that folio privately, so any
 further CoW would be made on a private mapping, which lead us to the  question:
  __Was the reservation for that address consumed?__
 That is all we care about, because if it was indeed consumed and we are the
 owner and we cannot allocate more folios, we need to unmap the folio from the
 processes pagetables and make it exclusive for us.

 We figured we do not need to look up the folio at all, and it is just enough to
 check whether the folio we have mapped is anonymous, which means we mapped it
 privately, so the reservation was indeed consumed.

 Patch#2 follows a bit more to the trend on why we need to lock the
 folio from the pagetables, whether it is anonymous or not.
 For anonymous folios we need the lock in order to check whether we can re-use
 exclusively for us, while for file folios we need to hold the lock to make the
 folio stable throughout the copy.
 We also hold it even if we are read-faulting, just to make sure it does not go
 away. For this last case, we are already covered by the hugetlb_mutex, but
 in order to bring hugetlb closer to the general faulting path, let us rely on
 the lock instead, as do_read_fault() does.

 Patch#3 is a merely correctness issue if you will, while Patch#4 and
 Patch#5 remove obsolete comments and assumptions that are no longer
 true.
 
 [1] https://lore.kernel.org/lkml/20250513093448.592150-1-gavinguo@igalia.com/
"

Shame on me, this should have been the cover letter.
 

-- 
Oscar Salvador
SUSE Labs
