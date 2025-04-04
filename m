Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEB27DA7F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771244; cv=none; b=WwK/aNegsQRjn3jMU5qwKxLmFd5jqx8fH8vMT/tHaFcwA/weeospNwnlM3jqXMNQmgtZWvwMUcMHEAW+kmZHXYPCvRe/Gaac8H3UGkVNmH+kQ2oQyGirUF1te3UvuMGbseigIumU/++sHoKkqrVIFZgBc//nbU/39T4la3R8CRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771244; c=relaxed/simple;
	bh=MO1g84JHd6dGcmLMXY8Ea66pb02b0PTWLblfjxZIDxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dR2tFxrX8EFwmH6qJ5LlaFPZzKiFui0RGeHmKjWPMB1yH7WL4AZai8tc5aYApkKOzD1cab3h0MkO0VK8JgC7WarpGrF0Q0cCAOHfanvg96XOn6xb7y8DNWoVtJBwMRhMX9snF0bS8ztlPivnA46rPt1fdpCv1jAFuwyqgxFkB68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mpHfzesV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UuGB+zpX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mpHfzesV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UuGB+zpX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mpHfzesV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UuGB+zpX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mpHfzesV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UuGB+zpX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A215211C8;
	Fri,  4 Apr 2025 12:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743771240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5qbKrD0h+S0pJh/V1i4JkUn/lVc2CMhJrcitjKBTUiw=;
	b=mpHfzesVONj8GHap3OQH/01AVAmhXxRXyWIyGO1xYtdPRexIU2g9NnZyiN7rDZDrU/iWms
	YzzitzESBwk+AEGbty8B0tSdKRYU7U4Gqp5tR6OO/KWKR7FMx+rWMaNbobyoXOZO4jcJT/
	9EarQ9zFJ46D3L7lf6NsLoOkR7bu4kA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743771240;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5qbKrD0h+S0pJh/V1i4JkUn/lVc2CMhJrcitjKBTUiw=;
	b=UuGB+zpXixPX6SbQsrbINqUbfSvydyqgGp95Apo1tecmyuEhy4UyC4oDywRDsFTaZslUm5
	Pa4Qg4AH3Dd0e/BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743771240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5qbKrD0h+S0pJh/V1i4JkUn/lVc2CMhJrcitjKBTUiw=;
	b=mpHfzesVONj8GHap3OQH/01AVAmhXxRXyWIyGO1xYtdPRexIU2g9NnZyiN7rDZDrU/iWms
	YzzitzESBwk+AEGbty8B0tSdKRYU7U4Gqp5tR6OO/KWKR7FMx+rWMaNbobyoXOZO4jcJT/
	9EarQ9zFJ46D3L7lf6NsLoOkR7bu4kA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743771240;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5qbKrD0h+S0pJh/V1i4JkUn/lVc2CMhJrcitjKBTUiw=;
	b=UuGB+zpXixPX6SbQsrbINqUbfSvydyqgGp95Apo1tecmyuEhy4UyC4oDywRDsFTaZslUm5
	Pa4Qg4AH3Dd0e/BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46B4F13691;
	Fri,  4 Apr 2025 12:54:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Rrs5D2jW72coUQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Fri, 04 Apr 2025 12:54:00 +0000
Date: Fri, 4 Apr 2025 14:53:59 +0200
From: Daniel Wagner <dwagner@suse.de>
To: James Smart <jsmart2021@gmail.com>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/18] nvmet-fcloop: allocate/free fcloop_lsreq
 directly
Message-ID: <2a012944-576c-469e-965d-080d841d191d@flourine.local>
References: <20250318-nvmet-fcloop-v3-0-05fec0fc02f6@kernel.org>
 <20250318-nvmet-fcloop-v3-10-05fec0fc02f6@kernel.org>
 <4937c9f8-fbc7-46d4-a14f-262a0244f1f0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4937c9f8-fbc7-46d4-a14f-262a0244f1f0@gmail.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

Hi James,

On Wed, Mar 19, 2025 at 03:47:20PM -0700, James Smart wrote:
> On 3/18/2025 3:40 AM, Daniel Wagner wrote:
> > fcloop depends on the host or the target to allocate the fcloop_lsreq
> > object. This means that the lifetime of the fcloop_lsreq is tied to
> > either the host or the target. Consequently, the host or the target must
> > cooperate during shutdown.
> > 
> > Unfortunately, this approach does not work well when the target forces a
> > shutdown, as there are dependencies that are difficult to resolve in a
> > clean way.
> 
> ok - although I'm guessing you'll trading one set of problems for
> another.

Yes, there is no free lunch :)

So far I was able to deal with new problems. I've run the updated series
over night with the nasty blktest case where the target is constantly
removed and added back without any problems.

> > @@ -353,10 +354,13 @@ fcloop_h2t_ls_req(struct nvme_fc_local_port *localport,
> >   			struct nvme_fc_remote_port *remoteport,
> >   			struct nvmefc_ls_req *lsreq)
> >   {
> > -	struct fcloop_lsreq *tls_req = lsreq->private;
> >   	struct fcloop_rport *rport = remoteport->private;
> > +	struct fcloop_lsreq *tls_req;
> >   	int ret = 0;
> > +	tls_req = kmalloc(sizeof(*tls_req), GFP_KERNEL);
> > +	if (!tls_req)
> > +		return -ENOMEM;
> >   	tls_req->lsreq = lsreq;
> >   	INIT_LIST_HEAD(&tls_req->ls_list);
> > @@ -387,19 +391,23 @@ fcloop_h2t_xmt_ls_rsp(struct nvmet_fc_target_port *targetport,
> >   	struct nvme_fc_remote_port *remoteport = tport->remoteport;
> >   	struct fcloop_rport *rport;
> > +
> > +	if (!remoteport) {
> > +		kfree(tls_req);
> > +		return -ECONNREFUSED;
> > +	}
> > +
> don't do this - this is not a path the lldd would generate.

Ok, after looking at it again, I think I don't need it.

> 
> >   	memcpy(lsreq->rspaddr, lsrsp->rspbuf,
> >   		((lsreq->rsplen < lsrsp->rsplen) ?
> >   				lsreq->rsplen : lsrsp->rsplen));
> >   	lsrsp->done(lsrsp);
> 
> This done() call should always be made regardless of the remoteport
> presence.
> 
> instead, put the check here
> 
>         if (!remoteport) {
>             kfree(tls_req);
>             return 0;
>         }

Will do

> > @@ -475,18 +491,21 @@ fcloop_t2h_xmt_ls_rsp(struct nvme_fc_local_port *localport,
> >   	struct nvmet_fc_target_port *targetport = rport->targetport;
> >   	struct fcloop_tport *tport;
> > +	if (!targetport) {
> > +		kfree(tls_req);
> > +		return -ECONNREFUSED;
> > +	}
> > +
> 
> same here - don't do this - this is not a path the lldd would
> generate.

The early return and freeing tls_req is necessary. If the host doesn't
expect the error code, then fine. I'll remove it. The reason why we need
it is:

  The target port is gone. The target doesn't expect any response
  anymore and the ->done call is not valid because the resources have
  been freed by nvmet_fc_free_pending_reqs.

  We end up here from delete association exchange:
  nvmet_fc_xmt_disconnect_assoc sends a async request.

I am adding this as comment here.

Thanks for the review. Highly appreciated!
Daniel
