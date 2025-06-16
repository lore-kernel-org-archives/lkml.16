Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740E81A3142
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083049; cv=none; b=kKupJNiYFinpWbqfNo59SwOYyrItxmQko2QQURB5oBn9ciIE/zMxjv3IBKWwXPz7uWYXgAXSjg5eNVOvVdzUA2HfiFVDjc93AouEzanW6CI5aS97O1PeDJ3pj6n//gZ4OwxND5HQ0uyE2KpWNNCY7cxU/79wmcm8N0OvcIxXyeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083049; c=relaxed/simple;
	bh=tZQNTAFb0RgI8Axkya+HR9XuebZC0Wk3IaBZRpHDbhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuIb0NuEEguBGfW9S+Nmtj1uprhL3RrNi74ZAxMnaWxOeL3PoZsqLAGgGkayvm/SYfzD1Jqh8V4QCwvWuYsqpTyq8uYvEGRzHRLzVzPGrkBE3agCcscYYPtbHH178RPucUsB33AEx1WCs7LW2YYNRMVGr60go9zwZ9QQJxK60l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cLrKKGdf; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=dny4tXlS; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=g3VRNMnF; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=tOk6EJwq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cLrKKGdf";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="dny4tXlS";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="g3VRNMnF";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="tOk6EJwq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BBF422118F;
	Mon, 16 Jun 2025 14:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750083045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gvIC/uuDHCtY1vVb5K1eQEc7EXM23z+t5pvf9m+AhSQ=;
	b=cLrKKGdfazuK4Qsukb+W30iaMebUpZwmGcHBCODU8QlPw2sGSsAGCWuCP1j/u4IDPpF2ET
	OK05y/aNcjg1kQTGXig6zW1VXgNvQZjQU98gqo/c2b94ojdV5Zqhlr1FPpBqKU0qDUr5/r
	0ZBtHGHlaNToPDVcFSjsjmkpIP7Oi4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750083045;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gvIC/uuDHCtY1vVb5K1eQEc7EXM23z+t5pvf9m+AhSQ=;
	b=dny4tXlS0p6cvIpZ3qa22iOHOnwh/W933JFxtg1ZB+XpFFp1lApUVb+aC7FQhwZ/9HvcsI
	A7Q4iQejoxV4OXDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750083040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gvIC/uuDHCtY1vVb5K1eQEc7EXM23z+t5pvf9m+AhSQ=;
	b=g3VRNMnFsV2vpdwTe3cGuOXifgTf2FfpdE1rZIRFPWSL3GI5QjO++smsP4a7JNEl5523nL
	MenhZkK0wh7D3vkWSKzAbsy9yl8JJf/vUE+W0iMvnEoZEC6BVTAQFbvIxL6lWjo8WSQQ29
	Q/7yL3lzmi0BN1fb6MqRzT3/RMAPbUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750083040;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gvIC/uuDHCtY1vVb5K1eQEc7EXM23z+t5pvf9m+AhSQ=;
	b=tOk6EJwqEhGC67oaMTTzj0WMn9JCX+ZBx3ZaIpb2DuC1HJE2OP1fOcZ9/QLj4zBlzg3H68
	hEDgeLSCNHZgYNDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A747A13A6D;
	Mon, 16 Jun 2025 14:10:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7r6UKOAlUGjxTAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 16 Jun 2025 14:10:40 +0000
Message-ID: <830729b1-dbe8-4569-89fb-4ada13ec7bc2@suse.cz>
Date: Mon, 16 Jun 2025 16:11:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/11] mm,memory_hotplug: Drop status_change_nid
 parameter from memory_notify
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250616135158.450136-1-osalvador@suse.de>
 <20250616135158.450136-12-osalvador@suse.de>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <20250616135158.450136-12-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -6.80

On 6/16/25 3:51 PM, Oscar Salvador wrote:
> There no users left of status_change_nid, so drop it from memory_notify
> struct.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  Documentation/core-api/memory-hotplug.rst | 7 -------
>  include/linux/memory.h                    | 1 -
>  mm/memory_hotplug.c                       | 4 ----
>  3 files changed, 12 deletions(-)
> 
> diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
> index fb84e78968b2..8fc97c2379de 100644
> --- a/Documentation/core-api/memory-hotplug.rst
> +++ b/Documentation/core-api/memory-hotplug.rst
> @@ -59,17 +59,10 @@ The third argument (arg) passes a pointer of struct memory_notify::
>  	struct memory_notify {
>  		unsigned long start_pfn;
>  		unsigned long nr_pages;
> -		int status_change_nid;
>  	}
>  
>  - start_pfn is start_pfn of online/offline memory.
>  - nr_pages is # of pages of online/offline memory.
> -- status_change_nid is set node id when N_MEMORY of nodemask is (will be)
> -  set/clear. It means a new(memoryless) node gets new memory by online and a
> -  node loses all memory. If this is -1, then nodemask status is not changed.
> -
> -  If status_changed_nid* >= 0, callback should create/discard structures for the
> -  node if necessary.
>  
>  It is possible to get notified for MEM_CANCEL_ONLINE without having been notified
>  for MEM_GOING_ONLINE, and the same applies to MEM_CANCEL_OFFLINE and
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index a9ccd6579422..de8b898ada3f 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -109,7 +109,6 @@ struct memory_notify {
>  	unsigned long altmap_nr_pages;
>  	unsigned long start_pfn;
>  	unsigned long nr_pages;
> -	int status_change_nid;
>  };
>  
>  struct notifier_block;
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index e8ccfe4cada2..bfaa570c0685 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1153,7 +1153,6 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>  	struct memory_notify mem_arg = {
>  		.start_pfn = pfn,
>  		.nr_pages = nr_pages,
> -		.status_change_nid = NUMA_NO_NODE,
>  	};
>  	struct node_notify node_arg = {
>  		.nid = NUMA_NO_NODE,
> @@ -1181,7 +1180,6 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>  	if (!node_state(nid, N_MEMORY)) {
>  		/* Adding memory to the node for the first time */
>  		node_arg.nid = nid;
> -		mem_arg.status_change_nid = nid;
>  		ret = node_notify(NODE_ADDING_FIRST_MEMORY, &node_arg);
>  		ret = notifier_to_errno(ret);
>  		if (ret)
> @@ -1905,7 +1903,6 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>  	struct memory_notify mem_arg = {
>  		.start_pfn = start_pfn,
>  		.nr_pages = nr_pages,
> -		.status_change_nid = NUMA_NO_NODE,
>  	};
>  	struct node_notify node_arg = {
>  		.nid = NUMA_NO_NODE,
> @@ -1976,7 +1973,6 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>  	 */
>  	if (nr_pages >= pgdat->node_present_pages) {
>  		node_arg.nid = node;
> -		mem_arg.status_change_nid = node;
>  		ret = node_notify(NODE_REMOVING_LAST_MEMORY, &node_arg);
>  		ret = notifier_to_errno(ret);
>  		if (ret)

