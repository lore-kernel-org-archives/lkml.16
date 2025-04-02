Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F242AEE9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743613690; cv=none; b=XkHz6R9ujPgmec+6ueyVwJibIrA/Ic4khPRsTUoDF+0s/AQMPpika5RKkfk62ywm/iA1gpZkqj6MCVDX2947wQ2DJjWu7PG5RcTdbrkOO7i2B6WfpafA1KUetttgAgpqtPpTaNzf1B6K4tR+MGL5+ToyVsxc3Vmaqn9CgH5LNmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743613690; c=relaxed/simple;
	bh=ozdB1JuP43sEG4aaAVApC9HiXghDl4Sec4c5MsIe/88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6f9MoQbvFSRRgk4uB2vmDefk9Jx1PWFuP9t777Ej8ubSqz6LZQ2oKqmOR9BJki0N8u/eOoTaf4Jvww0OjsASjNUS0TVe0NONFAdbVQJVZwrMDNZIegzbNqF7A3EognF4bCy5+RH/llHDRIwh3jXDxf0vJR+j2ifSjGxUY7KNl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T6pnDy7Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=neL9PqhZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T6pnDy7Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=neL9PqhZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T6pnDy7Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="neL9PqhZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T6pnDy7Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="neL9PqhZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 67EAE2116F;
	Wed,  2 Apr 2025 17:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743613687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6H3jGc2L+QTAKcPCJbHblvKv71VpQMMBZw0gUF0wOn8=;
	b=T6pnDy7QPG2EPhQdPk7z5q/lrutTp2k3XaNPksvq6DhI6MX3F53kxoNlVhzY8OTy+EY9dz
	pJ6oo32fGwmRnTYcMsTTsXvQb+bk8i0xpgPK3K3R0JFqsiM+Hv1DX0ilHzuABYNL+Cjuhz
	pdp8UL4EHvn7UfRYMr3ovaOvuoKRWKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743613687;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6H3jGc2L+QTAKcPCJbHblvKv71VpQMMBZw0gUF0wOn8=;
	b=neL9PqhZwdOQFjgL96KejjxPzGcD0iYFMTydjPZvL37o3W0NipeBkCvvRnFZWZ1Khvfp6W
	7P/Xi5dLXcqpzlDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743613687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6H3jGc2L+QTAKcPCJbHblvKv71VpQMMBZw0gUF0wOn8=;
	b=T6pnDy7QPG2EPhQdPk7z5q/lrutTp2k3XaNPksvq6DhI6MX3F53kxoNlVhzY8OTy+EY9dz
	pJ6oo32fGwmRnTYcMsTTsXvQb+bk8i0xpgPK3K3R0JFqsiM+Hv1DX0ilHzuABYNL+Cjuhz
	pdp8UL4EHvn7UfRYMr3ovaOvuoKRWKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743613687;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6H3jGc2L+QTAKcPCJbHblvKv71VpQMMBZw0gUF0wOn8=;
	b=neL9PqhZwdOQFjgL96KejjxPzGcD0iYFMTydjPZvL37o3W0NipeBkCvvRnFZWZ1Khvfp6W
	7P/Xi5dLXcqpzlDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B945137D4;
	Wed,  2 Apr 2025 17:08:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RooIEPdu7WefYAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 02 Apr 2025 17:08:07 +0000
Date: Wed, 2 Apr 2025 19:08:06 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/18] nvmet-fcloop: add missing
 fcloop_callback_host_done
Message-ID: <eb8ef257-72d0-43df-9e46-c6fb8b1dbb7c@flourine.local>
References: <20250318-nvmet-fcloop-v3-0-05fec0fc02f6@kernel.org>
 <20250318-nvmet-fcloop-v3-8-05fec0fc02f6@kernel.org>
 <931e5618-f85c-43ed-96a2-696c23a57857@suse.de>
 <db31e99f-364a-49ce-b54f-b697e76eca11@flourine.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db31e99f-364a-49ce-b54f-b697e76eca11@flourine.local>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
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
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, Mar 18, 2025 at 02:49:14PM +0100, Daniel Wagner wrote:
> On Tue, Mar 18, 2025 at 12:12:52PM +0100, Hannes Reinecke wrote:
> > On 3/18/25 11:40, Daniel Wagner wrote:
> > > Add the missing fcloop_call_host_done calls so that the caller
> > > frees resources when something goes wrong.
> > > 
> > > Signed-off-by: Daniel Wagner <wagi@kernel.org>
> > > ---
> > >   drivers/nvme/target/fcloop.c | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
> > > index cadf081e3653c641b0afcb0968fc74299ab941d1..de23f0bc5599b6f8dd5c3713dd38c952e6fdda28 100644
> > > --- a/drivers/nvme/target/fcloop.c
> > > +++ b/drivers/nvme/target/fcloop.c
> > > @@ -966,9 +966,11 @@ fcloop_fcp_abort(struct nvme_fc_local_port *localport,
> > >   	}
> > >   	spin_unlock(&inireq->inilock);
> > > -	if (!tfcp_req)
> > > +	if (!tfcp_req) {
> > >   		/* abort has already been called */
> > > +		fcloop_call_host_done(fcpreq, tfcp_req, -ECANCELED);
> > 
> > Am I misreading things or will fcloop_call_host_done() crash on a NULL
> > tfcp_req ?
> >
> > In patch 3 fcloop_tfcp_req_put() doesn't check for a NULL argument...
> 
> There is NULL pointer check in fcloop_call_host_done eventually. It is
> in 'nvmet-fcloop: update refs on tfcp_req'. That hunk should be in this
> patch though.

Looking again with fresh eyes. Patch #3 is adding ref counting to the
lport. 'nvmet-fcloop: update refs on tfcp_req' (the patch before this
one) adds the NULL check. Nothing will crash here. Actually, I've run
into this crash when testing before the NULL check was there :)
