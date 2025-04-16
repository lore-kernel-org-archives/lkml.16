Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7FD8494
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793510; cv=none; b=QWXJBLw513NigQMIdxSCNAbmCaE9lYlUkiUOXh/ZP2bW1UFGYoCQD2JIZKqKVIZyOOyw7ZjBNUgPOTSATCtuXKKg50JnaxmI1I8BhCpTIAi1aQb+nicMBrGiwgHL0ibd3HwvTXHl1dfJmT2YlweIPX8tPEovPn8PIoRAtsh9NJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793510; c=relaxed/simple;
	bh=FheX7qpcmD6GezfKRhXQIqzqf2UiIieVOikX/XJIfdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMV3Q7M4/uigSo28d/egpCVoi2Q4os1PQylwMcVdgHdSet+a6I4m4QcN9ejXnz7r6xy496Jz0WzXdxMS4Kn8VdSkIEepH6GCcIdnFDoPdQY5D+qfejv3eK2ppahRrqq+XoOcinPe6L1MvQqVrZ0Q2i3H1Oq6vSOgyN0dnWEPUE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e65+senm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vKSdgsB2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e65+senm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vKSdgsB2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e65+senm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vKSdgsB2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e65+senm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vKSdgsB2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D7BF821169;
	Wed, 16 Apr 2025 08:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744793506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1+XSbUfXn5ZdDRkNFT1LgJRmJGayzOgZM0KU9m+rrH8=;
	b=e65+senm7ojY4sp8ZGE4XD79fqsK6ZnFQj+DKhzWK/W51AEECb6ady49T+dUdWIXhe1uwW
	CKFK4OLzwau0Y39sq1St0N792zl7Ms2vg7pSxUQG+2DnwN9M+nfKJixO59T4TrKe22m7HM
	ZCqBmp8M0uOipJlMkMld96HAFsuzCHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744793506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1+XSbUfXn5ZdDRkNFT1LgJRmJGayzOgZM0KU9m+rrH8=;
	b=vKSdgsB2QxnL/V+8JltcjqTosdGXdjg7vxYm/nTdJkXCX6Qm1mM18VQNMs2k+1TGAo1f5u
	rdXyOaMfBC7CilBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744793506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1+XSbUfXn5ZdDRkNFT1LgJRmJGayzOgZM0KU9m+rrH8=;
	b=e65+senm7ojY4sp8ZGE4XD79fqsK6ZnFQj+DKhzWK/W51AEECb6ady49T+dUdWIXhe1uwW
	CKFK4OLzwau0Y39sq1St0N792zl7Ms2vg7pSxUQG+2DnwN9M+nfKJixO59T4TrKe22m7HM
	ZCqBmp8M0uOipJlMkMld96HAFsuzCHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744793506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1+XSbUfXn5ZdDRkNFT1LgJRmJGayzOgZM0KU9m+rrH8=;
	b=vKSdgsB2QxnL/V+8JltcjqTosdGXdjg7vxYm/nTdJkXCX6Qm1mM18VQNMs2k+1TGAo1f5u
	rdXyOaMfBC7CilBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C54C513976;
	Wed, 16 Apr 2025 08:51:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0fsvL6Jv/2cEZwAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 16 Apr 2025 08:51:46 +0000
Date: Wed, 16 Apr 2025 10:51:38 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>, 
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com, 
	Mohamed Khalfella <mkhalfella@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <12892dbf-9cdc-48c3-a67d-0c626d54100a@flourine.local>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <94ec166a-2025-4743-8e36-fd1e96c33d6e@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94ec166a-2025-4743-8e36-fd1e96c33d6e@grimberg.me>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, Apr 14, 2025 at 01:03:57AM +0300, Sagi Grimberg wrote:
> > --- a/drivers/nvme/host/core.c
> > +++ b/drivers/nvme/host/core.c
> > @@ -239,6 +239,7 @@ static void nvme_do_delete_ctrl(struct nvme_ctrl *ctrl)
> >   	flush_work(&ctrl->reset_work);
> >   	nvme_stop_ctrl(ctrl);
> > +	nvme_flush_failover(ctrl);
> 
> This will terminate all pending failvoer commands - this is the intended
> behavior?

Yes it will, I don't think so. From the feedback I gather so far, it
seems the correct way (spec) is to handle each command individually.

