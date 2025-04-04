Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6854919DFB4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756654; cv=none; b=Iz0Zex1jgOZL1OfNVZYK8N+gLJftvClHkKunoBcmO6q4cFAyXu38l5sqoHbIvrdAY5GOm7kiiv5+2TQ2W8/twyUMb/ZM9Qt8XNSFcBvjgdNv+GWsSqmUN311Z3dBRlsTGW+HVkmzdlXtLQa6/xbm5mNCNSVNrecTmibZtqTpbkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756654; c=relaxed/simple;
	bh=2jg+qs3Whl3tuhDOYf9dfPC+A7kP0mjKDtCbdH6iKZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLq7UqVrZfLVaMk+XxH4mJ0C1Jg7to7W6WFUsaluQLfxnkAmLfxO2emfgHVnOFbAsi+qwhwxY+Ex9HXx/WT3s+MyrZ5RjT8mcUf4SERh+UUjDRpiaRPEMVAX3NJIflsjlpB0WTWtcfMDzghfE1Lz7aFzVHXqI6VQLFguD7/a4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=dqyFuZ0o; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=w2rQ9U7L; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=dqyFuZ0o; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=w2rQ9U7L; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="dqyFuZ0o";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="w2rQ9U7L";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="dqyFuZ0o";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="w2rQ9U7L"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3E2B91F385;
	Fri,  4 Apr 2025 08:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743756650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=al/KGWINhLbwxqwLgfJXN1NKo8O3SXov2ubbI/5HcV0=;
	b=dqyFuZ0ob8nMFh7+OXygQwnQW9glQvatYrHsslYiRlROrasnbhZ0BWKjWxaYq8p51LR/vQ
	g7g/0oxMNffTiV2iskcqX5KPHIiZ1I890R2rArzAV3nB4iydliqEifnVoEnZd7KnqmOEZN
	DYOa2W9r21ZA6DVgMooiOqcWEBIHhx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743756650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=al/KGWINhLbwxqwLgfJXN1NKo8O3SXov2ubbI/5HcV0=;
	b=w2rQ9U7LYdkpPj3ZKH/JhXoEWGn0sZFt5ZR5xdamz3gCPFm0yYFGCUBpythm0KSThUXriG
	dUiKRnthkKSa8yAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=dqyFuZ0o;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=w2rQ9U7L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743756650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=al/KGWINhLbwxqwLgfJXN1NKo8O3SXov2ubbI/5HcV0=;
	b=dqyFuZ0ob8nMFh7+OXygQwnQW9glQvatYrHsslYiRlROrasnbhZ0BWKjWxaYq8p51LR/vQ
	g7g/0oxMNffTiV2iskcqX5KPHIiZ1I890R2rArzAV3nB4iydliqEifnVoEnZd7KnqmOEZN
	DYOa2W9r21ZA6DVgMooiOqcWEBIHhx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743756650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=al/KGWINhLbwxqwLgfJXN1NKo8O3SXov2ubbI/5HcV0=;
	b=w2rQ9U7LYdkpPj3ZKH/JhXoEWGn0sZFt5ZR5xdamz3gCPFm0yYFGCUBpythm0KSThUXriG
	dUiKRnthkKSa8yAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EC3113691;
	Fri,  4 Apr 2025 08:50:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QlMaA2qd72evAQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 04 Apr 2025 08:50:50 +0000
