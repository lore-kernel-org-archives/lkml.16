Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C6E24E00C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686752; cv=none; b=EIyZnvkErZv6MicdT+cEY+NcLeLHLTqoQ3ihNIO+ioD1lRSbIv0VtyuarQnO3RAASQfvRLl3wJxpSd9Agn1Mjep5x/KyvKvmWnM3dGrbmPSRATDt5wGuXosojOPHkCaAZ3ap35kZ89NCH5z4V+bSVjHUpHtUmpa6NEEAJh+Lwy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686752; c=relaxed/simple;
	bh=hkBlPiDPeUzOPJ7aPN9rgVflLfz6Y//z/CKhpFSMiXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sebqbNMnqZKL44ir20O9mFW/18ZyS6wRn9A7VYDEk+hOanpkvDPQaIqtw7XsSzhNROprQcz+xDJ9TTR2fYRHMMzw691uyGrv/I5XdEIcfZUWivHCSLzdxdLtQ1N04t9UfRB0onsRHEIWQCV15PxfUkHJVggd3ExAKy9pP9SEyek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R4RF6n/v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6sM1FTFA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R4RF6n/v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6sM1FTFA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R4RF6n/v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6sM1FTFA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R4RF6n/v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6sM1FTFA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 079181F38A;
	Thu,  3 Apr 2025 13:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743686749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrXwiMbjUIu9vc4AlIXwze08l1ErHWYbmIRvdf20zr8=;
	b=R4RF6n/vkcW//39vcdLeA5pmIXZCmPPoCWtg9ejfR7E76+BmuPhJzY3k7RbKEHRxjD9nXH
	y68mSgDgFDgK+wYey6Ci6qOPw5BixPqf6NQFEmy8v+l4j5uyOFBiHef8sw5j510ymNnacH
	lqdijfGo5NvvGUC2TCoS2LibwxRIOz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743686749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrXwiMbjUIu9vc4AlIXwze08l1ErHWYbmIRvdf20zr8=;
	b=6sM1FTFA5onYSDdZvH3BM/+YhYK1wa/D9ZRQobOT4syqKWvjlcK3dlWCTikUC5KITCqaEw
	Ro0ema/kLzTAr8AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="R4RF6n/v";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6sM1FTFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743686749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrXwiMbjUIu9vc4AlIXwze08l1ErHWYbmIRvdf20zr8=;
	b=R4RF6n/vkcW//39vcdLeA5pmIXZCmPPoCWtg9ejfR7E76+BmuPhJzY3k7RbKEHRxjD9nXH
	y68mSgDgFDgK+wYey6Ci6qOPw5BixPqf6NQFEmy8v+l4j5uyOFBiHef8sw5j510ymNnacH
	lqdijfGo5NvvGUC2TCoS2LibwxRIOz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743686749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrXwiMbjUIu9vc4AlIXwze08l1ErHWYbmIRvdf20zr8=;
	b=6sM1FTFA5onYSDdZvH3BM/+YhYK1wa/D9ZRQobOT4syqKWvjlcK3dlWCTikUC5KITCqaEw
	Ro0ema/kLzTAr8AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0E0E13A2C;
	Thu,  3 Apr 2025 13:25:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nsp7NFyM7meCQQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Thu, 03 Apr 2025 13:25:48 +0000
Date: Thu, 3 Apr 2025 15:25:48 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/18] nvmet-fcloop: add missing
 fcloop_callback_host_done
Message-ID: <4cb3543d-c3a3-4cf5-9615-ea13780b31d0@flourine.local>
References: <20250318-nvmet-fcloop-v3-0-05fec0fc02f6@kernel.org>
 <20250318-nvmet-fcloop-v3-8-05fec0fc02f6@kernel.org>
 <931e5618-f85c-43ed-96a2-696c23a57857@suse.de>
 <db31e99f-364a-49ce-b54f-b697e76eca11@flourine.local>
 <eb8ef257-72d0-43df-9e46-c6fb8b1dbb7c@flourine.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb8ef257-72d0-43df-9e46-c6fb8b1dbb7c@flourine.local>
X-Rspamd-Queue-Id: 079181F38A
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Wed, Apr 02, 2025 at 07:08:06PM +0200, Daniel Wagner wrote:
> > There is NULL pointer check in fcloop_call_host_done eventually. It is
> > in 'nvmet-fcloop: update refs on tfcp_req'. That hunk should be in this
> > patch though.
> 
> Looking again with fresh eyes. Patch #3 is adding ref counting to the
> lport. 'nvmet-fcloop: update refs on tfcp_req' (the patch before this
> one) adds the NULL check. Nothing will crash here. Actually, I've run
> into this crash when testing before the NULL check was there :)

After a bit more testing and a new KASAN report, it looks like yet
another life tracking for tfcp_req/fcpreq is a bit off. The whole
conditional free/put indicates a something is wrong IMO. Let me see if I
can resovle this a bit cleaner.
