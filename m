Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7478F5E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494285; cv=none; b=WoHTbnbmCLN+kwrRSY4Bwo+U+eKJfGufJQmRsGbBl8gkx+0lSE1V8uB/NIxOirMua4RB1pcLAM8k2wByLQYnmjA4c7+qlq5wK6DBv57tolSsvSRP/C+OYw9OKCUIYslmbBRU2L4wHntSM0ooZ04Fl/vEb6KYDv8Bqfyw9LfqVyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494285; c=relaxed/simple;
	bh=h5DfUNV3qLh6DnkYh8nN28jMEOxrUK+rLFJnNuBPoN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3LQajTK/01AsZYOByLirEoU3JIynkcZtQqSnbqVFhpryDHVTLKq5WTbq2LfITPNuXds2+hdMZCaS6dyRWM1nLR11FqUFuDXJWclmf0mZrfa55IhW8mKdTCBqkwgSQyZmPJkgArgvQa4WONrXyE7IyalPLHUk+gtUWOG8VYToE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4E7FF1F452;
	Thu, 24 Apr 2025 11:31:22 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 319421393C;
	Thu, 24 Apr 2025 11:31:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PQi1CQohCmgwPQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Thu, 24 Apr 2025 11:31:22 +0000
Date: Thu, 24 Apr 2025 13:31:13 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/14] nvmet-fcloop: access fcpreq only when holding
 reqlock
Message-ID: <c86e1da9-0525-4b4a-a32e-03d60f78d8fb@flourine.local>
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
 <20250423-nvmet-fcloop-v5-7-3d7f968728a5@kernel.org>
 <9444ac93-b0f7-4198-ad0f-d8c950b5d0ec@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9444ac93-b0f7-4198-ad0f-d8c950b5d0ec@suse.de>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 4E7FF1F452
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

On Thu, Apr 24, 2025 at 12:15:20PM +0200, Hannes Reinecke wrote:
> > @@ -663,9 +667,10 @@ fcloop_fcp_abort_recv_work(struct work_struct *work)
> >   	unsigned long flags;
> >   	spin_lock_irqsave(&tfcp_req->reqlock, flags);
> > -	fcpreq = tfcp_req->fcpreq;
> >   	switch (tfcp_req->inistate) {
> >   	case INI_IO_ABORTED:
> > +		fcpreq = tfcp_req->fcpreq;
> > +		tfcp_req->fcpreq = NULL;
> >   		break;
> >   	case INI_IO_COMPLETED:
> >   		completed = true;
> > @@ -688,10 +693,6 @@ fcloop_fcp_abort_recv_work(struct work_struct *work)
> >   		nvmet_fc_rcv_fcp_abort(tfcp_req->tport->targetport,
> >   					&tfcp_req->tgt_fcp_req);
> > -	spin_lock_irqsave(&tfcp_req->reqlock, flags);
> > -	tfcp_req->fcpreq = NULL;
> > -	spin_unlock_irqrestore(&tfcp_req->reqlock, flags);
> > -
> What happens for INI_IO_COMPLETED?

The request was completed before the abort handler was running. Thus
nothing to do here.

> Don't we need to clear the 'fcpreq' pointer in that case, too?

The normal code path has already taken care of this request and the only
thing left to do is to give back the refcount on the tfcp_req to free
the memory.
