Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551019FA92
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756477; cv=none; b=YgH4LN0Rq0VEt/gY/V1Y4cUw/tOMWhpJPDs/q63xKod38R2exn267NcekzEoriLkDYN9sCHlI97DIxcZMbTNZ28Y5fIwE7dwkgMKcXB5KEBNhMdh25Xrczphfj8ovVUjGWVFxc+fU/SAnJI47H3ReglAqH3hpcimvf8hfjcNiQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756477; c=relaxed/simple;
	bh=AZpCTjfkYC7OzwFRhcBaxCfeY9X43qU/3B3yqwCsv6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jkFEhE6m76HjwriWA6CjEV7Wv/Jeccl0rCSgDvx+dgxVff3ByJiZl/5MtqahwlPzTrWUj25PFowfITFtRq2qfOccOjlXE/hBwd05JZmrolT0tk1MwfSFeZFCs/GI+lRZAuGS7YTEjstBEzM1A9HgXwxPicDa12R5xmx3PeFTzq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=KnrrVpi7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZR2y1HsE; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=KnrrVpi7; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZR2y1HsE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="KnrrVpi7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZR2y1HsE";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="KnrrVpi7";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZR2y1HsE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B88C821184;
	Fri,  4 Apr 2025 08:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743756472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EIE8nJnyuWIo9mF7+tfr0Mdf07sXKWR7IdaYTIIfhRw=;
	b=KnrrVpi7yhvcOZBUNlBE3GrgW3poaQc1opRACCSfcN1XugNt2gbhRlNqq/a5wUrJp3jTlR
	W1pNwSZzQzg4dPR0wO4qdj+cWEOzrGhM25+WKsZ/m/TLrZRA30ll4d8ZBocROKD5iBg/3C
	X8aFPEP4pQ/UlBzkgRTk+OJ1c6i+lE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743756472;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EIE8nJnyuWIo9mF7+tfr0Mdf07sXKWR7IdaYTIIfhRw=;
	b=ZR2y1HsEoIoH3jyowMbZWArJeK+EURcoDbKUBd/ci7y/B9kH/rEqvwBK8KyioxXNO1D5Uh
	b0iWfz8ssWD1tEAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=KnrrVpi7;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=ZR2y1HsE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743756472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EIE8nJnyuWIo9mF7+tfr0Mdf07sXKWR7IdaYTIIfhRw=;
	b=KnrrVpi7yhvcOZBUNlBE3GrgW3poaQc1opRACCSfcN1XugNt2gbhRlNqq/a5wUrJp3jTlR
	W1pNwSZzQzg4dPR0wO4qdj+cWEOzrGhM25+WKsZ/m/TLrZRA30ll4d8ZBocROKD5iBg/3C
	X8aFPEP4pQ/UlBzkgRTk+OJ1c6i+lE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743756472;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EIE8nJnyuWIo9mF7+tfr0Mdf07sXKWR7IdaYTIIfhRw=;
	b=ZR2y1HsEoIoH3jyowMbZWArJeK+EURcoDbKUBd/ci7y/B9kH/rEqvwBK8KyioxXNO1D5Uh
	b0iWfz8ssWD1tEAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9928B13691;
	Fri,  4 Apr 2025 08:47:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YaqbIric72eCfgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 04 Apr 2025 08:47:52 +0000
