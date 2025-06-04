Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80F128D8C5
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749041045; cv=none; b=p1OUVFedHE9dDxSAL5ssd9Vf1+/nTqIKZ0TnKmDoeQfxMdhOTWDC2x22/GsSTKHdDOG8gNbO3Ii+7y1tOgu/DhUd5DTaYfMTi7Yc30B+DvWoO7+qJ6BnCPabjo/AVh9o1zm8JoSLznCcsvr8OUv6C+PiOhhfeC1yT6BBYuU6eog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749041045; c=relaxed/simple;
	bh=DtJJ+9PwKO//7uayEv6jnuC0oRYmGm3D6FieBnUN2K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLeDIt3QkPzgVfeNfW0VVyD/J3zG9WE+rwmI+6eIkrtNiquWq94jUGl9oPap0p36+r0EINoPKqZU9tbOc2wMRNKnvhi2vsQJvTdiVc5grWklbSqSwCo7oii/jckyo/B9WmSGjIQBnk86wSJN9sPPAkgO8d+lmRvPRL7oQSgURDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IcOf3EWo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p04YYldN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IcOf3EWo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p04YYldN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IcOf3EWo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p04YYldN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IcOf3EWo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p04YYldN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A90C82123D;
	Wed,  4 Jun 2025 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749041041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=im3r5Zh1u+5gCVjUWa8hcLEV/Y5bfG/UMN+4ZEhBTvc=;
	b=IcOf3EWogi09alHNv9zuMRSG5ALXwNS/bfRWi5gUBIfuKgqXPwVOqMG0IH55IwiEzwVKUa
	lFUZf6OMScHFwxE+JbxCEAu5rExS8qrobGhuT0m0yN5rK2x2Dp0RHde258E6WmuHVek0XJ
	GwrOnZq+96RmBk4pdyQPfyvYqVa7+L8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749041041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=im3r5Zh1u+5gCVjUWa8hcLEV/Y5bfG/UMN+4ZEhBTvc=;
	b=p04YYldNlnTL6/rR+IgOoeW7ROTl8T6cR+fKv8E+KWHWnT1x9kUkmshSX8CHsEf0ULa40m
	NR6br2O03j7mXVBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IcOf3EWo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=p04YYldN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749041041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=im3r5Zh1u+5gCVjUWa8hcLEV/Y5bfG/UMN+4ZEhBTvc=;
	b=IcOf3EWogi09alHNv9zuMRSG5ALXwNS/bfRWi5gUBIfuKgqXPwVOqMG0IH55IwiEzwVKUa
	lFUZf6OMScHFwxE+JbxCEAu5rExS8qrobGhuT0m0yN5rK2x2Dp0RHde258E6WmuHVek0XJ
	GwrOnZq+96RmBk4pdyQPfyvYqVa7+L8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749041041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=im3r5Zh1u+5gCVjUWa8hcLEV/Y5bfG/UMN+4ZEhBTvc=;
	b=p04YYldNlnTL6/rR+IgOoeW7ROTl8T6cR+fKv8E+KWHWnT1x9kUkmshSX8CHsEf0ULa40m
	NR6br2O03j7mXVBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC4491369A;
	Wed,  4 Jun 2025 12:44:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LY1VJ5A/QGjkUwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 04 Jun 2025 12:44:00 +0000
Date: Wed, 4 Jun 2025 14:43:59 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Zi Yan <ziy@nvidia.com>
Cc: david@redhat.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org,
	isaacmanjarres@google.com, jyescas@google.com,
	kaleshsingh@google.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com,
	masahiroy@kernel.org, mhocko@suse.com, minchan@kernel.org,
	rppt@kernel.org, surenb@google.com, tjmercier@google.com,
	vbabka@suse.cz
Subject: Re: [PATCH] mm: rename CONFIG_PAGE_BLOCK_ORDER to
 CONFIG_PAGE_BLOCK_ORDER_CEIL.
Message-ID: <aEA_j-OAwAfAchQf@localhost.localdomain>
References: <20250603154843.1565239-1-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603154843.1565239-1-ziy@nvidia.com>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A90C82123D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On Tue, Jun 03, 2025 at 11:48:43AM -0400, Zi Yan wrote:
> The config is in fact an additional upper limit of pageblock_order, so
> rename it to avoid confusion.
> 
> Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")
> Signed-off-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
