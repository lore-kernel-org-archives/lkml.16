Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB8A2F50B7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751478823; cv=none; b=D3JsYENFGFo9TSSmHm1lRzX6nXiTZokTXZKgCnySZ9HqJKk9UeAdLOt59pu8QVtl1kuHc2wLS5uhNVfByZA7T3alD41dMWAi3v9FVTGoOQyB18GF+1qruEyI/29AwdCmzZcQ1oec4nqDenphpaCnetdnRf69Tn5eT8NTI3YBXdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751478823; c=relaxed/simple;
	bh=uXYLCLa7He0l8SeuuT5s6C5IVlgt4fYu+20zNBy2wiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJ32lO3qSZPwLJCPXJeR91HrEepqyQHfUo+Y01AzuZ/tVJ9L1dD8Z4wgPK168zCOyNSn/yuqYOdmFD+cTcvQT8Ln5SMDgvgGe5tBvOkuCBPqspPdesZv0Mh+bLqVAsfICgqa5gt4sW2uoMzhXsuWRsCAZO8+GAMZ1VeL7Nt9ZGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pmnMC2zj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=agyambVu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pmnMC2zj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=agyambVu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pmnMC2zj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="agyambVu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pmnMC2zj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="agyambVu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0400021163;
	Wed,  2 Jul 2025 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751478820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FiMDhOWgDK6aRf46H0zrt2j/bBbAo0BPLVU88GTsNyw=;
	b=pmnMC2zj224RwnAUnlYQvqnfeIVeR8nocowKQ8dn6EATdfc4u8N8TISPzoiAPVcp190R9H
	0FfXrZg9w67/rlQExlkcTgynGOgBaagOx8/iJ9W17ljhGGVFH5IRXA6HZhBL4IIq2j4Kuj
	iX7bzHwZ0wDJlJzvqlJOTPLS90WM8QE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751478820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FiMDhOWgDK6aRf46H0zrt2j/bBbAo0BPLVU88GTsNyw=;
	b=agyambVuYYk7F7azrM2/DaReSK43Kp5URpcxsoyad0ADNIL6jenmjSpWtnktE12LCC+ftE
	wzpTASRxGrHEwrBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751478820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FiMDhOWgDK6aRf46H0zrt2j/bBbAo0BPLVU88GTsNyw=;
	b=pmnMC2zj224RwnAUnlYQvqnfeIVeR8nocowKQ8dn6EATdfc4u8N8TISPzoiAPVcp190R9H
	0FfXrZg9w67/rlQExlkcTgynGOgBaagOx8/iJ9W17ljhGGVFH5IRXA6HZhBL4IIq2j4Kuj
	iX7bzHwZ0wDJlJzvqlJOTPLS90WM8QE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751478820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FiMDhOWgDK6aRf46H0zrt2j/bBbAo0BPLVU88GTsNyw=;
	b=agyambVuYYk7F7azrM2/DaReSK43Kp5URpcxsoyad0ADNIL6jenmjSpWtnktE12LCC+ftE
	wzpTASRxGrHEwrBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5F2E13A24;
	Wed,  2 Jul 2025 17:53:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DpteLSJyZWj8BAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 02 Jul 2025 17:53:38 +0000
Date: Wed, 2 Jul 2025 19:53:37 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>, Lance Yang <ioworker0@gmail.com>
Subject: Re: [PATCH v2 4/4] mm: remove boolean output parameters from
 folio_pte_batch_ext()
Message-ID: <aGVyIZby0mCBz0Yl@localhost.localdomain>
References: <20250702104926.212243-1-david@redhat.com>
 <20250702104926.212243-5-david@redhat.com>
 <aGU7axcql69-GRQI@localhost.localdomain>
 <3f8d6f3f-f98b-4f90-95d5-f4a09d61c88a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f8d6f3f-f98b-4f90-95d5-f4a09d61c88a@redhat.com>
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,suse.cz,google.com,kernel.org,suse.com,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,suse.de,surriel.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Wed, Jul 02, 2025 at 04:40:30PM +0200, David Hildenbrand wrote:
> But more importantly, usually young+dirty is a moving target as HW can
> usually update it asynchronously.

Ok, you mean they often get queried both at once?

> So in the common case, you really have to rely on the young+dirty bits from
> get_and_clear_full_ptes(), and not on the current snapshot while the page
> remains mapped.
> 
> The madvise() use case is rather special in that sense.

I see.
I mean, codewise this looks like an improvement, I was just puzzled by the
fact that we're dealing with young+dirty together (while we didn't before),
but given that get_and_clear_full_ptes() do that already, I guess it makes
sense if that's the way we usually operate.

I wasn't familiar with that, thinking about it makes sense, but I wonder whether
we could place a comment either in the definition of FPB_MERGE_YOUNG_DIRTY, or in
the handling of it in folio_pte_batch_flags().
I guess in the definition would make more sense.


Whether you decide to move forward on the comment or not (could be
squashed), I'm ok with this. 


-- 
Oscar Salvador
SUSE Labs