Message-ID: <21b36caa-68d8-4ae4-a290-cff2e7e3411f@suse.cz>
Date: Fri, 4 Apr 2025 10:47:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Implement numa node notifier
To: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 mkoutny@suse.com, Dan Williams <dan.j.williams@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250401092716.537512-1-osalvador@suse.de>
 <78c976ba-1eaf-47b7-a310-b8a99a3882e2@suse.cz>
 <Z-1tzl2NqqRUYyU-@localhost.localdomain>
 <e1ebfafa-f063-4340-b577-d1b6b2fb5d11@redhat.com>
 <b9d5a23c-f97c-4d11-b468-5a83ee2e25e2@redhat.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <b9d5a23c-f97c-4d11-b468-5a83ee2e25e2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B88C821184
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
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,kvack.org,vger.kernel.org,gmail.com,suse.com,intel.com,huawei.com];
	DKIM_TRACE(0.00)[suse.cz:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/3/25 15:08, David Hildenbrand wrote:
> On 03.04.25 15:02, David Hildenbrand wrote:
>> On 02.04.25 19:03, Oscar Salvador wrote:
>>> On Wed, Apr 02, 2025 at 06:06:51PM +0200, Vlastimil Babka wrote:
>>>> What if we had two chains:
>>>>
>>>> register_node_notifier()
>>>> register_node_normal_notifier()
>>>>
>>>> I think they could have shared the state #defines and struct node_notify
>>>> would have just one nid and be always >= 0.
>>>>
>>>> Or would it add too much extra boilerplate and only slab cares?
>>>
>>> We could indeed go on that direction to try to decouple
>>> status_change_nid from status_change_nid_normal.
>>>
>>> Although as you said, slub is the only user of status_change_nid_normal
>>> for the time beign, so I am not sure of adding a second chain for only
>>> one user.
>>>
>>> Might look cleaner though, and the advantatge is that slub would not get
>>> notified for nodes adquiring only ZONE_MOVABLE.
>>>
>>> Let us see what David thinks about it.
>> 
>> I'd hope we'd be able to get rid of the _normal stuff completely, it's seems
>> way to specialized.
>> 
>> We added that in
>> 
>> commit b9d5ab2562eceeada5e4837a621b6260574dd11d
>> Author: Lai Jiangshan <laijs@cn.fujitsu.com>
>> Date:   Tue Dec 11 16:01:05 2012 -0800
>> 
>>       slub, hotplug: ignore unrelated node's hot-adding and hot-removing
>>       
>>       SLUB only focuses on the nodes which have normal memory and it ignores the
>>       other node's hot-adding and hot-removing.
>>       
>>       Aka: if some memory of a node which has no onlined memory is online, but
>>       this new memory onlined is not normal memory (for example, highmem), we
>>       should not allocate kmem_cache_node for SLUB.
>>       
>>       And if the last normal memory is offlined, but the node still has memory,
>>       we should remove kmem_cache_node for that node.  (The current code delays
>>       it when all of the memory is offlined)
>>       
>>       So we only do something when marg->status_change_nid_normal > 0.
>>       marg->status_change_nid is not suitable here.
>>       
>>       The same problem doesn't exist in SLAB, because SLAB allocates kmem_list3
>>       for every node even the node don't have normal memory, SLAB tolerates
>>       kmem_list3 on alien nodes.  SLUB only focuses on the nodes which have
>>       normal memory, it don't tolerate alien kmem_cache_node.  The patch makes
>>       SLUB become self-compatible and avoids WARNs and BUGs in rare conditions.
>> 
>> 
>> How "bad" would it be if we do the slab_mem_going_online_callback() etc even
>> for completely-movable nodes? I assume one kmem_cache_alloc() per slab_caches.

Yes.

>> slab_mem_going_offline_callback() only does shrinking, #dontcare
>> 
>> Looking at slab_mem_offline_callback(), we never even free the caches either
>> way when offlining. So the implication would be that we would have movable-only nodes
>> set in slab_nodes.

Yes.

>> We don't expect many such nodes, so ... do we care?

Right, the memory waste should be negligible in the big picture. So Oscar
can you change this as part of your series?

> BTW, isn't description of slab_nodes wrong?
> 
> "Tracks for which NUMA nodes we have kmem_cache_nodes allocated." -- but 
> as there is no freeing done in slab_mem_offline_callback(), isn't it 
> always kept allocated?

Hm yes right now it's "is it in slab_nodes => it's allocated" and not
equivalent.

I guess we could remove slab_mem_offline_callback() completely and thus stop
clearing from slab_nodes and the comment will be true again?

That would mean new caches created after node hotremove will allocate for
that node but that's even more negligible than the waste we're doing already.

> (probably I am missing something)
> 

