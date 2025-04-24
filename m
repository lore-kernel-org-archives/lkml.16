Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1565C214A91
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494373; cv=none; b=loAAN7oB7YIscCjXpAggcvbBEmJu1IpycUTgnd4FGF68TvccX30I5BoTF/aH89aMoYtIxif+QGB9luogL096KXcInD9JIFdJlqXBWQRvTJOyujwecFS3fraZhN5Imn1jdc/D+9QOAfNJOZ16LHPJwLW/2BdxNFxaFRYGjh5RDGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494373; c=relaxed/simple;
	bh=M0gwp0x6f9pVApAv2lYdxrPNizKHol1qhcpSCLHWbrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHy1zB5aaYCigZYMWy0zQEIX+O6KrEBitGwWuDHAWB61UuqhrGhXEu6H+C7cbtQT34wt9HLdao88NIlIJ2AmykojGrPgrXG7v9tynpwZ7c0eJ+QItOroSSRwi7w3xuyK9QHHogdsNbOgqDfarNbFOkl+UkGISGS0ziAflBmIEG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K2lVWxS4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1rfChyWe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K2lVWxS4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1rfChyWe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K2lVWxS4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1rfChyWe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K2lVWxS4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1rfChyWe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2039A1F452;
	Thu, 24 Apr 2025 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745494370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vY2fR86vwxaJL8mev8ZKItOGofuMn/aYR4r7fXiLEDQ=;
	b=K2lVWxS4Jst9GDo7hdDhId5aNOvNOj8Iq1whAwkATzxEzftpqMidJ3DDBk7IrbZCeRJgIU
	n+ZxxDuipXkl23UlaDjN0w0UddoW38Yl93GF+91WIoqBM5Y2lY6aouuZT/AgkXFZLrEoZ9
	Naz10Z027m2qZqYYv6APbyoaYusKN3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745494370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vY2fR86vwxaJL8mev8ZKItOGofuMn/aYR4r7fXiLEDQ=;
	b=1rfChyWeILfTopLYhU+YohmcXwM3FhuHyGcZceoR3gotPkREiIyiyxMN+r3ua2OTtp4Zwx
	400quaPpZoxrZnBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=K2lVWxS4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1rfChyWe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745494370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vY2fR86vwxaJL8mev8ZKItOGofuMn/aYR4r7fXiLEDQ=;
	b=K2lVWxS4Jst9GDo7hdDhId5aNOvNOj8Iq1whAwkATzxEzftpqMidJ3DDBk7IrbZCeRJgIU
	n+ZxxDuipXkl23UlaDjN0w0UddoW38Yl93GF+91WIoqBM5Y2lY6aouuZT/AgkXFZLrEoZ9
	Naz10Z027m2qZqYYv6APbyoaYusKN3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745494370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vY2fR86vwxaJL8mev8ZKItOGofuMn/aYR4r7fXiLEDQ=;
	b=1rfChyWeILfTopLYhU+YohmcXwM3FhuHyGcZceoR3gotPkREiIyiyxMN+r3ua2OTtp4Zwx
	400quaPpZoxrZnBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 023BF1393C;
	Thu, 24 Apr 2025 11:32:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eEGeOWEhCminPQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Thu, 24 Apr 2025 11:32:49 +0000
Date: Thu, 24 Apr 2025 13:32:49 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 08/14] nvmet-fcloop: prevent double port deletion
Message-ID: <54dc62a9-22f4-44a2-a1e6-b7e1b44f2d1a@flourine.local>
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
 <20250423-nvmet-fcloop-v5-8-3d7f968728a5@kernel.org>
 <10fec246-82a6-40bf-a522-ea3de7fa0624@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10fec246-82a6-40bf-a522-ea3de7fa0624@suse.de>
X-Rspamd-Queue-Id: 2039A1F452
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,flourine.local:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Thu, Apr 24, 2025 at 12:17:32PM +0200, Hannes Reinecke wrote:
> >   	struct fcloop_rport *rport = remoteport->private;
> > +	bool delete_port = true;
> >   	unsigned long flags;
> >   	flush_work(&rport->ls_work);
> >   	spin_lock_irqsave(&fcloop_lock, flags);
> > +	if (test_and_set_bit(PORT_DELETED, &rport->flags))
> > +		delete_port = false;
> >   	rport->nport->rport = NULL;
> >   	spin_unlock_irqrestore(&fcloop_lock, flags);
> > +	if (!delete_port)
> > +		return;
> > +
> 
> The double negation is hard to follow. Can't you
> rename it to 'put_port' or somesuch and invert the logic?

Yes, was also not really happy with it but didn't really come up with a
good name. Thanks!
