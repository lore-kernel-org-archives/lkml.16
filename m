Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19027267715
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392482; cv=none; b=gniKxHFvPm0Q7WFCc//Ts/AVY5m8WlvdZ7c3Vuhpf1kyyiQoZbo/VlpY4IDbLH/gRMFpp8hRZmlA1OkFnSetuxO+DeeR4jjFDwyDKANnRkTOTilZ2lTYXP8AUrCdV+EXWGxtGE7ugUAMGZFD3OJab/DM/r/G92oR0bRya7DS7wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392482; c=relaxed/simple;
	bh=2QjcY8oZdI84Z3AkI5288+S4rRI/wiJvEbCHzkh/fFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHAJbwDyogpqpRh6gV+UHQtKiRw0SnMXbMk/1ygwFH2ayohXEVxCbQkS/80UX7I6Ac3JcBp0Kx04t9HxThvch/59dqm7V9nrifFYYrVQuWhJHOYOW6n7Ya3b6XIDURYVJLjwvxY/hi7x2H9g7xOAjuib0cx+X1JBTmKiHybGj7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OMPCeQmz; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=f7x/Tyjl; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=PjlZbh98; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=a0t8xvjf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OMPCeQmz";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="f7x/Tyjl";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="PjlZbh98";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="a0t8xvjf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F0795211A8;
	Wed, 23 Apr 2025 07:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745392478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7zZPVktYGdWMKB/Oe2xuwcSVvsgPHmSKHp/5PsSPBo0=;
	b=OMPCeQmz0MbY0kliMesi9H9E0GD72JSHmkvlJC2+b4kUnpPXSiCZ9jN75+VU5EkY9dPhLf
	bsfuq+Dw420FRWv+vSRqiEnLwG3ufrN25NENXxrfw3cLzmpxBZih4OShKcGcAI/uRzjNhD
	Srqsg3Fzf4EXeS7q3dySQbNzzEmsKcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745392478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7zZPVktYGdWMKB/Oe2xuwcSVvsgPHmSKHp/5PsSPBo0=;
	b=f7x/TyjlIWDBuN0yhnoyEU+F7bixSACjMVOzRE5pqqeMx+y09/CRqlZNSngAGYV3DncdU1
	5Ua3UWHm2tQtEuDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=PjlZbh98;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=a0t8xvjf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745392477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7zZPVktYGdWMKB/Oe2xuwcSVvsgPHmSKHp/5PsSPBo0=;
	b=PjlZbh98Y5R2jsw1LShJnfiqFUJFicn1ZGTo4gm/4A8q1A3APen+t/n9UEQzbzjnX9291V
	B87ZhX0V1CBG0YaClW2/zks6P2YCICF+wqmbz74+c8o6FgSaRtEqYNwIdx2puY2tEVTBLO
	XYpxnzuAIviEHWJANiqNZN4FxLTaHcc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745392477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7zZPVktYGdWMKB/Oe2xuwcSVvsgPHmSKHp/5PsSPBo0=;
	b=a0t8xvjf9qU+UpWm3eRPh9H5M6zr3nkB5HXjHxTJHJsSFcLTSITgpvPSzHPEyAKavfOM34
	VE2gqHomLu1NH4CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE1B413A3D;
	Wed, 23 Apr 2025 07:14:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Tlf6MV2TCGjUYAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 23 Apr 2025 07:14:37 +0000
Message-ID: <0981c1fe-05d2-4bab-a0a4-6dc5666d98d7@suse.cz>
Date: Wed, 23 Apr 2025 09:14:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.15-rc3
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
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <CAADnVQ+KnfDLd-=Mg1BDJxCf80K_=RN0dJy_yp681gf1dQMhtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F0795211A8
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.dev,linutronix.de,linux-foundation.org];
	TAGGED_RCPT(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

On 4/23/25 01:37, Alexei Starovoitov wrote:
> On Tue, Apr 22, 2025 at 4:01 PM Dave Airlie <airlied@gmail.com> wrote:
>>
>> > Alexei Starovoitov (2):
>> >       locking/local_lock, mm: replace localtry_ helpers with
>> > local_trylock_t type
>>
>> This seems to have upset some phoronix nginx workload
>> https://www.phoronix.com/review/linux-615-nginx-regression/2
> 
> 3x regression? wow.
> Thanks for heads up.
> I'm staring at the patch and don't see it.
> Adding more experts.

Incidentally my work on slab sheaves using local_trylock() got to a phase
yesterday when after rebasing on rc3 and some refactoring I was looking at
sheaf stats that showed the percpu sheaves were used exactly once per cpu,
and other attempts failed. Which would be explained by local_trylock()
failing. In the context of rc3 itself it would mean the memcg stocks aren't
used at all because they can't be try-locked. Which could make benchmarks
unhappy of course, although surprising that it would be that much.

What I suspect now is the _Generic() part doesn't work as expected. So consider:

local_trylock() (or _irqsave variant) has no _Generic() part, does the
"if (READ_ONCE(tl->acquired))" and "WRITE_ONCE(tl->acquired, 1)" directly,
succeeds the first attempt on each cpu where executed.

local_unlock() goes via __local_lock_release() and since the _Generic() part
there doesn't work, we don't do WRITE_ONCE(tl->acquired, 0); so it stays 1.

preempt or irq handling is fine so nothing like lockdep, preempt debugging,
watchdogs gets suspicious, just the cpu can never succeed local_trylock() again

local_lock(_irqsave()) uses __local_lock_acquire() which also has a
_Generic() part but since it doesn't work, the "lockdep_assert(tl->acquired
== 0);" there isn't triggered either

In fact I've put BUG() in the _Generic() sections of _acquire() and _release()
and it didn't trigger, which would prove the code isn't executed. But I don't
know why _Generic() doesn't recognize the correct type there.

--- a/include/linux/local_lock_internal.h
+++ b/include/linux/local_lock_internal.h
@@ -104,6 +104,7 @@ do {                                                                \
                _Generic((lock),                                        \
                        local_trylock_t *: ({                           \
                                lockdep_assert(tl->acquired == 0);      \
+                               BUG();                                  \
                                WRITE_ONCE(tl->acquired, 1);            \
                        }),                                             \
                        default:(void)0);                               \
@@ -173,6 +174,7 @@ do {                                                                \
                _Generic((lock),                                        \
                        local_trylock_t *: ({                           \
                                lockdep_assert(tl->acquired == 1);      \
+                               BUG();                                  \
                                WRITE_ONCE(tl->acquired, 0);            \
                        }),                                             \
                        default:(void)0);                               \



