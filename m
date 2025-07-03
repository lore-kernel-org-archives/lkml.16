Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420042DFF17
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536392; cv=none; b=fJpfK5/6DFkglpS4uslrQfUzr5ntDoBlFw1YTamZD4QTHZWPTFgAMh77c06N+kyzJyvYNww7M1fDAfidZW3BzKMD00ms+ZXpMzcT5FLJxDbJN+DRWWQo79JJJkCyGFlYECLhnqRHxj9RYOeTrT86X3tPHBzTodqqqTpuD5kinio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536392; c=relaxed/simple;
	bh=uPbguE/8OAOATIPW9RykVhl8O/CGv8inu1oPmLQ4M7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hngDnlzSer+LV8gtNPb9RV9RtPW60z/2L9OyC5BvZpCyBwFTU34/cX2t5NXsOJwk/QbtQxHwkwDVEo1lKThtMqTkkAs59xt/1P32Ihav+CFjJ158OTPjuge0Jjp9j/uGuwpcD0xvWBJ5O6klGwmE6HUG9tsoIxU+ot7z/wSPLAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K4dy94I1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=irUAu815; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K4dy94I1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=irUAu815; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K4dy94I1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="irUAu815";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K4dy94I1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="irUAu815"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5BC3B1F387;
	Thu,  3 Jul 2025 09:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751536388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ASGLg+R2jtd9A6SKFohBR505MT0D8s64e+2Cx+0rS/M=;
	b=K4dy94I1QjSIye0Zp/yef9GHWsU+jIvS48MkYq5jLeguRxsd7EYBiFBUsY7KJE4hOfHuJo
	YkfP8c8Oho0dqO/80fXI6r4wdV8mYOB4lhDya4SuO09fqPyb+YuVVIIlpU4ed0yTuZoUbd
	WR6nYYqToGZ6HNbPyQJ7jBDSpHPQHIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751536388;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ASGLg+R2jtd9A6SKFohBR505MT0D8s64e+2Cx+0rS/M=;
	b=irUAu815G4wRehMLcBMN7OjR1KEfji/6qTkoGKDAZJ88hhvP5CzbApsBJquUg3ASCOPFxH
	FM+fcLP4j/GMWcBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=K4dy94I1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=irUAu815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751536388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ASGLg+R2jtd9A6SKFohBR505MT0D8s64e+2Cx+0rS/M=;
	b=K4dy94I1QjSIye0Zp/yef9GHWsU+jIvS48MkYq5jLeguRxsd7EYBiFBUsY7KJE4hOfHuJo
	YkfP8c8Oho0dqO/80fXI6r4wdV8mYOB4lhDya4SuO09fqPyb+YuVVIIlpU4ed0yTuZoUbd
	WR6nYYqToGZ6HNbPyQJ7jBDSpHPQHIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751536388;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ASGLg+R2jtd9A6SKFohBR505MT0D8s64e+2Cx+0rS/M=;
	b=irUAu815G4wRehMLcBMN7OjR1KEfji/6qTkoGKDAZJ88hhvP5CzbApsBJquUg3ASCOPFxH
	FM+fcLP4j/GMWcBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E47D213721;
	Thu,  3 Jul 2025 09:53:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0nUZNQNTZmh7CQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 03 Jul 2025 09:53:07 +0000
Date: Thu, 3 Jul 2025 11:53:06 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Pratyush Yadav <ptyadav@amazon.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 3/3] cma: move allocation from HIGHMEM to a helper
 function
