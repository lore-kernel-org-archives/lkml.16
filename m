Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E1B266588
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397729; cv=none; b=Uz/3TFEQLHbfP1sLI1nIPBoCaDZY+Bg28nf+paxRI0Ev5c3rFL0YeD/T3/LDG4QGivsFGzd1ZMbG7qbWBo5Q2zTHSVS7KTSCIo8ZwZZpqAksLyAt9d8y0uFxMEF2oATDTis0JM0LRpmqscdn/AVczSwpDUCx3tJvd5/wFXFT2p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397729; c=relaxed/simple;
	bh=Hzs0TVKxRbUC34MRlMtbM+BrDPnAowA3NJhn45DvJfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qzEEs8BZFJ81sY07AJ+D4Y+1nrXnkn8WLmBw/2VJ5PDNmKSkuzdfsDw5Ovb/XtCyQgRp7lblo9zCe7gtM9OyCzlIYHUxgcY8TdHHNiDTPUEnne4UpUQMwOgYdxLI2KEGUy3EOnYXhmHKAIPxWyWgX8zHxK3l2d2iXSmCsbiBuj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=0f+f0lJx; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=cJC0Kfkx; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=0f+f0lJx; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=cJC0Kfkx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="0f+f0lJx";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="cJC0Kfkx";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="0f+f0lJx";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="cJC0Kfkx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 315622117A;
	Wed, 23 Apr 2025 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745397724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fW8BCCmYe91eCliVad4ATqU8DOUJ4JvUB6Un4+Oy4lU=;
	b=0f+f0lJxnaK9ZMGq63hEgvk5fM2k0HGimXhoHZUkfT1Sn/q3MnPvx8WRX7tIzzHCsHD18u
	D97Yg1WVl7bp/CRcSzYWGKsSJnH+AGtuRZrgk/WD+R21WlUPnWq1coZynLijV5kTm6BQuo
	KF1g5vEZRKmxAAcwmGSzOTaXbopglVE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745397724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fW8BCCmYe91eCliVad4ATqU8DOUJ4JvUB6Un4+Oy4lU=;
	b=cJC0Kfkxu9VnTM8JS26jgEXXTYuJ5m4Cfmk08GNTsY78PKrEb4hCUdF3Typ9YXfs4NMYf1
	tNsRJhr1Sgfs52AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=0f+f0lJx;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=cJC0Kfkx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745397724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fW8BCCmYe91eCliVad4ATqU8DOUJ4JvUB6Un4+Oy4lU=;
	b=0f+f0lJxnaK9ZMGq63hEgvk5fM2k0HGimXhoHZUkfT1Sn/q3MnPvx8WRX7tIzzHCsHD18u
	D97Yg1WVl7bp/CRcSzYWGKsSJnH+AGtuRZrgk/WD+R21WlUPnWq1coZynLijV5kTm6BQuo
	KF1g5vEZRKmxAAcwmGSzOTaXbopglVE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745397724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fW8BCCmYe91eCliVad4ATqU8DOUJ4JvUB6Un4+Oy4lU=;
	b=cJC0Kfkxu9VnTM8JS26jgEXXTYuJ5m4Cfmk08GNTsY78PKrEb4hCUdF3Typ9YXfs4NMYf1
	tNsRJhr1Sgfs52AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1190813691;
	Wed, 23 Apr 2025 08:42:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yfXxA9ynCGjQfAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 23 Apr 2025 08:42:04 +0000
Message-ID: <27d55aab-c2d8-4edf-bab5-91a04b8383c5@suse.cz>
Date: Wed, 23 Apr 2025 10:42:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.15-rc3
Content-Language: en-US
To: Michael Larabel <Michael@phoronix.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
Cc: Dave Airlie <airlied@gmail.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Sebastian Sewior <bigeasy@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
 <CAPM=9tzj_OBFJNsN9j7nMs4OR3=V9yrPmaH7VvN-KNYUYhf-vQ@mail.gmail.com>
 <CAADnVQ+KnfDLd-=Mg1BDJxCf80K_=RN0dJy_yp681gf1dQMhtg@mail.gmail.com>
 <mhewqdlvb5ahqordw2nuebq7yvsxo7xvdas4vl6gehmbmypcil@v3fn7nzllglj>
 <896a67ec-9f48-4137-9d34-4bb16861e284@phoronix.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <896a67ec-9f48-4137-9d34-4bb16861e284@phoronix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 315622117A
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linutronix.de,linux-foundation.org,kernel.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:email,suse.cz:dkim,suse.cz:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

