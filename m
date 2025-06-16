Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D083F1BF58
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063857; cv=none; b=Gd8PKdKSPPoAac0ZmNi1PIrlHsIxrTysJE+Bo8NwVaCz5PYKmczFG7bCcXSi4tbRIYMTR705H0N4i4aO2DlKqZn0aXjEW/vLZrB+L+4rmBm8R9iINzuts9IB7qh1kwF0YACZgKH/JFUbTXBmumwXEaIo3qnkyxI1d7RzgCnBI9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063857; c=relaxed/simple;
	bh=MApachlhqAzCVaIiSiIPpWwCa3tuQFOMspQIadnilIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MoKQtnOiPA1kao5zat9JxhLYewsSnHt0fmxjjS9XhG+I4m73otgbJ9i50v9Rsj0Jd+Blu9ecWwor6tJLctJUykvr7bkpFGN2mtw/XchfmOcp75K/pIF+nbKMnDvWKlAkJZDDn68u1XX2vpj126qEEYvtsa/ybapDQfl8M7uwr0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2CAAFci1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zk2TXigx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2CAAFci1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zk2TXigx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2CAAFci1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zk2TXigx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2CAAFci1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zk2TXigx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 162A121203;
	Mon, 16 Jun 2025 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750063854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/4amVyIfpjADX65ebEMO5hOWnVs7Lj7aXl/n8kGn2w=;
	b=2CAAFci1yPN/wPPx+9rxZcbaSfKV4pT3VM/+GjchMTHhnWagQomeFGblEVXte0RDn4xQgz
	l6u1VZZkcj8aOiIXaZjglO5Vjoo42zcTNscorxrEsXrU1OjT9OY5aI4f21CwtyYg8j5WcM
	KxZhJt1wzoUTO30X++3Xc1RRCmQnZT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750063854;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/4amVyIfpjADX65ebEMO5hOWnVs7Lj7aXl/n8kGn2w=;
	b=Zk2TXigxxjkMqaa0nhBK948HIqOrGvb7ArlIroeC011v+eSNuE+4PFQNjmkE1J9eqhYNzg
	ycV2c8CEZBJHTCDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2CAAFci1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Zk2TXigx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750063854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/4amVyIfpjADX65ebEMO5hOWnVs7Lj7aXl/n8kGn2w=;
	b=2CAAFci1yPN/wPPx+9rxZcbaSfKV4pT3VM/+GjchMTHhnWagQomeFGblEVXte0RDn4xQgz
	l6u1VZZkcj8aOiIXaZjglO5Vjoo42zcTNscorxrEsXrU1OjT9OY5aI4f21CwtyYg8j5WcM
	KxZhJt1wzoUTO30X++3Xc1RRCmQnZT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750063854;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/4amVyIfpjADX65ebEMO5hOWnVs7Lj7aXl/n8kGn2w=;
	b=Zk2TXigxxjkMqaa0nhBK948HIqOrGvb7ArlIroeC011v+eSNuE+4PFQNjmkE1J9eqhYNzg
	ycV2c8CEZBJHTCDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88BD2139E2;
	Mon, 16 Jun 2025 08:50:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BBqwHu3aT2hXQQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 08:50:53 +0000
Date: Mon, 16 Jun 2025 10:50:43 +0200
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
Message-ID: <aE_a4_rGbMLJKBIs@localhost.localdomain>
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-4-osalvador@suse.de>
 <2bec8b53-f788-493e-a76e-1f804ed3aa0c@redhat.com>
 <aE_WG6bnjtLBzCp8@localhost.localdomain>
 <10c87a0e-c9fe-48fe-9bbd-16afd244b4ec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10c87a0e-c9fe-48fe-9bbd-16afd244b4ec@redhat.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 162A121203
X-Rspamd-Action: no action
X-Spam-Flag: NO
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,localhost.localdomain:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01
X-Spam-Level: 

On Mon, Jun 16, 2025 at 10:39:24AM +0200, David Hildenbrand wrote:
> It's suboptimal yes, But to get it right, you'd have to remmeber for exactly
> which notofiers you performed the calls ...

Yeah, definitely not straightforward.

> > I mean, yes, I guess we can put the burden on the users of
> > the notifiers to not assume anything, but then yes, I think we should document this
> > as it can lead to potential misbeliefs.
> 
> The burden is already on the users I think.

Yes, it's already on them, although I'm not sure if all of them are aware
though.
But anyway, let's just document it to have the ruleset clear.


-- 
Oscar Salvador
SUSE Labs
