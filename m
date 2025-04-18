Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC08326FD8C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744965991; cv=none; b=GwCPUtRegg8jbCS/h2PNQ6LGY3Tw8hNAv52HFV7LsSu4xOYdYvN/TSIoleeE1aIc/TOSfwm97f4Tt05XEFZvT0EfhSmXjQmi7999LopNIMVZWc0jd6/Z2aGWhhfqvd4/97HL1YMUh0CTPlzRjsoKmag0o5ueqMfp2U1sXgNXCgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744965991; c=relaxed/simple;
	bh=UXAui8PSoN+tcCQIAgw467tqrz581u6GiUivBzLJ0U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boZF9RqgHbGzWE/BbMdeb95KOPr8MC23WW6voS5l64RbMNv4O7pUkZ3k2eQ94++xrTzijip+NLuU4Th8rd3v4X3qx1tdhCABMPg5DhrlmRD9cNURQn5d+/e9uWB+1uQS4ZHrotBbHehvOZnwzpDihoS50mbcPGuXnsYw+jQbHuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T3FYYYiJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gX4axkBs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T3FYYYiJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gX4axkBs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T3FYYYiJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gX4axkBs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T3FYYYiJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gX4axkBs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 528D71F74A;
	Fri, 18 Apr 2025 08:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744965981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5wdUlcaGLNsNghYvAL7kfmJ/bZlynjprr5aMzitHMc8=;
	b=T3FYYYiJl0NGNNWzgoO5mvwYVfutq+m9Pse/zfQD1ndce/ixsHQ51ALzN17Mtg4qS7Hoio
	oTUdacBKtyzLfzERRmvKB+3y+r+nlkkCLzoofdKi2fKzkF8JRuTDE8JJtCxw9/1SW5NoqZ
	iao0aOYyleT+NnBfU8mNsC/C/aaxpUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744965981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5wdUlcaGLNsNghYvAL7kfmJ/bZlynjprr5aMzitHMc8=;
	b=gX4axkBsC2WW5RVYIdyOVlYvXKWEXi2/SpH7vaiZdoRUyKMcGs3cP1kzaLz7y+tRtkThPz
	Rz6L9LgAGhPtCDCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=T3FYYYiJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gX4axkBs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744965981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5wdUlcaGLNsNghYvAL7kfmJ/bZlynjprr5aMzitHMc8=;
	b=T3FYYYiJl0NGNNWzgoO5mvwYVfutq+m9Pse/zfQD1ndce/ixsHQ51ALzN17Mtg4qS7Hoio
	oTUdacBKtyzLfzERRmvKB+3y+r+nlkkCLzoofdKi2fKzkF8JRuTDE8JJtCxw9/1SW5NoqZ
	iao0aOYyleT+NnBfU8mNsC/C/aaxpUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744965981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5wdUlcaGLNsNghYvAL7kfmJ/bZlynjprr5aMzitHMc8=;
	b=gX4axkBsC2WW5RVYIdyOVlYvXKWEXi2/SpH7vaiZdoRUyKMcGs3cP1kzaLz7y+tRtkThPz
	Rz6L9LgAGhPtCDCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2F3313942;
	Fri, 18 Apr 2025 08:46:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5F9ZMFwRAmh7EgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 18 Apr 2025 08:46:20 +0000
Date: Fri, 18 Apr 2025 10:46:03 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Wupeng Ma <mawupeng1@huawei.com>, mike.kravetz@oracle.com,
	david@redhat.com, joshua.hahnjy@gmail.com, muchun.song@linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: Fix incorrect fallback for subpool
Message-ID: <aAIRSzTThAETw9BT@localhost.localdomain>
References: <20250410062633.3102457-1-mawupeng1@huawei.com>
 <20250417200327.ef9d1aed59e198aa2c8b046e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417200327.ef9d1aed59e198aa2c8b046e@linux-foundation.org>
X-Rspamd-Queue-Id: 528D71F74A
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[huawei.com,oracle.com,redhat.com,gmail.com,linux.dev,kvack.org,vger.kernel.org];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Apr 17, 2025 at 08:03:27PM -0700, Andrew Morton wrote:
> This has been in mm-hotfixes since April 1.  Do we have any reviwers?

Sorry, this slipped through the cracks.
I plan to review this but I will not ne able to do so until middle of
the next week.

 

-- 
Oscar Salvador
SUSE Labs