On 4/23/25 02:54, Michael Larabel wrote:
> On 4/22/25 7:12 PM, Shakeel Butt wrote:
>> Ccing Michael
>>
>> On Tue, Apr 22, 2025 at 04:37:59PM -0700, Alexei Starovoitov wrote:
>>> On Tue, Apr 22, 2025 at 4:01 PM Dave Airlie <airlied@gmail.com> wrote:
>>>>> Alexei Starovoitov (2):
>>>>>        locking/local_lock, mm: replace localtry_ helpers with
>>>>> local_trylock_t type
>>>> This seems to have upset some phoronix nginx workload
>>>> https://www.phoronix.com/review/linux-615-nginx-regression/2
>>> 3x regression? wow.
>>> Thanks for heads up.
>>> I'm staring at the patch and don't see it.
>>> Adding more experts.
>> Hi Michael,
>>
>> Can you please share a bit more on your nginx workload and how can we
>> reproduce locally? In the mean time, I can try netperf locally to
>> reproduce.
>>
>> I do have some followup optimizations [1, 2] which hopefully are aimed
>> for next release but we can try those as well.
>>
>> [1] https://lkml.kernel.org/r/20250416180229.2902751-1-shakeel.butt@linux.dev
>> [2] https://lkml.kernel.org/r/20250410025752.92159-1-shakeel.butt@linux.dev
>>
>> thanks,
>> Shakeel
> 
> The Nginx test case is a fairly stock Nginx build measuring HTTPS 
> throughput for serving some static web page with Wrk used as the 
> stressor, all on the same host for stressing just the local host. All of 
> the assets and execution scripts used for that Nginx test in raw form 
> are here - 
> https://openbenchmarking.org/innhold/c7b555063f5732b4f1bb08444e258984d1dbb94b 
> Let me know if any problems reproducing, etc.
> 
> Thanks, I can try out those patches tomorrow. At the moment on that same 
> server currently running through some of the other workloads I also 
> found regressed on Linux 6.15 GIt to see if attributed to same commit or 
> not.

Hi, please try the following patch. I also realized I left you out of my previous
replies leading to it, due to replying to an earlier mail of the thread:
https://lore.kernel.org/all/0981c1fe-05d2-4bab-a0a4-6dc5666d98d7@suse.cz/

Thanks,
Vlastimil

----8<----
From: Vlastimil Babka <vbabka@suse.cz>
Date: Wed, 23 Apr 2025 10:21:29 +0200
Subject: [PATCH] locking/local_lock: fix _Generic() matching of
 local_trylock_t

Michael Larabel reported [1] a nginx performance regression in v6.15-rc3 and
bisected it to commit 51339d99c013 ("locking/local_lock, mm: replace
localtry_ helpers with local_trylock_t type")

The problem is the _Generic() usage with a default association that
masks the fact that "local_trylock_t *" association is not being
selected as expected. Replacing the default with the only other expected
type "local_lock_t *" reveals the underlying problem:

./include/linux/local_lock_internal.h:174:26: error: ‘_Generic’ selector of
type ‘__seg_gs local_lock_t *’ is not compatible with any association

The local_locki's are part of __percpu structures and thus the __percpu
attribute is needed to associate the type properly. Add the attribute
and keep the default replaced to turn any further mismatches into
compile errors.

The failure to recognize local_try_lock_t in __local_lock_release()
means that a local_trylock[_irqsave]() operation will set tl->acquired
to 1 (there's no _Generic() part in the trylock code), but then
local_unlock[_irqrestore]() will not set tl->acquired back to 0, so
further trylock operations will always fail on the same cpu+lock, while
non-trylock operations continue to work - a lockdep_assert() is also
not being executed in the _Generic() part of local_lock() code.

This means consume_stock() and refill_stock() operations will fail
deterministically, resulting in taking the slow paths and worse
performance.

Fixes: 51339d99c013 ("locking/local_lock, mm: replace localtry_ helpers with local_trylock_t type")
Reported-by: Michael Larabel <Michael@phoronix.com>
Closes: https://www.phoronix.com/review/linux-615-nginx-regression/2 [1]
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/local_lock_internal.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock_internal.h
index bf2bf40d7b18..8d5ac16a9b17 100644
--- a/include/linux/local_lock_internal.h
+++ b/include/linux/local_lock_internal.h
@@ -102,11 +102,11 @@ do {								\
 		l = (local_lock_t *)this_cpu_ptr(lock);			\
 		tl = (local_trylock_t *)l;				\
 		_Generic((lock),					\
-			local_trylock_t *: ({				\
+			__percpu local_trylock_t *: ({			\
 				lockdep_assert(tl->acquired == 0);	\
 				WRITE_ONCE(tl->acquired, 1);		\
 			}),						\
-			default:(void)0);				\
+			__percpu local_lock_t *: (void)0);		\
 		local_lock_acquire(l);					\
 	} while (0)
 
@@ -171,11 +171,11 @@ do {								\
 		tl = (local_trylock_t *)l;				\
 		local_lock_release(l);					\
 		_Generic((lock),					\
-			local_trylock_t *: ({				\
+			__percpu local_trylock_t *: ({			\
 				lockdep_assert(tl->acquired == 1);	\
 				WRITE_ONCE(tl->acquired, 0);		\
 			}),						\
-			default:(void)0);				\
+			__percpu local_lock_t *: (void)0);		\
 	} while (0)
 
 #define __local_unlock(lock)					\
-- 
2.49.0


