Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111002E425D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077181; cv=none; b=tGa3/T4d8UMqhj2I47fic7d6m3oCtgLoW1yFLs+RD34Ck+4mfZ+z28TLKNljIBW3FAA/fnFxdQzrGvErp7RFS1E6+T/YwONmveo8mVw5cHl9ltBF+HQeYXeA4Nvt+bkg5ns0ORd/Q4udmXTo9Z7mK88MdTWqgzPWfnAyw9MNRBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077181; c=relaxed/simple;
	bh=OwlUMduCrZ+msLujtEjTceKi7BOIeKBdbPjQ5VWAm0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWeowTTZAhMBYIWzXnTTLakJf0bG84jrtDvf/4DBLXCEjqydez60bn02+13lmXkXRzNBbYCwVCF5AJzVJAqtVGySI7/C0SUDcJdSirkIUpvCmmufJ7WY01olubTAxQYTetYgyYBQ6NW590oBLalJNWjNx/DK4KKbPHhz0h7Nd8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j9FfApOZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KmNOV6uW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GbZbGM8o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Rzw6rv9K; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j9FfApOZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KmNOV6uW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GbZbGM8o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rzw6rv9K"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CFAAB211A3;
	Mon, 16 Jun 2025 12:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750077177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVMuZ31mFi2uH+VZBaaisw/uEdjo/iMkeB0fQGy/mHo=;
	b=j9FfApOZWtbgJFHk+Ik2mh10HTTqMtgyd8JYvPZk8gFIaKoBIhXqHTib1MyEBYooT5jP0a
	uYtNm9ntqPUYruqsWT6cSPmjre6s86orQExkUkzNjOfJOZt6jLA1tcPGb57x3eaRPRPCQL
	ygtI+n6L+Nr2F+65E4jevdwv3w9IfSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750077177;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVMuZ31mFi2uH+VZBaaisw/uEdjo/iMkeB0fQGy/mHo=;
	b=KmNOV6uWXeK3ssLS2cKHoi3+4lFkwPpLio4BDZtPuu6WBtxdoe06Grrv5Y822nHO2X1DWb
	36IuafMLmJZrOrDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GbZbGM8o;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Rzw6rv9K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750077176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVMuZ31mFi2uH+VZBaaisw/uEdjo/iMkeB0fQGy/mHo=;
	b=GbZbGM8o1DSBmIn8dbTFYcVEDItw6lg4nBypYHonYgsIJ+oCaJMzYNbieb5xsxuXLb2AJi
	zQ1W6WfOBLo0vDbUfokCNzVAhnuCaXTrxhAyRYrndjPpNWZFX4tjBlLFnx1FScL4iujRBS
	AnkQE++KaNlrNbeIKF43C5VeU+OYvgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750077176;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVMuZ31mFi2uH+VZBaaisw/uEdjo/iMkeB0fQGy/mHo=;
	b=Rzw6rv9KlwEF0HvE29gHURgQ0YXv4QMzd8KiBeuau8mR//srGn+qiMUEjFcOBhpmU++lSx
	1oI9WDG9U3NX2sDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 473FB139E2;
	Mon, 16 Jun 2025 12:32:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 29HBDvgOUGhnCQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 12:32:56 +0000
Date: Mon, 16 Jun 2025 14:32:54 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/10] mm,memory_hotplug: Implement numa node notifier
Message-ID: <aFAO9igZQ7yP1m7A@localhost.localdomain>
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-4-osalvador@suse.de>
 <2bec8b53-f788-493e-a76e-1f804ed3aa0c@redhat.com>
 <aE_WG6bnjtLBzCp8@localhost.localdomain>
 <10c87a0e-c9fe-48fe-9bbd-16afd244b4ec@redhat.com>
 <aE_a4_rGbMLJKBIs@localhost.localdomain>
 <360f2f04-4542-4595-bf36-c45ed10335af@redhat.com>
 <aFADwYs9LcyK5tVn@localhost.localdomain>
 <23431108-b5b8-4c8a-8869-8f994371e7a5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23431108-b5b8-4c8a-8869-8f994371e7a5@redhat.com>
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,localhost.localdomain:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: CFAAB211A3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

On Mon, Jun 16, 2025 at 02:21:02PM +0200, David Hildenbrand wrote:
> Exactly. I recall I checked some of them in the past as well, when I
> stumbled over this behavior.

