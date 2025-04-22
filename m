Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D61C27584E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319809; cv=none; b=m8wHbm/hQHqZEwAeCDVcr4bl+NGmEGQ6Uf6gQ7Ifx7mL3pRzKrlz8BmJEwAtKGOhl70tOtu4V9XTbzu9SvkAHdfIy6VTSoJDoGYLNAm9byzZvr1qrBYTPPm3mB5Wjm4bAupf0fdCg1ThdpKeNOTLgEFO5wU1tCnbrU6Jw/VELKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319809; c=relaxed/simple;
	bh=L9+c7UWOT4Qooe0Q5bfz3uwjiRUc2T0IrSL+flPYxbE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lNv32vRCM6uQJ/uG5Uk0owupDW1rthdt/i/tNj0wtX9HKZUFKLrHef6PuDQzJc7guntKZ6NXDFZMvHNPZb/iCsvwJff5yLwJBifb8ifv8bHbu2ZYyyTiFvkH+Ccw9nKx4S2D27mimXspwp61pknTRo/DQEr63QPZKT3SuyxrU/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J2bfkD7X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eDk8UKnP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J2bfkD7X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eDk8UKnP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J2bfkD7X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eDk8UKnP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J2bfkD7X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eDk8UKnP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7E1401F45A;
	Tue, 22 Apr 2025 11:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745319805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iO8ovA6YB8cUVoCUkIr56veXc8hllTBjm8bbQin2qQE=;
	b=J2bfkD7XAT470oXTN0fcdBLQy1AoMWnkcpNuKDkv6B5cj04oLYQT7GJHh4d0cx6iOOh41u
	IpFIQoT0ZI55utAMlMcUk+ODFYiw7wQmjZSQWZRknflOiHGDVdSXKUIaut3pKUvNBlJCQD
	8Hdn1y8rDfKSixxNAb7Gqn9h+qYWmlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745319805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iO8ovA6YB8cUVoCUkIr56veXc8hllTBjm8bbQin2qQE=;
	b=eDk8UKnPh8Psd4q1wzG9+nBnT6GWypxHPTmVs+r9Wflwvv6KxkmwncfoPUKy6noA3jlP6F
	lJfRE+A91+1s3ZCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745319805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iO8ovA6YB8cUVoCUkIr56veXc8hllTBjm8bbQin2qQE=;
	b=J2bfkD7XAT470oXTN0fcdBLQy1AoMWnkcpNuKDkv6B5cj04oLYQT7GJHh4d0cx6iOOh41u
	IpFIQoT0ZI55utAMlMcUk+ODFYiw7wQmjZSQWZRknflOiHGDVdSXKUIaut3pKUvNBlJCQD
	8Hdn1y8rDfKSixxNAb7Gqn9h+qYWmlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745319805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iO8ovA6YB8cUVoCUkIr56veXc8hllTBjm8bbQin2qQE=;
	b=eDk8UKnPh8Psd4q1wzG9+nBnT6GWypxHPTmVs+r9Wflwvv6KxkmwncfoPUKy6noA3jlP6F
	lJfRE+A91+1s3ZCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FB92137CF;
	Tue, 22 Apr 2025 11:03:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yyM7En13B2juAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 22 Apr 2025 11:03:25 +0000
Date: Tue, 22 Apr 2025 13:03:24 +0200
Message-ID: <8734e0tq4j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hillf Danton <hdanton@sina.com>
Cc: alsa-devel@alsa-project.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/9] ALSA: usb-audio: Fix possible race at sync of urb completions
In-Reply-To: <20250422102933.4239-1-hdanton@sina.com>
References: <20210929080844.11583-1-tiwai@suse.de>
	<20210929080844.11583-3-tiwai@suse.de>
	<20250418103533.4078-1-hdanton@sina.com>
	<87a58dvia7.wl-tiwai@suse.de>
	<20250418144518.4097-1-hdanton@sina.com>
	<875xj0ve49.wl-tiwai@suse.de>
	<20250419080410.4148-1-hdanton@sina.com>
	<871ptnuvad.wl-tiwai@suse.de>
	<87mscat1tq.wl-tiwai@suse.de>
	<20250421104343.4197-1-hdanton@sina.com>
	<878qnttwcx.wl-tiwai@suse.de>
	<20250421233900.4221-1-hdanton@sina.com>
	<875xiwu18n.wl-tiwai@suse.de>
	<20250422102933.4239-1-hdanton@sina.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[sina.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Tue, 22 Apr 2025 12:29:31 +0200,
Hillf Danton wrote:
> 
> On Tue, 22 Apr 2025 09:03:20 +0200 Takashi Iwai wrote:
> > On Tue, 22 Apr 2025 01:38:59 +0200, Hillf Danton wrote:
> > > On Mon, 21 Apr 2025 16:36:30 +0200 Takashi Iwai wrote:
> > > > On Mon, 21 Apr 2025 12:43:42 +0200, Hillf Danton wrote:
> > > > > I misread "Which reads and writes are you trying to solve?" though I
> > > > > showed the read/write, but it is a bad case particulay with UAF.
> > > > > 
> > > > > Could you tell us what will happen if the race is not fixed? Could ep
> > > > > be freed with in-flight urbs for example?
> > > > 
> > > > Before the patch, wait_clear_urbs() might return earlier than actually
> > > > all pending eps are finished, so it can be UAF.
> > > > 
> > > Got it.
> > > 
> > > > > Is it still race if the wait loop in wait_clear_urbs() ends before the
> > > > > urb complete callbace completes, given the last sentence in your commit
> > > > > message? If nope, igore my noise please.
> > > > 
> > > > Well, your concern about the missing barrier -- that would
> > > > wait_clear_urbs() missing the refcount decrement, hence it would be
> > > > rather to make the return delayed.  So it shouldn't lead to further
> > > > UAF, but at most it might lead to an unnecessary delay.
> > > > 
> > > > That said, I'm willing to take a fix even for a theoretical issue if
> > > > it clarifies what it really fixes.  But scratching a random surface
> > > > isn't what we want.
> > > > 
> > > Thank you for shedding light on the race, given
> > > a) the mb in 26fbe9772b8c ("USB: core: Fix hang in usb_kill_urb by adding memory barriers")
> > > b) the urb complete callback is invoked in giveback, see __usb_hcd_giveback_urb()
> > > 
> > > use the urb routines instead to close the race.
> > 
> > I'm afraid that it can break things as of this form; the stopped
> > stream might be restarted without reinitializing URBs.  That is, this
> > isn't called only from disconnect or close, but also just for stopping
> > the stream in the middle, too.
> > 
> I'd like to test the change proposed locally, so please tippoint me to
> the test programs that could trigger the break.

Well, you need to follow the code logic.  The function isn't called
only from release / disconnect, but also from the code pattern:
 trigger(STOP) -> prepare -> sync_stop
and the URBs aren't released / re-initialized in this case.

For the problem you raised, I suppose it's better to stick with your
first approach with the manual barriers.  But you'd need to describe
exactly what it does and why it needed as a proper patch.


thanks,

Takashi
