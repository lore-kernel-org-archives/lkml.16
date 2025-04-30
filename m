Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772561C5489
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998724; cv=none; b=hfKmknqj+4zUEj0LpXieFtJpg8qo2zBhtkDhQMsBg+ggHQYf1VlqShtJ6IopQCYJ5uBzwfz5XPiF7VUNe5Yncwucczsn4Y3udqYjc+PdE4MOiqQR8z8jEmZ5xylHdiDKO5kciPmCndpDlSUZ0TJUbZkMXs03eNSOP6Am1xlG5DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998724; c=relaxed/simple;
	bh=3S1jW0u9Fom9G1enfgWnzKclq7b3VjAVQjhyQSU1Dkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cz6vYYhQgqwY3uOpDZebFciVCVsDIv3kqePte0BPzpXIl/3QGaq6RJVfU/nKf50B0NdKJZOCPVoFqgxRJPQ2q1TYwlm2WKwAgDv8j3q8ge9dqZ0WSuFVqGDa9leWgblUvYcAHkqjOZLUaAWVnVhlogq0dp//976FuQteX0fZh5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TnxU1PwQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PkuMMQun; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TnxU1PwQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PkuMMQun; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TnxU1PwQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PkuMMQun";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TnxU1PwQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PkuMMQun"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9AEEB21259;
	Wed, 30 Apr 2025 07:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745998720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0Wxq+lm+JZ1Afn0Ufjma0zDuusZNEP1SWkG1+hjfJ4=;
	b=TnxU1PwQyrHRVyF+pcR6yLWKS41mxzATA+bT3LLUwzcJIMdoxyNnJpZHV062EbJBqMTnvI
	OJC1fsJxX/K+xD3Hf3QrXwmKYLT9Aj2MVmesRtHh5F6Z/E5SVC2sbE/8OwhHG0Uzxs7wm8
	kdsnXe8nzWlwU+8/aYDQ771a4XjFXNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745998720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0Wxq+lm+JZ1Afn0Ufjma0zDuusZNEP1SWkG1+hjfJ4=;
	b=PkuMMQun5mNMXZKTtF3Y5RmTQaEBzsPArrEG75Cnf3nK8flTcm8gW/9nAWLch2hVh6WmbN
	x5Mp6Y6I4yBpXcBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TnxU1PwQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PkuMMQun
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745998720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0Wxq+lm+JZ1Afn0Ufjma0zDuusZNEP1SWkG1+hjfJ4=;
	b=TnxU1PwQyrHRVyF+pcR6yLWKS41mxzATA+bT3LLUwzcJIMdoxyNnJpZHV062EbJBqMTnvI
	OJC1fsJxX/K+xD3Hf3QrXwmKYLT9Aj2MVmesRtHh5F6Z/E5SVC2sbE/8OwhHG0Uzxs7wm8
	kdsnXe8nzWlwU+8/aYDQ771a4XjFXNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745998720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0Wxq+lm+JZ1Afn0Ufjma0zDuusZNEP1SWkG1+hjfJ4=;
	b=PkuMMQun5mNMXZKTtF3Y5RmTQaEBzsPArrEG75Cnf3nK8flTcm8gW/9nAWLch2hVh6WmbN
	x5Mp6Y6I4yBpXcBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD88E139E7;
	Wed, 30 Apr 2025 07:38:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vXZNM3/TEWhWfwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 30 Apr 2025 07:38:39 +0000
Date: Wed, 30 Apr 2025 09:38:33 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] driver/base: Optimize memory block registration
 to reduce boot time
Message-ID: <aBHTeeAWtlrt4gN8@localhost.localdomain>
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
X-Rspamd-Queue-Id: 9AEEB21259
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,linuxfoundation.org,linux-foundation.org,gmail.com,huawei.com,intel.com,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

On Mon, Apr 28, 2025 at 10:33:46PM +0530, Donet Tom wrote:
> During node device initialization, `memory blocks` are registered under
> each NUMA node. The `memory blocks` to be registered are identified using
> the node’s start and end PFNs, which are obtained from the node's pg_data
> 

Hi Donet,

> Test Results on My system with 32TB RAM
> =======================================
> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
> 
> Without this patch
> ------------------
> Startup finished in 1min 16.528s (kernel)
> 
> With this patch
> ---------------
> Startup finished in 17.236s (kernel) - 78% Improvement

That is pretty impressive.

> +void register_memory_blocks_under_node_early(int nid)
> +{
> +	struct memblock_region *r;
> +	unsigned long start_block_id;
> +	unsigned long end_block_id;
> +	struct memory_block *mem;
> +	unsigned long block_id;
> +
> +	for_each_mem_region(r) {
> +		if (r->nid == nid) {
> +			start_block_id = phys_to_block_id(r->base);
> +			end_block_id = phys_to_block_id(r->base + r->size - 1);
> +
> +			for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
> +				mem = find_memory_block_by_id(block_id);
> +				if (!mem)
> +					continue;

I would just mention what David already said here, reduce identation,
and maybe declare the variables where they are needed. It might be clearer.

> +
> +				do_register_memory_block_under_node(nid, mem, MEMINIT_EARLY);
> +				put_device(&mem->dev);

I will comment on the "context" on patch#2.

> +void register_memory_blocks_under_node_early(int nid);
static void ... ?


-- 
Oscar Salvador
SUSE Labs
