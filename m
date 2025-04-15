Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7015A27A124
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704136; cv=none; b=g5YduppdvPvhJj3knaooF8TPgprcWHRfoVshvRp+jl1anXWC0Awec1VB2x2uBbb/pdJqk2E2MFXBqv0wKOs9NXE8GgG7SoXZo/FEjncDi7Zimd1dKHKNMfRahvac16XMALe8kHG2hI8KxpZcZqyxwWYikLcbKlBSt0lmArG9o8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704136; c=relaxed/simple;
	bh=ptIX0DTgA3RYibD3bO08qm0+082Je4Ii265f7nbrMoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7Gjt4VFKVsZWcrKJLNgQe/eyBVJ6Rn1gpP9zJbI9uNG7dpxaGqCxkfDrb961mPdOIPuAUD3L9awU21vdXYknUvplBFNiYJQRFRRdnOa0xgu54eoitSYI5UssFWaeOf/oh4/NgUMoc9qnJRT8As0b1KCyj5ChA7UZPid/QYBh5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yRpZxSbI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=x2WZbhdR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yRpZxSbI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=x2WZbhdR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yRpZxSbI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x2WZbhdR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yRpZxSbI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x2WZbhdR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6DD4E21171;
	Tue, 15 Apr 2025 08:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744704127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NdzThH7M/YnTsAvim5QLRl99y0NkF3bxcEaXgdfj7lY=;
	b=yRpZxSbI9BCiUPMoJ4MY0ghR4cyb1mNQVo4xHMXdoXw4VNMGiSkrCZF4pSu4r0pb+FL1Zg
	KZdWbth0wWjgD1DRTovusBIQWPQgQQbZaQWXaKoqjSGI4cDVS8/CEqy2kPGS7obQ83PXD4
	3RxXx8r/FV6WZpMhtO6xttCz89r1RxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744704127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NdzThH7M/YnTsAvim5QLRl99y0NkF3bxcEaXgdfj7lY=;
	b=x2WZbhdRrXXWvwliaKjo0j6dA2phX0bR0HLci0oGB7a6rk5RQ1Bmua7TPWzrqHsqupyIoV
	JgZ3vJ4n0mvkppCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744704127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NdzThH7M/YnTsAvim5QLRl99y0NkF3bxcEaXgdfj7lY=;
	b=yRpZxSbI9BCiUPMoJ4MY0ghR4cyb1mNQVo4xHMXdoXw4VNMGiSkrCZF4pSu4r0pb+FL1Zg
	KZdWbth0wWjgD1DRTovusBIQWPQgQQbZaQWXaKoqjSGI4cDVS8/CEqy2kPGS7obQ83PXD4
	3RxXx8r/FV6WZpMhtO6xttCz89r1RxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744704127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NdzThH7M/YnTsAvim5QLRl99y0NkF3bxcEaXgdfj7lY=;
	b=x2WZbhdRrXXWvwliaKjo0j6dA2phX0bR0HLci0oGB7a6rk5RQ1Bmua7TPWzrqHsqupyIoV
	JgZ3vJ4n0mvkppCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 036BB139A1;
	Tue, 15 Apr 2025 08:02:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id //2eOX4S/mfNOgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 15 Apr 2025 08:02:06 +0000
Date: Tue, 15 Apr 2025 10:02:01 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] mm, hugetlb: Reset mapping to TAIL_MAPPING before
 restoring vmemmap
Message-ID: <Z_4SeTicO-QuaGvc@localhost.localdomain>
References: <20250415054705.370412-1-osalvador@suse.de>
 <ab6d9bc7-4e6a-4604-9dca-44b13ce409b6@redhat.com>
 <a2447027-bc5f-461e-8fd8-93704dd543e4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2447027-bc5f-461e-8fd8-93704dd543e4@redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On Tue, Apr 15, 2025 at 09:32:40AM +0200, David Hildenbrand wrote:
> Ah, reading about the HVO hackery in the comment above NR_RESET_STRUCT_PAGE, might the following fix it?

Yap, I was experimenting in parallel with that after sending the patch
and it also fixes the issue, and I think is nicer indeed.

I do not want to step on someone else's fet, so do you want me to send
the patch or will you?

thanks!


-- 
Oscar Salvador
SUSE Labs
