Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC51D90AD
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431866; cv=none; b=hyWlToFRiOOUz81eEVCKJDhwdho6nmYLvEwzCwGPzerK+st7awI2fWXJpmJK8GhFdX6oq22FcyBczk2Yk8PkmY2B4HwP+C6y2MezuQMZTMftnSWAsm4s3k2aa7uF3IJW9OyyBtnhcbYrXmJzUd6h4nwTbmXXTm+EHczp64fIVls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431866; c=relaxed/simple;
	bh=Wi9GAu2eo3pSVUt3KaxK2q+1jNGNEPERKxwToA4jTfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEPo4fV5vpDeNTjNwi/Tz/ESldQ9VlAVZ3OobC+ONrreQjFeuS9dRQnW+rgQaqFtXblf084PbKVUpdnD/0gzoyVj4yL4OUNASffgwFi3FfyWD3yTwLruKbOM+7++Tc9G0G9iw1sQYHn0KxWqNjAX/ep++O8JEnezA7HSOhsYq+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gqwPmKNg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7fZHkoYb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gqwPmKNg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7fZHkoYb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gqwPmKNg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7fZHkoYb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gqwPmKNg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7fZHkoYb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1FC36216EE;
	Mon,  5 May 2025 07:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746431863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jmv+7HBEy0fwKr1rMdE+zrW2njkxMCW/EyLYP7nagd8=;
	b=gqwPmKNg3cyqehi3l7OIb0wFb7kggE614ZS3RUh6F8O76llJSmc0bGcxOhFycMOY8pCjmZ
	AWhnj0rAhjM21IIebMD/FsvZi8kjOnutyELLmJBoelmU3xC7MlQlKTfZ60KS2tl0EjgO5U
	4QpVPU2W0RgZrkgicdpIVGTqHuyw+2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746431863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jmv+7HBEy0fwKr1rMdE+zrW2njkxMCW/EyLYP7nagd8=;
	b=7fZHkoYbBYB6yYO8EmiYSqsGTdhqdKfoq4lzG+tLXFOKH4hWYvWW9bdOQp+G+7ErI1DEk4
	zczkqI4otfXqMjBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gqwPmKNg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7fZHkoYb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746431863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jmv+7HBEy0fwKr1rMdE+zrW2njkxMCW/EyLYP7nagd8=;
	b=gqwPmKNg3cyqehi3l7OIb0wFb7kggE614ZS3RUh6F8O76llJSmc0bGcxOhFycMOY8pCjmZ
	AWhnj0rAhjM21IIebMD/FsvZi8kjOnutyELLmJBoelmU3xC7MlQlKTfZ60KS2tl0EjgO5U
	4QpVPU2W0RgZrkgicdpIVGTqHuyw+2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746431863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jmv+7HBEy0fwKr1rMdE+zrW2njkxMCW/EyLYP7nagd8=;
	b=7fZHkoYbBYB6yYO8EmiYSqsGTdhqdKfoq4lzG+tLXFOKH4hWYvWW9bdOQp+G+7ErI1DEk4
	zczkqI4otfXqMjBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF78C13883;
	Mon,  5 May 2025 07:57:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8VC0N3VvGGhBUQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 05 May 2025 07:57:41 +0000
Date: Mon, 5 May 2025 09:57:31 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Donet Tom <donettom@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration
 to reduce boot time
Message-ID: <aBhva9D6H5BtkSID@localhost.localdomain>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
 <aBhoqpC4Jy-c-74p@localhost.localdomain>
 <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
X-Rspamd-Queue-Id: 1FC36216EE
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,nvidia.com,linuxfoundation.org,linux-foundation.org,gmail.com,huawei.com,intel.com,kvack.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, May 05, 2025 at 09:38:43AM +0200, David Hildenbrand wrote:
> On 05.05.25 09:28, Oscar Salvador wrote:
> > On Mon, May 05, 2025 at 09:16:48AM +0200, David Hildenbrand wrote:
> > > memory hotplug code never calls register_one_node(), unless I am missing
> > > something.
> > > 
> > > During add_memory_resource(), we call __try_online_node(nid, false), meaning
> > > we skip register_one_node().
> > > 
> > > The only caller of __try_online_node(nid, true) is try_online_node(), called
> > > from CPU hotplug code, and I *guess* that is not required.
> > 
> > Well, I guess this is because we need to link the cpus to the node.
> > register_one_node() has two jobs: 1) register cpus belonging to the node
> > and 2) register memory-blocks belonging to the node (if any).
> 
> Ah, via __register_one_node() ...
> 
> I would assume that an offline node
> 
> (1) has no memory
> (2) has no CPUs

That is right.

> When we *hotplug* either memory or CPUs, and we first online the node, there
> is nothing to register. Because if there would be something, the node would
> already be online.

I think I do not understand this, but let us imagine the following
scenario:

- You craft a VM with qemu that has a numa node which is memoryless and cpuless.
  This node will be allocated in free_area_init()->alloc_offline_node_data() but
  it will not be marked online because it does not have any resources.

  Then if you create a cpu device and hotplug in there, this will
  trigger try_online_node() from the cpu callback and go all the way to
  __register_one_node() to link the hotplugged cpu to the corresponding node.

  Now, I do not see an issue with that.
  The only think that makes me go "meh", is that register_one_node()
  calls register_memory_blocks_under_node() blindly when there might not
  be any memory block to register (I am sure we bail out if we see that
  somewhere, but still feels kinda of "wrong"?


-- 
Oscar Salvador
SUSE Labs
