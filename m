Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7C1DFE8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745395726; cv=none; b=hFMoBBWDFrHQXdX809QLtqGCm7Vp5qjOfu9c4+IZo7m7/WKhA1+sWCps1wFcpA5fptNXwMxFZq4LjA2Kd1qo4BWPfaJMEULufuUHGv25WnmVa3zxxhIlWW8K6fews5LokiQVLreK1+Ixbfl1o4o0qUnOAjmqYLN12+3KBr2z4sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745395726; c=relaxed/simple;
	bh=wi2uiHSipHxDVuYvEdSMQPL3yBv6AVhRmbaCF3RtItQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PCMeCU97tTHiFQatIgbzwanCmfgm4aGgVdL1WiY5gG4XMATD1YU+FxzA0QlKb0Oct/WIbUe2yYJjijPFcXnOewZCQOeyuQzWix6au5iQPMrJnqXYFLdnrY+m/hqMoOXw8Np3VqthaW2nLszIqkvLFhZBbnqllWndTvSPz3PXQeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=uo5/wpWi; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=AygwKCeZ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=CAJeXsLN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=a4xFRVrj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="uo5/wpWi";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="AygwKCeZ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="CAJeXsLN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="a4xFRVrj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DA5E21F395;
	Wed, 23 Apr 2025 08:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745395723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzcviC1y8OIUZfQzb1hdeY/QxkAJtDJkldVDT44pvn8=;
	b=uo5/wpWiyUREEfXkNYeqzuGQ06aOg2NRjZEFMU3omtNmRJkOZH52hTJC8FEk7h7/SjBLHT
	WEBu79Rm4St/S0iDRoBlxg6hDg95Xl2h/LoEdMONeaqrEIvpqLusunhssGLoUm54B+ZOrs
	WqaJe7Lyo9nHVeIKnW/rxcXWL/GpLs4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745395723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzcviC1y8OIUZfQzb1hdeY/QxkAJtDJkldVDT44pvn8=;
	b=AygwKCeZLln7Cvoaq2/Yc2+/oX8V6GU7B0tcU7cMqgQbH5YzOGvM8u3mCGBeMdH4uBpJY0
	Pv8kQNhT+mbsUECg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745395722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzcviC1y8OIUZfQzb1hdeY/QxkAJtDJkldVDT44pvn8=;
	b=CAJeXsLNZUGKIquxTaATncqzilpRwdR1IyrzYbG4Nf9z88wAgbT8KZvztqvFOU9H1tZmmi
	ptN2HhndmVy+ph7bRxO/+SD/STazn0LoQjZEUgMLp95MQXOiaGnU+WKu+yOD5mIMKabscM
	nmJr19jiwAzWDUtqy788m0X2h5qk5UM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745395722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzcviC1y8OIUZfQzb1hdeY/QxkAJtDJkldVDT44pvn8=;
	b=a4xFRVrjCtABVPlQ8Ek8240DgYnaHCv3472K69Sdv0fP2fYTCeYYSeUsiUthXbgEmgXJg/
	V6T3j+3Q1b0v0fCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B95B513691;
	Wed, 23 Apr 2025 08:08:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UY2QLAqgCGi6cgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 23 Apr 2025 08:08:42 +0000
Message-ID: <d1c0f057-63c8-4be5-9638-d1a67d9b9e15@suse.cz>
Date: Wed, 23 Apr 2025 10:08:42 +0200
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
 <bb701616-26b8-41f0-8a19-0f76b2a64deb@suse.cz>
In-Reply-To: <bb701616-26b8-41f0-8a19-0f76b2a64deb@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.dev,linutronix.de,linux-foundation.org];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On 4/23/25 10:03, Vlastimil Babka wrote:
> On 4/23/25 09:14, Vlastimil Babka wrote:
> 
> Oh I see, replacing the default: which "local_lock_t *:" which is the only
> other expected type, forces the compiler to actually tell me what's wrong:
> 
> ./include/linux/local_lock_internal.h:174:26: error: ‘_Generic’ selector of
> type ‘__seg_gs local_lock_t *’ is not compatible with any association
> 
> 

This should fix the issue hopefully and prevent more unexpected default matches:

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

