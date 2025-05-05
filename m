Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB4A25C829
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456937; cv=none; b=Bk+qa5E/vUsuu3MSwUlCoC4IbgHlcvQN61tKbcq4PTwsJpB8t1OxuEUAUhxgZYksgLvn7XDUPfbp0zbJ+V/dzrMpLAuOI7HmsaozIWajwXGC7nRLJIYkL2PCkHMEXVDDmtfpLv4ZPbfbWqijXhy/jtOz/1ofhp2d0zd51g37TXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456937; c=relaxed/simple;
	bh=gOV4olMgMrNm+jukeII4BTwvUs/58MW4k/n/DSfqrRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biasq1okwHeL12kQbzwWxcs/IFL86Bqs5b2v0aYv2iYnwp5qOcD7y9wRCaSjcrQErSJywWGDkEvDmxf/qUUrp/vSed08EMciYMR99sfDW+hsxmUqB9LYuHYxu5VkzeIYb6MCDTpewo0JEFwLZ0sCtdQD8YVJRJ+1fGuM39PA20E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2VZIj1p/; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=8NfBdIlJ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2VZIj1p/; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=8NfBdIlJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2VZIj1p/";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="8NfBdIlJ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2VZIj1p/";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="8NfBdIlJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 78C811F7A0;
	Mon,  5 May 2025 14:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746456933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jD0bkPmyM2A1kh39PQsBeO6AQfgRWdvpXNeMyu2NawA=;
	b=2VZIj1p/DAV3qS3oAtfs82VnXVw89+ZVrek0+OgdyBXxwZag0kpoPQjwJNqjDnI7QRxZXc
	2/I8ggm+5Zq3qkGYDUyW5StrZ07UWW1XgxfcBU0zvpnMFdrqcZx2HrjrFpRaUM9tijF67n
	RRvp/n1wArfFuJIlGuN1KbbB95ONCX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746456933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jD0bkPmyM2A1kh39PQsBeO6AQfgRWdvpXNeMyu2NawA=;
	b=8NfBdIlJCLI6dDk3yHivHqh/nIw5Wv1TYV7G93GxMlkD/Ek8u4QlzjGQoAQDGEuIBhb24J
	F6sP0u90Xl7MbsCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="2VZIj1p/";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=8NfBdIlJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746456933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jD0bkPmyM2A1kh39PQsBeO6AQfgRWdvpXNeMyu2NawA=;
	b=2VZIj1p/DAV3qS3oAtfs82VnXVw89+ZVrek0+OgdyBXxwZag0kpoPQjwJNqjDnI7QRxZXc
	2/I8ggm+5Zq3qkGYDUyW5StrZ07UWW1XgxfcBU0zvpnMFdrqcZx2HrjrFpRaUM9tijF67n
	RRvp/n1wArfFuJIlGuN1KbbB95ONCX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746456933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jD0bkPmyM2A1kh39PQsBeO6AQfgRWdvpXNeMyu2NawA=;
	b=8NfBdIlJCLI6dDk3yHivHqh/nIw5Wv1TYV7G93GxMlkD/Ek8u4QlzjGQoAQDGEuIBhb24J
	F6sP0u90Xl7MbsCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 542C31372E;
	Mon,  5 May 2025 14:55:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VQo0FGXRGGhVUgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 05 May 2025 14:55:33 +0000
Message-ID: <0feb4309-431f-4b74-83bf-e16198798c30@suse.cz>
Date: Mon, 5 May 2025 16:55:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/codetag: sub in advance when free non-compound high
 order pages
Content-Language: en-US
To: David Wang <00107082@163.com>
Cc: akpm@linux-foundation.org, surenb@google.com, mhocko@suse.com,
 jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>
References: <20250504061923.66914-1-00107082@163.com>
 <8edbd2be-d495-4bfc-a9f3-6eaae7a66d91@suse.cz>
 <1da43908.3afc.196a0db7dc3.Coremail.00107082@163.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <1da43908.3afc.196a0db7dc3.Coremail.00107082@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 78C811F7A0
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[163.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 5/5/25 16:31, David Wang wrote:
> 
> 
> At 2025-05-05 21:12:55, "Vlastimil Babka" <vbabka@suse.cz> wrote:
>>On 5/4/25 08:19, David Wang wrote:
>>> When page is non-compound, page[0] could be released by other
>>> thread right after put_page_testzero failed in current thread,
>>> pgalloc_tag_sub_pages afterwards would manipulate an invalid
>>> page for accounting remaining pages:
>>> 
>>> [timeline]   [thread1]                     [thread2]
>>>   |          alloc_page non-compound
>>>   V
>>>   |                                        get_page, rf counter inc
>>>   V
>>>   |          in ___free_pages
>>>   |          put_page_testzero fails
>>>   V
>>>   |                                        put_page, page released
>>>   V
>>>   |          in ___free_pages,
>>>   |          pgalloc_tag_sub_pages
>>>   |          manipulate an invalid page
>>>   V
>>>   V
>>> 
>>> Move the tag page accounting ahead, and only account remaining pages
>>> for non-compound pages with non-zero order.
>>> 
>>> Signed-off-by: David Wang <00107082@163.com>
>>
>>Hmm, I think the problem was introduced by 51ff4d7486f0 ("mm: avoid extra
>>mem_alloc_profiling_enabled() checks"). Previously we'd get the tag pointer
>>upfront and avoid the page use-after-free.
> 
> 
> Oh, you're right. I forgot to check history......
> 
> 
>>
>>It would likely be nicer to fix it by going back to that approach for
>>___free_pages(), while hopefully keeping the optimisations of 51ff4d7486f0
>>for the other call sites where it applies?
> 
> After checking that commit, I kind of feels the changes in __free_pages are
>  the major optimization of the commit....

We could have both pgalloc_tag_get() to use in __free_page() as before
51ff4d7486f0, and keep __pgalloc_tag_get() to use in pgalloc_tag_split() and
pgalloc_tag_swap().

I think __free_page() didn't benefit from the stated purpose of "avoiding
mem_alloc_profiling_enabled() ... which is often called after that check was
already done"

> What about revert that commit and make optimization by condition checks,
> similar to what this patch did?

The downside of the condition checks is they make the code more complex and
might actually increase overhead when mem_alloc_profiling_enabled() is
false, as those checks add non-static branches outside of the static branch
that's mem_alloc_profiling_enabled().

I think __free_pages() before 51ff4d7486f0 was quite ok.

- pgalloc_tag_get() is done unconditionally, but its code is all inside the
mem_alloc_profiling_enabled() static branch so that's a no-op when profiling
is not enabled

- pgalloc_tag_sub_pages() is also all behind the static branch inside. Also
it's a very rare path anyway, most freeing should go through the
put_page_testzero() being true.

> David
> 

