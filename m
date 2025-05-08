Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0534C1C5D59
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698810; cv=none; b=CH02hunaz1bgjGhOj3URnBubnM0tAk3bSCoPJqc23yeHuCWy9UTQFSJl8JqHkzCzoW9OdpUjvNUETJQWU7IGwG32inCIAj0bqC4fUWnZz/61hiv37OC8HpY3114BmkvXM/trPTE+VMzRngVv16RtbhI5DpAU0bQ46VkEU9qlJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698810; c=relaxed/simple;
	bh=9OFgkLwwQYyFgmgcN/DCjENMz0bPLUCBiHGhJdS/TZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvYKX5ressPTxp8jNWPa+ePdGC5pT8Xw+aWZg1ZXHgaBaYZ8uipKl/kj32vB6LFTjtvmQ86Or0lzd1AuBCf7RhVhDWq3gJra+XXW85l9Nuv3Cxvg9+smbzxFfdVhIoNNRyU4tzHIWmqPCWM9p1Zrbl9y9NqIn1ugMJwnuf7w82E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CgHnebkp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aJZl9/A/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CgHnebkp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aJZl9/A/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CgHnebkp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aJZl9/A/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CgHnebkp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aJZl9/A/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0F0D31F452;
	Thu,  8 May 2025 10:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746698807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2XZBC61pHArRi7h5c8bT0ngPckaZRAV64bLjA0KsKBA=;
	b=CgHnebkpMOqj3Wr2Ei2GbHvl5OyOCxnyKedTJt8gWaflco2MCYS5YDPIPcc5AkkjHBPPpz
	68II6zJzxQHI6qA05g37rOiF+C0tLcZdsRJNPowQyP8z0btXYwM/5YVt5aOAp+tlwdQg3C
	vWV7x6L99RrYHIzA4upxVmT8e54bOq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746698807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2XZBC61pHArRi7h5c8bT0ngPckaZRAV64bLjA0KsKBA=;
	b=aJZl9/A/0fxTusS6J6SsxYISvjp41x0XBqwtEn9fcE/C7P+zGgB60FPq2V0iNLgak1Q51B
	S/vT7dk4qPs2I1BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746698807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2XZBC61pHArRi7h5c8bT0ngPckaZRAV64bLjA0KsKBA=;
	b=CgHnebkpMOqj3Wr2Ei2GbHvl5OyOCxnyKedTJt8gWaflco2MCYS5YDPIPcc5AkkjHBPPpz
	68II6zJzxQHI6qA05g37rOiF+C0tLcZdsRJNPowQyP8z0btXYwM/5YVt5aOAp+tlwdQg3C
	vWV7x6L99RrYHIzA4upxVmT8e54bOq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746698807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2XZBC61pHArRi7h5c8bT0ngPckaZRAV64bLjA0KsKBA=;
	b=aJZl9/A/0fxTusS6J6SsxYISvjp41x0XBqwtEn9fcE/C7P+zGgB60FPq2V0iNLgak1Q51B
	S/vT7dk4qPs2I1BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E3D2913712;
	Thu,  8 May 2025 10:06:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zOBvNTaCHGjeewAAD6G6ig
	(envelope-from <dwagner@suse.de>); Thu, 08 May 2025 10:06:46 +0000
Date: Thu, 8 May 2025 12:06:46 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/14] nvmet-fcloop: track ref counts for nports
Message-ID: <a42eca0f-8a13-443e-a380-86609d88b4ee@flourine.local>
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
 <20250507-nvmet-fcloop-v6-1-ca02e16fb018@kernel.org>
 <4d262ac0-f27c-44d4-82c0-f50b31be606e@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d262ac0-f27c-44d4-82c0-f50b31be606e@suse.de>
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30

On Wed, May 07, 2025 at 03:50:30PM +0200, Hannes Reinecke wrote:
> > +	spin_lock_irqsave(&fcloop_lock, flags);
> > +	tport = __unlink_target_port(nport);
> >   	spin_unlock_irqrestore(&fcloop_lock, flags);
> > -	if (!nport)
> > -		return -ENOENT;
> > +	if (!tport) {
> > +		ret = -ENOENT;
> > +		goto out_nport_put;
> > +	}
> >   	ret = __targetport_unreg(nport, tport);
> 
> The lock needs to extend across both lookup and unlink,
> ie don't drop the lock in between.

No, this wont wor. There will be a nested lock in
nvmet_fc_unregister_targetport. The lock only protects the list
insert/delete/iterate operations not anything else.

FWIW, this is hasn't changed the unregister step was already done uside
the lock.

BTW, I've played with turning the spin lock into a mutex as there
doesn't seem to be any necessity to use a spin lock then we could in
theory keep the lock over the whole section but this is something I
would leave for the future.
