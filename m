Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1277519CCEA
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453534; cv=none; b=fN9xd47GBqWPoxUwRPIMoC3glv0jJxlq9tc8jZoD9+sHsdjBAsqf+DvRFZkn9iYadpOzmIVkxpuBbTE8IeUpnAc3J3kXpuRVmt9lpZQNe89s0Hf2NRGay7P/K/p/F/kIW8MpvxGkK1PgKMzsqa/O96Ol+Zo734obhO1j5mMG3OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453534; c=relaxed/simple;
	bh=ANSZT5cBTnShn4WR7qE1YaqGNO5dQUiGzpCUwGUSUrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tRu3IQ43N4atXcpOHecLo527wijpmKp8x9vbTUUE1iCgXaMYqk0E4B0N9D6Une3ac/6FE2lwy1Pe4qwGdXbliujDs1fKknFEuL94WCQCwJdgEeN7h8G65FCYCitFGiL3IlZEydfbr+c/t/nmddG8rRy6sX2QNV9QX1jjjuuOXgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=T8B/0FW5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=YYnhcdNF; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=wyZUsl9+; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=C97G38nm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="T8B/0FW5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="YYnhcdNF";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="wyZUsl9+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="C97G38nm"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7F4081F7A5;
	Mon,  5 May 2025 13:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746453531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TH+0b0M8H2Ybij59z8Bx1KMll9EwBpBNjNIZM+YojI=;
	b=T8B/0FW5KCOuaumgO6JCMaZDePcnkPhrzKvZIw9xc6IJbL4ZROQCG80ShN5jyUg2vWRCRY
	VvQTSZngXLKblxy5ZJ5ILaZFwKz/8KpebAHiFr2bHMCJQ2/Y3+6jsX0U2UFKWcWepGgIP8
	afSETDisB/Y9hkL6pIR5j8eLSTvWO/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746453531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TH+0b0M8H2Ybij59z8Bx1KMll9EwBpBNjNIZM+YojI=;
	b=YYnhcdNF0JBCsH5nJHSMP6nlumwMzhz7yb79Q5TqgFNmQaZYSEXDdLf4fWNl1rqjYSqMpV
	N1WeEc1eQNXbPRBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746453530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TH+0b0M8H2Ybij59z8Bx1KMll9EwBpBNjNIZM+YojI=;
	b=wyZUsl9+wRZyr+SHLNWLo0suoBvJAoDi0isOJF7fzEcNW0LMblIr9KMyzkEX1q9NfkCYjp
	/c/tDVNDpPA1uNMNwBqNT8oBxa7n8LPsVIxegjolt4YYvVd6nevoELMbZ6Prixf4k6sea2
	AgrH7onxSp7TQOLrFB9ZIcvblOJqx6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746453530;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TH+0b0M8H2Ybij59z8Bx1KMll9EwBpBNjNIZM+YojI=;
	b=C97G38nm48irOD39KxcI2JOhKUFDo9yqXmKUEImLVOHULo9dSoBM1i7M/n2EQpI/GfGdAL
	pa4HpHCTvBtn36DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6316713883;
	Mon,  5 May 2025 13:58:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IQ/iFxrEGGh8PQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 05 May 2025 13:58:50 +0000
Message-ID: <d70a95e2-78ab-4bb6-94f6-2adc56737adc@suse.cz>
Date: Mon, 5 May 2025 15:58:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] mm,memory_hotplug: Implement numa node notifier
Content-Language: en-US
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Rakie Kim
 <rakie.kim@sk.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250502083624.49849-1-osalvador@suse.de>
 <20250502083624.49849-3-osalvador@suse.de>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250502083624.49849-3-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,gmail.com,huawei.com,sk.com,oracle.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email,oracle.com:email,suse.cz:mid,suse.cz:email]
X-Spam-Flag: NO
X-Spam-Level: 

On 5/2/25 10:36, Oscar Salvador wrote:
> There are at least six consumers of hotplug_memory_notifier that what they
> really are interested in is whether any numa node changed its state, e.g: going
> from being memory aware to becoming memoryless and vice versa.
> 
> Implement a specific notifier for numa nodes when their state gets changed,
> and have those consumers that only care about numa node state changes use it.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Some cleanup suggestions below:

> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index b1caedbade5b..777f98326908 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -701,24 +701,18 @@ static void online_pages_range(unsigned long start_pfn, unsigned long nr_pages)
>  
>  /* check which state of node_states will be changed when online memory */
>  static void node_states_check_changes_online(unsigned long nr_pages,
> -	struct zone *zone, struct memory_notify *arg)
> +	struct zone *zone, struct node_notify *arg)

I've noticed nr_pages parameter is unused.

Also the function became rather trivial, you could just move the code into
its only caller now?

>  {
>  	int nid = zone_to_nid(zone);
>  
>  	arg->status_change_nid = NUMA_NO_NODE;
> -	arg->status_change_nid_normal = NUMA_NO_NODE;
>  
>  	if (!node_state(nid, N_MEMORY))
>  		arg->status_change_nid = nid;
> -	if (zone_idx(zone) <= ZONE_NORMAL && !node_state(nid, N_NORMAL_MEMORY))
> -		arg->status_change_nid_normal = nid;
>  }
>  
> -static void node_states_set_node(int node, struct memory_notify *arg)
> +static void node_states_set_node(int node, struct node_notify *arg)

This one too.

>  {
> -	if (arg->status_change_nid_normal >= 0)
> -		node_set_state(node, N_NORMAL_MEMORY);
> -
>  	if (arg->status_change_nid >= 0)
>  		node_set_state(node, N_MEMORY);
>  }
> @@ -1177,7 +1171,9 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
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
> @@ -1194,11 +1190,22 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>  	/* associate pfn range with the zone */
>  	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
>  
> -	arg.start_pfn = pfn;
> -	arg.nr_pages = nr_pages;
> -	node_states_check_changes_online(nr_pages, zone, &arg);
> +	mem_arg.start_pfn = pfn;
> +	mem_arg.nr_pages = nr_pages;

You could move the two lines below where the rest of mem_arg is filled.

> +	node_states_check_changes_online(nr_pages, zone, &node_arg);
> +
> +	if (node_arg.status_change_nid >= 0) {
> +		/* Node is becoming memory aware. Notify consumers */
> +		cancel_node_notifier_on_err = true;
> +		ret = node_notify(NODE_BECOMING_MEM_AWARE, &node_arg);
> +		ret = notifier_to_errno(ret);
> +		if (ret)
> +			goto failed_addition;
> +	}
>  
> -	ret = memory_notify(MEM_GOING_ONLINE, &arg);
> +	cancel_mem_notifier_on_err = true;
> +	mem_arg.status_change_nid = node_arg.status_change_nid;
> +	ret = memory_notify(MEM_GOING_ONLINE, &mem_arg);
>  	ret = notifier_to_errno(ret);
>  	if (ret)
>  		goto failed_addition;
