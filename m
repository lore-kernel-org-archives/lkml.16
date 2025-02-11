Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A62505A2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288167; cv=none; b=p1d0VVLnYAoAJ2FAAxgpHWbNMjMp8GF69A5iCWB/ZrAkIq5xsAwatiXCmS1zhG+eeK3121NBaPesftnsvTsSxugr0GEmIrjzYg2RxtYdw5hTCdEtRrIDGfzc5Ar9xkA51Dv8qsrBc/bDtGuVla1Sum4Li4mq4OhKB8xHq34ZIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288167; c=relaxed/simple;
	bh=jn2GR7kb6y8Q3yCAHMsOoyv0CpS36dCJXjWtasUSaHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VIDdbpaCPupt4/2N8+0gPL2AKPJ4oH3lBtlKnVxBRdvR0ggIvXGtt778jGRzoczFYrIbDjT5rFr9Sygy9aZ6TNALTMWbsxGcbOi5whls9KYWyWyhQgE6X00i9I234zWac1OyDhD1jjNz3L1oHjC+CI3hpFX0TN11hwtRjt5R5f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ajiXRJUi; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=D9uW25t3; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=j38a5bnJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=YbLyNrYq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ajiXRJUi";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="D9uW25t3";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="j38a5bnJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="YbLyNrYq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 27EA4343DB;
	Tue, 11 Feb 2025 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1739286356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SK/hMZFFWYHTcqTuxA26rggFAmVKbr6XW3u2dPATlN8=;
	b=ajiXRJUih45/mRPxgwFDUY9e9NIKnsH3/4Ve7O28ajVAHRsqcMASgBaxFeTxEOngG9jMAI
	+eSw5aI8EPfQWCw3mCksvmzuzrN+J2TaRgOMHLxcv9k+SVgsZeBxQNaKF51XOfL/Q6pcKc
	/GS5VCTDu+cs4PO06qRVyHTB7pVvnxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1739286356;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SK/hMZFFWYHTcqTuxA26rggFAmVKbr6XW3u2dPATlN8=;
	b=D9uW25t3hJxdPmbd/eVt9lnBviVjctjdv8IR5AcPj79k8PHMr7YqKK0MPQJ7vTqaZlirb4
	mCGfEaZrUl7RJEAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1739286355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SK/hMZFFWYHTcqTuxA26rggFAmVKbr6XW3u2dPATlN8=;
	b=j38a5bnJKw8ySZbz8a5mBmzIHcTN+zPIkAZNrSqAa9ElartJzi3+SbAj80qV4p8kVQdQO7
	JNClojydqwWPuzStQjh2Lf8Xz28VBUcLJCF7sEckKiVGndyXVXnX4+BW5oMQrKbOHgsRjF
	AxvuHIvShki7AD3IPBaXUmB2mwsVsGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1739286355;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SK/hMZFFWYHTcqTuxA26rggFAmVKbr6XW3u2dPATlN8=;
	b=YbLyNrYqwK8qmWNN5MvCXwcPkBY5yXp1es3olx4Oc3xlfApEVm5NEn8fRsjG+ZSJoGFPTu
	thP1hNQeYspc7bDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A45A13715;
	Tue, 11 Feb 2025 15:05:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IMosAlNnq2emXAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 11 Feb 2025 15:05:55 +0000
Message-ID: <b990116d-d475-4c57-9c6c-fafb4ef5fbad@suse.cz>
Date: Tue, 11 Feb 2025 16:05:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, percpu: do not consider sleepable allocations atomic
Content-Language: en-US
To: Michal Hocko <mhocko@kernel.org>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Filipe Manana <fdmanana@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 LKML <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
References: <20250206122633.167896-1-mhocko@kernel.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250206122633.167896-1-mhocko@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On 2/6/25 13:26, Michal Hocko wrote:
> From: Michal Hocko <mhocko@suse.com>
> 
> 28307d938fb2 ("percpu: make pcpu_alloc() aware of current gfp context")
> has fixed a reclaim recursion for scoped GFP_NOFS context. It has done
> that by avoiding taking pcpu_alloc_mutex. This is a correct solution as
> the worker context with full GFP_KERNEL allocation/reclaim power and which
> is using the same lock cannot block the NOFS pcpu_alloc caller.
> 
> On the other hand this is a very conservative approach that could lead
> to failures because pcpu_alloc lockless implementation is quite limited.
> 
> We have a bug report about premature failures when scsi array of 193
> devices is scanned. Sometimes (not consistently) the scanning aborts
> because the iscsid daemon fails to create the queue for a random scsi
> device during the scan. iscsid itslef is running with PR_SET_IO_FLUSHER
> set so all allocations from this process context are GFP_NOIO. This in
> turn makes any pcpu_alloc lockless (without pcpu_alloc_mutex) which
> leads to pre-mature failures.
> 
> It has turned out that iscsid has worked around this by dropping
> PR_SET_IO_FLUSHER (https://github.com/open-iscsi/open-iscsi/pull/382)
> when scanning host. But we can do better in this case on the kernel side
> and use pcpu_alloc_mutex for NOIO resp.  NOFS constrained allocation
> scopes too.  We just need the WQ worker to never trigger IO/FS reclaim.
> Achieve that by enforcing scoped GFP_NOIO for the whole execution of
> pcpu_balance_workfn (this will imply NOFS constrain as well). This will
> remove the dependency chain and preserve the full allocation power of
> the pcpu_alloc call.
> 
> While at it make is_atomic really test for blockable allocations.
> 
> Fixes: 28307d938fb2 ("percpu: make pcpu_alloc() aware of current gfp context
> Signed-off-by: Michal Hocko <mhocko@suse.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  mm/percpu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/percpu.c b/mm/percpu.c
> index d8dd31a2e407..192c2a8e901d 100644
> --- a/mm/percpu.c
> +++ b/mm/percpu.c
> @@ -1758,7 +1758,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
>  	gfp = current_gfp_context(gfp);
>  	/* whitelisted flags that can be passed to the backing allocators */
>  	pcpu_gfp = gfp & (GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
> -	is_atomic = (gfp & GFP_KERNEL) != GFP_KERNEL;
> +	is_atomic = !gfpflags_allow_blocking(gfp);
>  	do_warn = !(gfp & __GFP_NOWARN);
>  
>  	/*
> @@ -2204,7 +2204,12 @@ static void pcpu_balance_workfn(struct work_struct *work)
>  	 * to grow other chunks.  This then gives pcpu_reclaim_populated() time
>  	 * to move fully free chunks to the active list to be freed if
>  	 * appropriate.
> +	 *
> +	 * Enforce GFP_NOIO allocations because we have pcpu_alloc users
> +	 * constrained to GFP_NOIO/NOFS contexts and they could form lock
> +	 * dependency through pcpu_alloc_mutex
>  	 */
> +	unsigned int flags = memalloc_noio_save();
>  	mutex_lock(&pcpu_alloc_mutex);
>  	spin_lock_irq(&pcpu_lock);
>  
> @@ -2215,6 +2220,7 @@ static void pcpu_balance_workfn(struct work_struct *work)
>  
>  	spin_unlock_irq(&pcpu_lock);
>  	mutex_unlock(&pcpu_alloc_mutex);
> +	memalloc_noio_restore(flags);
>  }
>  
>  /**

