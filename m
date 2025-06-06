Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C8A2874FD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213102; cv=none; b=l4ME4Zh2Z7Qk5dpCQdvkxmmsf6iYM3zKJ8kaiwmBM2527m9AmFpcDa9CI04rrwQoCMDfejZLeIL6FnxVmxQaQ9eZKi1AxlwL1p17FQ/CxSDkd4Y1NQHV/VBRoAXEMvQsWhM/wiWhNUrN+K2sb0YchaqIWLtydDHODIJAHK/AvaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213102; c=relaxed/simple;
	bh=4Fvn74tNuC5PvD23cKgIks483iXBpQWxvcKayuZZlyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fG2jnsYcp5vcyWEWMCQ3sOIlqB/JmqDFDXYCD++7l+1ezWdSwDDmzshC9pU/Em94IDtD6j/EJVPptNZRPQa/czGCjYK/yGwqsciQwDF1QudTI5zZRhrDW5Ax1im26UnYROYUNzY9H1Bj7YoxJRE7vnukuKg6ICReiQzV1g/BuKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CWynOh08; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R3FcKnb1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CWynOh08; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R3FcKnb1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CWynOh08";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R3FcKnb1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CWynOh08";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R3FcKnb1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7403A21DB8;
	Fri,  6 Jun 2025 12:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749213098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZFBjHP0yQlB4Ntb3LxgelCg+C+4S/iiLHzEXOeCxmE=;
	b=CWynOh089i/FK+rgyRN5MJSyJQDC8IBSRyKG2T+zt5ie67bWJB8iFKpYWXIrOogyLYtqzx
	qGpC0su+ADfRAQvz7MBk33HBQ4EgqZff1tHTMR66vUY/6sSGPBKut3a7lgjtKvTQx6IHXF
	/Fcq6Wa2jcu9umgchm3ICIYuFA11Fvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749213098;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZFBjHP0yQlB4Ntb3LxgelCg+C+4S/iiLHzEXOeCxmE=;
	b=R3FcKnb1dwnVx3vNkKj8GViCfV79LiDAaw22EfDsJDDtyC57ztGgg+xhy4ybRd/xiYUMji
	IOtrxtvT7zBLf2AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CWynOh08;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R3FcKnb1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749213098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZFBjHP0yQlB4Ntb3LxgelCg+C+4S/iiLHzEXOeCxmE=;
	b=CWynOh089i/FK+rgyRN5MJSyJQDC8IBSRyKG2T+zt5ie67bWJB8iFKpYWXIrOogyLYtqzx
	qGpC0su+ADfRAQvz7MBk33HBQ4EgqZff1tHTMR66vUY/6sSGPBKut3a7lgjtKvTQx6IHXF
	/Fcq6Wa2jcu9umgchm3ICIYuFA11Fvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749213098;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZFBjHP0yQlB4Ntb3LxgelCg+C+4S/iiLHzEXOeCxmE=;
	b=R3FcKnb1dwnVx3vNkKj8GViCfV79LiDAaw22EfDsJDDtyC57ztGgg+xhy4ybRd/xiYUMji
	IOtrxtvT7zBLf2AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB43E1369F;
	Fri,  6 Jun 2025 12:31:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IGSqMqnfQmjaZAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 06 Jun 2025 12:31:37 +0000
Date: Fri, 6 Jun 2025 14:31:36 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10]
Message-ID: <aELfqFrdIiwRFQs2@localhost.localdomain>
References: <20250605142305.244465-1-osalvador@suse.de>
 <c4a96aa2-10ae-4dc1-abd8-be91f7e8b583@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4a96aa2-10ae-4dc1-abd8-be91f7e8b583@lucifer.local>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7403A21DB8
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	FREEMAIL_CC(0.00)[linux-foundation.org,redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01
X-Spam-Level: 

On Fri, Jun 06, 2025 at 12:30:42PM +0100, Lorenzo Stoakes wrote:
> Hi Oscar,
> 
> I don't have time to dig into what's broken here, but this series is breaking
> the mm-new build.
> 
> NODE_REMOVED_LAST_MEMORY for instance doesn't seem to be defined, but there's a
> bunch more errors.

Heh, I apologye, I assumed every config has MEMORY_HOTPLUG enabled.
(I'll walk on my knees all day long to make up for that!)

Fixup was posted this morning in 

https://lore.kernel.org/linux-mm/aEKdvc8IWgSXSF8Q@localhost.localdomain/T/#u

But we can drop the patchset for now as I'll have to respin a new
version including David's feedback.


-- 
Oscar Salvador
SUSE Labs
