Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD9C2D9EEB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074311; cv=none; b=nJF8F0ATTdlKPJeHoGfFb+Dra/RgVeZXtAJLrsG8dxby3RVINRIiWwyCW8mDh3Sr0OADD7lPIdv9Aidm6WV09na84byHzBRpWJps4imd2Gj8UwM0np6vjnjZ7erprDs18HbIThH30MCRCAGIYCTNc1+83ho2Av+jSE9KUF9T7f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074311; c=relaxed/simple;
	bh=Mvn/6G4LThIxW2CjjJfUiXbilMcuDA+zGxKWbasEcuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVQybNgZvH8hJ9a1y0xOL/ZeGcVBt1AnZ55o9O5ph55RfiGewzHr4v+nzj4X6idNHHTogfjVX7NhTanfSzhFpULY92tVjFq6D7X5h5n8ZZOHWmzaqBSoYR3Hpc2oV+Gg895Gi07jibauEXBBwBQIK4hUcEYbfFp6ZmnteJoi4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mYxvLLWL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9dV2Pfdd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mYxvLLWL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9dV2Pfdd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mYxvLLWL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9dV2Pfdd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mYxvLLWL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9dV2Pfdd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 439861F45F;
	Mon, 16 Jun 2025 11:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750074307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cQ1bUAfux7Bc+S0s8QLpyx6GcxjzeCaMMaG6o/PQiwY=;
	b=mYxvLLWL/MZGfYqrHTYfUBtRHsoSZxnndetQVTv+TwTJXRHQVyWupKD7jmtq9h4Rlzj1kx
	XjptyYZcbhZWPCrYri6bjwP2gNeiVwXMQlT8wSHt62E5Bq8FFcAfAUTDgSNISUXWWcpGiU
	umRResmrtQIe9I1NZL10Mq2VWhNTtl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750074307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cQ1bUAfux7Bc+S0s8QLpyx6GcxjzeCaMMaG6o/PQiwY=;
	b=9dV2PfddyhFzzUXqVkx/nAfmaeqBz0jZKBnBQFbvzIO6jHtxuQ1IgGlPAr/33VYctMwnLr
	51tSFgLI6jCQ9WCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mYxvLLWL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9dV2Pfdd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750074307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cQ1bUAfux7Bc+S0s8QLpyx6GcxjzeCaMMaG6o/PQiwY=;
	b=mYxvLLWL/MZGfYqrHTYfUBtRHsoSZxnndetQVTv+TwTJXRHQVyWupKD7jmtq9h4Rlzj1kx
	XjptyYZcbhZWPCrYri6bjwP2gNeiVwXMQlT8wSHt62E5Bq8FFcAfAUTDgSNISUXWWcpGiU
	umRResmrtQIe9I1NZL10Mq2VWhNTtl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750074307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cQ1bUAfux7Bc+S0s8QLpyx6GcxjzeCaMMaG6o/PQiwY=;
	b=9dV2PfddyhFzzUXqVkx/nAfmaeqBz0jZKBnBQFbvzIO6jHtxuQ1IgGlPAr/33VYctMwnLr
	51tSFgLI6jCQ9WCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF00E13A6B;
	Mon, 16 Jun 2025 11:45:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dL0lKMIDUGh7eQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 11:45:06 +0000
Date: Mon, 16 Jun 2025 13:45:05 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/10] mm,memory_hotplug: Implement numa node notifier
Message-ID: <aFADwYs9LcyK5tVn@localhost.localdomain>
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-4-osalvador@suse.de>
 <2bec8b53-f788-493e-a76e-1f804ed3aa0c@redhat.com>
 <aE_WG6bnjtLBzCp8@localhost.localdomain>
 <10c87a0e-c9fe-48fe-9bbd-16afd244b4ec@redhat.com>
 <aE_a4_rGbMLJKBIs@localhost.localdomain>
 <360f2f04-4542-4595-bf36-c45ed10335af@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <360f2f04-4542-4595-bf36-c45ed10335af@redhat.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 439861F45F
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -3.01
X-Spam-Level: 

On Mon, Jun 16, 2025 at 10:52:31AM +0200, David Hildenbrand wrote:
> Probably worth checking, to make sure we don't have accidental bugs in there
> ...

I did a quick sweep, and we should be cool since users of the node notifier
don't really use *_CANCEL* action. Only ADDED/REMOVED.

Now, users of memory notifier is a different story.
E.g: page_ext will call offline_page_ext to mark the section->page_ext invalid.

online_page_ext does:

 base = alloc_page_ext(table_size, nid);
 section->page_ext = (void *)base - page_ext_size * pfn;

This is fine, I think, offline_page_ext will not mark it as INVALID because
section->page_ext is NULL, so we just skip it.

This is just one example. I checked some others like kasan and hyperv and they
seem fine.
And anyway, the we could already hit this situation with MEM_* notifiers, so
nothing new.
I'll just make sure to document it so new users take this into account.
 

-- 
Oscar Salvador
SUSE Labs
