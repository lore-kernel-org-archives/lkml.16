Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063DF17A305
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743751714; cv=none; b=CgwNaUoJskEpq89EMjDmHU7rSnY7raxc+eJqrEME/FXoeZ5Ya1cHcy/ertAiFlNS+mzSVcgkl/9lvMeb+YTQ9TJRB1owtLTaBd3V3XNjOqH7nK0OeWIp4RLVK3JESOkFSVXIzRs/eXUwenXzFy94kS+SFOEy/x2uMjUTbOlU4U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743751714; c=relaxed/simple;
	bh=ggjewFQoSIZKfoJiPHWiS0WzL+rzVWDwf3sNWFjHZuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1BTn16GPTa070ccM02KKiAMpXegD6eOc71eTiP768GtIDg8IRjd4m0+Yy+eOBY6uB0kPrcASu87YaXci9NSSPg9xY0+kC+nCfMhTLIgXNDke7Zqko7+mDhT8lcCtDifriJp3brya6bfRWcsjSWLLnPlkjO8VBhE1yPTd2nY3hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SEtEN9xg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V5bqmdA4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SEtEN9xg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V5bqmdA4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SEtEN9xg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V5bqmdA4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SEtEN9xg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V5bqmdA4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 106811F385;
	Fri,  4 Apr 2025 07:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743751711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RxTxuLvr0WylZ6HBAg3z3PJVoMXLBQ8Ce7WM9VGNuaY=;
	b=SEtEN9xgbiKdTilc8TM1Q1+zuOMXK1SmCLMsK7Ns3v8KNJy3sjjWLJ0+3W9u0CeU2OLoIb
	UArtwj97hkSsy4BPFIfRqg2f22ilXhKh0mIkvlm/lc7fhCcHQAO+imLK3m2d0hZ3LTSj6s
	RgMsjUYA9mVRwUD3Rt/QJ5OdMXUL7uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743751711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RxTxuLvr0WylZ6HBAg3z3PJVoMXLBQ8Ce7WM9VGNuaY=;
	b=V5bqmdA4dcEO0lBx2LwYEznp3XK24rTOQPnRXejLNzxr21KpZIQU6JgkIuhvO2wkYCWaMg
	hAl4yPc2gh5lbzDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SEtEN9xg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=V5bqmdA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743751711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RxTxuLvr0WylZ6HBAg3z3PJVoMXLBQ8Ce7WM9VGNuaY=;
	b=SEtEN9xgbiKdTilc8TM1Q1+zuOMXK1SmCLMsK7Ns3v8KNJy3sjjWLJ0+3W9u0CeU2OLoIb
	UArtwj97hkSsy4BPFIfRqg2f22ilXhKh0mIkvlm/lc7fhCcHQAO+imLK3m2d0hZ3LTSj6s
	RgMsjUYA9mVRwUD3Rt/QJ5OdMXUL7uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743751711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RxTxuLvr0WylZ6HBAg3z3PJVoMXLBQ8Ce7WM9VGNuaY=;
	b=V5bqmdA4dcEO0lBx2LwYEznp3XK24rTOQPnRXejLNzxr21KpZIQU6JgkIuhvO2wkYCWaMg
	hAl4yPc2gh5lbzDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8D2513691;
	Fri,  4 Apr 2025 07:28:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lblpNh6K72cbZQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Fri, 04 Apr 2025 07:28:30 +0000
Date: Fri, 4 Apr 2025 09:28:30 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/18] nvmet-fcloop: add missing
 fcloop_callback_host_done
Message-ID: <9aa2b97a-a353-401f-ae51-017a95580d72@flourine.local>
References: <20250318-nvmet-fcloop-v3-0-05fec0fc02f6@kernel.org>
 <20250318-nvmet-fcloop-v3-8-05fec0fc02f6@kernel.org>
 <931e5618-f85c-43ed-96a2-696c23a57857@suse.de>
 <db31e99f-364a-49ce-b54f-b697e76eca11@flourine.local>
 <eb8ef257-72d0-43df-9e46-c6fb8b1dbb7c@flourine.local>
 <4cb3543d-c3a3-4cf5-9615-ea13780b31d0@flourine.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cb3543d-c3a3-4cf5-9615-ea13780b31d0@flourine.local>
X-Rspamd-Queue-Id: 106811F385
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Thu, Apr 03, 2025 at 03:25:48PM +0200, Daniel Wagner wrote:
> On Wed, Apr 02, 2025 at 07:08:06PM +0200, Daniel Wagner wrote:
> > > There is NULL pointer check in fcloop_call_host_done eventually. It is
> > > in 'nvmet-fcloop: update refs on tfcp_req'. That hunk should be in this
> > > patch though.
> > 
> > Looking again with fresh eyes. Patch #3 is adding ref counting to the
> > lport. 'nvmet-fcloop: update refs on tfcp_req' (the patch before this
> > one) adds the NULL check. Nothing will crash here. Actually, I've run
> > into this crash when testing before the NULL check was there :)
> 
> After a bit more testing and a new KASAN report, it looks like yet
> another life tracking for tfcp_req/fcpreq is a bit off. The whole
> conditional free/put indicates a something is wrong IMO. Let me see if I
> can resovle this a bit cleaner.

I found the issue which caused KASAN being unhappy. There is a state
machine for the fcp request state (active/idle/completed/aborted) which
got out of sync. I didn't want to change everything at this stage just
for the sake of refactoring. The conditional frees are still there.
