Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EC31FDE33
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750783702; cv=none; b=UDLa/FDoOJrdw3m6dUdUVmjrYm+Ot1L1UUoYSuRfEN9q696Yeddx+YSjhhISGBpsdjkZaluGWYD9aq8dodiA9sSi3cf9OdLre2aqXhYg5/xN3DUROnqa1aZxfd/v8Xfx3FNfLIv4wmpzRQ4JFG9g159BNdJ/Mm392+97YeKCZpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750783702; c=relaxed/simple;
	bh=EcjENa8GLuvMmolHUGNE7yYjrnaFqfkTdpV4mEqSg7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSp6RcuzoDl+OiP6bI4dYRKV+NxSiMZyaC7ZwUS70/k1a9m6+qpjvY/FmW0o/xx/46f+POulEKMuL9ERtj/rOu/zyA8TqgXdvFKFcXc8tJwedV2/MvcXaPCSDvrKg1K2GglYB82YFp4xQuctoZB3aiMdiww8KP04AnGw+dmj+FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=X6qC2SNn; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=KvkGKYvY; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=X6qC2SNn; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=KvkGKYvY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="X6qC2SNn";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="KvkGKYvY";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="X6qC2SNn";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="KvkGKYvY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 06A8D21204;
	Tue, 24 Jun 2025 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750783698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WQf8Sf0gqvKeBfKMlGsRGcbfsLkMKbWC6xxDiuZcULg=;
	b=X6qC2SNnTxxCJW8fDFO5WhxyZkTwu44cX4h4SqWDPyBUPt2+Psscts/hOeVYlp+r+CScCZ
	LN+IwO3PnKVZb5Lw2XTJG8M3372oaFyJl2SO7jJwSf1huC6Wftbw8cezKps0c1b6scCCLV
	//1dQVkwk7GRgUFtSURwuboBhCPXlq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750783698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WQf8Sf0gqvKeBfKMlGsRGcbfsLkMKbWC6xxDiuZcULg=;
	b=KvkGKYvYabERtfrdspAvzNd4kWzoc5LqJ6q1WyrhZfBEOGwM15GVd4dNbE+jMSI5AIC6cA
	jRLX/fGIjoYA7OCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=X6qC2SNn;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=KvkGKYvY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750783698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WQf8Sf0gqvKeBfKMlGsRGcbfsLkMKbWC6xxDiuZcULg=;
	b=X6qC2SNnTxxCJW8fDFO5WhxyZkTwu44cX4h4SqWDPyBUPt2+Psscts/hOeVYlp+r+CScCZ
	LN+IwO3PnKVZb5Lw2XTJG8M3372oaFyJl2SO7jJwSf1huC6Wftbw8cezKps0c1b6scCCLV
	//1dQVkwk7GRgUFtSURwuboBhCPXlq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750783698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WQf8Sf0gqvKeBfKMlGsRGcbfsLkMKbWC6xxDiuZcULg=;
	b=KvkGKYvYabERtfrdspAvzNd4kWzoc5LqJ6q1WyrhZfBEOGwM15GVd4dNbE+jMSI5AIC6cA
	jRLX/fGIjoYA7OCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE33B13A24;
	Tue, 24 Jun 2025 16:48:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hqKkNdHWWmjUJAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 24 Jun 2025 16:48:17 +0000
Message-ID: <d6dd13e2-1bd3-4b3f-bb88-781ad79ff358@suse.cz>
Date: Tue, 24 Jun 2025 18:48:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] mm, madvise: use standard madvise locking in
 madvise_set_anon_name()
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-4-600075462a11@suse.cz>
 <667e6631-8e2f-4154-8fcc-55fb5ab49a07@lucifer.local>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <667e6631-8e2f-4154-8fcc-55fb5ab49a07@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:dkim,suse.cz:mid,suse.cz:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 06A8D21204
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On 6/24/25 17:45, Lorenzo Stoakes wrote:
> On Tue, Jun 24, 2025 at 03:03:48PM +0200, Vlastimil Babka wrote:
>> Use madvise_lock()/madvise_unlock() in madvise_set_anon_name() in the
>> same way as in do_madvise(). This narrows the lock scope a bit and
>> reuses existing functionality. get_lock_mode() already picks the correct
>> MADVISE_MMAP_WRITE_LOCK mode for __MADV_SET_ANON_VMA_NAME so we can just
>> remove the explicit assignment.
>>
>> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> This is a nice idea, hadn't thought of it :) aren't we making anon vma name
> behave now :P
> 
> I mean this is a _minor_ difference in functionality in that we will now
> use mmap_write_lock_killable() and could fail to lock on fatal signal
> whereas before we unconditionally lock but I think that's fine, and
> possibly even... desirable actually?

Right! I'll add a note to the changelog. It's changing existing uapi but
hopefully not in a way that userspace would become broken. I mean even the
other madvise modes only got killable locks later tat some point after
introduction, no?

> 
> At any rate this is all nice, thanks again!
> 
>> ---
>>  mm/madvise.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/madvise.c b/mm/madvise.c
>> index cae064479cdf908707c45b941bd03d43d095eab6..ee02ccd0315a146cdb3001cd189e03be9e48a2ea 100644
>> --- a/mm/madvise.c
>> +++ b/mm/madvise.c
>> @@ -2082,10 +2082,10 @@ static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
>>  {
>>  	unsigned long end;
>>  	unsigned long len;
>> +	int error;
>>  	struct madvise_behavior madv_behavior = {
>>  		.mm = mm,
>>  		.behavior = __MADV_SET_ANON_VMA_NAME,
>> -		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
>>  		.anon_name = anon_name,
>>  	};
>>
>> @@ -2106,7 +2106,14 @@ static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
>>
>>  	madv_behavior.range.start = start;
>>  	madv_behavior.range.end = end;
>> -	return madvise_walk_vmas(&madv_behavior);
>> +
>> +	error = madvise_lock(&madv_behavior);
>> +	if (error)
>> +		return error;
>> +	error = madvise_walk_vmas(&madv_behavior);
>> +	madvise_unlock(&madv_behavior);
>> +
>> +	return error;
>>  }
>>
>>  int set_anon_vma_name(unsigned long addr, unsigned long size,
>> @@ -2136,9 +2143,7 @@ int set_anon_vma_name(unsigned long addr, unsigned long size,
>>  			return -ENOMEM;
>>  	}
>>
>> -	mmap_write_lock(mm);
>>  	error = madvise_set_anon_name(mm, addr, size, anon_name);
>> -	mmap_write_unlock(mm);
>>  	anon_vma_name_put(anon_name);
>>
>>  	return error;
>>
>> --
>> 2.50.0
>>

