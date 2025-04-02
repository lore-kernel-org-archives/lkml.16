Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B2538DE9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609789; cv=none; b=Hk5Iz3m3PPFmbM0thx5DqlpkhBPLtd7ciZ6ZZFy/4W2VlyANgOYkHcBMr8tIWEUvhG8PfsXyIrcNmpFBTC8kkMPwdqoxmVikeRr4weLj+wwV6xu2JoVwq/iNSXKHSxZW1M3b74KJPlP/6FjSrOM22h1sgTeLr/gNAdsUixf/UUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609789; c=relaxed/simple;
	bh=SUDY5nKAMEtXCnKWrW+qPfrHTE62Vcd8gTQDFv3L7ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUwK0GLtKUrL0FVsQFS0jqSr8R3AZrtwSMNLTIshDrfiydbfOdPkMIuBSZnZ6jTK4GlzFcoohqU5fWLkn3J7KW9ee/uT0MxyVrcpogmADZ7tp4qq7s+xj2UBdF78ZuMl3XepSQizmk68WlDLThlUdywebF8NHT5irNGqgfZ/MI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=mNMIPNRN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=UCIKwRDF; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=mNMIPNRN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=UCIKwRDF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="mNMIPNRN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="UCIKwRDF";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="mNMIPNRN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="UCIKwRDF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 171741F38A;
	Wed,  2 Apr 2025 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743609785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADREL8QGgcrkjimY1Iz7jNMHOBnx1JQ4bxule2Z1cc0=;
	b=mNMIPNRNWkvY8L60WnD8Oy5XR5o3nXzHmrvq/VVNJ4ZftdM0s8vIjptdMM/Hx2OH35SbVj
	n9uEbh3EkPa9S0L1TmYGA7jcwrb0XBTrnfDcmF8PTmcjpq/wDxyBDiIv3YLK0m9zqrUEYY
	TRuNJGh79gskOu3rztd2zv5gaYtvkqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743609785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADREL8QGgcrkjimY1Iz7jNMHOBnx1JQ4bxule2Z1cc0=;
	b=UCIKwRDFeVpl66gvGP0+toM6Z0/FXQV2iAcj9hCpQ4mpYbOWuKuYhNE9x/D6RGKQ5ODU6y
	BGQtnfDQo2rqCCBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=mNMIPNRN;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=UCIKwRDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743609785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADREL8QGgcrkjimY1Iz7jNMHOBnx1JQ4bxule2Z1cc0=;
	b=mNMIPNRNWkvY8L60WnD8Oy5XR5o3nXzHmrvq/VVNJ4ZftdM0s8vIjptdMM/Hx2OH35SbVj
	n9uEbh3EkPa9S0L1TmYGA7jcwrb0XBTrnfDcmF8PTmcjpq/wDxyBDiIv3YLK0m9zqrUEYY
	TRuNJGh79gskOu3rztd2zv5gaYtvkqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743609785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADREL8QGgcrkjimY1Iz7jNMHOBnx1JQ4bxule2Z1cc0=;
	b=UCIKwRDFeVpl66gvGP0+toM6Z0/FXQV2iAcj9hCpQ4mpYbOWuKuYhNE9x/D6RGKQ5ODU6y
	BGQtnfDQo2rqCCBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEF4713A4B;
	Wed,  2 Apr 2025 16:03:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZwYgObhf7WfGTAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 02 Apr 2025 16:03:04 +0000
Message-ID: <4e122668-6f6a-4874-85df-e6869b9ccb24@suse.cz>
Date: Wed, 2 Apr 2025 18:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm,memory_hotplug: Implement numa node notifier
Content-Language: en-US
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 mkoutny@suse.com, Dan Williams <dan.j.williams@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250401092716.537512-1-osalvador@suse.de>
 <20250401092716.537512-2-osalvador@suse.de>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250401092716.537512-2-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 171741F38A
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
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,gmail.com,suse.com,intel.com,huawei.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.cz:mid,suse.cz:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/1/25 11:27, Oscar Salvador wrote:
> There are at least four consumers of hotplug_memory_notifier that what they
> really are interested in is whether any numa node changed its state, e.g: going
> from being memory aware to becoming memoryless.
> 
> Implement a specific notifier for numa nodes when their state gets changed,
> and have those consumers that only care about numa node state changes use it.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>

<snip>

