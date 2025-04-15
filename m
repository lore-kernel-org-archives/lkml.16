Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081CB28469B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718727; cv=none; b=FtvB/LehUXPzGbg10TGiXO0NHU+uPb9/2kxN1lSmH/mFhCkWgIlaIIwm6jS0UTpm8aWYbkgbojqp3ufMcIN2at+mu2TJdSJsK6p9Bd4M1UvAw9B0R/gtbnf30N8eQPaG2vkwGyDnqFd3002HUK/vROPuRs2FdCLQevh16woIRsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718727; c=relaxed/simple;
	bh=WaEJ7Mm0YxxyYNYakbUNQEkV9dDxv5OXSxMVoq7gGLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbkOFoFbb850KAFOit/W8/BMXUbT1Jv59ALctuMRJoPfJhVuPm4sFcLpIeuqw4xtQxIIzhLGRO0ZZ35kU7SXsPNlO3qy6GBv6Criq/ZV30IxzlPkeJ7UmDhQyX9vVsb5tK94SSlb1PJPOO8OkS7BYgkJp0qQVLHlIjPMqysq/aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IWwljR+F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cewaL1RJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IWwljR+F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cewaL1RJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IWwljR+F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cewaL1RJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IWwljR+F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cewaL1RJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1D15321162;
	Tue, 15 Apr 2025 12:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744718724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+mCgPHzml+cG+IHXOvQdsMqGvOHFy+l1cnwHKlceKlk=;
	b=IWwljR+FdRRMMsl5HQ8hTIoG82tvyTjw+O33B87a2DVk4URPTZDlvxbF7+7yFQDeMo02is
	0M/LcQe6ADqCZXAhA5yPQHdan3zSC/6FLwt9vNEYBcJUVhqhP5BgF7i/wQLHcI9u0rBKc+
	mzNxl8tLJQcwoyg1e249tzxI+560wzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744718724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+mCgPHzml+cG+IHXOvQdsMqGvOHFy+l1cnwHKlceKlk=;
	b=cewaL1RJ39hOmDG1DVqh5M0tSuB3iQfj/f3XcVZy5Qvtwe2Sp4Y/gJDXbizh15cLJ7H8tH
	LS7Wg1V2X5/C9OAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IWwljR+F;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cewaL1RJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744718724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+mCgPHzml+cG+IHXOvQdsMqGvOHFy+l1cnwHKlceKlk=;
	b=IWwljR+FdRRMMsl5HQ8hTIoG82tvyTjw+O33B87a2DVk4URPTZDlvxbF7+7yFQDeMo02is
	0M/LcQe6ADqCZXAhA5yPQHdan3zSC/6FLwt9vNEYBcJUVhqhP5BgF7i/wQLHcI9u0rBKc+
	mzNxl8tLJQcwoyg1e249tzxI+560wzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744718724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+mCgPHzml+cG+IHXOvQdsMqGvOHFy+l1cnwHKlceKlk=;
	b=cewaL1RJ39hOmDG1DVqh5M0tSuB3iQfj/f3XcVZy5Qvtwe2Sp4Y/gJDXbizh15cLJ7H8tH
	LS7Wg1V2X5/C9OAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A333139A1;
	Tue, 15 Apr 2025 12:05:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EwKMAYRL/mfSCwAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 15 Apr 2025 12:05:24 +0000
Date: Tue, 15 Apr 2025 14:05:23 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>, 
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com, 
	Mohamed Khalfella <mkhalfella@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <97fd8c08-e5bb-4b4b-9ec0-0eea9af1da1d@flourine.local>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <7cb33ebe-2ff6-4c3a-82f0-c4ed547e8a25@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cb33ebe-2ff6-4c3a-82f0-c4ed547e8a25@linux.ibm.com>
X-Rspamd-Queue-Id: 1D15321162
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MISSING_XM_UA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Tue, Apr 01, 2025 at 07:02:11PM +0530, Nilay Shroff wrote:
 > -	kblockd_schedule_work(&ns->head->requeue_work);
> > +	spin_lock_irqsave(&ctrl->lock, flags);
> > +	list_add_tail(&req->queuelist, &ctrl->failover_list);
> > +	spin_unlock_irqrestore(&ctrl->lock, flags);
> > +
> 
> Why do we need to wait until error_recovery for scheduling failover?

This is where the delay is added to the processing. The failed requests
(timeout) are held back by the delay here and after the wait the are
immediately fall over

> Can't we schedule failover as soon as we get path error? Also can't
> we avoid failover_list? 

Then we have exactly what we have now. An failed request is rescheduled
to the next path immediately.
