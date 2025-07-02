Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF77219D8A7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447374; cv=none; b=VGtHSvS2VfTiQp4SUWtNdHiLGpacD9GA8vtWVdYZZvmCy3ss4nSqvImRdMXMI6GAVfw+KXKEZZcZmaXPDCy4uLL86+AoTT76RHynj3zrdaSdT+TL95fgmxOIyxem0muUKZe2Vj5P5wRP3024dN6UkokzWZCdGxrnVJaxnkQYggk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447374; c=relaxed/simple;
	bh=urTtuoYkB6NDi0LSN2m00vl9THNpGQAg/BWgDB43mqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQ71QTPY7CJ4+vAarVhXYPt1QhwWCX/zz//yAIcbfuxaQf4OQ6bNapeCkm/AUrRnEUBSmlMdM40Z0mGHot5vLIjsxyjqVRMAFefNoiLGkXSB8LKBuuABWGIwhWNIIUGgUoz10CBW2oSEYmUx1RQzfb/Pw9Co7k8rrffzHJEP0Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XJcpNtP6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gmgXlmut; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fBtVbuH3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P4eGlMxu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XJcpNtP6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gmgXlmut";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fBtVbuH3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P4eGlMxu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3102321189;
	Wed,  2 Jul 2025 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751447370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsYN+KydblcbGJyH+2QgDKawOYmLVVn1pDOpsr1JdQQ=;
	b=XJcpNtP6GQIaPRR/mSY2ixOvedMTzz1z0UzXnDjNB5UrH6GnYni9QOq/x31hXxE/64FbVn
	sVxVf8G9sEw2pxutjFQruXHhK142SmgUrrxXBY0B2N97LxJEQmYcCOQvwSwcjc123ivoxQ
	EAOoVRtdIFLoHZ7hW/Hq8kxboKawxyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751447370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsYN+KydblcbGJyH+2QgDKawOYmLVVn1pDOpsr1JdQQ=;
	b=gmgXlmut1qzWz/5rsncqiYPId2MkHwK5t0pgUNucjMym0WgEvJZCa/R/RsIPDLgLBtf/H8
	4sCtAY3618YSGZAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fBtVbuH3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=P4eGlMxu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751447369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsYN+KydblcbGJyH+2QgDKawOYmLVVn1pDOpsr1JdQQ=;
	b=fBtVbuH3Cs4wUfyXjIfvYLHYTSvu+kioty+pDAS9dGG9z76crY44XVy0ERhNLJLtOpPOkh
	jX/PTkVeJdugLGPxkTdWu93676gJvGqP+xuMdX1OYRMD64028cZtKAjNnuZdA+JRTP/yjH
	F0ydEzbklaz8btvgN/Qp+k4NO4FC7Do=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751447369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsYN+KydblcbGJyH+2QgDKawOYmLVVn1pDOpsr1JdQQ=;
	b=P4eGlMxusc4c+4VQEr8zq8ftcIp2LlusisbfI89F4Z9UmQcT2EtB1mdzj6Yo6UvIehMM8/
	ZX0JVP4/pKiQfQAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 056301369C;
	Wed,  2 Jul 2025 09:09:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2YQyOkf3ZGj0WQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 02 Jul 2025 09:09:27 +0000
Date: Wed, 2 Jul 2025 11:09:22 +0200
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
Message-ID: <aGT3QratnMhCZd46@localhost.localdomain>
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
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[22];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,suse.cz,google.com,kernel.org,suse.com,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,suse.de,surriel.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,localhost.localdomain:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3102321189
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

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

FWIW, folio_pte_batch_flags seems more appealling to me as well.

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
