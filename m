Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0056221423F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786649; cv=none; b=P95XfkFKsg0gw15U9ALDWH/VG0DI2mwb/bVPIxJg2zLbK5UWn50oSoGa9xbaEkFEEdrcDWoUL42cXqkjs1C4SCw2/zBDo7qd3gg5fd6fyFwKri9IK+gCZBCTf2dQXnS9jgn9YFdHUMpZbjN4d3rADSCrw7wSMcnfI6xn1+gNqh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786649; c=relaxed/simple;
	bh=xE4OaP2qS1bIrkmed+eBjXcN49Q0yZ2cCth5OVNDDqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYGXjO4VwX9WjF+cKyO0hke1CJgb4Ovq/c5SM1x0TOzIzIsMZdlhKdiQpW02kRq5FoeKwe4fhZ62syo+IVFywCP2lvqnnb04W9Qw/5Tjf4teUKkYWuynm80+rkHe/OZDYO+aJC08ul1E0cho6kVu/r2UPhahEbk5LT3WmMOj/II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LV74hYsO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M3RlYC4Q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yLSGObCQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/Wzt9If9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LV74hYsO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M3RlYC4Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yLSGObCQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/Wzt9If9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7BA0E211A0;
	Wed, 16 Apr 2025 06:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744786645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WMDi4lqZaM/FLt6WWbi8dH1t67+7zfV34pSrKmymEOo=;
	b=LV74hYsOuKHt+xd8wgXDedAvbkHC/CaZXvOU5jUnmO2Uu5uD8JJdbXrh8m9bRgZ1LdWZcq
	waKpUVisPdlfvmDPFJloCuJ4mN/bwkwGMCRazqbsIrrZMSP8uedhIm87cfjI1HXGg9736e
	Vdl6AWh5x6YVfelSebh+vLAcrj47U/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744786645;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WMDi4lqZaM/FLt6WWbi8dH1t67+7zfV34pSrKmymEOo=;
	b=M3RlYC4QlTqqebPFUJXQqRXB5+53lX3tVI7XQWKv5BkL305wqslv+THoGKqatLtn7EL/PC
	D02XqqfYKxae44Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yLSGObCQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/Wzt9If9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744786644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WMDi4lqZaM/FLt6WWbi8dH1t67+7zfV34pSrKmymEOo=;
	b=yLSGObCQ8kOZ49aa3WhYvfUsS6EIDrbNHBGrDQW3K14QaYwWaKSCHEsXmlEeYdbf7kLuCj
	hGji9OmWllK298DcauoBcKPuW8I6fhxVAgnN3blM1BiOw9h7XkBRPN/QRkQ7fiG45Vvnb5
	nmtuWyUI8v/dmEfVOGkUygXTRpzZ7PQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744786644;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WMDi4lqZaM/FLt6WWbi8dH1t67+7zfV34pSrKmymEOo=;
	b=/Wzt9If9RTwj+WG8GtDuokUIFZl6IgsMxI1oTUE32Agxqxt3OteXPKXA9Gh19ebm90RtTA
	Q/LCHk2eepKZC+Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6429D13976;
	Wed, 16 Apr 2025 06:57:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gUIdGNRU/2ctQwAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 16 Apr 2025 06:57:24 +0000
Date: Wed, 16 Apr 2025 08:57:19 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>, 
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <22e48664-63f3-4cc0-8b99-f56e98204e5b@flourine.local>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com>
 <6f0d50b2-7a16-4298-8129-c3a0b1426d26@flourine.local>
 <20250416001738.GA78596-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416001738.GA78596-mkhalfella@purestorage.com>
X-Rspamd-Queue-Id: 7BA0E211A0
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,flourine.local:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, Apr 15, 2025 at 05:17:38PM -0700, Mohamed Khalfella wrote:
> Help me see this:
> 
> - nvme_failover_req() is the only place reqs are added to failover_list.
> - nvme_decide_disposition() returns FAILOVER only if req has REQ_NVME_MPATH set.
> 
> How/where do admin requests get REQ_NVME_MPATH set?

Admin commands don't set REQ_NVME_MPATH. This is what the current code
does and I have deliberately decided not to touch this with this RFC.

Given how much discussion the CQT/CCR feature triggers, I don't think
it's a good idea to add this topic to this discussion.

> > > - What about requests that do not go through nvme_failover_req(), like
> > >   passthrough requests, do we not want to hold these requests until it
> > >   is safe for them to be retried?
> > 
> > Pasthrough commands should fail immediately. Userland is in charge here,
> > not the kernel. At least this what should happen here.
> > 
> > > - In case of controller reset or delete if nvme_disable_ctrl()
> > >   successfully disables the controller, then we do not want to add
> > >   canceled requests to failover_list, right? Does this implementation
> > >   consider this case?
> > 
> > Not sure. I've tested a few things but I am pretty sure this RFC is far
> > from being complete.
> 
> I think it does not, and maybe it should honor this. Otherwise every
> controller reset/delete will end up holding requests unnecessarily.

Yes, this is one of the problems with the failover queue. It could be
solved by really starting to track the delay timeout for each commands.
But this is a lot of logic code and complexity. Thus during the
discussion at LSFMM everyone including me, said failover queue idea
should not be our first choice.