Message-ID: <aGZTApK8WxFrTxI0@localhost.localdomain>
References: <20250702173605.2198924-1-rppt@kernel.org>
 <20250702173605.2198924-4-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702173605.2198924-4-rppt@kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5BC3B1F387
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On Wed, Jul 02, 2025 at 08:36:05PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> When CONFIG_HIGMEM is enabled, __cma_declare_contiguous_nid() first
> tries to allocate the area from HIGHMEM and if that fails it falls back
> to allocation from low memory.
> 
> Split allocation from HIGMEM into a helper function to further decouple
> logic related to CONFIG_HIGHMEM.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  mm/cma.c | 52 +++++++++++++++++++++++++++++-----------------------
>  1 file changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/cma.c b/mm/cma.c
> index 1df8ff312d99..0a24c46f3296 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -376,6 +376,30 @@ static int __init cma_fixed_reserve(phys_addr_t base, phys_addr_t size)
>  	return 0;
>  }
>  
> +static phys_addr_t __init cma_alloc_highmem(phys_addr_t base, phys_addr_t size,
> +			phys_addr_t align, phys_addr_t *limit, int nid)
> +{
> +	phys_addr_t addr = 0;
> +
> +	if (IS_ENABLED(CONFIG_HIGHMEM)) {
> +		phys_addr_t highmem = __pa(high_memory - 1) + 1;
> +
> +		/*
> +		 * All pages in the reserved area must come from the same zone.
> +		 * If the requested region crosses the low/high memory boundary,
> +		 * try allocating from high memory first and fall back to low
> +		 * memory in case of failure.
> +		 */
> +		if (base < highmem && *limit > highmem) {
> +			addr = memblock_alloc_range_nid(size, align, highmem,
> +							*limit, nid, true);
> +			*limit = highmem;
> +		}
> +	}

Not a big deal, but maybe better to do it in one function? Maybe even move
the CONFIG_PHYS_ADDR_T_64BIT block in there as well? So memblock_alloc_range_nid()
calls would be contained in one place and the X86_64/HIGHMEM comments as
well.
Just a thought.

 diff --git a/mm/cma.c b/mm/cma.c
 index dd7643fc01db..532b56e6971a 100644
 --- a/mm/cma.c
 +++ b/mm/cma.c
 @@ -377,11 +377,12 @@ static int __init cma_fixed_reserve(phys_addr_t base, phys_addr_t size)
  	return 0;
  }
 
 -static phys_addr_t __init cma_alloc_highmem(phys_addr_t base, phys_addr_t size,
 -			phys_addr_t align, phys_addr_t *limit, int nid)
 +static phys_addr_t __init cma_alloc_mem(phys_addr_t base, phys_addr_t size,
 +			phys_addr_t align, phys_addr_t limit, int nid)
  {
  	phys_addr_t addr = 0;
 
 +	/* On systems with HIGHMEM try allocating from there first */
  	if (IS_ENABLED(CONFIG_HIGHMEM)) {
  		phys_addr_t highmem = __pa(high_memory - 1) + 1;
 
 @@ -393,11 +394,15 @@ static phys_addr_t __init cma_alloc_highmem(phys_addr_t base, phys_addr_t size,
  		 */
  		if (base < highmem && *limit > highmem) {
  			addr = memblock_alloc_range_nid(size, align, highmem,
 -							*limit, nid, true);
 +							limit, nid, true);
  			*limit = highmem;
  		}
  	}
 
 +	if (!addr)
 +		addr = memblock_alloc_range_nid(size, alignment, base,
 +						limit, nid, true);
 +
  	return addr;
  }
 
 @@ -487,16 +492,8 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
  		}
  #endif
 
 -		/* On systems with HIGHMEM try allocating from there first */
  		if (!addr)
 -			addr = cma_alloc_highmem(base, size, alignment, &limit,
 -						 nid);
 -		if (!addr) {
 -			addr = memblock_alloc_range_nid(size, alignment, base,
 -					limit, nid, true);
 -			if (!addr)
 -				return -ENOMEM;
 -		}
 +			addr = cma_alloc_mem(base, size, alignment, limit, nid);
 
  		/*
  		 * kmemleak scans/reads tracked objects for pointers to other



-- 
Oscar Salvador
SUSE Labs
