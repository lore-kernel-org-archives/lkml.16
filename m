Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6457C1E9B0B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999921; cv=none; b=ung97aREuXXPN0rPpJQkJrEIXL/mlC9xhEiwaJRwsn38VnLEjZcW1grkBX4nsNCyKpaWtibCxsBaS3p5UY4Soy4qls7HpdjzLXY4kLf73N4Nn94vZclohWdy5r7f8MWyuNa5RC8hbGjAmvZYP3AFg08E51EBgAds9ML+4CML6f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999921; c=relaxed/simple;
	bh=A5bs3Y0HgnKMZO9n6N0qe8Dj9r0Ew2s+T0UNo6/pnOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyTCNCuZCKf2jhIAj7TaX46Wpcd0SeObysfm0e3cZckf/Gj7OsODKyS0CyFKIaSsfCb/eY9eyWsET/AdGbDqB0XrZJlEzNgiHL7uch4JWwNE9EU27KUKWuUSI3Vp24a3nFs3LVs3QTelyEFbutXAVzRHzWJNPx2Js6iKV5lE0zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yz/8EJox; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R5NEXsyn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yz/8EJox; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R5NEXsyn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yz/8EJox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R5NEXsyn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yz/8EJox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R5NEXsyn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7633D1F7C3;
	Wed, 30 Apr 2025 07:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745999917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K+M0v88wXkTO2lfW07pgxE5E1/OLEgDm+uJTK9nmId0=;
	b=yz/8EJoxTd6DvEU+JcHbFqvWeP7IgDWih8frOXqGghRnE/VQPlcNXPr7vlDWJav7nODC0x
	MGFpeVCeyQ7lF4l22EGW28vzISTN0pvvr2JfxFZhMUKzovRvI3B2ioi0o4/bZJh1bghJ1a
	bTFNx9GxBWngadWdHOg1LecNwNRWVWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745999917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K+M0v88wXkTO2lfW07pgxE5E1/OLEgDm+uJTK9nmId0=;
	b=R5NEXsynJ53+34V2g4jOsXv0bPItofkgVGow2tQZV7g4U1KiMX67x/EksZ/2U9O/2ehm77
	5q3SIHs/EzgfPKBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="yz/8EJox";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R5NEXsyn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745999917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K+M0v88wXkTO2lfW07pgxE5E1/OLEgDm+uJTK9nmId0=;
	b=yz/8EJoxTd6DvEU+JcHbFqvWeP7IgDWih8frOXqGghRnE/VQPlcNXPr7vlDWJav7nODC0x
	MGFpeVCeyQ7lF4l22EGW28vzISTN0pvvr2JfxFZhMUKzovRvI3B2ioi0o4/bZJh1bghJ1a
	bTFNx9GxBWngadWdHOg1LecNwNRWVWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745999917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K+M0v88wXkTO2lfW07pgxE5E1/OLEgDm+uJTK9nmId0=;
	b=R5NEXsynJ53+34V2g4jOsXv0bPItofkgVGow2tQZV7g4U1KiMX67x/EksZ/2U9O/2ehm77
	5q3SIHs/EzgfPKBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D042B139E7;
	Wed, 30 Apr 2025 07:58:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oZhDMCzYEWgwBwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 30 Apr 2025 07:58:36 +0000
Date: Wed, 30 Apr 2025 09:58:35 +0200
From: Oscar Salvador <osalvador@suse.de>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, willy@infradead.org, mcgrof@kernel.org,
	a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Fan Ni <fan.ni@samsung.com>
Subject: Re: [PATCH v3 3/4] mm/hugetlb: Refactor __unmap_hugepage_range() to
 take folio instead of page
Message-ID: <aBHYK3mqUyvqrGm2@localhost.localdomain>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428171608.21111-6-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428171608.21111-6-nifan.cxl@gmail.com>
X-Rspamd-Queue-Id: 7633D1F7C3
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim,samsung.com:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, Apr 28, 2025 at 10:11:46AM -0700, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function __unmap_hugepage_range() has two kinds of users:
> 1) unmap_hugepage_range(), which passes in the head page of a folio.
>    Since unmap_hugepage_range() already takes folio and there are no other
>    uses of the folio struct in the function, it is natural for
>    __unmap_hugepage_range() to take folio also.
> 2) All other uses, which pass in NULL pointer.
> 
> In both cases, we can pass in folio. Refactor __unmap_hugepage_range() to
> take folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

But:

>  void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  			    unsigned long start, unsigned long end,
> -			    struct page *ref_page, zap_flags_t zap_flags)
> +			    struct folio *folio, zap_flags_t zap_flags)

I think we are kinda losing information here. ref_ was a good hint
and...

>  	struct mm_struct *mm = vma->vm_mm;
>  	unsigned long address;
> @@ -5885,8 +5885,8 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  		 * page is being unmapped, not a range. Ensure the page we
>  		 * are about to unmap is the actual page of interest.
>  		 */
> -		if (ref_page) {
> -			if (page != ref_page) {
> +		if (folio) {
> +			if (page_folio(page) != folio) {

You have to update the comment above, since we are not passing a
reference page anymore but a folio.

 

-- 
Oscar Salvador
SUSE Labs
