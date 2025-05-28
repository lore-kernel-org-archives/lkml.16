Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB802CA8
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423087; cv=none; b=szzu159L+f/A+McTQn7ASgiOMD++MSdePrXK0fIneoZlZBJhifBIdQRcqvUfdu2EOuBR1kMtGUJ3KSz15cBKfyFpRTltPnW2lh4QOXvqC7uztKVwLNlKd/fqE18ZFISUXKQ6jk4ao2911T5Ftt68hNKhwoKrV7tr2tK8dAIQDg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423087; c=relaxed/simple;
	bh=BCPmWotxYnhiVhx8a88cIXNIaYc00lx469hJzboFrXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HffNhSgHwmVbslEW/uTQRD3PvYvEFoJybo+37ar3gP/x1TguPhnLW1lY5nG8dBF/RVJY5UxccXd2dZgvGXq3WL5A6TS86nYZrFRBvW9t/zxunV79Yza2A0l1+7rgNsNlwGGKoO+XNzp+MzIp8/8B23PRz+dzuKEreDDUT+Yqbng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=j1Yf1CsJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=L4S6W4h9; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=j1Yf1CsJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=L4S6W4h9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="j1Yf1CsJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="L4S6W4h9";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="j1Yf1CsJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="L4S6W4h9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 722BD21B47;
	Wed, 28 May 2025 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748423083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DF79ZmvEmJitEx8ite1iCdEbm7wTvePAxSFygteHMdE=;
	b=j1Yf1CsJ2czzv8SEmdmmEikG0WBJyhQN5WRlv9EeRI72uIhlx0InHeIxRddVEH1NuL4u/e
	/KA/D/YltvH6m0lGqDZXN1cWcV9mkNjU1PJbnVuE94w/C2jo2iZjh99vL2MOVaJ1JMJ+2E
	KgOW0mb8EGm805Ao9kQ2gU42ddFTs68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748423083;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DF79ZmvEmJitEx8ite1iCdEbm7wTvePAxSFygteHMdE=;
	b=L4S6W4h9Y5RwnEOjLgk6d6WaqNNsVWbiAV6zgLp05J5C8JiAUKfG+b+WQIeTEM1bx1/Ryk
	aiCsoCGwSaw7SCDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=j1Yf1CsJ;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=L4S6W4h9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748423083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DF79ZmvEmJitEx8ite1iCdEbm7wTvePAxSFygteHMdE=;
	b=j1Yf1CsJ2czzv8SEmdmmEikG0WBJyhQN5WRlv9EeRI72uIhlx0InHeIxRddVEH1NuL4u/e
	/KA/D/YltvH6m0lGqDZXN1cWcV9mkNjU1PJbnVuE94w/C2jo2iZjh99vL2MOVaJ1JMJ+2E
	KgOW0mb8EGm805Ao9kQ2gU42ddFTs68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748423083;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DF79ZmvEmJitEx8ite1iCdEbm7wTvePAxSFygteHMdE=;
	b=L4S6W4h9Y5RwnEOjLgk6d6WaqNNsVWbiAV6zgLp05J5C8JiAUKfG+b+WQIeTEM1bx1/Ryk
	aiCsoCGwSaw7SCDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53FEE136E0;
	Wed, 28 May 2025 09:04:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kP5uE6vRNmgeZAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 28 May 2025 09:04:43 +0000
Message-ID: <7faca175-64c2-4a12-9340-37eaeeb8bd3e@suse.cz>
Date: Wed, 28 May 2025 11:04:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] local_lock: Minor improvements of local_trylock*()
 documentation
Content-Language: en-US
To: Leonardo Bras <leobras@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jakub Kicinski <kuba@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
References: <20250521174726.578303-1-leobras@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250521174726.578303-1-leobras@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:dkim,suse.cz:mid,suse.cz:email];
	URIBL_BLOCKED(0.00)[suse.cz:dkim,suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 722BD21B47
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On 5/21/25 19:47, Leonardo Bras wrote:
> Fix local_trylock_init() documentation, as it was mentioning the non-try
> helper instead, and use the opportunity to make clear the try_lock*() needs
> to receive a local_trylock_t variable as parameter.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

Locking tree (btw the local_lock files are missing in the list of
MAINTAINERS) or mm since this fixes up changes that went through mm recently?

> ---
> v1: https://lore.kernel.org/all/20250505170244.253170-1-leobras@redhat.com/
> RFC: https://lore.kernel.org/all/20250430073610.163846-1-leobras@redhat.com/
> 
> 
>  include/linux/local_lock.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/local_lock.h b/include/linux/local_lock.h
> index 16a2ee4f8310b..d8d5e6cfa1151 100644
> --- a/include/linux/local_lock.h
> +++ b/include/linux/local_lock.h
> @@ -45,38 +45,38 @@
>  /**
>   * local_unlock_irqrestore - Release a per CPU local lock and restore
>   *			      interrupt flags
>   * @lock:	The lock variable
>   * @flags:      Interrupt flags to restore
>   */
>  #define local_unlock_irqrestore(lock, flags)			\
>  	__local_unlock_irqrestore(lock, flags)
>  
>  /**
> - * local_lock_init - Runtime initialize a lock instance
> + * local_trylock_init - Runtime initialize a local_trylock_t instance
>   */
>  #define local_trylock_init(lock)	__local_trylock_init(lock)
>  
>  /**
>   * local_trylock - Try to acquire a per CPU local lock
> - * @lock:	The lock variable
> + * @lock:	The local_trylock_t variable
>   *
>   * The function can be used in any context such as NMI or HARDIRQ. Due to
>   * locking constrains it will _always_ fail to acquire the lock in NMI or
>   * HARDIRQ context on PREEMPT_RT.
>   */
>  #define local_trylock(lock)		__local_trylock(lock)
>  
>  /**
>   * local_trylock_irqsave - Try to acquire a per CPU local lock, save and disable
>   *			   interrupts if acquired
> - * @lock:	The lock variable
> + * @lock:	The local_trylock_t variable
>   * @flags:	Storage for interrupt flags
>   *
>   * The function can be used in any context such as NMI or HARDIRQ. Due to
>   * locking constrains it will _always_ fail to acquire the lock in NMI or
>   * HARDIRQ context on PREEMPT_RT.
>   */
>  #define local_trylock_irqsave(lock, flags)			\
>  	__local_trylock_irqsave(lock, flags)
>  
>  DEFINE_GUARD(local_lock, local_lock_t __percpu*,

