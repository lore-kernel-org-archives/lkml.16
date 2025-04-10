Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605721EDA39
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274763; cv=none; b=LMkpUToDw6Mrq6z7uHI10ICicfD66Dtn7VDUpJfMZvVD3YuQweH/grwCXIphVnuRbIY7VN0ugW5+AH4BnqjPJLJKBEXbe3jGOLE69exd6xC9cjCl8TUXzfo9y6tc79T68v3EBVhAAwoWE4Ey016rVgBJk4MozGdtwb5yTYvenSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274763; c=relaxed/simple;
	bh=/No0HjmKt3z/NFMhw9zbwnjT7HIkNQdjRffEMWsruJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuGG7yNb+lxuek8N3jUYHJmKlFpy+Qxjt50QQQWlT39qeaAVrdNHz8dQTdBXzbbs2PYpTdVXSTnULv8DgTlLyAxrgDlWaLKU9MtxiblkiGlOOE+fUhwLBBFL1HpdaGh95H86KBh2lnkyokLF8tGYi/6kzGc6JqrSLFiC9SEkrPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v8iZtKGj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qhXswKEx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MMJ8QTFt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iWhGRnOd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v8iZtKGj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qhXswKEx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MMJ8QTFt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iWhGRnOd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E7BB41F385;
	Thu, 10 Apr 2025 08:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744274753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I/xIZNB+1S7HSx+9HZ/N45M0iCLSgjCcL+f6rMf2PbM=;
	b=v8iZtKGjm2h6qTW/UDmWhsU8gPq+/l0OqSkt5XYJa1wrt8J7NRVhBzj7x8oPrtxRsrwKD+
	nrt2vxq1IZ0tJlEsWkaMBbW48v9NQTXr2AjtjAyvyFQwXjRMc4KhfQcbwW0Cl5zZLF9Eyw
	FMkkFjIzq2Nn6UNAUBS1tEBthR6Akz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744274753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I/xIZNB+1S7HSx+9HZ/N45M0iCLSgjCcL+f6rMf2PbM=;
	b=qhXswKExiTam3yfYiv+XJJyFIQQKz3HO8/w4yW/fvf1Ru1npdXgE934NwIwJhVqUOsD02G
	K2DAHODEfz6EizBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MMJ8QTFt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iWhGRnOd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744274751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I/xIZNB+1S7HSx+9HZ/N45M0iCLSgjCcL+f6rMf2PbM=;
	b=MMJ8QTFtfH99zahH+bSvDXiN8HeWxfUr2UH2piT6PJ7Eua4FY5HSYIHVmGRSPQcTtmr8mP
	K5voZdaA7JUVW/bX49+iORKoJZZ76wDwJUJYF5IMmapme59ObiDMsIDoc+zT3D9YlpbAhA
	NnGxAPwaO/ydRpC/GjxtOrMDRTjRsHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744274751;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I/xIZNB+1S7HSx+9HZ/N45M0iCLSgjCcL+f6rMf2PbM=;
	b=iWhGRnOdLISa3M6u6GwrXRN5p5Jv1DoNyeLCNZ0Ta9sRn37B5aZ9wt++UxAuvZ7AaShzdR
	k+f/+IN6Sj1SlDCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C72613886;
	Thu, 10 Apr 2025 08:45:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YTo2Ej+F92fxDQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 10 Apr 2025 08:45:51 +0000
Date: Thu, 10 Apr 2025 10:45:49 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com,
	hannes@cmpxchg.org, 21cnbao@gmail.com, ryan.roberts@arm.com,
	ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: huge_memory: add folio_mark_accessed() when zapping
 file THP
Message-ID: <Z_eFPetk00AaFXem@localhost.localdomain>
References: <fc117f60d7b686f87067f36a0ef7cdbc3a78109c.1744190345.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc117f60d7b686f87067f36a0ef7cdbc3a78109c.1744190345.git.baolin.wang@linux.alibaba.com>
X-Rspamd-Queue-Id: E7BB41F385
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,redhat.com,cmpxchg.org,gmail.com,arm.com,nvidia.com,kvack.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alibaba.com:email,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, Apr 09, 2025 at 05:38:58PM +0800, Baolin Wang wrote:
> When investigating performance issues during file folio unmap, I noticed some
> behavioral differences in handling non-PMD-sized folios and PMD-sized folios.
> For non-PMD-sized file folios, it will call folio_mark_accessed() to mark the
> folio as having seen activity, but this is not done for PMD-sized folios.
> 
> This might not cause obvious issues, but a potential problem could be that,
> it might lead to reclaim hot file folios under memory pressure, as quoted
> from Johannes:
> 
> "
> Sometimes file contents are only accessed through relatively short-lived
> mappings. But they can nevertheless be accessed a lot and be hot. It's
> important to not lose that information on unmap, and end up kicking out a
> frequently used cache page.
> "
> 
> Therefore, we should also add folio_mark_accessed() for PMD-sized file
> folios when unmapping.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> Acked-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

Although I agree with David here that pmd_present would be more obvious than
flush_needed.
It was not obvious to be at first glance.

 

-- 
Oscar Salvador
SUSE Labs
