Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473D0226D0D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169449; cv=none; b=BgD5v21Qir6zIK+/FnOX3yekhlg0IRGaE0iLpm6BYNpPVHQcSdc/5oUt4BG2numKMwCALJ/oIvWtQgSoP/2veAy7NujDNcLDX3zdps+dneO6VhgOcfYx74OSbKJLZQmFgkH4iA+TwPlODW5N1mOBPH673g3m+rZtpew7rI/Pmjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169449; c=relaxed/simple;
	bh=Oa+xSI2txhhcdnDFz0az2j3vIMkXyzobp2/6xU6Fn0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeKA0+obwHhosnwYfLcW0kpnp3UqDq38C0B9o9OH6KoC7hxdObnFCIgacUX+YSvvWgAdsm5plkvz6tIQRdzmt7kyJxYLRtxOPI0+985EgYMhTpyVIxgoA2Qn1G9aUyWuGczovezrI0M3EtSsdVBqkdrDZZf1eRDh3NTzEn5jms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JuUfbvHa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hoyQW1R6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ILGDQ+s5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tXyED2Mt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JuUfbvHa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hoyQW1R6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ILGDQ+s5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tXyED2Mt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 773151F393;
	Fri, 28 Mar 2025 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743169445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RPFJ48KGhj+KLQfNV2vcV9VmybTFElBFEvbSzstMz6s=;
	b=JuUfbvHaGkhkztddcu2fNDh3YaPbvIi4vT6YGx3weJMaP4SBCmYJY3KgsFz1rYcPzLn4h5
	1A008jUcNrFz5GoJ6+bk/zZ/ccCJqvEpd0tpi28dhLa3vW0Vt5RAQb//X0pD83yZYpKClN
	Q0BlQQvN5npevLG9AacPS7rzUUZKEW0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743169445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RPFJ48KGhj+KLQfNV2vcV9VmybTFElBFEvbSzstMz6s=;
	b=hoyQW1R6w57i2iyKKdRG4CSQwR0Fmb93Fi3ldKqT+jGHizxIrRNxPjtTb1qQLEAv5kPrr+
	XCtvtDRSt0sSywBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743169444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RPFJ48KGhj+KLQfNV2vcV9VmybTFElBFEvbSzstMz6s=;
	b=ILGDQ+s5aFSxuJgmLwSDuTaCbtCvaog1dRvtbFWfMwHFKle3P9YG9QqPYGRspDndkhah8v
	QapLZwkqFcLu2G+H2oRbOn0czg8Zns4OV/jgLpF7q9K3KZ+svuBx19UtHjQFh9TNc0PzwJ
	rQBqwo5AGk2h/lH2/NE2NEXZrVYKf10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743169444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RPFJ48KGhj+KLQfNV2vcV9VmybTFElBFEvbSzstMz6s=;
	b=tXyED2Mt41nU7CApnPuzn274TowRhNfJexvhWwixUxgCh0BcfNb1UnWgfcd/wxLHeRU9QA
	XwwVUuas1HdYL2AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20599139D4;
	Fri, 28 Mar 2025 13:44:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P2kdBaSn5mexaAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 28 Mar 2025 13:44:04 +0000
Date: Fri, 28 Mar 2025 14:44:02 +0100
From: Oscar Salvador <osalvador@suse.de>
To: wangchuanguo <wangchuanguo@inspur.com>
Cc: akpm@linux-foundation.org, mhiramat@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: migrate: restore the nmask after successfully
 allocating on the  target node
Message-ID: <Z-anohhuNGiQ7kib@localhost.localdomain>
References: <20250326031218.487450-1-wangchuanguo@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326031218.487450-1-wangchuanguo@inspur.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, Mar 26, 2025 at 11:12:18AM +0800, wangchuanguo wrote:
> If memory is successfully allocated on the target node and the
> function directly returns without value restore for nmask,
> non-first migration operations in migrate_pages() by again label
> may ignore the nmask settings, thereby allowing new memory
> allocations for migration on any node.
> 
> Signed-off-by: wangchuanguo <wangchuanguo@inspur.com>

Unless I am missing something this looks reasonable, but I whonder why nobody
noticed it before.
It is a path that should be pretty exercised.


-- 
Oscar Salvador
SUSE Labs
