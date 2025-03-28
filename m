Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1590145355
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743167430; cv=none; b=hB0blG0frMOR37yVnPHQGl5tcQjxFgA7zJn6Bwlr/6zKfd/pOmgTakdyLXHC9bEpQhCeupiHLI8HHX/OHa/xMXvmcv7ej+sWOMma1t4dV2Y7Adc3BQ2F6nLRKVXxDW7asYg4xCW+5/hPLQcNQlHhLtNLsBxR124EH2lntwv/mzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743167430; c=relaxed/simple;
	bh=On9No0HbpCX/gikk0qGXkiMf8uMwWvvDnDP966WgRdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nU8pUMaWBmp8H8k5ujshOByZGbeLugcLaMLMGvO/Gorgq23IOFN54mnc4kulh+EnrhjFO+gydAw3bIQg/Yj/2Q2NF+hK0YHgyCkM5ZAr/l+o/npsgGidI69HmaFlSX/+YPf/cokGAE3KUc4WXQWI3urUIUrSl6BfoNJj4/2XsWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L5H1rfvo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9+ULbLGD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f6nHSpqB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JVcPqmAa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L5H1rfvo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9+ULbLGD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f6nHSpqB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JVcPqmAa"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E28FB1F388;
	Fri, 28 Mar 2025 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743167427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xu1rSHeQgr2TGn2wogNSIxm18y3cQEiVZTbjppWE6F4=;
	b=L5H1rfvoEM88pq1D5oWedswEYssvdloxShoiAjRCwku77+uMMut2dnFqa6sn1SjUfP5107
	SFHSnXy6SCogX83wX8Acw6p3YeAVH5PYzvDa6QwAZ2Ym668fGxsrwTBG91+/WnlJkYh6Yv
	ME7D/N0XuYvL01iUsCUfiot2DZ5a3LQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743167427;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xu1rSHeQgr2TGn2wogNSIxm18y3cQEiVZTbjppWE6F4=;
	b=9+ULbLGDTBrhvM4DMbrx/SlOF+iDLs1nsgrBENy5oBc3BN9l1TCLMKSqelpONaKa6eGux5
	sU5Zs+QzCa/IAqDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f6nHSpqB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JVcPqmAa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743167426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xu1rSHeQgr2TGn2wogNSIxm18y3cQEiVZTbjppWE6F4=;
	b=f6nHSpqBO0rJMm+yJS7a+aKMJkd21PtIKTkfXGDMEPLLEqOy+ke86jXZTQD44qeurkpwpb
	sPlyuqjIammQ1HzLmeNIqecaNUphhWDyx80zj5L1P0zTxQIVDLmTCsycxAh9foHyKYc+LM
	kfrIM5dDxgknO618j/qNV4p2T4vqAFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743167426;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xu1rSHeQgr2TGn2wogNSIxm18y3cQEiVZTbjppWE6F4=;
	b=JVcPqmAakRV7qR4ZkSj9JkqqhXRwiKNCP7PRHqRR2AvGsKhyLUgHavr/ciwvJW76VjVJLT
	QbVO8+NJ1LS/vZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4EB7213927;
	Fri, 28 Mar 2025 13:10:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o4NpEMKf5mdiXQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 28 Mar 2025 13:10:26 +0000
Date: Fri, 28 Mar 2025 14:10:24 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
	hughd@google.com, willy@infradead.org, david@redhat.com,
	21cnbao@gmail.com, ziy@nvidia.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: mincore: use folio_pte_batch() to batch process
 large folios
Message-ID: <Z-afwA3UyEJxryBp@localhost.localdomain>
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
 <54886038-3707-4ea0-bd84-00a8f4a19a6a@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54886038-3707-4ea0-bd84-00a8f4a19a6a@arm.com>
X-Rspamd-Queue-Id: E28FB1F388
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux.alibaba.com,linux-foundation.org,google.com,infradead.org,redhat.com,gmail.com,nvidia.com,kvack.org,vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Mar 27, 2025 at 10:08:56AM -0400, Ryan Roberts wrote:
> You could simplify to the following, I think, to avoid needing to grab the folio
> and call folio_pte_batch():
> 
> 			else if (pte_present(pte)) {
> 				int max_nr = (end - addr) / PAGE_SIZE;
> 				step = min(pte_batch_hint(ptep, pte), max_nr);
> 			} ...

Yes, I think this makes much more sense, in the end, as you said, we do
not really need what folio_pte_batch gives us here.

With the API I am working on, batching will be done in there internally,
so we will not have to expose this here.

-- 
Oscar Salvador
SUSE Labs
