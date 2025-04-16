Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B2422156C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803239; cv=none; b=hdq9BEaNV7lsrbTKqNkKc6PCz8wxdPU9fB4zqN10bhzLG/uaMUe9tWoJH8fr24doxsURnaqtgrUIZvjDErCGhjyqwJhXIt4cAcKWMOwDj+LiApkqzeNvqkTMoYmiMmxefajqNvtWDJsczo3uxqpaZRojX5uA0tn+UbPd5kjn/L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803239; c=relaxed/simple;
	bh=WpJOgo0pra6MnGVvIg+ITze0to+sYmNs9nCVI68piZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1ba+IZ3lja6Cl7OxG3E4IFb2/uoQYAB4hM4zRdW54OqyZ6iIJAkmO3qsYirq+hdMTZBeKXEBJCHLssBZPp+xjgYiP6js9IvzbQWe+XO2muH3qBDJEzT0OGvbYaScgBtM3/o4VBCOAF75cFLwU8APR/s3mG6LFGKIC65d1dpvYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FxCdb+jS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=umHP/Zrr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FxCdb+jS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=umHP/Zrr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FxCdb+jS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="umHP/Zrr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FxCdb+jS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="umHP/Zrr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9FF811F445;
	Wed, 16 Apr 2025 11:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744803235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hd9/9YS5gY8lCOJW4mVtCqgsUO1WX7XXGa/kAO8gBVU=;
	b=FxCdb+jSdWTeViWSOzmdu9P+Zkbw9Q5G/yXPG26pRUA9m7ReZc/d5memTDJw6xWr2Ikc1w
	tHeY1pmBeeIGmqt4PIxG7OV07Oi+CUi5GnzzwA8v+edtcNavvOydq/x+7dMUGrc5zE/lcR
	RDyvvZfaJD0XjTVqVON5MzpOQGAcAVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744803235;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hd9/9YS5gY8lCOJW4mVtCqgsUO1WX7XXGa/kAO8gBVU=;
	b=umHP/ZrrcOwUXG9TkVD1yHmUuF+llBJ46K6fSWD/Vygt1/50vxQ0WuzvYinwO4rI+2uJWs
	MSE05AFfaeOrI+Bg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FxCdb+jS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="umHP/Zrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744803235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hd9/9YS5gY8lCOJW4mVtCqgsUO1WX7XXGa/kAO8gBVU=;
	b=FxCdb+jSdWTeViWSOzmdu9P+Zkbw9Q5G/yXPG26pRUA9m7ReZc/d5memTDJw6xWr2Ikc1w
	tHeY1pmBeeIGmqt4PIxG7OV07Oi+CUi5GnzzwA8v+edtcNavvOydq/x+7dMUGrc5zE/lcR
	RDyvvZfaJD0XjTVqVON5MzpOQGAcAVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744803235;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hd9/9YS5gY8lCOJW4mVtCqgsUO1WX7XXGa/kAO8gBVU=;
	b=umHP/ZrrcOwUXG9TkVD1yHmUuF+llBJ46K6fSWD/Vygt1/50vxQ0WuzvYinwO4rI+2uJWs
	MSE05AFfaeOrI+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 908C013976;
	Wed, 16 Apr 2025 11:33:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h/VZIqOV/2fEGAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 16 Apr 2025 11:33:55 +0000
Date: Wed, 16 Apr 2025 13:33:55 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>, 
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <3b4df14e-4008-40d8-b185-5c81a7acc7e2@flourine.local>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250416002324.GB78596-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416002324.GB78596-mkhalfella@purestorage.com>
X-Rspamd-Queue-Id: 9FF811F445
X-Spam-Score: -4.51
X-Rspamd-Action: no action
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
	RCPT_COUNT_SEVEN(0.00)[10];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, Apr 15, 2025 at 05:23:24PM -0700, Mohamed Khalfella wrote:
> > -	nvme_req(req)->status = 0;
> > -	nvme_end_req(req);
> > -	kblockd_schedule_work(&ns->head->requeue_work);
> > +	spin_lock_irqsave(&ctrl->lock, flags);
> > +	list_add_tail(&req->queuelist, &ctrl->failover_list);
> > +	spin_unlock_irqrestore(&ctrl->lock, flags);
> > +
> 
> In case the delay in nvme_schedule_failover() is larget than request
> timeout, is it possible for timeout callback to be called while a
> request is sitting in failover_list?

Yes this can happen.

> Is there any guarantee to prevent this from happening? I understand from
> the patch that we do not want this to happen, right?

As already said, I think with failover queue we need to handle timeouts
on command basis.
