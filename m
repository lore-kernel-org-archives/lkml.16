Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F537259C93
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184490; cv=none; b=hl/H+QeSlZojocP4zsAIs9t2H086RhRouvzksPuNUQY2eI0xZgx+ITkwJ2oiPbbuypiLvzNYGy/DgMz4qDmvlB3hT0XA1/UUc3e6/aXDGVf84HLdE/+i5cl4q1SDAtEzfZnQ0OZR+CNJ4kjy/1tsLUTgaeMDbtsiHV8Ktj5gGxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184490; c=relaxed/simple;
	bh=kuHaskm0sbPLXwPWBIXRwW7j/3b3EklZ2RezsWy7vlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRAuF6QfgI7C5WTmKAms0crHo7tE/LCocHZJsYgEBXCrvaUWXW7faflAYiLhjSvO4Kyo26FAjOSAEKU5qhr8hm19F6Oe63/9SOfubAZIMIYCXA2zgjNJyfDD70Y+63sKoAjMfjIJZhKFE9juWDRWyfVWV2Ad3LAkP9LEsV9pjXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yEoD99sS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z2tZeSSn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yEoD99sS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z2tZeSSn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yEoD99sS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z2tZeSSn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yEoD99sS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z2tZeSSn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 386F02116D;
	Wed,  9 Apr 2025 07:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744184487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YVUe0LBj9tIZhcK6wpqm47n/qetJLVQlWCDI8cAovT0=;
	b=yEoD99sS5RRQUUFVfTiN/xiaHNFSJQS3HrgFB//jH/Ik2v0SwaHhCCDkuYqU/cxGNQKEGv
	eliB+c6tEuWT/OqyuNd/oIxWmfp7y1He2SS03FD1X9+/qLdDg7JVjL8tR3/rxTasrWZyV7
	/TsiAvv1P3JwPYigpbOJQgz2OIC9Hgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744184487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YVUe0LBj9tIZhcK6wpqm47n/qetJLVQlWCDI8cAovT0=;
	b=Z2tZeSSnKBCjV/RrU7xtpOYnKd+8bRu18I+E7t5nIYUOSOBCcFfPSYTsJojlmcTIawmhi+
	z1y1LEGG8aW9OAAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yEoD99sS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Z2tZeSSn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744184487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YVUe0LBj9tIZhcK6wpqm47n/qetJLVQlWCDI8cAovT0=;
	b=yEoD99sS5RRQUUFVfTiN/xiaHNFSJQS3HrgFB//jH/Ik2v0SwaHhCCDkuYqU/cxGNQKEGv
	eliB+c6tEuWT/OqyuNd/oIxWmfp7y1He2SS03FD1X9+/qLdDg7JVjL8tR3/rxTasrWZyV7
	/TsiAvv1P3JwPYigpbOJQgz2OIC9Hgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744184487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YVUe0LBj9tIZhcK6wpqm47n/qetJLVQlWCDI8cAovT0=;
	b=Z2tZeSSnKBCjV/RrU7xtpOYnKd+8bRu18I+E7t5nIYUOSOBCcFfPSYTsJojlmcTIawmhi+
	z1y1LEGG8aW9OAAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7191137AC;
	Wed,  9 Apr 2025 07:41:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TsQDKqYk9mciTwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 09 Apr 2025 07:41:26 +0000
Date: Wed, 9 Apr 2025 09:41:25 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Frank van der Linden <fvdl@google.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, david@redhat.com, luizcap@redhat.com
Subject: Re: [PATCH] mm/hugetlb: use separate nodemask for bootmem allocations
Message-ID: <Z_YkpQ37w9QIpBZh@localhost.localdomain>
References: <20250402205613.3086864-1-fvdl@google.com>
 <Z_Uqiu75bXhqpwm4@localhost.localdomain>
 <CAPTztWZCEvgoy-s553nTcd_qyRknaEcw3OU56H_kfePHzi3WdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPTztWZCEvgoy-s553nTcd_qyRknaEcw3OU56H_kfePHzi3WdA@mail.gmail.com>
X-Rspamd-Queue-Id: 386F02116D
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Tue, Apr 08, 2025 at 08:48:33AM -0700, Frank van der Linden wrote:
> next_nid_to_alloc is used to remember the last node that was allocated
> from in __alloc_bootmem_huge_page(), so that the next call will
> continue at the node after the one that was successfully allocated
> from. The code there looks a bit confusing, since the macro
> for_each_node_mask_to_alloc is used there not really as a for loop,
> but simply as a way of saying "try this node and remember the next
> one".

Yes, this makes sense, thanks for explaining Frank :-)


-- 
Oscar Salvador
SUSE Labs