Message-ID: <e316916e-178a-41f2-ab6c-00ca644101b6@suse.cz>
Date: Fri, 4 Apr 2025 10:50:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Implement numa node notifier
Content-Language: en-US
To: Harry Yoo <harry.yoo@oracle.com>, David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 mkoutny@suse.com, Dan Williams <dan.j.williams@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250401092716.537512-1-osalvador@suse.de>
 <78c976ba-1eaf-47b7-a310-b8a99a3882e2@suse.cz>
 <Z-1tzl2NqqRUYyU-@localhost.localdomain>
 <e1ebfafa-f063-4340-b577-d1b6b2fb5d11@redhat.com> <Z-8GY8X9uAE8LsDz@harry>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <Z-8GY8X9uAE8LsDz@harry>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3E2B91F385
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
	FREEMAIL_CC(0.00)[suse.de,linux-foundation.org,kvack.org,vger.kernel.org,gmail.com,suse.com,intel.com,huawei.com];
	DKIM_TRACE(0.00)[suse.cz:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/4/25 00:06, Harry Yoo wrote:
> On Thu, Apr 03, 2025 at 03:02:25PM +0200, David Hildenbrand wrote:
>> On 02.04.25 19:03, Oscar Salvador wrote:
>> > On Wed, Apr 02, 2025 at 06:06:51PM +0200, Vlastimil Babka wrote:
>> > > What if we had two chains:
>> > > 
>> > > register_node_notifier()
>> > > register_node_normal_notifier()
>> > > 
>> > > I think they could have shared the state #defines and struct node_notify
>> > > would have just one nid and be always >= 0.
>> > > 
>> > > Or would it add too much extra boilerplate and only slab cares?
>> > 
>> > We could indeed go on that direction to try to decouple
>> > status_change_nid from status_change_nid_normal.
>> > 
>> > Although as you said, slub is the only user of status_change_nid_normal
>> > for the time beign, so I am not sure of adding a second chain for only
>> > one user.
>> > 
>> > Might look cleaner though, and the advantatge is that slub would not get
>> > notified for nodes adquiring only ZONE_MOVABLE.
>> > 
>> > Let us see what David thinks about it.
>> 
>> I'd hope we'd be able to get rid of the _normal stuff completely, it's seems
>> way to specialized.
> 
> Hmm, perhaps we can remove it with as part of this patch series?
> 
> status_change_nid_normal has been used to indicate both 'There is a
> status change' AND 'The node id when the NUMA node has normal memory'.
> 
> But since NUMA node notifier triggers only when there is a state change,
> it can simply pass nid, like patch 2 does. SLUB can then check whether the
> node has normal memory.

Well the state change could be adding movable memory, SLUB checks that
there's no normal memory and thus does nothing. Then normal memory is added
to the node, but there's no new notification and SLUB is left without
supporting the node forever.

But with David's suggestion we avoid that problem.

> Or am I missing something?
> 
>> We added that in
>> 
>> commit b9d5ab2562eceeada5e4837a621b6260574dd11d
>> Author: Lai Jiangshan <laijs@cn.fujitsu.com>
>> Date:   Tue Dec 11 16:01:05 2012 -0800
>> 
>>     slub, hotplug: ignore unrelated node's hot-adding and hot-removing
>>     SLUB only focuses on the nodes which have normal memory and it ignores the
>>     other node's hot-adding and hot-removing.
>>     Aka: if some memory of a node which has no onlined memory is online, but
>>     this new memory onlined is not normal memory (for example, highmem), we
>>     should not allocate kmem_cache_node for SLUB.
>>     And if the last normal memory is offlined, but the node still has memory,
>>     we should remove kmem_cache_node for that node.  (The current code delays
>>     it when all of the memory is offlined)
>>     So we only do something when marg->status_change_nid_normal > 0.
>>     marg->status_change_nid is not suitable here.
>>     The same problem doesn't exist in SLAB, because SLAB allocates kmem_list3
>>     for every node even the node don't have normal memory, SLAB tolerates
>>     kmem_list3 on alien nodes.  SLUB only focuses on the nodes which have
>>     normal memory, it don't tolerate alien kmem_cache_node.  The patch makes
>>     SLUB become self-compatible and avoids WARNs and BUGs in rare conditions.
>> 
>> 
>> How "bad" would it be if we do the slab_mem_going_online_callback() etc even
>> for completely-movable nodes? I assume one kmem_cache_alloc() per slab_caches.
>>
>> slab_mem_going_offline_callback() only does shrinking, #dontcare
>> 
>> Looking at slab_mem_offline_callback(), we never even free the caches either
>> way when offlining. So the implication would be that we would have movable-only nodes
>> set in slab_nodes.
>> 
>> 
>> We don't expect many such nodes, so ... do we care?
>> 
>> -- 
>> Cheers,
>> 
>> David / dhildenb
>> 
>> 
> 

