Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659C1238177
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445742; cv=none; b=ZNRrSINEoq+EVtIcS7+L6gG8g7bab144HYW1Td/VIMDZR2vwXxpVwxIZUUCMVQqt/7SZqnof9D22Y65q6RCSWS30IiCesBNP358WaTIrJrazZkP7Ct5+561CzJANlXc8qUpAiMWn/WjAD+I7gtsohVHB3ZYybAScUW2Qj6BoPOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445742; c=relaxed/simple;
	bh=n3lGFbe4VAuGNEMCQBO8DFMLi0H9T5mjz8s6f0ODa3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEm843bBNq04FHS0Ai6MoyhWc9JBVaba+byARrsI+hbfIAs7h0VFaMVkTRbZg2KGq14lv46jSAIxws2uB2UPYjK0QmZF9+IppFdid8mWUxOid4lae3PuPuWSVl/UXVJ3s1RRE54askWx1ozAqPFBloyhV9M421hzT0f7l/wEkfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KPvIdnrf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1tT4+xW/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KPvIdnrf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1tT4+xW/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KPvIdnrf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1tT4+xW/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KPvIdnrf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1tT4+xW/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7DF342116E;
	Wed,  2 Jul 2025 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751445737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jU2bqc1mBirNwkpAEUTKLOgtJSq8z+qHvFX/1pA5K3g=;
	b=KPvIdnrf2W5r/V8c0HlZjQsYbIa913azRk6tifhUjd1gfC/R6iakGDF7DNruBeci4IDTKT
	jX07h5GlvmqRiJpJ7n0+bjSNHKQ/tVDfHuQOl8IhM1QPfmwjJ6oRFvSapbJi4cXLitUzJ5
	h1bXqsGoq1DzndVnxfqTrJJGopeMw9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751445737;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jU2bqc1mBirNwkpAEUTKLOgtJSq8z+qHvFX/1pA5K3g=;
	b=1tT4+xW/ZzRfq9fMuYAiXP/y58cdzahxouxX1YBZav2YWJWxcqQXLMOx2yGca/05YoUpm0
	r43CuAimn8u0kCAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KPvIdnrf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="1tT4+xW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751445737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jU2bqc1mBirNwkpAEUTKLOgtJSq8z+qHvFX/1pA5K3g=;
	b=KPvIdnrf2W5r/V8c0HlZjQsYbIa913azRk6tifhUjd1gfC/R6iakGDF7DNruBeci4IDTKT
	jX07h5GlvmqRiJpJ7n0+bjSNHKQ/tVDfHuQOl8IhM1QPfmwjJ6oRFvSapbJi4cXLitUzJ5
	h1bXqsGoq1DzndVnxfqTrJJGopeMw9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751445737;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jU2bqc1mBirNwkpAEUTKLOgtJSq8z+qHvFX/1pA5K3g=;
	b=1tT4+xW/ZzRfq9fMuYAiXP/y58cdzahxouxX1YBZav2YWJWxcqQXLMOx2yGca/05YoUpm0
	r43CuAimn8u0kCAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 514151369C;
	Wed,  2 Jul 2025 08:42:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AR7VEOjwZGgsUgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 02 Jul 2025 08:42:16 +0000
Date: Wed, 2 Jul 2025 10:42:14 +0200
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
	Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 2/4] mm: smaller folio_pte_batch() improvements
Message-ID: <aGTw5ipC-ITJGfv0@localhost.localdomain>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-3-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627115510.3273675-3-david@redhat.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7DF342116E
X-Rspamd-Action: no action
X-Spam-Flag: NO
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,suse.cz,google.com,kernel.org,suse.com,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,suse.de,surriel.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,localhost.localdomain:mid]
X-Spam-Score: -3.01
X-Spam-Level: 

On Fri, Jun 27, 2025 at 01:55:08PM +0200, David Hildenbrand wrote:
> Let's clean up a bit:
> 
> (1) No need for start_ptep vs. ptep anymore, we can simply use ptep
> 
> (2) Let's switch to "unsigned int" for everything
> 
> (3) We can simplify the code by leaving the pte unchanged after the
>     pte_same() check.
> 
> (4) Clarify that we should never exceed a single VMA; it indicates a
>     problem in the caller.
> 
> No functional change intended.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Hi David :-),

I have to confess that I fell in the same trap as Lorenzo wrt.
__pte_batch_clear_ignored changing the pte value.
So I'm not sure if it would be nice to place a little comment in
__pte_batch_clear_ignored claryfing that pte's value remains unchanged ?

Reviewed-by: Oscar Salvador <osalvador@suse.de>

 
-- 
Oscar Salvador
SUSE Labs
