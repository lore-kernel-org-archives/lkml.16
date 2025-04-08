Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35640268C5D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111752; cv=none; b=AkjusZd2+FT+wXmb+NywcdNAFB+4Hy7obLAwoHEMQEV9G5Hkrfu8M8ZWk5t9ZrT87YZXzbiDCffbaUMlpjF1n7/6siatYh+gGo+AN1JXesmSWmhc5GusV5wKatoE0uWPwX1rhVWpq6vZx+Y8dbL5TBzOYPC+A94lp08e5hNMGE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111752; c=relaxed/simple;
	bh=4yDrryX7DIFXUJXE2LWEqLb+VEEqHheQ/0UbdYFGY0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdzUqwW9IM/mDhxfyjqQ3wYuBaDtSUiA22vg2Ecx7BfH/H5pDmYsnMtim3kIB4qLBHlTgy3mAlXGiS1Fw1c7bmC2O1TvcVxDCugSmKm/lFIEgFMZSirP9wbXkJrFHjHdPZxEImrF+ac9ZRqidjS0GL7VnFn3WBirsrgTHJpqJ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J2YIx5i7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FP1naVRV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EAba3NfE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rsHQ/+EB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J2YIx5i7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FP1naVRV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EAba3NfE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rsHQ/+EB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 441131F388;
	Tue,  8 Apr 2025 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744111749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YZsH0za6jklr/PkNSqVbTqTi5EdWX2rZkbAX46UN7y0=;
	b=J2YIx5i7Jxfg8y0vi/Rq/fiV3tsYr1D2OIBd/cU1IiG6Us26ZiUBWztKRF4PPBsqeIXkeN
	+ZOUCaJN/J76iqijgBGjLPLQLV5krt4j1RjT255L1oJoaZLIg8FqUzGczKUfP84d4oFZCt
	uPL7ib9oDVju36vo56ry6EBGzWyDpE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744111749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YZsH0za6jklr/PkNSqVbTqTi5EdWX2rZkbAX46UN7y0=;
	b=FP1naVRVHRCPJ1/xY50HOB4EPsXGY3d/ZsMv2iXA/JGD9Pk+6yAdrCC8MG1tPBuRiarVNY
	5tGACizAxYJZZrAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EAba3NfE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="rsHQ/+EB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744111748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YZsH0za6jklr/PkNSqVbTqTi5EdWX2rZkbAX46UN7y0=;
	b=EAba3NfENmml5dz+Nql7oO6Q/7t1Vu4k0XBYf8EJ+52+/VMdHF+KbNDbLqo16gO//7aFjr
	wnBcXkn84AfvA/qYBQWuRSxEPVERGZdDKEmnNelhe5TMgGliWhaMTeu/+xC68/DxbgnOh7
	3vJ5M3lHqJK4/VOVkkbCH9Rs8VD0tg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744111748;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YZsH0za6jklr/PkNSqVbTqTi5EdWX2rZkbAX46UN7y0=;
	b=rsHQ/+EBSfbkjpO8M4YBg672OegaupMI8NJ+Z52RVXJJ+naUaYYrqANfDZNROMMTyngC02
	2V+kEheOomIoL/Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35B4513A1E;
	Tue,  8 Apr 2025 11:29:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fYQwDIQI9WdFCwAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 08 Apr 2025 11:29:08 +0000
Date: Tue, 8 Apr 2025 13:29:07 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 15/18] nvmet-fc: free pending reqs on tgtport
 unregister
Message-ID: <2436ed10-1da8-4090-8e3d-4ed485d6907e@flourine.local>
References: <20250318-nvmet-fcloop-v3-0-05fec0fc02f6@kernel.org>
 <20250318-nvmet-fcloop-v3-15-05fec0fc02f6@kernel.org>
 <20250321061903.GG3198@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321061903.GG3198@lst.de>
X-Rspamd-Queue-Id: 441131F388
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flourine.local:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Fri, Mar 21, 2025 at 07:19:03AM +0100, Christoph Hellwig wrote:
> On Tue, Mar 18, 2025 at 11:40:09AM +0100, Daniel Wagner wrote:
> > nvmet-fc: merge with f200af94ac9d ("nvmet-fc: free pending reqs on tgtport unregister")
> 
> What is this supposed to mean?

This a left over from my dev work.

> > +	for (;;) {
> > +		lsop = list_first_entry_or_null(&tgtport->ls_req_list,
> > +						struct nvmet_fc_ls_req_op,
> > +						lsreq_list);
> > +		if (!lsop)
> > +			break;
> 
> 	while ((lsop = list_first_entry_or_null(&tgtport->ls_req_list,
> 			struct nvmet_fc_ls_req_op, lsreq_list))) {
> 
> > +
> > +		list_del(&lsop->lsreq_list);
> 
> Another case where I'd really love to help the list_pop helper Linus
> flamed me for :(

Sure, will change these for(;;) loops into while() loops.

BTW, bcachefs seems to have it:

#define container_of_or_null(ptr, type, member)                         \
({                                                                      \
        typeof(ptr) _ptr = ptr;                                         \
        _ptr ? container_of(_ptr, type, member) : NULL;                 \
})

static inline struct list_head *list_pop(struct list_head *head)
{
        if (list_empty(head))
                return NULL;

        struct list_head *ret = head->next;
        list_del_init(ret);
        return ret;
}

#define list_pop_entry(head, type, member)              \
        container_of_or_null(list_pop(head), type, member)
