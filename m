Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E4E27BF8D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744341282; cv=none; b=j9UwpdvtRsyM2miHCmrdjz6vbmwfT2rzd9PHHhDLXIHCXhYBotkmVjYxd2W6HagX+3lrfCHkQCDxD0QwOp2J0IL8gVhSDGPKif5gCJh/Qg9YqHaNZYKbd7c8THTukQjPe/qB7LvOO25n8LTx9G6fEK02Uv77Rpn0+8hP79+U47E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744341282; c=relaxed/simple;
	bh=tMBW6SsrRp4eqZIhRhJwVyfm4buVLJZl0knatb+Bg8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IG22SjvLK/hhWM04oqesmWM6bgmU4DYr7JAx9oL9fczGAyFiylKIJ5JZNraXiRuqm9Rb1dVsZC/Fo31u30F9UabOZL6M7RGo88IhL34yM1GkDlSxFg0hbuwzEK2FEnZ5kmf6fuKH5qVJII8z+YUsVYUw6eMgupxNX81ri1Xps1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nPIcN93G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wQ+Qexkp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nPIcN93G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wQ+Qexkp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nPIcN93G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wQ+Qexkp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nPIcN93G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wQ+Qexkp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DBD7821163;
	Fri, 11 Apr 2025 03:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744341277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/OdfG6AiAbx+J2/sOs1IgaMLUTVNE3PJ0+dUGIA+UEE=;
	b=nPIcN93GPscI5eEY+8zCM0GPpOtSaw8mJUVyuWKDGEdWEJZcU330LQ5TMO1UB+r/Wc94uk
	J3U8Xa5XALjoYL4MzhjVDKC+Ajw/Qau/wQ9PtkMggNneZWEx23Ql/45KIQ3iemfmNzNodl
	LCUzJAYm/EuMDEmnHlWdOJWotoQeMjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744341277;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/OdfG6AiAbx+J2/sOs1IgaMLUTVNE3PJ0+dUGIA+UEE=;
	b=wQ+QexkpFwwFVX279DS7buUg2NDPDMyA2v2xTP/ZJhQlk687t+gEyxlfQtG7lv7xz26q/7
	ZZFKfdyS2z0GvyAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744341277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/OdfG6AiAbx+J2/sOs1IgaMLUTVNE3PJ0+dUGIA+UEE=;
	b=nPIcN93GPscI5eEY+8zCM0GPpOtSaw8mJUVyuWKDGEdWEJZcU330LQ5TMO1UB+r/Wc94uk
	J3U8Xa5XALjoYL4MzhjVDKC+Ajw/Qau/wQ9PtkMggNneZWEx23Ql/45KIQ3iemfmNzNodl
	LCUzJAYm/EuMDEmnHlWdOJWotoQeMjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744341277;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/OdfG6AiAbx+J2/sOs1IgaMLUTVNE3PJ0+dUGIA+UEE=;
	b=wQ+QexkpFwwFVX279DS7buUg2NDPDMyA2v2xTP/ZJhQlk687t+gEyxlfQtG7lv7xz26q/7
	ZZFKfdyS2z0GvyAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DAE713886;
	Fri, 11 Apr 2025 03:14:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zaM6EB2J+GeuRAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 11 Apr 2025 03:14:37 +0000
Date: Fri, 11 Apr 2025 05:14:31 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com,
	hannes@cmpxchg.org, 21cnbao@gmail.com, ryan.roberts@arm.com,
	ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: huge_memory: add folio_mark_accessed() when zapping
 file THP
Message-ID: <Z_iJF2ehg9d-azoq@localhost.localdomain>
References: <fc117f60d7b686f87067f36a0ef7cdbc3a78109c.1744190345.git.baolin.wang@linux.alibaba.com>
 <Z_eFPetk00AaFXem@localhost.localdomain>
 <23fdc11d-e983-4627-89a8-79e9ecf9a45a@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23fdc11d-e983-4627-89a8-79e9ecf9a45a@linux.alibaba.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,redhat.com,cmpxchg.org,gmail.com,arm.com,nvidia.com,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, Apr 11, 2025 at 09:07:16AM +0800, Baolin Wang wrote:
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index b3ade7ac5bbf..93abd1fcc4fb 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2263,6 +2263,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct
> vm_area_struct *vma,
>                         add_mm_counter(tlb->mm, mm_counter_file(folio),
>                                        -HPAGE_PMD_NR);
> 
> +                       /*
> +                        * Use flush_needed to indicate whether the PMD
> entry is present,
> +                        * instead of checking pmd_present() again.
> +                        */
>                         if (flush_needed && pmd_young(orig_pmd) &&
>                             likely(vma_has_recency(vma)))
>                                 folio_mark_accessed(folio);
Yes, thanks, looks good to me, and I see that Andrew has already taken
it.


-- 
Oscar Salvador
SUSE Labs