FWIW, we are shipping

  https://lore.kernel.org/linux-nvme/20230908100049.80809-3-hare@suse.de/

as stop-gap solution for a while and our customer wasn't able to
reproduce the ghost writes anymore. And as far I can tell it does also
failover all pending commands.

> 
> >   	nvme_remove_namespaces(ctrl);
> >   	ctrl->ops->delete_ctrl(ctrl);
> >   	nvme_uninit_ctrl(ctrl);
> > @@ -1310,6 +1311,19 @@ static void nvme_queue_keep_alive_work(struct nvme_ctrl *ctrl)
> >   	queue_delayed_work(nvme_wq, &ctrl->ka_work, delay);
> >   }
> > +void nvme_schedule_failover(struct nvme_ctrl *ctrl)
> > +{
> > +	unsigned long delay;
> > +
> > +	if (ctrl->cqt)
> > +		delay = msecs_to_jiffies(ctrl->cqt);
> > +	else
> > +		delay = ctrl->kato * HZ;
> 
> This delay was there before?

No, this is function returns the additional time the host should wait
for it starts to failover. So this is the CQT value, after the KATO
timeout protocol and this timeout is not present in the nvme subsystem.

> >   void nvme_failover_req(struct request *req)
> >   {
> >   	struct nvme_ns *ns = req->q->queuedata;
> > +	struct nvme_ctrl *ctrl = nvme_req(req)->ctrl;
> >   	u16 status = nvme_req(req)->status & NVME_SCT_SC_MASK;
> >   	unsigned long flags;
> >   	struct bio *bio;
> > +	enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
> >   	nvme_mpath_clear_current_path(ns);
> > @@ -121,9 +123,53 @@ void nvme_failover_req(struct request *req)
> >   	blk_steal_bios(&ns->head->requeue_list, req);
> >   	spin_unlock_irqrestore(&ns->head->requeue_lock, flags);
> > -	nvme_req(req)->status = 0;
> > -	nvme_end_req(req);
> > -	kblockd_schedule_work(&ns->head->requeue_work);
> > +	spin_lock_irqsave(&ctrl->lock, flags);
> > +	list_add_tail(&req->queuelist, &ctrl->failover_list);
> > +	spin_unlock_irqrestore(&ctrl->lock, flags);
> 
> So these request - which we stripped their bios, are now placed
> on a failover queue?

Yes, this is the idea.

> > +
> > +	if (state == NVME_CTRL_DELETING) {
> > +		/*
> > +		 * request which fail over in the DELETING state were
> > +		 * canceled and blk_mq_tagset_wait_completed_request will
> > +		 * block until they have been proceed. Though
> > +		 * nvme_failover_work is already stopped. Thus schedule
> > +		 * a failover; it's still necessary to delay these commands
> > +		 * by CQT.
> > +		 */
> > +		nvme_schedule_failover(ctrl);
> 
> This condition is unclear. Isn't any request failing over should do this?
> Something is unclear here.

Ye, the comment is not very clear. Sorry about that. I observed that
blk_mq_tagset_wait_completed_request would block when the controller was
already in DELETING state and request were canceled, IIRC. The commands
would be queued on the failover queue but never processed
nvme_failover_work.

> > +	nvme_schedule_failover(&ctrl->ctrl);
> >   	nvme_rdma_teardown_io_queues(ctrl, shutdown);
> >   	nvme_quiesce_admin_queue(&ctrl->ctrl);
> >   	nvme_disable_ctrl(&ctrl->ctrl, shutdown);
> > diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> > index d0023bcfd8a79a193adf2807a24481c8c164a174..3a6c1d3febaf233996e4dcf684793327b5d1412f 100644
> > --- a/drivers/nvme/host/tcp.c
> > +++ b/drivers/nvme/host/tcp.c
> > @@ -2345,6 +2345,7 @@ static void nvme_tcp_error_recovery_work(struct work_struct *work)
> >   	nvme_stop_keep_alive(ctrl);
> >   	flush_work(&ctrl->async_event_work);
> > +	nvme_schedule_failover(ctrl);
> >   	nvme_tcp_teardown_io_queues(ctrl, false);
> >   	/* unquiesce to fail fast pending requests */
> >   	nvme_unquiesce_io_queues(ctrl);
> > 
> 
> What is the reason for rdma and tcp not being identical?

Sorry, can't remember. But I really want to start moving this code into
one place.
