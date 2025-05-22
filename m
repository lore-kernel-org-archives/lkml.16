Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68C31547F5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892105; cv=none; b=lal2JpFZPFAXU7HO+NaPHV0i32jBOkaGLpBGt4mfgfffi+JlGq2bz1d9/0AMW4H/izpMQC6nCUWCbSKP49Pm97s12HaQisfuc5hTWr9IE6pvj4Zrkoo76gGtvAZrVuEjVq8r2lhk6jTyfaLNx3idBdiw4nXSxiu1LHFvfOM1Wvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892105; c=relaxed/simple;
	bh=+5RQprsipDU5xKStlyFkAtDZ5vu/+PG9dND2HfxnKMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1E4DpJK2u2EXRynpWvlGlvFnCbKWKM4fktWRVNjmUZNwCMbh65HB70kfxkNhKL01iyfseyr4CdaOgV0uvHBdr6yqpYh22lMnTxgfCtqP8a7ZEbqA9Hb3/u83LA24EHoClOqaquRvHeKiNW+b7nQec8KVwEq0KgrE3mONhoL9SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MVcOa9n7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fwczE69S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PO/iM8Xh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZBYX7Aot; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MVcOa9n7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fwczE69S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PO/iM8Xh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZBYX7Aot"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E528022015;
	Thu, 22 May 2025 05:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747892096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X6mmuutB4EJBxLC91OPwfCbcXZlRXsNyxRUnIx9MDOk=;
	b=MVcOa9n7tuVl15UoflxqRMmUnRCPlO37v4ww0JkWRqCl5ZdAPtuU3oD2byyJGKTc3dIrhg
	SITYS9od6p3rT4/tUFmDgy2+FrHuaX/JspOLlaITEzZODq/iQ0Ehc4yrZ/+rA/B9Fmg/uW
	GULgjNMTO99EN9GiROU+aDE+bbE1IGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747892096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X6mmuutB4EJBxLC91OPwfCbcXZlRXsNyxRUnIx9MDOk=;
	b=fwczE69S6AmUK/CvwGXfKAFICdOCI7rS9gQoAgAJRN/AgVeckjPGX/F8nMtmgWa/xJYgP7
	JUOaiITTg3wuePBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="PO/iM8Xh";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZBYX7Aot
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747892095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X6mmuutB4EJBxLC91OPwfCbcXZlRXsNyxRUnIx9MDOk=;
	b=PO/iM8XhDldtMTNiBoCA9Nr0WmPyVlb5CyKSMfqbD8lJBcVKnOmL6KtTSvfT5Ejk4ljgGt
	0rTIdFAp6Q7kvbd7SUQxSVlWiF779vHjeFX627se0rcdw8VM20Z0KeFbFv9X6kY+kKKso+
	6wozOFsJQZxVhl0udEYMvjyE4WTYMyo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747892095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X6mmuutB4EJBxLC91OPwfCbcXZlRXsNyxRUnIx9MDOk=;
	b=ZBYX7AotSRVrsxaxNgTLl/eGerJ7lTBUEiW883mNwNJE4d352MLFJijyzbGCUy3COZECLl
	EdU3nfQZP30I/2Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE4CB136A4;
	Thu, 22 May 2025 05:34:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UOFnKX+3LmgvbQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 22 May 2025 05:34:55 +0000
Date: Thu, 22 May 2025 07:34:54 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Muchun Song <muchun.song@linux.dev>
Cc: yangge1116@126.com, akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	21cnbao@gmail.com, david@redhat.com, baolin.wang@linux.alibaba.com,
	liuzixing@hygon.cn
Subject: Re: [PATCH] mm/hugetlb: fix kernel NULL pointer dereference when
 replacing free hugetlb folios
Message-ID: <aC63fmFKK84K7YiZ@localhost.localdomain>
References: <1747884137-26685-1-git-send-email-yangge1116@126.com>
 <644FF836-9DC7-42B4-BACE-C433E637B885@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <644FF836-9DC7-42B4-BACE-C433E637B885@linux.dev>
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Queue-Id: E528022015
X-Spam-Score: -1.51
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	FREEMAIL_ENVRCPT(0.00)[126.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[126.com,linux-foundation.org,kvack.org,vger.kernel.org,gmail.com,redhat.com,linux.alibaba.com,hygon.cn];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]

On Thu, May 22, 2025 at 11:47:05AM +0800, Muchun Song wrote:
> Thanks for fixing this problem. BTW, in order to catch future similar problem,
> it is better to add WARN_ON into folio_hstate() to assert if hugetlb_lock
> is not held when folio's reference count is zero. For this fix, LGTM.

Why cannot we put all the burden in alloc_and_dissolve_hugetlb_folio(),
which will again check things under the lock?
I mean, I would be ok to save cycles and check upfront in
replace_free_hugepage_folios(), but the latter has only one user which
is alloc_contig_range(), which is not really an expected-to-be optimized
function.

 diff --git a/mm/hugetlb.c b/mm/hugetlb.c
 index bd8971388236..b4d937732256 100644
 --- a/mm/hugetlb.c
 +++ b/mm/hugetlb.c
 @@ -2924,13 +2924,6 @@ int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
 
  	while (start_pfn < end_pfn) {
  		folio = pfn_folio(start_pfn);
 -		if (folio_test_hugetlb(folio)) {
 -			h = folio_hstate(folio);
 -		} else {
 -			start_pfn++;
 -			continue;
 -		}
 -
  		if (!folio_ref_count(folio)) {
  			ret = alloc_and_dissolve_hugetlb_folio(h, folio,
  							       &isolate_list);

 

-- 
Oscar Salvador
SUSE Labs
