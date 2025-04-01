Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCCE202F67
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515516; cv=none; b=HJmrGHZvWyuwAmpZSIV2VU4e7IPh5gnWTMXsqEU5PzDkLEFD9kWQl1cnkRiBAoVVIdZAObV6pdFM0K7a7WIS5Za+YoXZrYOkm7L/xOMgLQa51VeoEQzy2iu8GUzOPVu+F8+WylA+nbYzlJUy0id0acsW8sJWOLuKpSQgq6SaPBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515516; c=relaxed/simple;
	bh=l0AC9gnA9+z1OQwJTYDMpGc81mQkJQvmEZQg2O2MDvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0QGEXkiukLo9QNtxExITLHqUAB62tuGMlOjQT+/tcnnH6ekTfxztRz+7OWB2No15ZRtvIxODsQYQhcy/H1g+PxB/NkDBRR2/FZx0k/ib/4CrNtRkWSw4JOhpjGWxQG0AeQlxijGLI2YsyjGNck/vN5JbdACNveSraIzAsFoPa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TcFA5SZi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FqwTgoTC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TcFA5SZi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FqwTgoTC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TcFA5SZi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FqwTgoTC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TcFA5SZi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FqwTgoTC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 374C4211E5;
	Tue,  1 Apr 2025 13:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743515512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RG24GCY7wOPa8cPzvXOhJ7YDRKS0RXj4+VcNrGOGoxw=;
	b=TcFA5SZiaEQhVwqcRBiRU24icdTIeZCYSWemH8u4oeAE1sWvjjabsWYw46ox5Jrh+UIQxI
	yDkNvY9pEO6cHDwdjmwHtSmsuLLW6xTIxqJ9fv+RFO4ecDbOWPLwTkna/QCnaUt2u7XOXU
	YdhiVO8TlXz3APg3o5tSY+Cd+RilYcs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743515512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RG24GCY7wOPa8cPzvXOhJ7YDRKS0RXj4+VcNrGOGoxw=;
	b=FqwTgoTC7hyqwNrGa+JcEvH5KdJUBPaGHWTdENPjruxa4Z+ucy8w4ki/B6lRGrdE0G9HvA
	YV14gg1EhTr5DEBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TcFA5SZi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FqwTgoTC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743515512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RG24GCY7wOPa8cPzvXOhJ7YDRKS0RXj4+VcNrGOGoxw=;
	b=TcFA5SZiaEQhVwqcRBiRU24icdTIeZCYSWemH8u4oeAE1sWvjjabsWYw46ox5Jrh+UIQxI
	yDkNvY9pEO6cHDwdjmwHtSmsuLLW6xTIxqJ9fv+RFO4ecDbOWPLwTkna/QCnaUt2u7XOXU
	YdhiVO8TlXz3APg3o5tSY+Cd+RilYcs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743515512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RG24GCY7wOPa8cPzvXOhJ7YDRKS0RXj4+VcNrGOGoxw=;
	b=FqwTgoTC7hyqwNrGa+JcEvH5KdJUBPaGHWTdENPjruxa4Z+ucy8w4ki/B6lRGrdE0G9HvA
	YV14gg1EhTr5DEBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D751E138A5;
	Tue,  1 Apr 2025 13:51:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qC+5MXfv62dsWQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 01 Apr 2025 13:51:51 +0000
Date: Tue, 1 Apr 2025 15:51:50 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Baoquan He <bhe@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
Subject: Re: [PATCH v2 3/7] mm/gup: Fix the outdated code comments above
 get_user_pages_unlocked()
Message-ID: <Z-vvdrpr-MnkpH7d@localhost.localdomain>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-4-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331081327.256412-4-bhe@redhat.com>
X-Rspamd-Queue-Id: 374C4211E5
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Mon, Mar 31, 2025 at 04:13:23PM +0800, Baoquan He wrote:
> Since commit f0818f472d8d ("mm: gup: add get_user_pages_locked
> and get_user_pages_unlocked"), get_user_pages() doesn't need to have
> mmap_lock held anymore. It calls __get_user_pages_locked() which
> can acquire and drop the mmap_lock internaly.
> 
> Hence remove the incorrect code comments now.

Uhm, I think this one should be dropped according to 

https://lore.kernel.org/linux-mm/20250330121718.175815-4-bhe@redhat.com/T/#m1aa161016ab98a6d85bcb657a729e01cb98763ec

?


-- 
Oscar Salvador
SUSE Labs