Now, about simplying the cancel_{mem,node}_notifier_on_err.
It would look like this:

 diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
 index d6df85452c72..ff887f10b114 100644
 --- a/mm/memory_hotplug.c
 +++ b/mm/memory_hotplug.c
 @@ -1150,11 +1150,16 @@ void mhp_deinit_memmap_on_memory(unsigned long pfn, unsigned long nr_pages)
  int online_pages(unsigned long pfn, unsigned long nr_pages,
  		       struct zone *zone, struct memory_group *group)
  {
 -	bool cancel_mem_notifier_on_err = false, cancel_node_notifier_on_err = false;
  	const int nid = zone_to_nid(zone);
  	int need_zonelists_rebuild = 0;
 -	struct memory_notify mem_arg;
 -	struct node_notify node_arg;
 +	struct memory_notify mem_arg = {
 +		.start_pfn = pfn,
 +		.nr_pages = nr_pages,
 +		.status_change_nid = NUMA_NO_NODE,
 +	};
 +	struct node_notify node_arg = {
 +		.nid = NUMA_NO_NODE,
 +	};
  	unsigned long flags;
  	int ret;
 
 @@ -1173,21 +1178,16 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
  	/* associate pfn range with the zone */
  	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
 
 -	node_arg.nid = NUMA_NO_NODE;
  	if (!node_state(nid, N_MEMORY)) {
  		/* Adding memory to the node for the first time */
 -		cancel_node_notifier_on_err = true;
  		node_arg.nid = nid;
 +		mem_arg.status_change_nid = nid;
  		ret = node_notify(NODE_ADDING_FIRST_MEMORY, &node_arg);
  		ret = notifier_to_errno(ret);
  		if (ret)
  			goto failed_addition;
  	}
 
 -	mem_arg.start_pfn = pfn;
 -	mem_arg.nr_pages = nr_pages;
 -	mem_arg.status_change_nid = node_arg.nid;
 -	cancel_mem_notifier_on_err = true;
  	ret = memory_notify(MEM_GOING_ONLINE, &mem_arg);
  	ret = notifier_to_errno(ret);
  	if (ret)
 @@ -1249,9 +1249,8 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
  	pr_debug("online_pages [mem %#010llx-%#010llx] failed\n",
  		 (unsigned long long) pfn << PAGE_SHIFT,
  		 (((unsigned long long) pfn + nr_pages) << PAGE_SHIFT) - 1);
 -	if (cancel_mem_notifier_on_err)
 -		memory_notify(MEM_CANCEL_ONLINE, &mem_arg);
 -	if (cancel_node_notifier_on_err)
 +	memory_notify(MEM_CANCEL_ONLINE, &mem_arg);
 +	if (node_arg.nid != NUMA_NO_NODE)
  		node_notify(NODE_CANCEL_ADDING_FIRST_MEMORY, &node_arg);
  	remove_pfn_range_from_zone(zone, pfn, nr_pages);
  	return ret;
 @@ -1899,13 +1898,18 @@ static int count_system_ram_pages_cb(unsigned long start_pfn,
  int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
  			struct zone *zone, struct memory_group *group)
  {
 -	bool cancel_mem_notifier_on_err = false, cancel_node_notifier_on_err = false;
  	unsigned long pfn, managed_pages, system_ram_pages = 0;
  	const unsigned long end_pfn = start_pfn + nr_pages;
  	struct pglist_data *pgdat = zone->zone_pgdat;
  	const int node = zone_to_nid(zone);
 -	struct memory_notify mem_arg;
 -	struct node_notify node_arg;
 +	struct memory_notify mem_arg = {
 +		.start_pfn = pfn,
 +		.nr_pages = nr_pages,
 +		.status_change_nid = NUMA_NO_NODE,
 +	};
 +	struct node_notify node_arg = {
 +		.nid = NUMA_NO_NODE,
 +	};
  	unsigned long flags;
  	char *reason;
  	int ret;
 @@ -1970,20 +1974,15 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
  	 * 'nr_pages' more. If so, we know that the node will become empty, and
  	 * so we will clear N_MEMORY for it.
  	 */
 -	node_arg.nid = NUMA_NO_NODE;
  	if (nr_pages >= pgdat->node_present_pages) {
  		node_arg.nid = node;
 -		cancel_node_notifier_on_err = true;
 +		mem_arg.status_change_nid = node;
  		ret = node_notify(NODE_REMOVING_LAST_MEMORY, &node_arg);
  		ret = notifier_to_errno(ret);
  		if (ret)
  			goto failed_removal_isolated;
  	}
 
 -	mem_arg.start_pfn = start_pfn;
 -	mem_arg.nr_pages = nr_pages;
 -	mem_arg.status_change_nid = node_arg.nid;
 -	cancel_mem_notifier_on_err = true;
  	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
  	ret = notifier_to_errno(ret);
  	if (ret) {
 @@ -2087,9 +2086,8 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
  failed_removal_isolated:
  	/* pushback to free area */
  	undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
 -	if (cancel_mem_notifier_on_err)
 -		memory_notify(MEM_CANCEL_OFFLINE, &mem_arg);
 -	if (cancel_node_notifier_on_err)
 +	memory_notify(MEM_CANCEL_OFFLINE, &mem_arg);
 +	if (node_arg.nid != NUMA_NO_NODE)
  		node_notify(NODE_CANCEL_REMOVING_LAST_MEMORY, &node_arg);
  failed_removal_pcplists_disabled:
  	lru_cache_enable();


Not sure if I like keeping the cancel_* stuff.
Strong opinion here? Feelings? :-)

 

-- 
Oscar Salvador
SUSE Labs
