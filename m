Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BA2267713
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735512; cv=none; b=VJr3lUaQum3XZJMq8UEbRTvPVTkX0AbkkmYh2drg2GW66Zoj8LUR4qCv9OejzkKffPA/eWiEzCmjDCprBHzJSittY9TWpkGWtr5rDRd/Q3oz11DN6uhmfvskN2XSZamtRY4fRNkQcy5+BZCooVyndHa0XqRqlrMtICV2VfA1UhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735512; c=relaxed/simple;
	bh=vEr2evVqF7buvX80qTeUg68IDenzt6IkT7O+67h9UCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZOnWqF05lJOnlWXsQRxcePmmbna736i2Mgv99j4q+X+F4932U1VUCMq8mOO1JQDgZXUwKf8/LOZcd/KAYKiMz/o3ycUv7LdBtHZUwy0TlYJ2g6QTGR12/cF/tHdvGYkulhV6R65IrHAv27B660IjE4rshv9wmIEfoD9KoX/KlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Kg/oXx3+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BksDnml4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Kg/oXx3+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BksDnml4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Kg/oXx3+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BksDnml4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Kg/oXx3+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BksDnml4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5484220663;
	Tue, 20 May 2025 10:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747735509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l0NOErDr8CoTJmeJPQ3XuHSDjH3q/HOWtKaSpvPXI2k=;
	b=Kg/oXx3+ECnyjLTpNUlHhIRxHB8NCCkg/xdE2jad5z4Z1M9v7knCNij9q3FQwadO7/WwWD
	uG3oIEY+QrwsH+lZ7vozxm7d9TCEBNKcNyqngITV3RXqnBn2zrkExkDIP7OW0vwIluJrY7
	RmkfDvGOyVdWVfWaDHF84X4MpwjLi4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747735509;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l0NOErDr8CoTJmeJPQ3XuHSDjH3q/HOWtKaSpvPXI2k=;
	b=BksDnml4mZ9b53Ff6/wF+rwSSZwwlDSkcUEMgCXX17l0Cg8+v4G8Icspkkr4ptv/kFsV4u
	Y7IKJvikUeU7nJAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Kg/oXx3+";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BksDnml4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747735509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l0NOErDr8CoTJmeJPQ3XuHSDjH3q/HOWtKaSpvPXI2k=;
	b=Kg/oXx3+ECnyjLTpNUlHhIRxHB8NCCkg/xdE2jad5z4Z1M9v7knCNij9q3FQwadO7/WwWD
	uG3oIEY+QrwsH+lZ7vozxm7d9TCEBNKcNyqngITV3RXqnBn2zrkExkDIP7OW0vwIluJrY7
	RmkfDvGOyVdWVfWaDHF84X4MpwjLi4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747735509;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l0NOErDr8CoTJmeJPQ3XuHSDjH3q/HOWtKaSpvPXI2k=;
	b=BksDnml4mZ9b53Ff6/wF+rwSSZwwlDSkcUEMgCXX17l0Cg8+v4G8Icspkkr4ptv/kFsV4u
	Y7IKJvikUeU7nJAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1EB3C13A3E;
	Tue, 20 May 2025 10:05:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id E2PMBtVTLGiVZAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 20 May 2025 10:05:09 +0000
Date: Tue, 20 May 2025 12:05:03 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Donet Tom <donettom@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v4 2/4] driver/base: remove
 register_mem_block_under_node_early()
Message-ID: <aCxTz1iOgysNDH60@localhost.localdomain>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <1b516adb43371fad2dbc69c83a2ed2a224219688.1747376551.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b516adb43371fad2dbc69c83a2ed2a224219688.1747376551.git.donettom@linux.ibm.com>
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5484220663
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[redhat.com,linux-foundation.org,kernel.org,nvidia.com,gmail.com,linuxfoundation.org,vger.kernel.org,kvack.org,huawei.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,suse.de:email,suse.de:dkim]

On Fri, May 16, 2025 at 03:19:52AM -0500, Donet Tom wrote:
> The function register_mem_block_under_node_early() is no longer used,
> as register_memory_blocks_under_node_early() now handles memory block
> registration during early boot.
> 
> Removed register_mem_block_under_node_early() and get_nid_for_pfn(),
> the latter was only used by the former.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>

Acked-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
