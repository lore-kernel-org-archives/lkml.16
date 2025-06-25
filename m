Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC30820C038
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837407; cv=none; b=jrTxIaXUsemj+tN8MQRQd0drCPElzG4fB6i094lHUj1YH8tWuWHaHsl50gKsC4NEOHRc+8PiCeWz8nbly+DQ44/syoDMAPOQ/Soa2gGY1u82ElPZ5Vo0bYr3+yIjXh63r5muaUXznGRAelDG6ne3BFNb9Xp6p0SpWKkW6i6gi9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837407; c=relaxed/simple;
	bh=Fio2FSArnCcgo7shE/aKbg9RoXEubCUqkEwTyQ15U+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSQ40/n3D3LZJwq93tbagYKkdG87nw5dULNLKayms+bnmL219GSphUKJtuOOtbRfYQXA2nOpSJJG3lJpBLv1ZXnyiERPhQhkI3jaEvhBJaiHVtVhBlt9Mdz7LDCiGcIvzTxb96xlUtpkajy1/w8Eyc9XTKjZHG5urj8TwuQImmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FfSWVFIx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2Z/DsRZT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FfSWVFIx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2Z/DsRZT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FfSWVFIx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Z/DsRZT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FfSWVFIx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Z/DsRZT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C7ECE2118D;
	Wed, 25 Jun 2025 07:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750837403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ebHyLuUK14qItIBQuWhot/BcmESBtVunMH4Kh6YCI1Y=;
	b=FfSWVFIx62fpcU15mEohvf5Ig24z1aCRrNGa8X3vyNxmv5pCI09VY2AxtQEn7Zb2p72gM5
	LwjLKmyYzhVQG1r5MYTbZVWp+v8xhOvrDHwBsvoqno6aG2aRp0Jw1GoKL8S2lkO2y8LZrw
	nYexw9AiOfaSBeORz4X9TP/gnHurlcc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750837403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ebHyLuUK14qItIBQuWhot/BcmESBtVunMH4Kh6YCI1Y=;
	b=2Z/DsRZTh84cpG9jVAxL0XIMiRRioil1FzUBfjpEoa0BvQ9GlwY+zFLUxJa+EF40zGKTlu
	YQFN24joKhyGQsAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FfSWVFIx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="2Z/DsRZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750837403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ebHyLuUK14qItIBQuWhot/BcmESBtVunMH4Kh6YCI1Y=;
	b=FfSWVFIx62fpcU15mEohvf5Ig24z1aCRrNGa8X3vyNxmv5pCI09VY2AxtQEn7Zb2p72gM5
	LwjLKmyYzhVQG1r5MYTbZVWp+v8xhOvrDHwBsvoqno6aG2aRp0Jw1GoKL8S2lkO2y8LZrw
	nYexw9AiOfaSBeORz4X9TP/gnHurlcc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750837403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ebHyLuUK14qItIBQuWhot/BcmESBtVunMH4Kh6YCI1Y=;
	b=2Z/DsRZTh84cpG9jVAxL0XIMiRRioil1FzUBfjpEoa0BvQ9GlwY+zFLUxJa+EF40zGKTlu
	YQFN24joKhyGQsAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DB6C13301;
	Wed, 25 Jun 2025 07:43:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sw0XFJuoW2h8DwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 25 Jun 2025 07:43:23 +0000
Date: Wed, 25 Jun 2025 09:43:21 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] mm,hugetlb: Rename anon_rmap to new_anon_folio
 and make it boolean
Message-ID: <aFuomf97EUK2YJDJ@localhost.localdomain>
References: <20250620123014.29748-1-osalvador@suse.de>
 <20250620123014.29748-4-osalvador@suse.de>
 <7f8ac35d-89f0-41e7-acfb-bcf54991612e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f8ac35d-89f0-41e7-acfb-bcf54991612e@redhat.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C7ECE2118D
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
X-Spam-Level: 

On Mon, Jun 23, 2025 at 04:13:17PM +0200, David Hildenbrand wrote:
> > -	if (new_folio && !new_pagecache_folio)
> > +	/* We only need to restore reservations for private mappings */
> > +	if (new_folio && new_anon_folio)
> 
> Could this be simplified to
> 
> if (new_anon_folio) {

Yes, definitely, will do in the next version.

 

-- 
Oscar Salvador
SUSE Labs
