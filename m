Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C14919A2A3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745493236; cv=none; b=Wm4Ut5IKiELAju17awRuxxl82p9QA2pfaTsNsttQd58Hnwo0US5NhkTBnT3d1DeRfdivOCZQ/2Jf1Ldh6jC22361e9w+F/Hwco6M/5VyfA1fO7oWeKpcv3pnD5wdrFvYRJiARyc13tb8OlhnhkIrPDICcvUEuyel4XE1uUqDrhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745493236; c=relaxed/simple;
	bh=aQ7AxajcWq6h4lyfxQzRgC74X5mJjKnJjkf87J0ciJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd48aspGdtUGQuycRZKkJOKeRW4wvsVuRoIVhHAzHKz2mF5EcE9oGxebkUxyqqZ8apGZRQWA2qW4RLxUZ5rxchhikmpLvhL8Wl9ra6/m+ZGtAmZrtaRVZICQrVyiIqBRo3/QAKoRxGH+0bHkRbiFobrzUGqyOyPqlufCOg+INTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QeONCUYQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZRgl3Wiv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QeONCUYQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZRgl3Wiv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QeONCUYQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZRgl3Wiv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QeONCUYQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZRgl3Wiv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2157521125;
	Thu, 24 Apr 2025 11:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745493233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i/K2W5ncqSvxvGO0gXZwnTTuYSRLi6Dm3a0SywDMhEQ=;
	b=QeONCUYQxIo3psidYLLYfgzG2yRpVA55gy9E8Ao1SjxfXW84hwnSrBKKjchZi1UUUtdIpG
	PUHCVTpWg0iyw++SXS9WGGVDyPYI/4+8WpBTxuPlcAEF2YHc0XLqHJuJ2HpZS4CiAQuBKR
	TdhRVmiF3l95H4kLjBiwrdKrPzfb0nI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745493233;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i/K2W5ncqSvxvGO0gXZwnTTuYSRLi6Dm3a0SywDMhEQ=;
	b=ZRgl3WivlM9PbiPVp7ZRwv58I12rxKQD3xHZrSi6rpE1jQPRqO00E/W6x7Pe/JP+2WtUJG
	QGpzz7UMpcF2fZCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745493233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i/K2W5ncqSvxvGO0gXZwnTTuYSRLi6Dm3a0SywDMhEQ=;
	b=QeONCUYQxIo3psidYLLYfgzG2yRpVA55gy9E8Ao1SjxfXW84hwnSrBKKjchZi1UUUtdIpG
	PUHCVTpWg0iyw++SXS9WGGVDyPYI/4+8WpBTxuPlcAEF2YHc0XLqHJuJ2HpZS4CiAQuBKR
	TdhRVmiF3l95H4kLjBiwrdKrPzfb0nI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745493233;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i/K2W5ncqSvxvGO0gXZwnTTuYSRLi6Dm3a0SywDMhEQ=;
	b=ZRgl3WivlM9PbiPVp7ZRwv58I12rxKQD3xHZrSi6rpE1jQPRqO00E/W6x7Pe/JP+2WtUJG
	QGpzz7UMpcF2fZCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05950139D0;
	Thu, 24 Apr 2025 11:13:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j42wOvAcCmguOAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Thu, 24 Apr 2025 11:13:52 +0000
Date: Thu, 24 Apr 2025 13:13:48 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/14] nvmet-fcloop: track ref counts for nports
Message-ID: <9d18c084-afd5-4bd7-8650-496b88584ed4@flourine.local>
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
 <20250423-nvmet-fcloop-v5-1-3d7f968728a5@kernel.org>
 <002aee76-9114-4029-85b3-aa04e8ef76ed@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <002aee76-9114-4029-85b3-aa04e8ef76ed@suse.de>
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -8.30
X-Spam-Flag: NO

On Thu, Apr 24, 2025 at 12:08:33PM +0200, Hannes Reinecke wrote:
> > +	nport = fcloop_nport_lookup(nodename, portname);
> > +	if (!nport)
> > +		return -ENOENT;
> > +	spin_lock_irqsave(&fcloop_lock, flags);
> > +	tport = __unlink_target_port(nport);
> >   	spin_unlock_irqrestore(&fcloop_lock, flags);
> Hmm. This now has a race condition; we're taking the lock
> during lokup, drop the lock, take the lock again, and unlink
> the port.
> Please do a __fcloop_nport_lookup() function which doesn't
> take a lock and avoid this race.

The lock is protecting the list iteration not the object itself. The
lookup function will increase the refcount, so it doesn't get freed
after the unlock. How is this racing?
