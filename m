Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0470C285411
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290012; cv=none; b=dVzicBCM8APiBIkYdQbtOqlpL1BbjK3Jpbiy0wMFtz4zhcaN9a9bjD1VBvTIYi8nHh/KWPDm2yeXBBzqmdWP40zu90MEtnuw3w74e/XceyD5gFnJJskCqty5mU2pFLL/0AuXYX3buPzQK1AAy4/Eowmkw7rO5/ZBNF6Od66fqvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290012; c=relaxed/simple;
	bh=6qCKRWZANcFjZy+jbXJSxvPG7FHCQWeErLwuiSVg2vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWmMiqqePFXMjYcyyHV7v/keXwYqkgDX5hAxSi4RbhMW6y/ODpwCIjnrMKq634O5CnLFw6HNL7k8zJfhChicR8nC1Vusrgc0BTr4XX6znZa+dhOlw/duEz1Pg4eE6TS+X8TdHXW+6ydv6igLaPKIPcYUt4g/y5miUE59lh8EZfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=twVn18qU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rH1ToKF8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=twVn18qU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rH1ToKF8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="twVn18qU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rH1ToKF8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="twVn18qU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rH1ToKF8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9BE281F397;
	Mon, 30 Jun 2025 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751290008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4dKDhV7HkHnR/fM06ZQ3VumFSoemzPHeiTMaH7qh8g=;
	b=twVn18qUxwWl/xc6qNMIqVlShHP0g2wOWcv9pruz7LQ3sJ6LlLgexX2WuITrlO+pZNlxt1
	Sklq4cwwcRHsQkKLUdA+kBsevjE+OT6TUZGmDwEvoVl4WY2XoHvkFYVUOZaapyafSanJhW
	a3lI7R2fWlT+et7jSHOPz7mrWWsLnak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751290008;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4dKDhV7HkHnR/fM06ZQ3VumFSoemzPHeiTMaH7qh8g=;
	b=rH1ToKF8a//Wim8aB/cQ2WQ92HMBCwrquiYSTV/ulwveH9qAQ8NYtgxsNSh5O6SDXpibzw
	JzU+Qc3fSwkZHgBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=twVn18qU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rH1ToKF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751290008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4dKDhV7HkHnR/fM06ZQ3VumFSoemzPHeiTMaH7qh8g=;
	b=twVn18qUxwWl/xc6qNMIqVlShHP0g2wOWcv9pruz7LQ3sJ6LlLgexX2WuITrlO+pZNlxt1
	Sklq4cwwcRHsQkKLUdA+kBsevjE+OT6TUZGmDwEvoVl4WY2XoHvkFYVUOZaapyafSanJhW
	a3lI7R2fWlT+et7jSHOPz7mrWWsLnak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751290008;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4dKDhV7HkHnR/fM06ZQ3VumFSoemzPHeiTMaH7qh8g=;
	b=rH1ToKF8a//Wim8aB/cQ2WQ92HMBCwrquiYSTV/ulwveH9qAQ8NYtgxsNSh5O6SDXpibzw
	JzU+Qc3fSwkZHgBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 235C513983;
	Mon, 30 Jun 2025 13:26:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YAjdBZiQYmhPXQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 30 Jun 2025 13:26:48 +0000
Date: Mon, 30 Jun 2025 15:26:45 +0200
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
Message-ID: <aGKQlSNmF5ELFaYB@localhost.localdomain>
References: <20250627102904.107202-1-osalvador@suse.de>
 <20250627102904.107202-2-osalvador@suse.de>
 <e8287af7-08bd-491c-bca8-70af107e0fea@igalia.com>
 <CAOXBz7gP9Zur3804zJhxFhSjprNc-gfi4vg7w2g07HA2S9EkcA@mail.gmail.com>
 <aGF8v50STTr3fV57@localhost.localdomain>
 <aGGeFrPwAxsu-f3F@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGGeFrPwAxsu-f3F@localhost.localdomain>
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,localhost.localdomain:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 9BE281F397
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

On Sun, Jun 29, 2025 at 10:12:06PM +0200, Oscar Salvador wrote:
> Nevermind, I just wrote my own reproducer.
> I see two ways of fixing this, the simpler being a trylock instead of a
> lock, like the original code did.
> I'll sleep on it and fix it tomorrow.

I crafted the fix, and now my reproducer no longer reproduces the
problem.
Also, with the fix the whole lock-unlock dance becomes much more simple.
I'll send out a v4 later today.

 

-- 
Oscar Salvador
SUSE Labs
