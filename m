Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6501CA2D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196232; cv=none; b=gsrTEbzuhaEzzPrwg4TZ7RRhhx7kbSP0JJTBC0bVc1fN0OeLy58IdagO5XWp6XvceQxL85JWZunGpxtFUmoLb+kr7zzGmVDIY8DAG93USSGBaWBpAoSUgdmNFwv7rTRiynPgGJmJApnc/yi8aPTj9B8H1eTE358inr6IhOHz+2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196232; c=relaxed/simple;
	bh=W95dGKvZISs+VrvkO9omqb8XkHClGIeaLwUIm5GV9T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ips54GwXtkzY0JQaqnwr/oUqwp+lkmeaw+7VLfTjn2CLVsQq9COlzdghKF/OfGvhBG9/NMtVfRf62UQz9C5FF3uiYF3fjXiG09HsWsZLxvgWA3XHEOWnRntKxiUDL3fnMdPGeNf2ZjGTvo8otUZlTDDh7fDCcTbyxpqY+xARFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x0YT28om; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6zHbOdk/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x0YT28om; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6zHbOdk/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x0YT28om";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6zHbOdk/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x0YT28om";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6zHbOdk/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 465111F46E;
	Fri,  6 Jun 2025 07:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749196223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPQ5OU5UE55RJ5fsjrvbcqhqZJm6LEqSqE1iQQ88/l0=;
	b=x0YT28omMrjMtmnEUrNNujG81DIAQ2v/504ZJN5Hfs996/r63QyPf4nJKdU7d1S8Qbu7NO
	KopxPr/vhk2wRZAcZMXLDhEPTDjWQnDCDEbGP6Deo94h7YwSdQ+FDRLE+vZ2w5yBIx4LcX
	u6zRrlkmCUgGMBCfC1aiE8n3eArinyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749196223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPQ5OU5UE55RJ5fsjrvbcqhqZJm6LEqSqE1iQQ88/l0=;
	b=6zHbOdk//8hxS5cmfvtV4OFTaw3nMs5dQUA3Em6KSpXPWJdsXVXiWrwnFcnk5ze0USVVx6
	ryvQ2T9GEZD8JzCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=x0YT28om;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="6zHbOdk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749196223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPQ5OU5UE55RJ5fsjrvbcqhqZJm6LEqSqE1iQQ88/l0=;
	b=x0YT28omMrjMtmnEUrNNujG81DIAQ2v/504ZJN5Hfs996/r63QyPf4nJKdU7d1S8Qbu7NO
	KopxPr/vhk2wRZAcZMXLDhEPTDjWQnDCDEbGP6Deo94h7YwSdQ+FDRLE+vZ2w5yBIx4LcX
	u6zRrlkmCUgGMBCfC1aiE8n3eArinyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749196223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPQ5OU5UE55RJ5fsjrvbcqhqZJm6LEqSqE1iQQ88/l0=;
	b=6zHbOdk//8hxS5cmfvtV4OFTaw3nMs5dQUA3Em6KSpXPWJdsXVXiWrwnFcnk5ze0USVVx6
	ryvQ2T9GEZD8JzCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE0D31336F;
	Fri,  6 Jun 2025 07:50:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gwLDJ76dQmg1eAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 06 Jun 2025 07:50:22 +0000
Date: Fri, 6 Jun 2025 09:50:21 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/10] mm,memory_hotplug: Implement numa node notifier
Message-ID: <aEKdvc8IWgSXSF8Q@localhost.localdomain>
References: <20250605142305.244465-1-osalvador@suse.de>
 <20250605142305.244465-4-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605142305.244465-4-osalvador@suse.de>
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,oracle.com:email,suse.cz:email,suse.de:dkim,suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 465111F46E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

On Thu, Jun 05, 2025 at 04:22:54PM +0200, Oscar Salvador wrote:
> There are at least six consumers of hotplug_memory_notifier that what they
> really are interested in is whether any numa node changed its state, e.g: going
> from having memory to not having memory and vice versa.
> 
> Implement a specific notifier for numa nodes when their state gets changed,
> which will later be used by those consumers that are only interested
> in numa node state changes.
> 
> Add documentation as well.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
...
> diff --git a/include/linux/node.h b/include/linux/node.h
> index 2b7517892230..8c783269011d 100644
> --- a/include/linux/node.h
> +++ b/include/linux/node.h
> @@ -123,6 +123,48 @@ static inline void register_memory_blocks_under_node(int nid, unsigned long star
>  #endif
>  
>  extern void unregister_node(struct node *node);
> +
> +#ifdef CONFIG_MEMORY_HOTPLUG
> +struct node_notify {
> +	int nid;
> +};
> +
> +#define NODE_ADDING_FIRST_MEMORY                (1<<0)
> +#define NODE_ADDED_FIRST_MEMORY                 (1<<1)
> +#define NODE_CANCEL_ADDING_FIRST_MEMORY         (1<<2)
> +#define NODE_REMOVING_LAST_MEMORY               (1<<3)
> +#define NODE_REMOVED_LAST_MEMORY                (1<<4)
> +#define NODE_CANCEL_REMOVING_LAST_MEMORY        (1<<5)
> +
> +#if defined(CONFIG_MEMORY_HOTPLUG) && defined(CONFIG_NUMA)
> +extern int register_node_notifier(struct notifier_block *nb);
> +extern void unregister_node_notifier(struct notifier_block *nb);
> +extern int node_notify(unsigned long val, void *v);
> +
> +#define hotplug_node_notifier(fn, pri) ({		\
> +	static __meminitdata struct notifier_block fn##_node_nb =\
> +		{ .notifier_call = fn, .priority = pri };\
> +	register_node_notifier(&fn##_node_nb);			\
> +})
> +#else
> +static inline int register_node_notifier(struct notifier_block *nb)
> +{
> +	return 0;
> +}
> +static inline void unregister_node_notifier(struct notifier_block *nb)
> +{
> +}
> +static inline int node_notify(unsigned long val, void *v)
> +{
> +	return 0;
> +}
> +static inline int hotplug_node_notifier(notifier_fn_t fn, int pri)
> +{
> +	return 0;
> +}
> +#endif
> +#endif


I got carried away, sorry.
We need this fixup on top:

 diff --git a/include/linux/node.h b/include/linux/node.h
 index 8c783269011d..d7aa2636d948 100644
 --- a/include/linux/node.h
 +++ b/include/linux/node.h
 @@ -124,7 +124,6 @@ static inline void register_memory_blocks_under_node(int nid, unsigned long star
 
  extern void unregister_node(struct node *node);
 
 -#ifdef CONFIG_MEMORY_HOTPLUG
  struct node_notify {
  	int nid;
  };
 @@ -163,7 +162,6 @@ static inline int hotplug_node_notifier(notifier_fn_t fn, int pri)
  	return 0;
  }
  #endif
 -#endif
 
  #ifdef CONFIG_NUMA
  extern void node_dev_init(void);
 

-- 
Oscar Salvador
SUSE Labs