> -static void node_states_set_node(int node, struct memory_notify *arg)
> +static void node_states_set_node(int node, struct node_notify *arg)
>  {
>  	if (arg->status_change_nid_normal >= 0)
>  		node_set_state(node, N_NORMAL_MEMORY);
> @@ -1177,7 +1177,9 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>  	int need_zonelists_rebuild = 0;
>  	const int nid = zone_to_nid(zone);
>  	int ret;
> -	struct memory_notify arg;
> +	struct memory_notify mem_arg;
> +	struct node_notify node_arg;
> +	bool cancel_mem_notifier_on_err = false, cancel_node_notifier_on_err = false;
>  
>  	/*
>  	 * {on,off}lining is constrained to full memory sections (or more
> @@ -1194,11 +1196,23 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>  	/* associate pfn range with the zone */
>  	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
>  
> -	arg.start_pfn = pfn;
> -	arg.nr_pages = nr_pages;
> -	node_states_check_changes_online(nr_pages, zone, &arg);
> +	mem_arg.start_pfn = pfn;
> +	mem_arg.nr_pages = nr_pages;
> +	node_states_check_changes_online(nr_pages, zone, &node_arg);
>  
> -	ret = memory_notify(MEM_GOING_ONLINE, &arg);
> +	if (node_arg.status_change_nid >= 0) {

Hmm, don't we need to add "|| node_arg.status_change_nid_normal >= 0"? Or we
fail to notify addition of normal memory to a node that already has !normal
memory?

> +		/* Node is becoming memory aware. Notify consumers */
> +		cancel_node_notifier_on_err = true;
> +		ret = node_notify(NODE_BECOMING_MEM_AWARE, &node_arg);
> +		ret = notifier_to_errno(ret);
> +		if (ret)
> +			goto failed_addition;
> +	}
> +
> +	cancel_mem_notifier_on_err = true;
> +	mem_arg.status_change_nid = node_arg.status_change_nid;
> +	mem_arg.status_change_nid_normal = node_arg.status_change_nid_normal;
> +	ret = memory_notify(MEM_GOING_ONLINE, &mem_arg);
>  	ret = notifier_to_errno(ret);
>  	if (ret)
>  		goto failed_addition;
> @@ -1224,7 +1238,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>  	online_pages_range(pfn, nr_pages);
>  	adjust_present_page_count(pfn_to_page(pfn), group, nr_pages);
>  
> -	node_states_set_node(nid, &arg);
> +	node_states_set_node(nid, &node_arg);
>  	if (need_zonelists_rebuild)
>  		build_all_zonelists(NULL);
>  
> @@ -1245,16 +1259,26 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>  	kswapd_run(nid);
>  	kcompactd_run(nid);
>  
> +	if (node_arg.status_change_nid >= 0)
> +		/*
> +		 * Node went from memoryless to have memory. Notifiy interested
> +		 * consumers
> +		 */
> +		node_notify(NODE_BECAME_MEM_AWARE, &node_arg);
> +
>  	writeback_set_ratelimit();
>  
> -	memory_notify(MEM_ONLINE, &arg);
> +	memory_notify(MEM_ONLINE, &mem_arg);
>  	return 0;
>  
>  failed_addition:
>  	pr_debug("online_pages [mem %#010llx-%#010llx] failed\n",
>  		 (unsigned long long) pfn << PAGE_SHIFT,
>  		 (((unsigned long long) pfn + nr_pages) << PAGE_SHIFT) - 1);
> -	memory_notify(MEM_CANCEL_ONLINE, &arg);
> +	if (cancel_node_notifier_on_err)
> +		node_notify(NODE_CANCEL_MEM_AWARE, &node_arg);
> +	if (cancel_mem_notifier_on_err)
> +		memory_notify(MEM_CANCEL_ONLINE, &mem_arg);

Switch the order of those just for symmetry? :)

