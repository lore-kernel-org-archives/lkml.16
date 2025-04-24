Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9362F228CAD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495337; cv=none; b=jTHVPLrtr+GV3XoHoekbuPuAv87WCOkDiZn4hu6aehqOPP4RxbOn/xnNM1BF8QzLSLE68I71OdIqz4tjcaIGcnPxHz+bg9YurBtqYtwMQA9pcYJhF6ORK8dxZp767FqJTs2s6DMzC8Kzzvb+KH0j3pu1Lfmpl4jMR5F5Veec/WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495337; c=relaxed/simple;
	bh=/2d3pMNoqRqTcmizMeil+z0SCqz60gM3xfMnEE+QW7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HutCLasSa6I59Ao8OzvXIZsnCTQp6lIvbhjn9yIp0wZ3baPJh/7Nk7/DuaC1DP20y2SibYzEzWm1dK68yqvgIqfRxr9PylrY23eTYvCPQYSrNiJ7uLEnvrtQKYYxZkgiKjLBzuDZR2i9ulH3ybbFptL2xorUcDbnFd0BHn83i5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wSyWe2Cz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mbka+LAb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wSyWe2Cz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mbka+LAb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wSyWe2Cz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mbka+LAb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wSyWe2Cz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mbka+LAb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8312821187;
	Thu, 24 Apr 2025 11:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745495333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=642kJ82oQUCGe+oDaUnZ8xGsd2REFvEZPgvdPkU74UA=;
	b=wSyWe2CzFlLlpG9kmBchLfZv1XvfhnwmeJa9ZX1JUK4rbQPf6D+hZbTKtHeViULbhkBNk7
	kjrBuITHBRvuNybw7tXfvES5tkepATYVtRVKfZ3kgzsEMIPtdbZ1c2WQwHPCfnfK+okCzh
	f653epe14VW026e2wwbaFlqUpURFq3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745495333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=642kJ82oQUCGe+oDaUnZ8xGsd2REFvEZPgvdPkU74UA=;
	b=Mbka+LAb88zsxPKWvASUo7Vozs9yscltMx1nLaobolFPNQCgZXaK4cJV63Ry+rW9dC15Lf
	Ef+IgIrGe3z9G/DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wSyWe2Cz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Mbka+LAb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745495333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=642kJ82oQUCGe+oDaUnZ8xGsd2REFvEZPgvdPkU74UA=;
	b=wSyWe2CzFlLlpG9kmBchLfZv1XvfhnwmeJa9ZX1JUK4rbQPf6D+hZbTKtHeViULbhkBNk7
	kjrBuITHBRvuNybw7tXfvES5tkepATYVtRVKfZ3kgzsEMIPtdbZ1c2WQwHPCfnfK+okCzh
	f653epe14VW026e2wwbaFlqUpURFq3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745495333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=642kJ82oQUCGe+oDaUnZ8xGsd2REFvEZPgvdPkU74UA=;
	b=Mbka+LAb88zsxPKWvASUo7Vozs9yscltMx1nLaobolFPNQCgZXaK4cJV63Ry+rW9dC15Lf
	Ef+IgIrGe3z9G/DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68F5A1393C;
	Thu, 24 Apr 2025 11:48:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Nrw6FyUlCmgAQgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Thu, 24 Apr 2025 11:48:53 +0000
Date: Thu, 24 Apr 2025 13:48:52 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 10/14] nvmet-fcloop: don't wait for lport cleanup
Message-ID: <c1f207f3-6657-4803-90df-a059353ba6da@flourine.local>
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
 <20250423-nvmet-fcloop-v5-10-3d7f968728a5@kernel.org>
 <05ac9a81-66a9-4bbc-92e0-6ff47a6dc7ad@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05ac9a81-66a9-4bbc-92e0-6ff47a6dc7ad@suse.de>
X-Rspamd-Queue-Id: 8312821187
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,flourine.local:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Thu, Apr 24, 2025 at 12:21:09PM +0200, Hannes Reinecke wrote:
> > @@ -1776,7 +1763,7 @@ static void __exit fcloop_exit(void)
> >   		spin_unlock_irqrestore(&fcloop_lock, flags);
> > -		ret = __wait_localport_unreg(lport);
> > +		ret = __localport_unreg(lport);
> >   		if (ret)
> >   			pr_warn("%s: Failed deleting local port\n", __func__);
> > 
> And who is freeing the allocated fcloop_lsreq structures?

After a fcloop_lsreq is allocated it is put on either rport->ls_list or
tport->ls_list and later freed in fcloop_tport_lsrqst_work, resp.
fcloop_rport_lsrqst_work for the non-error case (or in the callbacks).

That means when the localport is unregistered successfully there are no
fcloop_lsreq around. The issue is what to do when __localport_unreq
returns an error.

This code could loop forever when the port_state is not in
FC_OBJSTATE_ONLINE when calling nvme_fc_unregister_localport(). This
should not happen (it did before this series) but now it shouldn't be
the case anymore. I suppose a pr_warn_once() and a sleep might be a good
idea to avoid a busy loop?
