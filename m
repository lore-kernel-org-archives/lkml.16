Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D754E237173
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544439; cv=none; b=W9OIhvXgoK7jmshD80XZUFRgkvZKRSJoijWUNENz8bU3gEhxbLNDjWGQ7e14Uf5RBrLKrHBAm3pktZgyOlIqQJYSvCBjPW2x6P0mqBIHgrjBzBNnspWImQB952QSFwOA9jMD8zqi/wbkXJyHuhxrK6QmxoYkOGL3zTgDBABl8dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544439; c=relaxed/simple;
	bh=IBytXpNaaLhMV/u17w0QJznygY6nF8ZlIqvfVG0TI6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qul3wTJ9SK09TrnVm3nXGOzX+fealrGuR/6lr/l9fnK/F4PtwfavkxJbrqOX50YU2R1TFo8WS7mnHyvEzlSVFV2deESG/emIfmZRtVMJm7cWLnmvffjEBSQDwFvEB4RLHnaBOzEm48R6GS0bDm8FjfwpQZgLrzHpg8jSHWqmEWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=PnoL+dEk; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=dsoAksmF; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=PnoL+dEk; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=dsoAksmF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="PnoL+dEk";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="dsoAksmF";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="PnoL+dEk";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="dsoAksmF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF3011F390;
	Tue,  6 May 2025 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746544434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jd6xXTmqLw4/z46X71OaL8w3NdaQT1DvHvsLk/MyuWc=;
	b=PnoL+dEk96Fi2Ztk5oC8VYqaiFz5Up/98FxJiUHMbIqzOxKktl7vkLG5EJWzQl9Fgl7tC2
	I8S5h83mFl51HnXGr/itp+eVwFTDAZyweOOKlrEVn2J2aQIeH+4kJ5F9Eul0A5ILVCaPrM
	DMieilDU77zxANgP6SnnebA/Xtzv0V4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746544434;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jd6xXTmqLw4/z46X71OaL8w3NdaQT1DvHvsLk/MyuWc=;
	b=dsoAksmFVWU1/S6Y6chYRuhDWPMqLRhcK9q8C37nic5LP+wkQ7LyT7oQcZ5BEKquIVhQyV
	DQxlmQ31i3R+8+DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=PnoL+dEk;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=dsoAksmF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746544434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jd6xXTmqLw4/z46X71OaL8w3NdaQT1DvHvsLk/MyuWc=;
	b=PnoL+dEk96Fi2Ztk5oC8VYqaiFz5Up/98FxJiUHMbIqzOxKktl7vkLG5EJWzQl9Fgl7tC2
	I8S5h83mFl51HnXGr/itp+eVwFTDAZyweOOKlrEVn2J2aQIeH+4kJ5F9Eul0A5ILVCaPrM
	DMieilDU77zxANgP6SnnebA/Xtzv0V4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746544434;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jd6xXTmqLw4/z46X71OaL8w3NdaQT1DvHvsLk/MyuWc=;
	b=dsoAksmFVWU1/S6Y6chYRuhDWPMqLRhcK9q8C37nic5LP+wkQ7LyT7oQcZ5BEKquIVhQyV
	DQxlmQ31i3R+8+DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9893D137CF;
	Tue,  6 May 2025 15:13:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HJHeJDInGmh9XgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 06 May 2025 15:13:54 +0000
Message-ID: <62cf4450-c765-4641-b042-66cca71d5912@suse.cz>
Date: Tue, 6 May 2025 17:13:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Fix up memory allocation tracing
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Christoph Lameter <cl@linux.com>
Cc: David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250506144531.3434190-1-linux@roeck-us.net>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250506144531.3434190-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BF3011F390
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 5/6/25 16:45, Guenter Roeck wrote:
> intcp_init_early() calls syscon_regmap_lookup_by_compatible() which in
> turn calls of_syscon_register(). This function allocates memory.

CCing people for intcp_init_early()

> intcp_init_early() is called well before kmalloc caches are initialized.
> As consequence, kmalloc_caches[] entries are NULL, and NULL is passed as
> kmem_cache argument to __kmalloc_cache_noprof(). While slab_alloc_node()
> handles this just fine, the trace code unconditionally dereferences it.
> This results in crashes such as

OK, so we have crashes that are not deterministic. But also
intcp_init_early() deterministically fails, right? This means it's called
before mm_core_init(), and given the "_early" part of the name that's
probably expected (i.e. I don't think it's due to some random initcall
ordering) but maybe then it's wrong to rely on kmalloc() in DT's init_early
hook?

> Unable to handle kernel NULL pointer dereference at virtual address 0000000c when read
> [0000000c] *pgd=00000000
> Internal error: Oops: 5 [#1] ARM
> Modules linked in:
> CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc5-00026-g5fcc9bf84ee5 #1 PREEMPT
> Hardware name: ARM Integrator/CP (Device Tree)
> PC is at __kmalloc_cache_noprof+0xec/0x39c
> LR is at __kmalloc_cache_noprof+0x34/0x39c
> ...
> Call trace:
>  __kmalloc_cache_noprof from of_syscon_register+0x7c/0x310
>  of_syscon_register from device_node_get_regmap+0xa4/0xb0
>  device_node_get_regmap from intcp_init_early+0xc/0x40
>  intcp_init_early from start_kernel+0x60/0x688
>  start_kernel from 0x0
> 
> The problem is not seen with all versions of gcc. Some versions such as
> gcc 9.x apparently do not dereference the pointer, presumably if tracing
> is disabled. The problem has been reproduced with gcc 10.x, 11.x, and 13.x.
> 
> Fix the problem by only dereferencing the kmem_cache pointer if it is
> not NULL, and pass a dummy parameter otherwise. Only add the check to
> __kmalloc_cache_noprof() since it is the only function known to be
> affected.
> 
> The problem affects all supported branches of Linux. The crashing function
> depends on the kernel version, and some versions are only affected if
> CONFIG_TRACING is enabled.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Let's see if making slab silently handle those unexpectedly early calls as
NULL is the right way or we should warn in a debug config or something.

> ---
> I only changed a single call of trace_kmalloc() because it is the only one
> known to be affected. I'll be happy to change the remaining callers if that
> is preferred.
> 
> I have seen this problem for a long time. I always thought it is a compiler
> problem because it is not seen with gcc 9.x. However, it turns out that the
> problem is real.
> 
>  mm/slub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index be8b09e09d30..627aa8d2b9fd 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -4353,7 +4353,7 @@ void *__kmalloc_cache_noprof(struct kmem_cache *s, gfp_t gfpflags, size_t size)
>  	void *ret = slab_alloc_node(s, NULL, gfpflags, NUMA_NO_NODE,
>  					    _RET_IP_, size);
>  
> -	trace_kmalloc(_RET_IP_, ret, size, s->size, gfpflags, NUMA_NO_NODE);
> +	trace_kmalloc(_RET_IP_, ret, size, s ? s->size : -1, gfpflags, NUMA_NO_NODE);
>  
>  	ret = kasan_kmalloc(s, ret, size, gfpflags);
>  	return ret;

