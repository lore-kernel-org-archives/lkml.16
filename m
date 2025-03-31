Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46FF214228
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434827; cv=none; b=O3aV1YTJBzG0ubu2GhVzw+/mBRaPFRRGJ1tZd1i90NFkbA0E5yXNW7i/+WKrbS0t4PLPEaPuMOdBYgud4JupWiP69Ov6AEL2lUvLYH0Ah7XOYboi3Z0XaLHyyn/RIh76JbKdq4K8yfUun+J28N1GvazJvLTIl0dOVu3+PP1/Z7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434827; c=relaxed/simple;
	bh=XZVhDaAbSWOhuHkFG6pSknas5KywrNraRFIzSsDs2lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tyjnc/FrY0/JUpKjbruU9xxstLKuBgwlWKL8bbF5WEVTNn6Cf09kHh0UR/sSGDJAACCkN4WzNcf1ZBLrzK/xM2Dswge4bMPbI28hiul+URG70Qw46mh4f4V2frGnenadT16rhdJQO4fyq17en2Ws0zSHFMQd4mChOCXspFsCMeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PG1R0xZB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZVSaERfW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PG1R0xZB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZVSaERfW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PG1R0xZB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZVSaERfW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PG1R0xZB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZVSaERfW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 900AD1F452;
	Mon, 31 Mar 2025 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743434823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HMmFCsqLjK22XQFPm+Ppg3nveLJ+YQdxYvvixpi6H1s=;
	b=PG1R0xZB4srxpCoyuH2P41oVFOJsjMmPoaQPknpS8bJWB4wn8Qli+H9X+gSO/zmrk6TpnG
	gdxcxHlmpf5mER4nOUpiMFbcBgqY4/QJi8fKU2J2LKoVkP+qx3KzzPgE2e3+PBZmjs/SKy
	ccaeIZoGWxywORZOsbDM9fXt3cMrDg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743434823;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HMmFCsqLjK22XQFPm+Ppg3nveLJ+YQdxYvvixpi6H1s=;
	b=ZVSaERfW5JJCTJi7/qkZABWr/oHYliNOrFrxThZKR14OsGj5eZLKkMGqzP1GUzLNY0z1Kc
	Og+3SYCiVnwFHEAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PG1R0xZB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZVSaERfW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743434823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HMmFCsqLjK22XQFPm+Ppg3nveLJ+YQdxYvvixpi6H1s=;
	b=PG1R0xZB4srxpCoyuH2P41oVFOJsjMmPoaQPknpS8bJWB4wn8Qli+H9X+gSO/zmrk6TpnG
	gdxcxHlmpf5mER4nOUpiMFbcBgqY4/QJi8fKU2J2LKoVkP+qx3KzzPgE2e3+PBZmjs/SKy
	ccaeIZoGWxywORZOsbDM9fXt3cMrDg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743434823;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HMmFCsqLjK22XQFPm+Ppg3nveLJ+YQdxYvvixpi6H1s=;
	b=ZVSaERfW5JJCTJi7/qkZABWr/oHYliNOrFrxThZKR14OsGj5eZLKkMGqzP1GUzLNY0z1Kc
	Og+3SYCiVnwFHEAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11AC513A1F;
	Mon, 31 Mar 2025 15:27:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kmiKAEe06mc7SwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 31 Mar 2025 15:27:03 +0000
Date: Mon, 31 Mar 2025 16:26:56 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.15] mm/vma: add give_up_on_oom option on modify/merge,
 use in uffd release
Message-ID: <sniaixyko3mirqm3hdnyrm56sge6bzuhyyq2o4dtmwxykifs7k@dqwlk6qlj2d7>
References: <20250321100937.46634-1-lorenzo.stoakes@oracle.com>
 <1f9436a5-65e4-4027-a22d-9e5500e34dba@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f9436a5-65e4-4027-a22d-9e5500e34dba@lucifer.local>
X-Rspamd-Queue-Id: 900AD1F452
X-Spam-Level: 
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,oracle.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,appspotmail.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Flag: NO

On Mon, Mar 31, 2025 at 04:10:41PM +0100, Lorenzo Stoakes wrote:
> I know that none of us love this, but seemed to be consensus that this was
> a viable, if semi-vom-inducing solution - can we go ahead with this?

/me barfs

> Would appreciate ack's (even if queasy) if so, so this doesn't get
> stalled. We can always revisit this (in fact, it's on my list...).
> 
> On Fri, Mar 21, 2025 at 10:09:37AM +0000, Lorenzo Stoakes wrote:
> > Currently, if a VMA merge fails due to an OOM condition arising on commit
> > merge or a failure to duplicate anon_vma's, we report this so the caller
> > can handle it.
> >
> > However there are cases where the caller is only ostensibly trying a
> > merge, and doesn't mind if it fails due to this condition.
> >
> > Since we do not want to introduce an implicit assumption that we only
> > actually modify VMAs after OOM conditions might arise, add a 'give up on
> > oom' option and make an explicit contract that, should this flag be set, we
> > absolutely will not modify any VMAs should OOM arise and just bail out.
> >
> > Since it'd be very unusual for a user to try to vma_modify() with this flag
> > set but be specifying a range within a VMA which ends up being split (which
> > can fail due to rlimit issues, not only OOM), we add a debug warning for
> > this condition.
> >
> > The motivating reason for this is uffd release - syzkaller (and Pedro
> > Falcato's VERY astute analysis) found a way in which an injected fault on
> > allocation, triggering an OOM condition on commit merge, would result in
> > uffd code becoming confused and treating an error value as if it were a VMA
> > pointer.
> >
> > To avoid this, we make use of this new VMG flag to ensure that this never
> > occurs, utilising the fact that, should we be clearing entire VMAs, we do
> > not wish an OOM event to be reported to us.
> >
> > Many thanks to Pedro Falcato for his excellent analysis and Jann Horn for
> > his insightful and intelligent analysis of the situation, both of whom were
> > instrumental in this fix.
> >
> > Reported-by: syzbot+20ed41006cf9d842c2b5@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/67dc67f0.050a0220.25ae54.001e.GAE@google.com/
> > Fixes: 47b16d0462a4 ("mm: abort vma_modify() on merge out of memory failure")
> > Suggested-by: Pedro Falcato <pfalcato@suse.de>
> > Suggested-by: Jann Horn <jannh@google.com>
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Alright, I'm not a huge fan of the solution, but if you feel like it's the best course of action,
I'll trust your instincts. The patch itself LGTM.

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

> >  	if (vma->vm_start < start) {
> >  		int err = split_vma(vmg->vmi, vma, start, 1);
> > @@ -1602,12 +1642,15 @@ struct vm_area_struct
> >  		       struct vm_area_struct *vma,
> >  		       unsigned long start, unsigned long end,
> >  		       unsigned long new_flags,
> > -		       struct vm_userfaultfd_ctx new_ctx)
> > +		       struct vm_userfaultfd_ctx new_ctx,
> > +		       bool give_up_on_oom)
> >  {
> >  	VMG_VMA_STATE(vmg, vmi, prev, vma, start, end);
> >
> >  	vmg.flags = new_flags;
> >  	vmg.uffd_ctx = new_ctx;
> > +	if (give_up_on_oom)
> > +		vmg.give_up_on_oom = true;

Why not just
	vmg.give_up_on_oom = give_up_on_oom;
with no if?

--
Pedro
