Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6551F7580
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441419; cv=none; b=f/Jkx80xoIicrwFpC+Mj6DNbxtnZb4oazIltp0Ua+5XnQfNOHesjsrny+KShoIBchCZnf3SZ5O+4qO1D1cpmsq/nW4v+k0KzSywz7ON6BJlYtR1pxmoB+iK3lMs1/osFy07ys71DyuPdVDypZJfw+woE8W3Rp4ay9DyH30QlyDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441419; c=relaxed/simple;
	bh=jyqeqmGv/mlTJdm3XdlAID6BKX84U/aEJbQYYNt7YNc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DdznJEsp6Z9bAQHXKu4To0zHV8yev7fM87zJFnnDD36tZnmVzRfwyB8/DUdFdhl/VJibRS2JsFgAqFSMwcH35jl3uugO+jk/0I0PqCTsEEBy2Q9mhaGjG8hWiQrikkiHIq9XwITNSre7mhA1vJkM0alcc+h2emu6tUmxKyu9pco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sK3gWBlP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JnejGnMw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sK3gWBlP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JnejGnMw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sK3gWBlP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JnejGnMw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sK3gWBlP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JnejGnMw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 51B421F453;
	Mon,  5 May 2025 10:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746441416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SsTjdbYpKD9ol0/J1eGdyndTbc2m8a6B1lVbC7de0dA=;
	b=sK3gWBlP95rb9kn3XLXv1oGrJtV+xjmBcnEX584FIrMGW8gwrCNeLEIGRIJWGVErj1CzSu
	e+jKvWO0sMb68Zrs4TqR/xwFDCvTYqtiVEY2OUe6xaACZiruL2MG0TDhvUGbIOKx/rt6qe
	ADNiR1ae5qzs2KrziPx0mVwz1ZwHCow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746441416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SsTjdbYpKD9ol0/J1eGdyndTbc2m8a6B1lVbC7de0dA=;
	b=JnejGnMwUy1cXjlyZ4CW4XX2g1rh050BObHnOSFNBgUf/jsjwSFiTxsuRJ0CSJrG/50DUK
	VJaTzjZ3zETgEDDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sK3gWBlP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JnejGnMw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746441416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SsTjdbYpKD9ol0/J1eGdyndTbc2m8a6B1lVbC7de0dA=;
	b=sK3gWBlP95rb9kn3XLXv1oGrJtV+xjmBcnEX584FIrMGW8gwrCNeLEIGRIJWGVErj1CzSu
	e+jKvWO0sMb68Zrs4TqR/xwFDCvTYqtiVEY2OUe6xaACZiruL2MG0TDhvUGbIOKx/rt6qe
	ADNiR1ae5qzs2KrziPx0mVwz1ZwHCow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746441416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SsTjdbYpKD9ol0/J1eGdyndTbc2m8a6B1lVbC7de0dA=;
	b=JnejGnMwUy1cXjlyZ4CW4XX2g1rh050BObHnOSFNBgUf/jsjwSFiTxsuRJ0CSJrG/50DUK
	VJaTzjZ3zETgEDDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20CAB1372E;
	Mon,  5 May 2025 10:36:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZhO6BsiUGGhXAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 May 2025 10:36:56 +0000
Date: Mon, 05 May 2025 12:36:55 +0200
Message-ID: <87r013qr7c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux@treblig.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] ALSA: core: removing unused functions
In-Reply-To: <20250502235219.1000429-1-linux@treblig.org>
References: <20250502235219.1000429-1-linux@treblig.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 51B421F453
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 03 May 2025 01:52:14 +0200,
linux@treblig.org wrote:
> 
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   This is a small set of deadcode removal from sound/core;
> they're all full function removal rather than changing the
> code inside functions.
> 
> Dave
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> 
> Dr. David Alan Gilbert (5):
>   ALSA: pcm: Remove unused snd_pcm_rate_range_to_bits
>   ALSA: pcm: Remove unused snd_dmaengine_pcm_open_request_chan
>   ALSA: seq: Remove unused snd_seq_queue_client_leave_cells
>   ALSA: core: Remove unused snd_device_get_state
>   ALSA: core: Remove unused snd_jack_set_parent

Applied all patches now to for-next branch.  Thanks.


Takashi
