Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B42BEFE6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083016; cv=none; b=PHf24oj//yCXFUGSOK+1UCHsSc6eoHeNF4JT7Aq3busbQOgK8WMIenp3/5hRJx1bMps5hNyDCF7IKbR9/+noUoDU3fk3yy3BT7URrL/8Ey9/YyXnnFEuknOxh2/P+uFX7xsp8sSUFfgF3FJzKXGW/NsKB+vjIz2m6atBzib4C30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083016; c=relaxed/simple;
	bh=WAuAopaFE62od8GV/8XzeePYFJyET2mSBfEs8wOz79A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbJRlLEWn2KjfiHj9C4EcdgcVbzccAtgmheeYmnO5FyfrTVUWUNNDUWsVvEmLyNI3jEL/7nVB0zb0tS6sIZ7eZM0SH7i6fQOmtaI9GfN8m+sW+1+jieBYG0vXxGJE7NL2wysVxHmJ3Y+BxLFQPuu+/j4Hm3kLtCVI9O0lNVLTzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FfE3qqOd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GaimmJA3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FfE3qqOd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GaimmJA3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FfE3qqOd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GaimmJA3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FfE3qqOd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GaimmJA3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E1D641F74A;
	Mon, 16 Jun 2025 14:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750083012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pjbZJaffVvP6vuBZvxM6g9mqSeMEhj0RjSxyuqax+yM=;
	b=FfE3qqOdPMtM0nEACqjOdSJ/1V4ckmGIOhu1d5aYdsNFn6fKKVdl+ETe/QJYsWZvy+yecS
	1oQ81cb/l4FZLTktYRnKbbNc45L6Q13UAhp6i/pHdxZuEOsGEUnfFSJGfmJy8lj7rXyk/W
	8TH9YE1y2rhdI6eEqvPaLgVylJV5YLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750083012;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pjbZJaffVvP6vuBZvxM6g9mqSeMEhj0RjSxyuqax+yM=;
	b=GaimmJA3hGx3BbuHMjADldom51FNmjZZ7B48/hqQNjxvz3DaCiejmLIujrOxQO9RxiqY0q
	rchSEgGVgze38lDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750083012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pjbZJaffVvP6vuBZvxM6g9mqSeMEhj0RjSxyuqax+yM=;
	b=FfE3qqOdPMtM0nEACqjOdSJ/1V4ckmGIOhu1d5aYdsNFn6fKKVdl+ETe/QJYsWZvy+yecS
	1oQ81cb/l4FZLTktYRnKbbNc45L6Q13UAhp6i/pHdxZuEOsGEUnfFSJGfmJy8lj7rXyk/W
	8TH9YE1y2rhdI6eEqvPaLgVylJV5YLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750083012;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pjbZJaffVvP6vuBZvxM6g9mqSeMEhj0RjSxyuqax+yM=;
	b=GaimmJA3hGx3BbuHMjADldom51FNmjZZ7B48/hqQNjxvz3DaCiejmLIujrOxQO9RxiqY0q
	rchSEgGVgze38lDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FFE013A6D;
	Mon, 16 Jun 2025 14:10:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J++TF8QlUGi9TAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 14:10:12 +0000
Date: Mon, 16 Jun 2025 16:10:02 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
Message-ID: <aFAlupvoJ_w7jCIU@localhost.localdomain>
References: <20250612134701.377855-1-osalvador@suse.de>
 <20250612134701.377855-3-osalvador@suse.de>
 <44f0f1cc-307a-46e3-9e73-8b2061e4e938@redhat.com>
 <aEw0dxfc5n8v1-Mp@localhost.localdomain>
 <ffeeb3d2-0e45-43d1-b2e1-a55f09b160f5@redhat.com>
 <aEychl8ZkJDG1-5K@localhost.localdomain>
 <aE075ld-fOyMipcJ@localhost.localdomain>
 <a5e098d1-ee5a-447f-9e05-0187b22500e1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5e098d1-ee5a-447f-9e05-0187b22500e1@redhat.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Mon, Jun 16, 2025 at 11:22:43AM +0200, David Hildenbrand wrote:
 
> hugetlb_fault->hugetlb_no_page->hugetlb_wp
> 
> already *mapped* the pagecache page into the page table.
> 
> See
> 	if (anon_rmap)
> 		hugetlb_add_new_anon_rmap(folio, vma, vmf->address);
> 	else
> 		hugetlb_add_file_rmap(folio);
> 
> So at that point it would be "stable" unless I am missing something?
> 
> So once we are in hugetlb_wp(), that path much rather corresponds to
> do_wp_page()->wp_page_copy.

Yes, that's right.
That's something I've been thinking over the weekend.

E.g: do_cow_fault, first copies the page from the pagecache to a new one
and __then__ maps the that page into the page tables.
While in hugetlb_no_page->hugetlb_wp, the workflow is a bit different.

We first map it and then we copy it if we need to.

What do you mean by stable?
In the generic faulting path, we're not worried about the page going away
because we hold a reference, so I guess the lock must be to keep content stable?

I mean, yes, after we have mapped the page privately into the pagetables,
we don't have business about content-integrity anymore, so given this rule, yes,
I guess hugetlb_wp() wouldn't need the lock (for !anonymous) because we already
have mapped it privately at that point.

But there's something I don't fully understand and makes me feel uneasy.
If the lock in the generic faultin path is to keep content stable till we
have mapped it privately, wouldn't be more correct to also hold it
during the copy in hugetlb_wp, to kinda emulate that?


-- 
Oscar Salvador
SUSE Labs
