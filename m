Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC5F267B7F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111207; cv=none; b=X2PMGzMAMDPtu3JBIWHjfooNPif5vUmdH50rUCdkk4VzGbwxJEuSYF9nfWLHkq2xRThhgnpt6oLBrsubiOMZFvQBVsVwRh7jUI/fgqgRE1YC67Tf6PcUWPYeMpHgXpfq3dNdgvH6sbYATeUelmzA9ickc7D1YLcywh5n1r5S4yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111207; c=relaxed/simple;
	bh=NBS68HJOrdL+OtNrsBLAN3A5gKCnV6vcjTUGWqJiqvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YT+B+0yeFba6MKIvTBE4YXlNJeI3Rb2uhkxjGEVVZL4bp5Ewkm3H9OsHo8/rd5kELiFQAS3c3U4uS0IPfLvDN61WTTfiqxLpEQX35i6PM5pkFMmOSr3uTsyFVrS/8/HjsAVx+XMN+1eM3qwMLMaWX3SafuSDXIlU6D9x2/tDD4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZjSNMmcp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uRaQTp4H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ou1eIImZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3NECoo1T; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZjSNMmcp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uRaQTp4H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ou1eIImZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3NECoo1T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5AC652111F;
	Tue,  8 Apr 2025 11:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744111203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2epGjcmKvJhQTpWKHhYmv8HYnIBJ+VqFT0VdqeNyqM=;
	b=ZjSNMmcpuKoFAbwrpTD/N3QE2g+JjQyjYIKW2DfBbLAYrGSq6bu5m3WA/bJqrDi1orIeqq
	3Kx4Rc1JcxDVETnH8lqcwsJUMIemXwcJEEmbWY+4qX3uKuTz3V7e5pv778QdMN1bB8pWCa
	FkG8hUaqN5aRJ/pKLNbtgtFzKpDtRDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744111203;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2epGjcmKvJhQTpWKHhYmv8HYnIBJ+VqFT0VdqeNyqM=;
	b=uRaQTp4HM1YiYFlOYbCX+gu+BBcd3TuO5em2xQbrxFM/F4mG3/Crwan046WPqnppAnqLsP
	qm/r1DVFdhuO4+DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ou1eIImZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3NECoo1T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744111202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2epGjcmKvJhQTpWKHhYmv8HYnIBJ+VqFT0VdqeNyqM=;
	b=ou1eIImZxqXvyBcPgJZLf+434L96g38FQ+GLqb/4KwM0udIIgD8hUm6TdDGDxjaMEMANqz
	zBxnO/2C8eEhfGUEOTr/HPL1+zM5sLYBvCZLSlSCa7/J5AkfVrOVp1W72qhai7TqFDeqw0
	ESKtF4CFbYm2RrFFM4BpoubtAuCk0o8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744111202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2epGjcmKvJhQTpWKHhYmv8HYnIBJ+VqFT0VdqeNyqM=;
	b=3NECoo1TAy+G1ykYMFG+aK1bPcYEl9VlHbzG03xzZ1pKPCk5/N38A75At/yLm869W7bc/Q
	ctG6CFKWguaUZVBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B56A13691;
	Tue,  8 Apr 2025 11:20:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rRlvEWIG9WdDCAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 08 Apr 2025 11:20:02 +0000
Date: Tue, 8 Apr 2025 13:20:01 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/18] nvmet-fcloop: allocate/free fcloop_lsreq
 directly
Message-ID: <3bca3fe4-3a1c-43f9-a0c2-96ab1887f3c8@flourine.local>
References: <20250318-nvmet-fcloop-v3-0-05fec0fc02f6@kernel.org>
 <20250318-nvmet-fcloop-v3-10-05fec0fc02f6@kernel.org>
 <603b438e-02f6-4f01-8ffa-12ab6ec8e745@suse.de>
 <984ea057-de15-472a-9be3-79594f6bfc00@flourine.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <984ea057-de15-472a-9be3-79594f6bfc00@flourine.local>
X-Rspamd-Queue-Id: 5AC652111F
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,flourine.local:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, Mar 18, 2025 at 02:58:35PM +0100, Daniel Wagner wrote:
> On Tue, Mar 18, 2025 at 12:17:11PM +0100, Hannes Reinecke wrote:
> > > +	tls_req = kmalloc(sizeof(*tls_req), GFP_KERNEL);
> > > +	if (!tls_req)
> > > +		return -ENOMEM;
> > 
> > This cries out for kmem_cache_alloc() ...
> 
> Okay, will switch to this API. FWIW, in the same call path there are
> more kmallocs.

This change send me down yet another rabbit hole because when
deallocatin the cache, it reported a leak caused by a list_add_tail(x,
y) vs list_add_tail(y,x) bug which I missed the last time...
