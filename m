Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965D61DDC2B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837630; cv=none; b=LERBoYZmIfqNp6c2UaXawfWQbBmM+rFyvClz8Oqw0j1qrkpfNr7xh3j+Vo9avkEO8C5X+qb1rIoxeK/ADozalI+SgY2d3DrfcLH6tkdR/ASKtySr/GJ2qaI3D5+4TmtaaPiA6pcel8uCtv0V3M2fGB+TZrO0ExsVu5fWYEcFv8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837630; c=relaxed/simple;
	bh=pn/35gFDzOSiQJ8LPN+YOKlhW3YpM/SDZq+Drrb4WqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZsPN6AK/itO29jDCxY4xWwVkbmCe3EGqtwax8vvFy6IFyxFjiCuE+b55ueW7js3VFOa1fOEUv7SHrsasBvuv2mwEeIO/80yrguMV6EBYZP8lH9cPyou5NDLeclJH/o3bec46qiwfHMmT7YD0dIbJTqnwxtVjwRmE+eDqpmAI7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J3hP/wg2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5GJs08+D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J3hP/wg2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5GJs08+D; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J3hP/wg2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5GJs08+D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J3hP/wg2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5GJs08+D"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9B0041F46E;
	Wed, 25 Jun 2025 07:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750837626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xXBBfsUS9fR2aHzH67qrOpQB4aEBWcIW7pc74y0G3ko=;
	b=J3hP/wg2DtUmHbzhBcleJhBGGMT+cIygOuxZatABluAZ+iMg57GWCgo2lc2noN9jIZDq7y
	8UTpzonVJ1hsxJsivPUb4PCfCOTYJUg8EdOUliiGKNTB7vqFo9byLbU/V0rX+JB+J1ewMT
	iWfXBwO3+SkxEEcLE1Dam89bfF0uy8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750837626;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xXBBfsUS9fR2aHzH67qrOpQB4aEBWcIW7pc74y0G3ko=;
	b=5GJs08+DbL47sC4bdxSR9Vwy6LwjY0OggjIFdXpD3fQ8qsN5pFe62PFhAw+Xl5/9tdYBgf
	b0aFxB/nKXUEiZCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750837626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xXBBfsUS9fR2aHzH67qrOpQB4aEBWcIW7pc74y0G3ko=;
	b=J3hP/wg2DtUmHbzhBcleJhBGGMT+cIygOuxZatABluAZ+iMg57GWCgo2lc2noN9jIZDq7y
	8UTpzonVJ1hsxJsivPUb4PCfCOTYJUg8EdOUliiGKNTB7vqFo9byLbU/V0rX+JB+J1ewMT
	iWfXBwO3+SkxEEcLE1Dam89bfF0uy8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750837626;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xXBBfsUS9fR2aHzH67qrOpQB4aEBWcIW7pc74y0G3ko=;
	b=5GJs08+DbL47sC4bdxSR9Vwy6LwjY0OggjIFdXpD3fQ8qsN5pFe62PFhAw+Xl5/9tdYBgf
	b0aFxB/nKXUEiZCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 308A713301;
	Wed, 25 Jun 2025 07:47:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3REgCXqpW2jNEAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 25 Jun 2025 07:47:06 +0000
Date: Wed, 25 Jun 2025 09:47:00 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] mm,hugetlb: Sort out folio locking in the
 faulting path
Message-ID: <aFupdJ_ky4wT6wGM@localhost.localdomain>
References: <20250620123014.29748-1-osalvador@suse.de>
 <20250620123014.29748-3-osalvador@suse.de>
 <35b03911-74c3-4626-aaa8-4c331c086f8f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35b03911-74c3-4626-aaa8-4c331c086f8f@redhat.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 

On Mon, Jun 23, 2025 at 04:11:38PM +0200, David Hildenbrand wrote:
> > @@ -6801,13 +6810,24 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
> >   		/* Fallthrough to CoW */
> >   	}
> > -	/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
> > -	folio = page_folio(pte_page(vmf.orig_pte));
> > -	folio_lock(folio);
> > -	folio_get(folio);
> > -
> >   	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
> >   		if (!huge_pte_write(vmf.orig_pte)) {
> > +			/*
> > +			 * Anonymous folios need to be lock since hugetlb_wp()
> > +			 * checks whether we can re-use the folio exclusively
> > +			 * for us in case we are the only user of it.
> > +			 */
> 
> Should we move that comment to hugetlb_wp() instead? And if we are already
> doing this PTL unlock dance now, why not do it in hugetlb_wp() instead so we
> can simplify this code?

Yes, probably we can move it further up.
Let me see how it would look.

thanks! 

-- 
Oscar Salvador
SUSE Labs
