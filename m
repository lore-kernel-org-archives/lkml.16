Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4351E47B7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429727; cv=none; b=JsjvmY1SPS/EFyuk9bPRG9ki11yuOoa3CUC7rcBE7XJbfy/EsSckboijEHuIVA5jy3EepbNCKsiF4OQDREfW/rjtqukrZ7K92HzDTUa7LI+Tkg64NmwvGjEY3gw5i25k6GC7N9vBo385eIC8+UtHJGLZ53cAQzEWsy//87/goGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429727; c=relaxed/simple;
	bh=5wyL4q/HqByPoG55Jg3dJ51bokNAMLu+96sPzGwtyTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrI5rdRybarIPjshAP9wyWAb1UThk8MWcOXeSTu1NAIAiPh9+QzGRmfW34Fm+uI80KYaoTnr3hC2xJyovNs+nyGM1lewppJCU68+p5VGUr9Jo4ynx0P/dZ4FeQAxwl+hBG7Ve7SqntsHodkukdNplKuCl/3lHiYN2fUj+9Iyixs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DxvinQlC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XYg0ko8T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DxvinQlC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XYg0ko8T; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DxvinQlC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XYg0ko8T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DxvinQlC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XYg0ko8T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 20A74211AA;
	Fri, 20 Jun 2025 14:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750429724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zDCXy2xUuIpDrZt6lZelut4/OesMx2eGwdtjU0b+qKY=;
	b=DxvinQlCQT7htDy2x3qJc0l8S9I2wtlZFnrvr2MmCgd+KCWdfllBkOoBzO53nGmxqAQGW+
	n6IThfqJiNIVIq4K8/K/TU++WyqmptL5cVJjbzMf5RTxXRrtsFwHvGlIlLnj5girryMgWc
	zrAgVd3LusSS6dS31ymTmxMg+5IkYSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750429724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zDCXy2xUuIpDrZt6lZelut4/OesMx2eGwdtjU0b+qKY=;
	b=XYg0ko8TqcrK4PThoiWu27rjoKhW5F6wdUaFP7Xpo/XL8ibt9yp8Tr5B5wC4yCILbBDHwb
	0rsEMIATsgX2hfCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DxvinQlC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XYg0ko8T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750429724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zDCXy2xUuIpDrZt6lZelut4/OesMx2eGwdtjU0b+qKY=;
	b=DxvinQlCQT7htDy2x3qJc0l8S9I2wtlZFnrvr2MmCgd+KCWdfllBkOoBzO53nGmxqAQGW+
	n6IThfqJiNIVIq4K8/K/TU++WyqmptL5cVJjbzMf5RTxXRrtsFwHvGlIlLnj5girryMgWc
	zrAgVd3LusSS6dS31ymTmxMg+5IkYSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750429724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zDCXy2xUuIpDrZt6lZelut4/OesMx2eGwdtjU0b+qKY=;
	b=XYg0ko8TqcrK4PThoiWu27rjoKhW5F6wdUaFP7Xpo/XL8ibt9yp8Tr5B5wC4yCILbBDHwb
	0rsEMIATsgX2hfCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9F9D136BA;
	Fri, 20 Jun 2025 14:28:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hPs4JhtwVWh2TQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 20 Jun 2025 14:28:43 +0000
Date: Fri, 20 Jun 2025 16:28:42 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] mm,hugetlb: Rename anon_rmap to new_anon_folio
 and make it boolean
Message-ID: <aFVwGttkfeRmK9Rr@localhost.localdomain>
References: <20250620123014.29748-1-osalvador@suse.de>
 <20250620123014.29748-4-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620123014.29748-4-osalvador@suse.de>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 20A74211AA
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
X-Spam-Level: 

On Fri, Jun 20, 2025 at 02:30:12PM +0200, Oscar Salvador wrote:
> anon_rmap is used to determine whether the new allocated folio is anonymous.
> Rename it to something more meaningul like new_anon_folio and make it boolean,
> as we use it like that.
> While we are at it, drop 'new_pagecache_folio' as 'new_anon_folio' is enough to
> check whether we need to restore the consumed reservation.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---
>  mm/hugetlb.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
[...]
> @@ -6518,6 +6517,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>  		folio_zero_user(folio, vmf->real_address);
>  		__folio_mark_uptodate(folio);
>  		new_folio = true;
> +		new_anon_folio = !(vma->vm_flags & VM_MAYSHARE);

>  
>  		if (vma->vm_flags & VM_MAYSHARE) {
>  			int err = hugetlb_add_to_page_cache(folio, mapping,
> @@ -6536,10 +6536,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>  				ret = VM_FAULT_SIGBUS;
>  				goto out;
>  			}
> -			new_pagecache_folio = true;
>  		} else {
>  			folio_lock(folio);
> -			anon_rmap = 1;

Let's just on top:

 diff --git a/mm/hugetlb.c b/mm/hugetlb.c
 index 57bb8b2dce21..f6ea1864ce5c 100644
 --- a/mm/hugetlb.c
 +++ b/mm/hugetlb.c
 @@ -6517,7 +6517,6 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
                 folio_zero_user(folio, vmf->real_address);
                 __folio_mark_uptodate(folio);
                 new_folio = true;
 -               new_anon_folio = !(vma->vm_flags & VM_MAYSHARE);
 
                 if (vma->vm_flags & VM_MAYSHARE) {
                         int err = hugetlb_add_to_page_cache(folio, mapping,
 @@ -6537,6 +6536,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
                                 goto out;
                         }
                 } else {
 +                       new_anon_folio = true;
                         folio_lock(folio);
                 }
         } else {

which is more explicit :-)

 

-- 
Oscar Salvador
SUSE Labs
