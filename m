Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B6E1547E7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824644; cv=none; b=cSFcSJSU9mAk+gK/v1luOQ3w0teekAUb6u1ZuNniFGJdDo4cVnP1loVwjiZTRp4Fg6t0z5yMLyE6qJAMBSvYrBIaqbqJoUmxa3F7R4rxi1o5XQPjtvtBE/lYzOkJYUGn2J3dpYJDHZMHKqbaVqxL+KDCNzVgVG+WolW9Cx9a1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824644; c=relaxed/simple;
	bh=DOKuj24pLJlpwCLjnFtv8Sx+s8z8HHrltCn8BdP4ETo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZ5RMQByNbDBO9GiRK5cPsyUzorfLDEgRQeRGIDgxO+4TGdK0qzYCbtgGv1ES4tdRxramaYAZI9Gj4ksacVnslErYQF2JKUDuBiwCUfZKPSBlNT5i65MdDXAjgZd58Frqyiniwul0Eq0GzW+PhbR7KTaEYJs24Smuizn+cnNPR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hmZMJOrS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SzC7Q44l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hmZMJOrS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SzC7Q44l; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hmZMJOrS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SzC7Q44l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hmZMJOrS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SzC7Q44l"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7866A5C374;
	Fri, 13 Jun 2025 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749824641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MUPsPgx6alNrpaxgdEaMoO7XxeOfzLHfWilP4Ho/V/k=;
	b=hmZMJOrSr0dBj5z7fuxXat4z/MY1W6PJnsQr9nV5t+Fcnk0I+/CjJH1IpI72MqY4mALRdn
	0YUE7C2C6M3mU4qYlqUeogGBftHiYwMUhkPIociKqfB+friItSXZUTGYAzXemnqNwNefHC
	tqZdUw2a+fjX/7GVGR1UB9w826kD8nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749824641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MUPsPgx6alNrpaxgdEaMoO7XxeOfzLHfWilP4Ho/V/k=;
	b=SzC7Q44lvgh2o1HrVmhgFh4t6zSmQdXcuFv3OzJZLOJAPKFkjeRFvGK4DfciE7Ffo7IWMx
	A9pHnCIAAKN9UuBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749824641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MUPsPgx6alNrpaxgdEaMoO7XxeOfzLHfWilP4Ho/V/k=;
	b=hmZMJOrSr0dBj5z7fuxXat4z/MY1W6PJnsQr9nV5t+Fcnk0I+/CjJH1IpI72MqY4mALRdn
	0YUE7C2C6M3mU4qYlqUeogGBftHiYwMUhkPIociKqfB+friItSXZUTGYAzXemnqNwNefHC
	tqZdUw2a+fjX/7GVGR1UB9w826kD8nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749824641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MUPsPgx6alNrpaxgdEaMoO7XxeOfzLHfWilP4Ho/V/k=;
	b=SzC7Q44lvgh2o1HrVmhgFh4t6zSmQdXcuFv3OzJZLOJAPKFkjeRFvGK4DfciE7Ffo7IWMx
	A9pHnCIAAKN9UuBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E6C1013782;
	Fri, 13 Jun 2025 14:24:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id seVGNYA0TGjBFAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 13 Jun 2025 14:24:00 +0000
Date: Fri, 13 Jun 2025 16:23:51 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
Message-ID: <aEw0dxfc5n8v1-Mp@localhost.localdomain>
References: <20250612134701.377855-1-osalvador@suse.de>
 <20250612134701.377855-3-osalvador@suse.de>
 <44f0f1cc-307a-46e3-9e73-8b2061e4e938@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44f0f1cc-307a-46e3-9e73-8b2061e4e938@redhat.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid]
X-Spam-Level: 

On Fri, Jun 13, 2025 at 03:56:15PM +0200, David Hildenbrand wrote:
> On 12.06.25 15:46, Oscar Salvador wrote:
> > -	/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
> > +	/*
> > +	 * We need to lock the folio before calling hugetlb_wp().
> > +	 * Either the folio is in the pagecache and we need to copy it over
> > +	 * to another file, so it must remain stable throughout the operation,
> 
> But as discussed, why is that the case? We don't need that for ordinary
> pages, and existing folio mappings can already concurrently modify the page?

Normal faulting path takes the lock when we fault in a file read-only or to
to map it privately.
That is done via __do_fault or cow_fault, in __do_fault()->vma->vm_ops_>fault().
E.g. filemap_fault() will locate the page and lock it.
And it will hold it during the entire operation, note that we unlock it
after we have called finish_fault().

The page can't go away because filemap_fault also gets a reference on
it, so I guess it's to hold it stable.

Now, when we get a wp fault for an already private mapping, via do_wp_page(), we
only take the lock to check whether we can re-use the page for us.
We don't hold it during the copy.

The only reason we hold it in hugetlb for the entire hugetlb_wp() is because making
this distinction on the lock's timespan depending on what we are dealing with,
would be tricky with the current code.
We would need to do some dancing of release-and-take-it depending on
what we want to do, and frankly it seems overcomplicated at this point.

I plan to do some more work in that area, and potentially glue it with
the generic faulting path (I have some ideas but I need some other works
to land first)

 

-- 
Oscar Salvador
SUSE Labs
