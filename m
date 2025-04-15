Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2FA2957DE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719472; cv=none; b=J+HmgCPJM7rsatZfhXPnwS7sJpZtKQlPAeUOpJ2biu7bJlJpO12IMz96xFDpIWgVWEIoy4P/IvH1GUsrNBQf5Pna21j83iXpk1nV25RgCZQpVNM32HDLQXDoujPh4vrzASl716KsCh9WdqXVZ8dBaH3xxNty6ExDDWnWd4X4TKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719472; c=relaxed/simple;
	bh=GlbipjX8moNaKfjxSagL1s+fPkMJxL7Ij1ddY9gIc54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okjcMarlsrp5zXryPbs/qvPJiTR631XMnMU7o6OuYtZB55CWEBp+fuOsNaYkv/U29Cp+1jh2X6X8/CnCG8tuwFZEt9G2ldvUurtOw9LbSjhamupZD/4wyaYaep7fRB/ZWbHWVS5Cs3NKSkuGK0U9Cw2zA+KrFRZZBFZXBr2PZzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pcZtyyv1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MsQu9Ubc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pcZtyyv1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MsQu9Ubc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pcZtyyv1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MsQu9Ubc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pcZtyyv1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MsQu9Ubc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F4E521164;
	Tue, 15 Apr 2025 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744719469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KdtTOVJISIQ4Cl0YjSVZGn4hwArezCxw33TLu9csL+U=;
	b=pcZtyyv1IkEmlJ6MZ92KESNTPSpgaagpjsggIEpvJwdQ0MFRAOP9O/LVXUaAAIbOlAOPjT
	k9Eoiq4vuq9rUUE/GvwrRPo04BqPdv8VU+X0R7xhOL7O6JnFJvMPPMHcmDU/oFTofpflHC
	oL0QVETVSz612gKzFivEZtQTP8zkWqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744719469;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KdtTOVJISIQ4Cl0YjSVZGn4hwArezCxw33TLu9csL+U=;
	b=MsQu9UbcRAdvyYphHi+IkI3Y/9IRx6UIHs53TdaRQAavSlRUaIk/VrSelGBMJdpjjpVzfi
	PdqBDorfMnm38xDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744719469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KdtTOVJISIQ4Cl0YjSVZGn4hwArezCxw33TLu9csL+U=;
	b=pcZtyyv1IkEmlJ6MZ92KESNTPSpgaagpjsggIEpvJwdQ0MFRAOP9O/LVXUaAAIbOlAOPjT
	k9Eoiq4vuq9rUUE/GvwrRPo04BqPdv8VU+X0R7xhOL7O6JnFJvMPPMHcmDU/oFTofpflHC
	oL0QVETVSz612gKzFivEZtQTP8zkWqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744719469;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KdtTOVJISIQ4Cl0YjSVZGn4hwArezCxw33TLu9csL+U=;
	b=MsQu9UbcRAdvyYphHi+IkI3Y/9IRx6UIHs53TdaRQAavSlRUaIk/VrSelGBMJdpjjpVzfi
	PdqBDorfMnm38xDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21972139A1;
	Tue, 15 Apr 2025 12:17:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5/NLB21O/melDwAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 15 Apr 2025 12:17:49 +0000
Date: Tue, 15 Apr 2025 14:17:48 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>, 
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <6f0d50b2-7a16-4298-8129-c3a0b1426d26@flourine.local>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410085137.GE1868505-mkhalfella@purestorage.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[flourine.local:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Apr 10, 2025 at 01:51:37AM -0700, Mohamed Khalfella wrote:
> > +void nvme_schedule_failover(struct nvme_ctrl *ctrl)
> > +{
> > +	unsigned long delay;
> > +
> > +	if (ctrl->cqt)
> > +		delay = msecs_to_jiffies(ctrl->cqt);
> > +	else
> > +		delay = ctrl->kato * HZ;
> 
> I thought that delay = m * ctrl->kato + ctrl->cqt
> where m = ctrl->ctratt & NVME_CTRL_ATTR_TBKAS ? 3 : 2
> no?

The failover schedule delay is the additional amount of time we have to
wait for the target to cleanup (CQT). If the CTQ is not valid I thought
the spec said to wait for a KATO. Possible I got that wrong.

The factor 3 or 2 is relavant for the timeout value for the KATO command
we schedule. The failover schedule timeout is ontop of the command
timeout value.

> > --- a/drivers/nvme/host/multipath.c
> > +++ b/drivers/nvme/host/multipath.c
> > @@ -86,9 +86,11 @@ void nvme_mpath_start_freeze(struct nvme_subsystem *subsys)
> >  void nvme_failover_req(struct request *req)
> >  {
> >  	struct nvme_ns *ns = req->q->queuedata;
> > +	struct nvme_ctrl *ctrl = nvme_req(req)->ctrl;
> >  	u16 status = nvme_req(req)->status & NVME_SCT_SC_MASK;
> >  	unsigned long flags;
> >  	struct bio *bio;
> > +	enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
> >  
> >  	nvme_mpath_clear_current_path(ns);
> >  
> > @@ -121,9 +123,53 @@ void nvme_failover_req(struct request *req)
> >  	blk_steal_bios(&ns->head->requeue_list, req);
> >  	spin_unlock_irqrestore(&ns->head->requeue_lock, flags);
> >  
> > -	nvme_req(req)->status = 0;
> > -	nvme_end_req(req);
> > -	kblockd_schedule_work(&ns->head->requeue_work);
> > +	spin_lock_irqsave(&ctrl->lock, flags);
> > +	list_add_tail(&req->queuelist, &ctrl->failover_list);
> > +	spin_unlock_irqrestore(&ctrl->lock, flags);
> 
> I see this is the only place where held requests are added to
> failover_list.
> 
> - Will this hold admin requests in failover_list?

Yes.

> - What about requests that do not go through nvme_failover_req(), like
>   passthrough requests, do we not want to hold these requests until it
>   is safe for them to be retried?

Pasthrough commands should fail immediately. Userland is in charge here,
not the kernel. At least this what should happen here.

> - In case of controller reset or delete if nvme_disable_ctrl()
>   successfully disables the controller, then we do not want to add
>   canceled requests to failover_list, right? Does this implementation
>   consider this case?

Not sure. I've tested a few things but I am pretty sure this RFC is far
from being complete.
