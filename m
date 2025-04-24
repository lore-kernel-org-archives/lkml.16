Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21781E22FC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745493424; cv=none; b=jHc07z101mde0TIw/B8PDXTM72qIPmEbpXjIrlPpqRG/nr8126b8PyKTdg9SnxuDvV94FpSGtiM27c5u2NMpsf7uQvGdbo1epOxxA84Lpsb26zAFdRL4BeA7++xwnoYMsPQ3Ec7GMfZFVlFTgxeV/arXoC+8+BST6PriUcceEmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745493424; c=relaxed/simple;
	bh=rN3a+r+F4cWlZfEv6k0ufewQddliyCSPmPGBw6orybU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McCJDpkDkDr31QiixsUHNf6p4lFg9M4ZCtrw8X3OWi0kFOol2AQLqugwU8vCQoPO4ihjevpL1/rP/SetcoI0mR8VIWgnsEkdz17T+fSW8HWiMhpnlAZNq4VMxRvDX344ZkGL2wkjQF7HUlJaykoTxpFoYQIbbjKT5K3lW7OCg/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qquh4YNp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FCc8tN1m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1OiekEMZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QhMbUUAC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qquh4YNp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FCc8tN1m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1OiekEMZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QhMbUUAC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D01F421125;
	Thu, 24 Apr 2025 11:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745493421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=INeTkgOjLN0k/r+yDqIW8EZ9muScBYK5kQVQV9iDXQw=;
	b=Qquh4YNpgV0bV9f0IxlCpUZbdvmAiRsyWsLtCoBNqVqW1wDNLQhffiqGN0rywCi59O6qZ4
	yQg8IreGtW6Q7W+N12mToj/LGPGyRiYvtMJgQnDajTm2Ot26hUgPwJjP92y6sj9aElYXYR
	yMzBHFm1kkFFdbEEm7CS5NFIsSuYS8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745493421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=INeTkgOjLN0k/r+yDqIW8EZ9muScBYK5kQVQV9iDXQw=;
	b=FCc8tN1m8rrCgPI1vFd0qb/JFaI2e0b04ExJS1M0Xwmc111dY2c//IjncmEFTCblqKbBgf
	xLSsRmlbfDcICBDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1OiekEMZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QhMbUUAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745493420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=INeTkgOjLN0k/r+yDqIW8EZ9muScBYK5kQVQV9iDXQw=;
	b=1OiekEMZK8RjqmQwWMPuhdIEsyPX+1+STSYlWFat+eIOp308AXKEAnxOC2N/AjWoda1Lyv
	zbz2PBNgszKzSrisIvKnm2uo3pHHEPmA12zMAHnnAeny0/lZdo1WuLIkYCB14gPPCUGeww
	hANpX5CO0NUimxBsouj1/i9TqJwUpVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745493420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=INeTkgOjLN0k/r+yDqIW8EZ9muScBYK5kQVQV9iDXQw=;
	b=QhMbUUACzZWpLIOalWiAMF5XC1rMUrCX4yo+n/TAnMtlpy1Sxv5plS68X47/wzzaBT+BUR
	ykk71evEPga5czAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B68D41393C;
	Thu, 24 Apr 2025 11:17:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ngsuKqwdCmgaOQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Thu, 24 Apr 2025 11:17:00 +0000
Date: Thu, 24 Apr 2025 13:16:52 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/14] nvmet-fcloop: refactor fcloop_delete_local_port
Message-ID: <80fd88ea-50e8-4692-ad15-c18cd45191dd@flourine.local>
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
 <20250423-nvmet-fcloop-v5-4-3d7f968728a5@kernel.org>
 <0c04b345-152b-4bbe-b9b7-7796211b8547@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c04b345-152b-4bbe-b9b7-7796211b8547@suse.de>
X-Rspamd-Queue-Id: D01F421125
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,flourine.local:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Thu, Apr 24, 2025 at 12:10:46PM +0200, Hannes Reinecke wrote:
> On 4/23/25 15:21, Daniel Wagner wrote:
> > Use the newly introduced fcloop_lport_lookup instead
> > of the open coded version.
> > 
> > Signed-off-by: Daniel Wagner <wagi@kernel.org>
> > ---
> >   drivers/nvme/target/fcloop.c | 30 +++++++++++++++---------------
> >   1 file changed, 15 insertions(+), 15 deletions(-)
> > 
> You could merge it with the previous patch, but I guess that's
> personal preference.

I've decided to split this out, so the previous patch is simpler to
read but I merge it if this is better.
