Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AF02576
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 17:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751219406; cv=none; b=LeV/cfYDWEs0HwDrgDjzp/vANhKKlDDabi1yWrzQIz3P2hrROjoP8dxBoJyzvhShcW/PGOhyw9zqAI7FF0JUROYnwXEdiM3jq12tqapC3tW1fI/9D0MPSPvcaAvVER3N/FlmYU/G4u94e0YvHjWBWORGzJ9UhC+2+lFMV4d/Y9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751219406; c=relaxed/simple;
	bh=RjQfoSzTrPPKq/pctsdrZa4Uh7eLJMTIY3pYUFvqVEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMXPTMy3/jQ9DD2ZXml1gTJR97uHAHRBu3Ykl6NOLCkzitc4tKCr2g/Gz/r9xVt3V/VpwzoAtJgBwIX5VkDnEG8H1Xkb2jBxtEMwkBChLjCh7+HWu3ZmIKNERZZ+IFXYwU2nwgfwmK9TYhwYQvWJYRCex5Hq9XlgPBU0JJsfcwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hVVWF8U5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Pgo+GOfc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hVVWF8U5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Pgo+GOfc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hVVWF8U5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Pgo+GOfc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hVVWF8U5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Pgo+GOfc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2DA701F388;
	Sun, 29 Jun 2025 17:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751219402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RGL3sfEecuk0afRd+uuIJbALJWWTgyUjORjsYLSGgTo=;
	b=hVVWF8U5XVVWWqbOi6TVmtkWjLmEOGD0ZGYN97WOz+MK/CaIv1djuqNEZ9HiMj24lC462v
	LrBRMDu/V0pncAOO9xFDd7hD6ytc/olhWmVPXHNyofsPOxjhucV8pATGlu5Dyk7IaukBo8
	c9JJaPGV3WCzHrKcSsVwEAxP2C6sNDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751219402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RGL3sfEecuk0afRd+uuIJbALJWWTgyUjORjsYLSGgTo=;
	b=Pgo+GOfcTkrCpK8mbpZdv/GyrOhPIZjXB4AE4K0zuCYVsIq0UbAxJ0Fset+PoCQAxAzgY2
	AW+wqYBLLWgOknDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751219402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RGL3sfEecuk0afRd+uuIJbALJWWTgyUjORjsYLSGgTo=;
	b=hVVWF8U5XVVWWqbOi6TVmtkWjLmEOGD0ZGYN97WOz+MK/CaIv1djuqNEZ9HiMj24lC462v
	LrBRMDu/V0pncAOO9xFDd7hD6ytc/olhWmVPXHNyofsPOxjhucV8pATGlu5Dyk7IaukBo8
	c9JJaPGV3WCzHrKcSsVwEAxP2C6sNDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751219402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RGL3sfEecuk0afRd+uuIJbALJWWTgyUjORjsYLSGgTo=;
	b=Pgo+GOfcTkrCpK8mbpZdv/GyrOhPIZjXB4AE4K0zuCYVsIq0UbAxJ0Fset+PoCQAxAzgY2
	AW+wqYBLLWgOknDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B1E51379A;
	Sun, 29 Jun 2025 17:50:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xCKqIsl8YWiuJgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Sun, 29 Jun 2025 17:50:01 +0000
Date: Sun, 29 Jun 2025 19:49:51 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Oscar Salvador <osalvador.vilardaga@gmail.com>
Cc: Gavin Guo <gavinguo@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] mm,hugetlb: Change mechanism to detect a COW on
 private mapping
Message-ID: <aGF8v50STTr3fV57@localhost.localdomain>
References: <20250627102904.107202-1-osalvador@suse.de>
 <20250627102904.107202-2-osalvador@suse.de>
 <e8287af7-08bd-491c-bca8-70af107e0fea@igalia.com>
 <CAOXBz7gP9Zur3804zJhxFhSjprNc-gfi4vg7w2g07HA2S9EkcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOXBz7gP9Zur3804zJhxFhSjprNc-gfi4vg7w2g07HA2S9EkcA@mail.gmail.com>
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Sun, Jun 29, 2025 at 08:53:52AM +0200, Oscar Salvador wrote:
> Thanks Galvin for testing!
> I'll have a look when I'm back but I suspect thiz wants to be a trylock and
> bailout if we can't take it.

Are there any considerations to be taken before kicking in the test?
I don't seem to be able to reproduce the issue.

Are there important steps to do before running it?

thank you!


-- 
Oscar Salvador
SUSE Labs