>  	remove_pfn_range_from_zone(zone, pfn, nr_pages);
>  	return ret;
>  }
> @@ -1898,7 +1922,7 @@ early_param("movable_node", cmdline_parse_movable_node);
>  
>  /* check which state of node_states will be changed when offline memory */
>  static void node_states_check_changes_offline(unsigned long nr_pages,
> -		struct zone *zone, struct memory_notify *arg)
> +		struct zone *zone, struct node_notify *arg)
>  {
>  	struct pglist_data *pgdat = zone->zone_pgdat;
>  	unsigned long present_pages = 0;
> @@ -1935,7 +1959,7 @@ static void node_states_check_changes_offline(unsigned long nr_pages,
>  		arg->status_change_nid = zone_to_nid(zone);
>  }
>  
> -static void node_states_clear_node(int node, struct memory_notify *arg)
> +static void node_states_clear_node(int node, struct node_notify *arg)
>  {
>  	if (arg->status_change_nid_normal >= 0)
>  		node_clear_state(node, N_NORMAL_MEMORY);
> @@ -1963,7 +1987,9 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>  	unsigned long pfn, managed_pages, system_ram_pages = 0;
>  	const int node = zone_to_nid(zone);
>  	unsigned long flags;
> -	struct memory_notify arg;
> +	struct memory_notify mem_arg;
> +	struct node_notify node_arg;
> +	bool cancel_mem_notifier_on_err = false, cancel_node_notifier_on_err = false;
>  	char *reason;
>  	int ret;
>  
> @@ -2022,11 +2048,22 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>  		goto failed_removal_pcplists_disabled;
>  	}
>  
> -	arg.start_pfn = start_pfn;
> -	arg.nr_pages = nr_pages;
> -	node_states_check_changes_offline(nr_pages, zone, &arg);
> +	mem_arg.start_pfn = start_pfn;
> +	mem_arg.nr_pages = nr_pages;
> +	node_states_check_changes_offline(nr_pages, zone, &node_arg);
> +
> +	if (node_arg.status_change_nid >= 0) {

Ditto.

> +		cancel_node_notifier_on_err = true;
> +		ret = node_notify(NODE_BECOMING_MEMORYLESS, &node_arg);
> +		ret = notifier_to_errno(ret);
> +		if (ret)
> +			goto failed_removal_isolated;
> +	}
>  
> -	ret = memory_notify(MEM_GOING_OFFLINE, &arg);
> +	cancel_mem_notifier_on_err = true;
> +	mem_arg.status_change_nid = node_arg.status_change_nid;
> +	mem_arg.status_change_nid_normal = node_arg.status_change_nid_normal;
> +	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
>  	ret = notifier_to_errno(ret);
>  	if (ret) {
>  		reason = "notifier failure";
> @@ -2106,27 +2143,32 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>  	 * Make sure to mark the node as memory-less before rebuilding the zone
>  	 * list. Otherwise this node would still appear in the fallback lists.
>  	 */
> -	node_states_clear_node(node, &arg);
> +	node_states_clear_node(node, &node_arg);
>  	if (!populated_zone(zone)) {
>  		zone_pcp_reset(zone);
>  		build_all_zonelists(NULL);
>  	}
>  
> -	if (arg.status_change_nid >= 0) {
> +	if (node_arg.status_change_nid >= 0) {
>  		kcompactd_stop(node);
>  		kswapd_stop(node);
> +		/*Node went memoryless. Notifiy interested consumers */
> +		node_notify(NODE_BECAME_MEMORYLESS, &node_arg);
>  	}
>  
>  	writeback_set_ratelimit();
>  
> -	memory_notify(MEM_OFFLINE, &arg);
> +	memory_notify(MEM_OFFLINE, &mem_arg);
>  	remove_pfn_range_from_zone(zone, start_pfn, nr_pages);
>  	return 0;
>  
>  failed_removal_isolated:
>  	/* pushback to free area */
>  	undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
> -	memory_notify(MEM_CANCEL_OFFLINE, &arg);
> +	if (cancel_node_notifier_on_err)
> +		node_notify(NODE_CANCEL_MEMORYLESS, &node_arg);
> +	if (cancel_mem_notifier_on_err)
> +		memory_notify(MEM_CANCEL_OFFLINE, &mem_arg);

Ditto.

>  failed_removal_pcplists_disabled:
>  	lru_cache_enable();
>  	zone_pcp_enable(zone);
> diff --git a/mm/slub.c b/mm/slub.c
> index 184fd2b14758..74350f6c8ddd 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -5928,10 +5928,10 @@ static int slab_mem_going_offline_callback(void *arg)
>  
>  static void slab_mem_offline_callback(void *arg)
>  {
> -	struct memory_notify *marg = arg;
> +	struct node_notify *narg = arg;
>  	int offline_node;
>  
> -	offline_node = marg->status_change_nid_normal;
> +	offline_node = narg->status_change_nid_normal;
>  
>  	/*
>  	 * If the node still has available memory. we need kmem_cache_node
> @@ -5954,8 +5954,8 @@ static int slab_mem_going_online_callback(void *arg)
>  {
>  	struct kmem_cache_node *n;
>  	struct kmem_cache *s;
> -	struct memory_notify *marg = arg;
> -	int nid = marg->status_change_nid_normal;
> +	struct node_notify *narg = arg;
> +	int nid = narg->status_change_nid_normal;
>  	int ret = 0;
>  
>  	/*
> @@ -6007,18 +6007,18 @@ static int slab_memory_callback(struct notifier_block *self,
>  	int ret = 0;
>  
>  	switch (action) {
> -	case MEM_GOING_ONLINE:
> +	case NODE_BECOMING_MEM_AWARE:
>  		ret = slab_mem_going_online_callback(arg);
>  		break;
> -	case MEM_GOING_OFFLINE:
> +	case NODE_BECOMING_MEMORYLESS:
>  		ret = slab_mem_going_offline_callback(arg);
>  		break;
> -	case MEM_OFFLINE:
> -	case MEM_CANCEL_ONLINE:
> +	case NODE_BECAME_MEMORYLESS:
> +	case NODE_CANCEL_MEM_AWARE:
>  		slab_mem_offline_callback(arg);
>  		break;
> -	case MEM_ONLINE:
> -	case MEM_CANCEL_OFFLINE:
> +	case NODE_BECAME_MEM_AWARE:
> +	case NODE_CANCEL_MEMORYLESS:
>  		break;
>  	}
>  	if (ret)
> @@ -6094,7 +6094,7 @@ void __init kmem_cache_init(void)
>  			sizeof(struct kmem_cache_node),
>  			SLAB_HWCACHE_ALIGN | SLAB_NO_OBJ_EXT, 0, 0);
>  
> -	hotplug_memory_notifier(slab_memory_callback, SLAB_CALLBACK_PRI);
> +	hotplug_node_notifier(slab_memory_callback, SLAB_CALLBACK_PRI);
>  
>  	/* Able to allocate the per node structures */
>  	slab_state = PARTIAL;

