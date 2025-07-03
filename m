Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D0323C4ED
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535702; cv=none; b=l+DdHc/iOh3tvTbOM0w3tTAAQsS4JgHNRsAUjhmTZqWRdSYJ5f+3RUZDD8V0K8tL8W6cNsnw3Y7aO0O3rCk+aUzY9ayAAjW4JN2KH/LLxY0u6X/8RGV4nY7PAKvE2BIrvKu4fFY/SzmsD6mLZf9qu8uHnx9EmqaFTcBTVX9MRds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535702; c=relaxed/simple;
	bh=ip8FTUMQlOvqUYW/dKEemNmQRLKJjTMm6ukds/crstY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cn+Yb483QS03/XinLBMxHQJ4VKNJKINsg9dMpWaLfVI4O4anLCRLVLOk/922je1tEzUswij2rXDoSQbDHj+ekxtSsRLSbK+MMrGxwcDvWLmv9MU44tzs3cAa5Bl4u94CqsGvY7su3uFaDGfd8ALKf+IkekCAjwiXz4++jHQFOzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WI9j06YE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3GfxT+Ad; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WI9j06YE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3GfxT+Ad; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WI9j06YE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3GfxT+Ad";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WI9j06YE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3GfxT+Ad"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0F9A21F45E;
	Thu,  3 Jul 2025 09:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751535699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IuP3Owi1Awp/sedPsUL162PM9Tw1iJHPrsBuLgR0KY0=;
	b=WI9j06YEFDMsuOrHkAoGj7RuhsVWQKZHysZT1f14LduS7gg+dk8b+jtQLqAj/BGZuZxu+d
	U5SyiqwggNHd4p1zofKEpKTUgrP3kVGMciUJoETicu5HOldY262WEooXwRLcaEHxzH7+S8
	HYT8S0750vMJtyKFnsQ0AeT5MyedYQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751535699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IuP3Owi1Awp/sedPsUL162PM9Tw1iJHPrsBuLgR0KY0=;
	b=3GfxT+Ad+L0MGzDhahjU0OBkbzZOqP0ooT7vU4ARBs+exYkoOkW5uEtJEuI4p7J4SWd/7v
	ORJPPGEoQLNkiWAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WI9j06YE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3GfxT+Ad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751535699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IuP3Owi1Awp/sedPsUL162PM9Tw1iJHPrsBuLgR0KY0=;
	b=WI9j06YEFDMsuOrHkAoGj7RuhsVWQKZHysZT1f14LduS7gg+dk8b+jtQLqAj/BGZuZxu+d
	U5SyiqwggNHd4p1zofKEpKTUgrP3kVGMciUJoETicu5HOldY262WEooXwRLcaEHxzH7+S8
	HYT8S0750vMJtyKFnsQ0AeT5MyedYQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751535699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IuP3Owi1Awp/sedPsUL162PM9Tw1iJHPrsBuLgR0KY0=;
	b=3GfxT+Ad+L0MGzDhahjU0OBkbzZOqP0ooT7vU4ARBs+exYkoOkW5uEtJEuI4p7J4SWd/7v
	ORJPPGEoQLNkiWAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5958613721;
	Thu,  3 Jul 2025 09:41:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zCwCE1JQZmjGBQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 03 Jul 2025 09:41:38 +0000
Date: Thu, 3 Jul 2025 11:41:36 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
	baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] khugepaged: Reduce race probability between migration
 and khugepaged
Message-ID: <aGZQUIfiLEMXZ_Cu@localhost.localdomain>
References: <20250703054823.49149-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703054823.49149-1-dev.jain@arm.com>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,localhost.localdomain:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 0F9A21F45E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On Thu, Jul 03, 2025 at 11:18:23AM +0530, Dev Jain wrote:
> Suppose a folio is under migration, and khugepaged is also trying to
> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
> page cache via filemap_lock_folio(), thus taking a reference on the folio
> and sleeping on the folio lock, since the lock is held by the migration
> path. Migration will then fail in
> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
> such a race happening (leading to migration failure) by bailing out
> if we detect a PMD is marked with a migration entry.
> 
> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
> 
> Note that, this is not a "fix" since it only reduces the chance of
> interference of khugepaged with migration, wherein both the kernel
> functionalities are deemed "best-effort".
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

David's comment refering to a 'present PMD entry' seems more clear to
me, but

Acked-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs
