Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750841E3DFD
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182964; cv=none; b=IZz1dw5wIUtXAl7GVi7TRnX1gUGjv3CZC/DwDdF6ExsGEKj5vRFJMi2xBOqmggBMsw5U1KyCYkWQpW4LPNU+jaGXL24wqH2lg1yVffxInR00o2E88hXwFdEnPAT4izAFNo9vh9zOu+vdm4gMHwfWDrMzZMCVk0S31X8HFG89adg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182964; c=relaxed/simple;
	bh=gH7pb4UecEOQnymj2j9Az1d2qXFNL/ko1+IZ5aVbix4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPL3f6ORbqWKe5EfACWV2JkJfsL9egaD+VaTAMQacA6krtQIxaq/6A8V1D6vc8+FMGKk4x0CvFrKhVWk4RTdq3+RS3dlXPR5qtW0LERbkY26fW/HfVMBIdiQCYsPK0PST/1GgU69rzn5xO8sHytWQfi7Ggcq/Njhk3uH9c06Fro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xLjevKLM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IGkjEFnN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xLjevKLM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IGkjEFnN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xLjevKLM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IGkjEFnN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xLjevKLM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IGkjEFnN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7A2B11F38F;
	Mon, 10 Feb 2025 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739182955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bd6LHuWajiclYWz6GHaEHXdwPEj1Ju2kDcOuAmYgqx8=;
	b=xLjevKLMtv2HqTi5b1dBDJhvMTU7mTxpI0Gei+GbnZiGmWl0XRbZoTeZ0nwB6SdJq7iP+6
	QCOVFv0W7Cv0IyPQxb8maa/x9UPGkC8XDHvPMt3DZkr03+BJQvk9TgMLTzIvaSAzoL26HE
	PZXhICJGunj/xmk3uA/FG0rtAUb2UTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739182955;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bd6LHuWajiclYWz6GHaEHXdwPEj1Ju2kDcOuAmYgqx8=;
	b=IGkjEFnNnx2SK4mdv3acEJwuAbWVFRllu9WAk7HeWhEIBun2OALFDgg6dIIb1K3BcG0tsM
	kwmCCFczaYi63UCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xLjevKLM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IGkjEFnN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739182955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bd6LHuWajiclYWz6GHaEHXdwPEj1Ju2kDcOuAmYgqx8=;
	b=xLjevKLMtv2HqTi5b1dBDJhvMTU7mTxpI0Gei+GbnZiGmWl0XRbZoTeZ0nwB6SdJq7iP+6
	QCOVFv0W7Cv0IyPQxb8maa/x9UPGkC8XDHvPMt3DZkr03+BJQvk9TgMLTzIvaSAzoL26HE
	PZXhICJGunj/xmk3uA/FG0rtAUb2UTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739182955;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bd6LHuWajiclYWz6GHaEHXdwPEj1Ju2kDcOuAmYgqx8=;
	b=IGkjEFnNnx2SK4mdv3acEJwuAbWVFRllu9WAk7HeWhEIBun2OALFDgg6dIIb1K3BcG0tsM
	kwmCCFczaYi63UCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC82713707;
	Mon, 10 Feb 2025 10:22:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BAv3MmrTqWcVSgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 10 Feb 2025 10:22:34 +0000
Date: Mon, 10 Feb 2025 11:22:18 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Frank van der Linden <fvdl@google.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yuzhao@google.com,
	usamaarif642@gmail.com, joao.m.martins@oracle.com,
	roman.gushchin@linux.dev
Subject: Re: [PATCH v3 01/28] mm/cma: export total and free number of pages
 for CMA areas
Message-ID: <Z6nTWhmqkIwFzNMN@localhost.localdomain>
References: <20250206185109.1210657-1-fvdl@google.com>
 <20250206185109.1210657-2-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206185109.1210657-2-fvdl@google.com>
X-Rspamd-Queue-Id: 7A2B11F38F
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,linux.dev,kvack.org,vger.kernel.org,google.com,gmail.com,oracle.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Thu, Feb 06, 2025 at 06:50:41PM +0000, Frank van der Linden wrote:
> In addition to the number of allocations and releases, system
> management software may like to be aware of the size of CMA
> areas, and how many pages are available in it. This information
> is currently not available, so export it in total_page and
> available_pages, respectively.
> 
> The name 'available_pages' was picked over 'free_pages' because
> 'free' implies that the pages are unused. But they might not
> be, they just haven't been used by cma_alloc
> 
> The number of available pages is tracked regardless of
> CONFIG_CMA_SYSFS, allowing for a few minor shortcuts in
> the code, avoiding bitmap operations.
> 
> Signed-off-by: Frank van der Linden <fvdl@google.com>

LGTM,

nit below

Reviewed-by: Oscar Salvador <osalvador@suse.de>

> ---
...  
> @@ -444,6 +445,14 @@ static struct page *__cma_alloc(struct cma *cma, unsigned long count,
>  
>  	for (;;) {
>  		spin_lock_irq(&cma->lock);
> +		/*
> +		 * If the request is larger than the available number
> +		 * of pages, stop right away.
> +		 */
> +		if (count > cma->available_count) {
> +			spin_unlock_irq(&cma->lock);
> +			break;
> +		}
>  		bitmap_no = bitmap_find_next_zero_area_off(cma->bitmap,
>  				bitmap_maxno, start, bitmap_count, mask,
>  				offset);
> @@ -452,6 +461,7 @@ static struct page *__cma_alloc(struct cma *cma, unsigned long count,
>  			break;
>  		}
>  		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
> +		cma->available_count -= count;

I wonder whether we should have a cma_bitmat_set, so available_count would be
touched in there.


-- 
Oscar Salvador
SUSE Labs
