Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877A328640B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464822; cv=none; b=GGAIuFtG/BGSIo0622ZXJn4IfqcJbyqj3jkoYbeyaB/wT8a07RzoA8fO91KCRPaJuSlQbeK/W9WpWMN86MRLrl+0LZMRo2cmjgTNQx5Hca8oukpAikv7vZsHVCNMCm7feF/0VWAADNP1/bfiR0qHbYYTqVheeI2/qyMr7FznWdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464822; c=relaxed/simple;
	bh=o1eOb5ZjMILIlhh/zhBFDxtKYI/io5O3KBBCErdGwQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzTYwSqNkl1R1eUvo00azhwxzlLdMHJraVBRO46d5o1o38MFZ20xnQDjfr3UW1AUy8VbK8b3LVCycdxgKu2zGEiYDGvVpaYxYn3iPB7Mk61qC0K1MdlsGIZhprooVLebU3uvroZKRmH/a7Y0hgmYEJ7C4wxzwCfZJn0IZXnh3vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uyMj+XKz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ztdvVxzF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uyMj+XKz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ztdvVxzF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uyMj+XKz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ztdvVxzF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uyMj+XKz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ztdvVxzF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 72BB31F38D;
	Wed,  2 Jul 2025 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751464818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KonS7cv/G9gzTUrpW1rGIG1iuK5W8/1IKztK8Mu1XO4=;
	b=uyMj+XKz39UxrdzMtyrBsFtS95teaCi94Xxf49fDUQLfiycJ2ec5JOAAREHGLgFVb96S5d
	4TCa5pe1fCdXt+kLhLW07IMIBQO+zP6CpHxZw5XD4v+A4i2+5zxUCo71lZKYTMlfzIwWZh
	EubwWx4ev/qmgG8APO9ClCue91oEtVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751464818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KonS7cv/G9gzTUrpW1rGIG1iuK5W8/1IKztK8Mu1XO4=;
	b=ztdvVxzFzrBrPPHs14FmGsYmlixiWnvLiMdwom9ORka3RFw+Tj1vdDd38fxYB8/mCjRFYn
	ESb63tVyzZQNwQDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uyMj+XKz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ztdvVxzF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751464818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KonS7cv/G9gzTUrpW1rGIG1iuK5W8/1IKztK8Mu1XO4=;
	b=uyMj+XKz39UxrdzMtyrBsFtS95teaCi94Xxf49fDUQLfiycJ2ec5JOAAREHGLgFVb96S5d
	4TCa5pe1fCdXt+kLhLW07IMIBQO+zP6CpHxZw5XD4v+A4i2+5zxUCo71lZKYTMlfzIwWZh
	EubwWx4ev/qmgG8APO9ClCue91oEtVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751464818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KonS7cv/G9gzTUrpW1rGIG1iuK5W8/1IKztK8Mu1XO4=;
	b=ztdvVxzFzrBrPPHs14FmGsYmlixiWnvLiMdwom9ORka3RFw+Tj1vdDd38fxYB8/mCjRFYn
	ESb63tVyzZQNwQDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F46A13A24;
	Wed,  2 Jul 2025 14:00:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6XWBDHE7ZWhGPAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 02 Jul 2025 14:00:17 +0000
Date: Wed, 2 Jul 2025 16:00:11 +0200
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
Message-ID: <aGU7axcql69-GRQI@localhost.localdomain>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,suse.cz,google.com,kernel.org,suse.com,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,suse.de,surriel.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 72BB31F38D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

On Wed, Jul 02, 2025 at 12:49:26PM +0200, David Hildenbrand wrote:
> Instead, let's just allow for specifying through flags whether we want
> to have bits merged into the original PTE.
> 
> For the madvise() case, simplify by having only a single parameter for
> merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
> dirty bit is not required, but also not harmful. This code is not that
> performance critical after all to really force all micro-optimizations.

Seems a bit odd to me to have the dirty-young bit being treat as "one".
You mention that this is done because the only user of it doesn't really
care about dirty vs non-dirty and it's not harmful eitherway, so micro-optimizing
this isn't worth at this moment.

But what if we grop another user which wants to make this distinction and
where it matters dirty vs non-dirty/young vs not-young.
Wouldn't be better to have it separated from the start?

And I'm not talking about micro-optimizing, because that's clear that it
doesn't matter, but for clarity purposes.
It seems a lot more organic/natural/obvious to me.



-- 
Oscar Salvador
SUSE Labs
