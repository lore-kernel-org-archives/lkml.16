Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2D3148827
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748938626; cv=none; b=tsb+CBDqimy5YDk3nfpm+nQZvulePuCNbXqQmg0c5UugEIQV+X2dmFX9DfglybMLUuN34QFnqSQ6+DXo463PEgDXWWgiP6ubyJ1vLRemrKXEye7E6LJmLu02I9Ubvp+LOmaqDApvKo65RiZsuFXoZAo8ozcKdzZ5stvXVWpK/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748938626; c=relaxed/simple;
	bh=8f/zr5eJgjcXkwWWlTfOvIe89qjyn3xV4JL5AKxe9Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmFy4lVphZjh9nwEWLSTXsihKG9TeOBQYUv7uZnOBzItq+G2Vp3JgGtI+d1Jw2Netqx0Izt8T2vUZSJRVFJiVmKgJahEJt353/GScF/Yp9MU4Kj80aLd6cD7trosz59Z2eYNaJtjgfaEkesO9TQfEh5YQ0CDgnrwTEoMUeBO1g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FJZwonCF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oWvD6hYw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FJZwonCF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oWvD6hYw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FJZwonCF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oWvD6hYw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FJZwonCF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oWvD6hYw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 02FD81F395;
	Tue,  3 Jun 2025 08:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748938623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L+3MJa4vgeMVcpuCPatCX8ZD9o5YgfCxkGCBD/K8oUc=;
	b=FJZwonCF2vaqqk3lmKYXle3mMcDMZkBAGUEC8xQXBMy0+jqEhgCOWRpmTEETeeofvLNTgC
	iNojnSz7hnPlwchuP3qe/0H+LIGfKIrRYosnmR4C5hJg4DcglNsojGiOKJJn0WDtuQ1ibu
	uj8RsAbnwbN3IeKGEtG9awMAH7xpzkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748938623;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L+3MJa4vgeMVcpuCPatCX8ZD9o5YgfCxkGCBD/K8oUc=;
	b=oWvD6hYwbJObQ9xjFnoED5Vb3x5oqMrOSt2iJUtwXj9kijOOhWoRjm+mNRhHu5wf8raTTP
	ED/p3blxJcoVpfDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FJZwonCF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oWvD6hYw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748938623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L+3MJa4vgeMVcpuCPatCX8ZD9o5YgfCxkGCBD/K8oUc=;
	b=FJZwonCF2vaqqk3lmKYXle3mMcDMZkBAGUEC8xQXBMy0+jqEhgCOWRpmTEETeeofvLNTgC
	iNojnSz7hnPlwchuP3qe/0H+LIGfKIrRYosnmR4C5hJg4DcglNsojGiOKJJn0WDtuQ1ibu
	uj8RsAbnwbN3IeKGEtG9awMAH7xpzkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748938623;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L+3MJa4vgeMVcpuCPatCX8ZD9o5YgfCxkGCBD/K8oUc=;
	b=oWvD6hYwbJObQ9xjFnoED5Vb3x5oqMrOSt2iJUtwXj9kijOOhWoRjm+mNRhHu5wf8raTTP
	ED/p3blxJcoVpfDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38FD313A1D;
	Tue,  3 Jun 2025 08:17:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MR0ZC36vPmjWIgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 03 Jun 2025 08:17:02 +0000
Date: Tue, 3 Jun 2025 10:16:52 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC] mm: madvise: use walk_page_range_vma() for
 madvise_free_single_vma()
Message-ID: <aD6vdJLLflLql2yq@localhost.localdomain>
References: <20250603013154.5905-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603013154.5905-1-21cnbao@gmail.com>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.cz:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 02FD81F395
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On Tue, Jun 03, 2025 at 01:31:54PM +1200, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> We've already found the VMA before calling madvise_free_single_vma(),
> so calling walk_page_range() and doing find_vma() again seems
> unnecessary. It also prevents potential optimizations for MADV_FREE
> to use a per-VMA lock.
> 
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
