Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F0B270ECC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745395400; cv=none; b=h2rv97tXq75z/BOKfl1xAGAUM34ntK2HGhnXwOajwOghOclkKtQ8D5s4ErHheTTkWgz3b1SWnqXjstzTPWc+Z+XdSXtwQp/SAmwTf5s+g2Ub8Pjb+vjjUdT2BkCAdTEUoHS0xEN4gNLRp2jrZh/tWTS4zVHXKRIDQ9PhlY5c6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745395400; c=relaxed/simple;
	bh=7zi/VGJAai9L8BZ01QEEznoM0u5vIMx02DdsfPaof3g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OyMXLrmoyFbTsOnRfTXbjfM5J9nilfsAssz6nkeoSiYieaSkD9uvfh0n460fda3r08KQBiUONA14Okd/5iyvbEp6bsUUBvpgMtRgNjCnyRVaKn+05E2C9rSIAOcnqCvRkiAzwKc4ncszaM4mdACsoEb4tchDj7U3epTBXFpzLQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=3MXTuZgq; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=KN5FmSPO; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=3MXTuZgq; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=KN5FmSPO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="3MXTuZgq";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="KN5FmSPO";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="3MXTuZgq";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="KN5FmSPO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 05B882118E;
	Wed, 23 Apr 2025 08:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745395396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLduGxsUVUHR/ygPLzOccrmiWWCk116mKUNY4+PD46I=;
	b=3MXTuZgqDz6BOfQ4HuFpXLMkGrvOA0lVAYpXObwTJbB4k4iBOidCAerEhrPQdnGRcqHsN1
	QdfM+YRxnJlcWmgt/AqbM2bt3qo29wpF8kjWGsByfLkTgWqQL3NPJHkkk1JY/bcWw5fQYE
	rUpa1XpTf+xV9QB+HMO1/PDeh4V/h6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745395396;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLduGxsUVUHR/ygPLzOccrmiWWCk116mKUNY4+PD46I=;
	b=KN5FmSPOaCEWo+QI/L+lHA1dh3w6j6WhpUqruDXfrkz+Tf572T1z4dPjYgyE5soZ7noyuT
	ubHFjX5u0OAJuqDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=3MXTuZgq;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=KN5FmSPO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745395396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLduGxsUVUHR/ygPLzOccrmiWWCk116mKUNY4+PD46I=;
	b=3MXTuZgqDz6BOfQ4HuFpXLMkGrvOA0lVAYpXObwTJbB4k4iBOidCAerEhrPQdnGRcqHsN1
	QdfM+YRxnJlcWmgt/AqbM2bt3qo29wpF8kjWGsByfLkTgWqQL3NPJHkkk1JY/bcWw5fQYE
	rUpa1XpTf+xV9QB+HMO1/PDeh4V/h6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745395396;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLduGxsUVUHR/ygPLzOccrmiWWCk116mKUNY4+PD46I=;
	b=KN5FmSPOaCEWo+QI/L+lHA1dh3w6j6WhpUqruDXfrkz+Tf572T1z4dPjYgyE5soZ7noyuT
	ubHFjX5u0OAJuqDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBFE013691;
	Wed, 23 Apr 2025 08:03:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YPTxNMOeCGgAcQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 23 Apr 2025 08:03:15 +0000
Message-ID: <bb701616-26b8-41f0-8a19-0f76b2a64deb@suse.cz>
Date: Wed, 23 Apr 2025 10:03:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.15-rc3
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Dave Airlie <airlied@gmail.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Sebastian Sewior <bigeasy@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
 <CAPM=9tzj_OBFJNsN9j7nMs4OR3=V9yrPmaH7VvN-KNYUYhf-vQ@mail.gmail.com>
 <CAADnVQ+KnfDLd-=Mg1BDJxCf80K_=RN0dJy_yp681gf1dQMhtg@mail.gmail.com>
 <0981c1fe-05d2-4bab-a0a4-6dc5666d98d7@suse.cz>
In-Reply-To: <0981c1fe-05d2-4bab-a0a4-6dc5666d98d7@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 05B882118E
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com,linux.dev,linutronix.de,linux-foundation.org];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/23/25 09:14, Vlastimil Babka wrote:
> On 4/23/25 01:37, Alexei Starovoitov wrote:
>> On Tue, Apr 22, 2025 at 4:01 PM Dave Airlie <airlied@gmail.com> wrote:
>>>
>>> > Alexei Starovoitov (2):
>>> >       locking/local_lock, mm: replace localtry_ helpers with
>>> > local_trylock_t type
>>>
>>> This seems to have upset some phoronix nginx workload
>>> https://www.phoronix.com/review/linux-615-nginx-regression/2
>> 
>> 3x regression? wow.
>> Thanks for heads up.
>> I'm staring at the patch and don't see it.
>> Adding more experts.
> 
> Incidentally my work on slab sheaves using local_trylock() got to a phase
> yesterday when after rebasing on rc3 and some refactoring I was looking at
> sheaf stats that showed the percpu sheaves were used exactly once per cpu,
> and other attempts failed. Which would be explained by local_trylock()
> failing. In the context of rc3 itself it would mean the memcg stocks aren't
> used at all because they can't be try-locked. Which could make benchmarks
> unhappy of course, although surprising that it would be that much.
> 
> What I suspect now is the _Generic() part doesn't work as expected. So consider:
> 
> local_trylock() (or _irqsave variant) has no _Generic() part, does the
> "if (READ_ONCE(tl->acquired))" and "WRITE_ONCE(tl->acquired, 1)" directly,
> succeeds the first attempt on each cpu where executed.
> 
> local_unlock() goes via __local_lock_release() and since the _Generic() part
> there doesn't work, we don't do WRITE_ONCE(tl->acquired, 0); so it stays 1.
> 
> preempt or irq handling is fine so nothing like lockdep, preempt debugging,
> watchdogs gets suspicious, just the cpu can never succeed local_trylock() again
> 
> local_lock(_irqsave()) uses __local_lock_acquire() which also has a
> _Generic() part but since it doesn't work, the "lockdep_assert(tl->acquired
> == 0);" there isn't triggered either
> 
> In fact I've put BUG() in the _Generic() sections of _acquire() and _release()
> and it didn't trigger, which would prove the code isn't executed. But I don't
> know why _Generic() doesn't recognize the correct type there.
> 
> --- a/include/linux/local_lock_internal.h
> +++ b/include/linux/local_lock_internal.h
> @@ -104,6 +104,7 @@ do {                                                                \
>                 _Generic((lock),                                        \
>                         local_trylock_t *: ({                           \
>                                 lockdep_assert(tl->acquired == 0);      \
> +                               BUG();                                  \
>                                 WRITE_ONCE(tl->acquired, 1);            \
>                         }),                                             \
>                         default:(void)0);                               \
> @@ -173,6 +174,7 @@ do {                                                                \
>                 _Generic((lock),                                        \
>                         local_trylock_t *: ({                           \
>                                 lockdep_assert(tl->acquired == 1);      \
> +                               BUG();                                  \
>                                 WRITE_ONCE(tl->acquired, 0);            \
>                         }),                                             \
>                         default:(void)0);                               \
> 

Oh I see, replacing the default: which "local_lock_t *:" which is the only
other expected type, forces the compiler to actually tell me what's wrong:

./include/linux/local_lock_internal.h:174:26: error: ‘_Generic’ selector of
type ‘__seg_gs local_lock_t *’ is not compatible with any association


