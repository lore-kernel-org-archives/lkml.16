Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC36022331C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750154525; cv=none; b=tOn8ArF7n85XsoqnxTVk0GXNgAHAHxicm+GGzFYClvtMJyTQfKzD9Wy/UYItKLwhCgLs82AAzKGbIEoJ3GxX4iPB0heGbO1lEqYAvb9xQbQqnD0y2lONVX0zjVt7ywew4SY2kz+6WoBEq+a6LDe0U9S7WaEnGU+56xCKuSV42gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750154525; c=relaxed/simple;
	bh=DSsgT3BPDXrnH4seaJ585q1I3Z83m/A2GcztaQTwB8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1F91AloLo7aEbVblogMBvu+yGzQP7UoaKg5lwa65uGCxlc+1NQ3KPjFg8UQOziICLa91p2FPWrx8fBKatuebUNH3Ix6PipCnXK0wjHXEK2/u2eps5mBlb646A26GZw9p/G2w6suEqMbJ3cljsO6N+g1joOgrPW8vRmtByC40Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=QU2rtsN8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=/Fl2UmtK; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cMW8JP6a; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=V8HLv7ZL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="QU2rtsN8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/Fl2UmtK";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cMW8JP6a";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="V8HLv7ZL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E25C51F391;
	Tue, 17 Jun 2025 10:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750154516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=is6xPlFFjHxaFmKq3lSjTwC88hPdy6cHcQ1nJWax3T0=;
	b=QU2rtsN85tcH+wAy9eWHh5Jot7RqHm8qNSAEa9JeeeM7lhQk9X+04lxHyviETFMmE+2eCM
	X3k8OG04UaxPwcwH76ZE8RZSYyoCcpQmE43wuXDcem8sOplH4v3gndq/LNzrkKxzVEeJZ+
	m1CKFCWSstiGFlc7tljmUl0/uK9E8Fo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750154516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=is6xPlFFjHxaFmKq3lSjTwC88hPdy6cHcQ1nJWax3T0=;
	b=/Fl2UmtKYM9yIYVjZvFCQUpdtqQlxJrbTSF2Z1l3i6g3LubAyPbSf3AqVNUuoGdDQPpDtK
	6aUhHG5W2DA2EsBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750154515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=is6xPlFFjHxaFmKq3lSjTwC88hPdy6cHcQ1nJWax3T0=;
	b=cMW8JP6atbgqTRHQjqXliTY+BkezB3w/0SJf7wle4TZHdVxU3jFxEwRdLfMLRRw9Yg8YKp
	dMANAK3zfk+PUv5Ein+MSIcbGtaExrjpYqc+GLgI5pOiRL3jodND20lv7yCk92k15+oqDA
	5i5KTmjJk6vCEFwR+dRvjffGdQpejF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750154515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=is6xPlFFjHxaFmKq3lSjTwC88hPdy6cHcQ1nJWax3T0=;
	b=V8HLv7ZLKCpHrbSjFo8ZraJqDW6bM88t+CNzTxp2Hu9z6uZbnCPJU3EePtF6cKQuE6Inu7
	WrxyACqzoA3dh0Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5A5013A69;
	Tue, 17 Jun 2025 10:01:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ow5/LxM9UWiyFQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 17 Jun 2025 10:01:55 +0000
Message-ID: <dd93f2ba-871a-421d-add2-eab6159cd875@suse.cz>
Date: Tue, 17 Jun 2025 12:01:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] frozen pages for large kmalloc
To: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250602-frozen-pages-for-large-kmalloc-v2-0-84a21f2c3640@suse.cz>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250602-frozen-pages-for-large-kmalloc-v2-0-84a21f2c3640@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email]
X-Spam-Level: 

On 6/2/25 13:02, Vlastimil Babka wrote:
> In [1] I have suggested we start warning for get_page() done on large
> kmalloc pages as the first step to convert them to frozen pages.
> We exposed to -next and indeed got such a warning [2]. But it turns out
> the code is using sendpage_ok() and thus would avoid the get_page() if
> the page was actually frozen.
> 
> So in this version, freeze the large kmalloc pages at the same time as
> adding the warnings and refusals to get_page/put_page() on large kmalloc
> pages, the same as we do for slab pages - in patch 2.
> 
> While doing that I've noticed that large kmalloc doesn't observe NUMA
> policies, while the rest of the allocator does. This turns out to be a
> regression from v6.1, so I'm restoring that first in patch 1. There is
> no Cc: stable as it's not fixing a critical bug, but we can submit it to
> e.g. latest LTSS afterwards.
> 
> Given the timing I would expose this to -next after the current merge
> window closes, thus towards 6.17.

It's now in slab/for-next. Went with Cc: stable for the first patch in the
end. Thanks for the reviews!

> [1] https://lore.kernel.org/all/20250417074102.4543-2-vbabka@suse.cz/
> [2] https://lore.kernel.org/all/202505221248.595a9117-lkp@intel.com/
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
> Changes in v2:
> - Reword commit log of patch 1 to acknowledge it's restoring pre-6.1
>   behavior, add Fixes:
> - Change the order of the two patches to allow possible backport of the
>   NUMA fix.
> - Link to v1: https://patch.msgid.link/20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz
> 
> ---
> Vlastimil Babka (2):
>       mm, slab: restore NUMA policy support for large kmalloc
>       mm, slab: use frozen pages for large kmalloc
> 
>  include/linux/mm.h | 4 +++-
>  mm/slub.c          | 9 +++++++--
>  2 files changed, 10 insertions(+), 3 deletions(-)
> ---
> base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> change-id: 20250529-frozen-pages-for-large-kmalloc-bd4d2522e52b
> 
> Best regards,

