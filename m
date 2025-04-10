Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123B628CF46
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294392; cv=none; b=Aaw8hhR70UCshN8eqVWH/2j5RMWgIUY/36M66EO5JlygDmAHQPRka3zhRzRf6oX03SIGwccAyTtxRkTSzTxfPEVQ6kBbniTTgqKqV1G6doLNsKbe+kHDqzVYRkrKIt5g3j08VPPUYF0wdAtWTDTWsCXmn/vbXD9k4VV9q/41QUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294392; c=relaxed/simple;
	bh=XaPItLZIAiNFJonAW7dS4W5GjuIidEVHMY59hr2oACA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rtjhu/NPg/+H4behks38r4/m6hw+sYch1cbdTEFPWziOhQPpmOu3GCxrmjrFa5AKEdmBJzk2mIP+Ox1Umm+RG79TC4wYl7/vPdzkUgovMIGuZhtdp1GciRTNadi+QvzlFoKVxQcjGnCQlLXozrYyefphVeQAQS6xZqDIVa8Hnx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=inkbw2GZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F7mwxsTy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=inkbw2GZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F7mwxsTy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="inkbw2GZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F7mwxsTy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="inkbw2GZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F7mwxsTy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 165FC1F444;
	Thu, 10 Apr 2025 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744294389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AL2WDE7+c3ZZTaiHGqzl9biXY7f/SObq+Ng9E0nbdDQ=;
	b=inkbw2GZcnIuOPbqXOmppbdnUVDD1uiAKH+eq+jb0utaR7AMq+llb1Xpgf6b/SOTD3ymq7
	k+HnLvzpKgRLAZlNnY4uVyQ4gPZ3HyVMw6OOKuCPG3N5fBx9UCl8Shx+6Zl2Xyp1oC6Hht
	dlnPKR0Qi5pMEhG6HyFGEdoFWSbHlsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744294389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AL2WDE7+c3ZZTaiHGqzl9biXY7f/SObq+Ng9E0nbdDQ=;
	b=F7mwxsTy2J8hH3xQHNjvBQgbjYlP+kro1kA88zKAq6MAjmnxI7ZAuASW8p/eBCVhse0wHx
	qnS4ZTsIxbwxS7DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=inkbw2GZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=F7mwxsTy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744294389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AL2WDE7+c3ZZTaiHGqzl9biXY7f/SObq+Ng9E0nbdDQ=;
	b=inkbw2GZcnIuOPbqXOmppbdnUVDD1uiAKH+eq+jb0utaR7AMq+llb1Xpgf6b/SOTD3ymq7
	k+HnLvzpKgRLAZlNnY4uVyQ4gPZ3HyVMw6OOKuCPG3N5fBx9UCl8Shx+6Zl2Xyp1oC6Hht
	dlnPKR0Qi5pMEhG6HyFGEdoFWSbHlsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744294389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AL2WDE7+c3ZZTaiHGqzl9biXY7f/SObq+Ng9E0nbdDQ=;
	b=F7mwxsTy2J8hH3xQHNjvBQgbjYlP+kro1kA88zKAq6MAjmnxI7ZAuASW8p/eBCVhse0wHx
	qnS4ZTsIxbwxS7DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A6AA132D8;
	Thu, 10 Apr 2025 14:13:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v1s6F/TR92dxdgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 10 Apr 2025 14:13:08 +0000
Date: Thu, 10 Apr 2025 16:12:57 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, adityag@linux.ibm.com,
	donettom@linux.ibm.com, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, akpm@linux-foundation.org,
	shan.gavin@gmail.com
Subject: Re: [PATCH] drivers/base/memory: Avoid overhead from
 for_each_present_section_nr()
Message-ID: <Z_fR6c4o1V57ZAXR@localhost.localdomain>
References: <20250410125110.1232329-1-gshan@redhat.com>
 <9deb3725-8991-43d1-8c3d-56523fabff28@redhat.com>
 <Z_fNx7hTOR8St0SM@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_fNx7hTOR8St0SM@localhost.localdomain>
X-Rspamd-Queue-Id: 165FC1F444
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,linux.ibm.com,linuxfoundation.org,kernel.org,linux-foundation.org,gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,localhost.localdomain:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

On Thu, Apr 10, 2025 at 03:55:19PM +0200, Oscar Salvador wrote:
> All in all, I think we are better, and the code is slightly simpler?

One thing to notice is that maybe we could further improve and leap 'nr'
by the number of sections_per_block, so in those scenarios where
a memory-block spans multiple sections this could be faster?

Just a thought, and maybe not worth it.
In the end, we have payed more than once the price of trying to be too smart
wrt. sections and boot tricks :-).


-- 
Oscar Salvador
SUSE Labs
