Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F7F6AA7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446974; cv=none; b=f4K1oSztTqSk5AnQhweM4Fk2VklqJgMcRP8hhO8H2/+KUQAFLrYMXIoTssEB9bcyLEyiPGhB0HR54Rekkpuar9eNr2iH6/Rg6AQa+tF8BjztaoZVfxNShGwlcH9KvBphnQkcGjEWpuVGjXnmHix9f45A7sr0Kl3JzS3Z+1cgUxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446974; c=relaxed/simple;
	bh=uX2KUbA7LTSU4deSqm7f9kM2n2Y/H/YhwVdLvQqZFZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUCjRvZ0JwabcLQkmpJFA57obBTL1JX8RFsAmCHGX+2B8b3iDD7MrLmnpAxwZtOsPRkstwXpwTYOBkT1eXe7o+SxOascML4DpEuamXzHZCy8fUZJDx3m3UZU9C6N9ZAQ8vdgNI372kq81QI68g/7/TzO06xNxN0/KKhK9mQUdS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Fdp7qRY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ca0bA/va; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Fdp7qRY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ca0bA/va; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Fdp7qRY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ca0bA/va";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Fdp7qRY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ca0bA/va"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A84081F452;
	Wed,  2 Jul 2025 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751446970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pIb0lfPUXtpRwSrqU6GCKD30rV+XacuTCI2v/FcPKU8=;
	b=1Fdp7qRYA/Bw3VBBVzCklNjsI7Gvrpcf4nHOHlJnAxRGyOOZsIyiDTDCvQsRtDu0oMpWry
	E5Kmtl6czApZCSEA7mw9aP7yBLNl6l2VwiBxnFrOgmyufcpDQu/6IESOf3LzV6ZV5R6Nfa
	BdU0bJrUGp9WE5ITXwMLX3VSelanN6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751446970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pIb0lfPUXtpRwSrqU6GCKD30rV+XacuTCI2v/FcPKU8=;
	b=ca0bA/vaFSl5VLPSWHyxSZJY+8zypA1AIXlb5d9nHR8ZG4Qxx7OG6mjW5XUVBR4U+UbLDO
	c4EeypilGnYLjxDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751446970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pIb0lfPUXtpRwSrqU6GCKD30rV+XacuTCI2v/FcPKU8=;
	b=1Fdp7qRYA/Bw3VBBVzCklNjsI7Gvrpcf4nHOHlJnAxRGyOOZsIyiDTDCvQsRtDu0oMpWry
	E5Kmtl6czApZCSEA7mw9aP7yBLNl6l2VwiBxnFrOgmyufcpDQu/6IESOf3LzV6ZV5R6Nfa
	BdU0bJrUGp9WE5ITXwMLX3VSelanN6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751446970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pIb0lfPUXtpRwSrqU6GCKD30rV+XacuTCI2v/FcPKU8=;
	b=ca0bA/vaFSl5VLPSWHyxSZJY+8zypA1AIXlb5d9nHR8ZG4Qxx7OG6mjW5XUVBR4U+UbLDO
	c4EeypilGnYLjxDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73D4F1369C;
	Wed,  2 Jul 2025 09:02:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S0H4GLn1ZGgvWAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 02 Jul 2025 09:02:49 +0000
Date: Wed, 2 Jul 2025 11:02:43 +0200
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
Subject: Re: [PATCH v1 3/4] mm: split folio_pte_batch() into
 folio_pte_batch() and folio_pte_batch_ext()
Message-ID: <aGT1s-32GpVfVZNU@localhost.localdomain>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-4-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627115510.3273675-4-david@redhat.com>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,suse.cz,google.com,kernel.org,suse.com,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,suse.de,surriel.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

On Fri, Jun 27, 2025 at 01:55:09PM +0200, David Hildenbrand wrote:
> Many users (including upcoming ones) don't really need the flags etc,
> and can live with a function call.
> 
> So let's provide a basic, non-inlined folio_pte_batch().
> 
> In zap_present_ptes(), where we care about performance, the compiler
> already seem to generate a call to a common inlined folio_pte_batch()
> variant, shared with fork() code. So calling the new non-inlined variant
> should not make a difference.
> 
> While at it, drop the "addr" parameter that is unused.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

So, let me see if I get this.

Before this, every other user that doesn't use the extra flags (dirty,
etc...) will end up with the code, optimized out, inlined within its body?

With this change, a single function, folio_pte_batch(), identical to folio_pte_batch_ext
but without the runtime checks for those arguments will be created (folio_pte_batch()),
and so the users of it won't have it inlined in their body ?


-- 
Oscar Salvador
SUSE Labs
