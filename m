Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84981255F24
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746452620; cv=none; b=prTDZ9JPKf5f0bfttM4gAD45/PQe34+JmE5eeDmR57z+A/IKl0t2LYVGaFKt+CLOnqUTuHKGQydurgh46V+dIN1BJJYAhYV8zfyMVf7v+SkqtArWqR1CrmN0hBD692qc1Ybf08F+DLnw/8Quz1PpM8y9lVlnKhefylm/KQgAR7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746452620; c=relaxed/simple;
	bh=0jKLIURpbm6ove+4lNS05PHziDGo3BSA3O2p8fPRl+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWBfAM0bwsnLjGkrFrIf8JNcDQNwF9eTmHxMJ/B7L9FFrxYeDqXIP/hOlfDp19q+qVUiYl8YQlK64RBAIwAJmyEfZygxv0z+97p6h+AGvBXWwAF+jVJaTSP26KhoijVbibfl25Vc8mh0LWrgrBltGnOYit/vc7s3jCgVeHa9kJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=NhAp3hao; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=etM7WbHd; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=NhAp3hao; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=etM7WbHd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="NhAp3hao";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="etM7WbHd";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="NhAp3hao";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="etM7WbHd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 883341F79C;
	Mon,  5 May 2025 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746452616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PP8n/I9c2HpK3CnIVwDPh7bDQ61AQFRol0vbEOVCU/E=;
	b=NhAp3haovTppDhz1ZgJVSTRoq9Cx1hp63I6YHUypl1os/L9WzRoOatMCwIM9QNrCfoTiF1
	D6xbCKtROUqWipKc4xhr1TKB7ZeIpa07CIyLWCnMXZxtdMwjmjVezIhNXGZGMV4QXen0CD
	n1T8njYL8klQ7PgI4ndnQsQUMCIU+T0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746452616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PP8n/I9c2HpK3CnIVwDPh7bDQ61AQFRol0vbEOVCU/E=;
	b=etM7WbHd96MRE+tNykIDJQ856Bdm3saxpZz7SMYz8leDIjPSQNws6UHUcfag7XvP+F8jwd
	3l7ewVIBtff5tYDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=NhAp3hao;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=etM7WbHd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746452616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PP8n/I9c2HpK3CnIVwDPh7bDQ61AQFRol0vbEOVCU/E=;
	b=NhAp3haovTppDhz1ZgJVSTRoq9Cx1hp63I6YHUypl1os/L9WzRoOatMCwIM9QNrCfoTiF1
	D6xbCKtROUqWipKc4xhr1TKB7ZeIpa07CIyLWCnMXZxtdMwjmjVezIhNXGZGMV4QXen0CD
	n1T8njYL8klQ7PgI4ndnQsQUMCIU+T0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746452616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PP8n/I9c2HpK3CnIVwDPh7bDQ61AQFRol0vbEOVCU/E=;
	b=etM7WbHd96MRE+tNykIDJQ856Bdm3saxpZz7SMYz8leDIjPSQNws6UHUcfag7XvP+F8jwd
	3l7ewVIBtff5tYDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7505413883;
	Mon,  5 May 2025 13:43:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kji+GojAGGgBOQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 05 May 2025 13:43:36 +0000
Message-ID: <c593b2c0-d5bc-49fa-b16d-a7f89c927c6e@suse.cz>
Date: Mon, 5 May 2025 15:43:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mm,slub: Do not special case N_NORMAL nodes for
 slab_nodes
Content-Language: en-US
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Rakie Kim <rakie.kim@sk.com>
References: <20250502083624.49849-1-osalvador@suse.de>
 <20250502083624.49849-2-osalvador@suse.de>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250502083624.49849-2-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 883341F79C
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
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,gmail.com,huawei.com,sk.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.cz:dkim,suse.cz:mid,suse.cz:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 5/2/25 10:36, Oscar Salvador wrote:
> Currently, slab_mem_going_going_callback() checks whether the node has
> N_NORMAL memory in order to be set in slab_nodes.
> While it is true that gettind rid of that enforcing would mean
> ending up with movables nodes in slab_nodes, the memory waste that comes
> with that is negligible.
> 
> So stop checking for status_change_nid_normal and just use status_change_nid
> instead which works for both types of memory.
> 
> Also, once we allocate the kmem_cache_node cache  for the node in

					     ^ object? instance?

> slab_mem_online_callback(), we never deallocate it in
> slab_mem_off_callback() when the node goes memoryless, so we can just
> get rid of it.
> 
> The only side effect is that we will stop clearing the node from slab_nodes.

Technically, another effect is that also any newly created kmem caches after
 node hotremove will now allocate their kmem_cache_node for the node(s) that
was hotremoved. But that should be even more negligible waste than from
using N_MEMORY.

> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Oscar Salvador <osalvador@suse.de>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

