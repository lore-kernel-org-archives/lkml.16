Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9031917E7
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 18:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744570251; cv=none; b=dMoDryOH+OyjWZmVvqbySZ29RDe4tqrxEUheahGOvBKiOUAM/MllpK4nHEZExedVrG+LXayA1gYbm/B6RyjwVfM3hKooweTTXzEFut1g+FrTPFnTVBd6JsYY3bjmewnj8PEOcCO2YIbMCx+yclsu5l2PQteS31cujZLldPUvjWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744570251; c=relaxed/simple;
	bh=7VkMY4A2RA+WBaYHlXbzoMn0yufRxuc2KfGpdbmfU2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gwd/FO36IrCQKjWSt8ldWyb4cRJgCr9KYzFHawbkJq2xLgtwo0Wle2DQxzpvZ1rJcHZ3xaPNrasCMYfVz0xlnkWKhD1ut8eX72c6l5dxeFLBhmTJLDx31jst3Hn9/JLllouvo+Q/Bb23NsPjBD9uQin2MNvcKiDItgCHSuNFfII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fKqszuzf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X2nNtRfl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fKqszuzf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X2nNtRfl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fKqszuzf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X2nNtRfl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fKqszuzf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X2nNtRfl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 830281F394;
	Sun, 13 Apr 2025 18:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744570240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wWMq+5HNuIt5gXVuWs3Yv4+oEPokSbGiAH9IK2R14Ts=;
	b=fKqszuzfUo06c/jLz6cF82pBzSfUTfluThJO4Lkbs3Ss29BFlAWQRhgR0ROKReBgo+bjdP
	pnWkaPDtUfozKqjxZisvZHHLdL6Lo1GP1PqeXZp/MOiDcA8/Rc7+j+ok1TveXDjDyApp8g
	TSLqv1z754sXvGvixgF/pOOLjfYtNxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744570240;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wWMq+5HNuIt5gXVuWs3Yv4+oEPokSbGiAH9IK2R14Ts=;
	b=X2nNtRfl0tc/0O4hkgySTFRN05kleZFxtoX7yLXB8v/ahthIF4dgjUfUwyejPJzBjqeuvE
	HFDrsCFauWSeJ5CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fKqszuzf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=X2nNtRfl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744570240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wWMq+5HNuIt5gXVuWs3Yv4+oEPokSbGiAH9IK2R14Ts=;
	b=fKqszuzfUo06c/jLz6cF82pBzSfUTfluThJO4Lkbs3Ss29BFlAWQRhgR0ROKReBgo+bjdP
	pnWkaPDtUfozKqjxZisvZHHLdL6Lo1GP1PqeXZp/MOiDcA8/Rc7+j+ok1TveXDjDyApp8g
	TSLqv1z754sXvGvixgF/pOOLjfYtNxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744570240;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wWMq+5HNuIt5gXVuWs3Yv4+oEPokSbGiAH9IK2R14Ts=;
	b=X2nNtRfl0tc/0O4hkgySTFRN05kleZFxtoX7yLXB8v/ahthIF4dgjUfUwyejPJzBjqeuvE
	HFDrsCFauWSeJ5CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 115BF137C0;
	Sun, 13 Apr 2025 18:50:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mOzSAIAH/GcbWQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Sun, 13 Apr 2025 18:50:40 +0000
Date: Sun, 13 Apr 2025 20:50:31 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Matthew Wilcox <willy@infradead.org>
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm,hugetlb: Allocate frozen pages in
 alloc_buddy_hugetlb_folio
Message-ID: <Z_wHd1Cfsn1OyMU8@localhost.localdomain>
References: <20250411132359.312708-1-osalvador@suse.de>
 <f0373427-b4e8-4612-b668-980d93febe26@redhat.com>
 <Z_kldseGr033Hqny@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_kldseGr033Hqny@casper.infradead.org>
X-Rspamd-Queue-Id: 830281F394
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Fri, Apr 11, 2025 at 03:21:42PM +0100, Matthew Wilcox wrote:
> Oscar, if you want to take on the gigantic allocation next ...
> 
>  - I don't think we need folio_alloc_gigantic() to be wrapped in
>    alloc_hooks
>  - folio_alloc_gigantic() should return a frozen folio
>  - as should hugetlb_cma_alloc_folio()

Yeah, I was taking a look at that as well.
I plan to tackle it in a few days.


-- 
Oscar Salvador
SUSE Labs
