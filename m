Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485962DE701
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534223; cv=none; b=sMVUoIP0Rf41iesbu0FPUxBckL44O4WnNLZGf0RbqY8Eo6NrnLM4DUgMxfLOc/kirB+FDU4xHDIGHCJzWwjdlDIqoCJIvx0kVTlf3has2kE6yL2ov0FRHOHnKR5NrsME5k4iydh0tjScd6V8YNqlw6DsS+bacMeA7mJVssY3+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534223; c=relaxed/simple;
	bh=FFYbF8zg9rUoqfLABh54efvXTjFmqS0km31OXA9FiJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oley2kk9hwpaTI0WBEI6+G46zcmLT/OnO7bIO5L0WF191/3U4qZuRJC24ekbYSv9nsQTNKLDfmNvx2tdpCPUrkRhfkZgaO+yKFXw3TCRJ0rEItb47KF3f+nABGeyK9R1CSDl2EWbvSWgX9e0ceBdUIn8CQYQSEnQDpmY0mc7+Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E3s24UWY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aTjCnBfy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E3s24UWY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aTjCnBfy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E3s24UWY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aTjCnBfy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E3s24UWY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aTjCnBfy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5299121167;
	Thu,  3 Jul 2025 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751534220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7y1s4fvtr8B8FLht4Zw6Q/Lw7MtiAfaDUQQM/yYXSw=;
	b=E3s24UWY3Bvz1AMHIzOjmyXA/CNUO3GBhGx31Ia0OR+Vjlej++hE7dH7qTEviY33IdAdKc
	IFIw1DEvjp7+0TEnBh6NbWTu6320qUXn8ixaD54I0zk45W34W48YbJbU/AjdzBm0l+ciGV
	I8jt4fGpHGUJmhgtbUtUQlmLS0mQY+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751534220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7y1s4fvtr8B8FLht4Zw6Q/Lw7MtiAfaDUQQM/yYXSw=;
	b=aTjCnBfyh8tUDRy3nIwIsy1T7vYazk0iEDaHiYXq4ml4NBw+LbRO0iCktfcHcJ5VXIae/I
	76SYbrewxK7ZdgBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751534220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7y1s4fvtr8B8FLht4Zw6Q/Lw7MtiAfaDUQQM/yYXSw=;
	b=E3s24UWY3Bvz1AMHIzOjmyXA/CNUO3GBhGx31Ia0OR+Vjlej++hE7dH7qTEviY33IdAdKc
	IFIw1DEvjp7+0TEnBh6NbWTu6320qUXn8ixaD54I0zk45W34W48YbJbU/AjdzBm0l+ciGV
	I8jt4fGpHGUJmhgtbUtUQlmLS0mQY+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751534220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7y1s4fvtr8B8FLht4Zw6Q/Lw7MtiAfaDUQQM/yYXSw=;
	b=aTjCnBfyh8tUDRy3nIwIsy1T7vYazk0iEDaHiYXq4ml4NBw+LbRO0iCktfcHcJ5VXIae/I
	76SYbrewxK7ZdgBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19A5313721;
	Thu,  3 Jul 2025 09:16:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aE2OA4tKZmhPfAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 03 Jul 2025 09:16:59 +0000
Date: Thu, 3 Jul 2025 11:16:57 +0200
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
Message-ID: <aGZKiTgsARxVh8h1@localhost.localdomain>
References: <20250702104926.212243-1-david@redhat.com>
 <20250702104926.212243-5-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702104926.212243-5-david@redhat.com>
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Wed, Jul 02, 2025 at 12:49:26PM +0200, David Hildenbrand wrote:
> Instead, let's just allow for specifying through flags whether we want
> to have bits merged into the original PTE.
> 
> For the madvise() case, simplify by having only a single parameter for
> merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
> dirty bit is not required, but also not harmful. This code is not that
> performance critical after all to really force all micro-optimizations.
> 
> As we now have two pte_t * parameters, use PageTable() to make sure we
> are actually given a pointer at a copy of the PTE, not a pointer into
> an actual page table.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Although I think it'd be nice to have a comment pointing out why dirty-young bites
go together:

Reviewed-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs
