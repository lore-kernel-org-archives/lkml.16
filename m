Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4574417799F
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746972828; cv=none; b=iZX+2iJmfFeJ4CD2opTMze4YDxzJQ4xOYigKEsG1AJYX2Xit9MuPwZYqg2+F+yQvaZfoxMl+DXpWUcEodplI6+9LBZHP5A3yhY3lJ0C6+pqhXTqHIqAPgOLPXfrza3hTR1penhQ93XV8JNF2vI3JFP0XJ5yrms7NUjy6/JAJ57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746972828; c=relaxed/simple;
	bh=jSzC4Ep0cfK3dP1pOLzEb3ZIpFtz+ILy4t9Amgnd4rw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jCEiKHQTBt5CcFChUh8ymR71tXEEK8IJul+t6l5alpTIJ1l5mQeGgoSJYpRB6LZDqVqgLsdtckv/P7iP8YsXbYyJs7Yy1gblyQnoriwhiM9GaiG2VSxaST4/3VBtm0myLSziXhhs7L2bQFw1stUgdR/OtBpUBe7zyX++S3VzVSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G2r6imJB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IYVsUN0R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G2r6imJB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IYVsUN0R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G2r6imJB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IYVsUN0R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G2r6imJB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IYVsUN0R"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 65C0B21170;
	Sun, 11 May 2025 14:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746972824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KSB3SCvLIomAD/HSeuVRkK7Cz7+GVRdTyy8BJ1aqsb4=;
	b=G2r6imJBjRvDXq351A/8w8stWsVG33xLnxluBk2n6etmbsnpSlvVKFtQ3THwdL6Jfeu0GY
	fMevAe0MH8Bsvcog8msOQynZipnmK+lmnBTOR8Ih8g4/RlaVF3/97lMjnOcax2xrG32vyL
	BwXyLMSIQHfdS6bPj5pxWOxwOGncB9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746972824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KSB3SCvLIomAD/HSeuVRkK7Cz7+GVRdTyy8BJ1aqsb4=;
	b=IYVsUN0RwCFKHqiroZtUsPt/gzrX5fPVxgrLKV18NYIlGyKbXJ7Fe4gLrwDrMw0WuqmpXA
	dE8i/ckDoMAUQXCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746972824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KSB3SCvLIomAD/HSeuVRkK7Cz7+GVRdTyy8BJ1aqsb4=;
	b=G2r6imJBjRvDXq351A/8w8stWsVG33xLnxluBk2n6etmbsnpSlvVKFtQ3THwdL6Jfeu0GY
	fMevAe0MH8Bsvcog8msOQynZipnmK+lmnBTOR8Ih8g4/RlaVF3/97lMjnOcax2xrG32vyL
	BwXyLMSIQHfdS6bPj5pxWOxwOGncB9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746972824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KSB3SCvLIomAD/HSeuVRkK7Cz7+GVRdTyy8BJ1aqsb4=;
	b=IYVsUN0RwCFKHqiroZtUsPt/gzrX5fPVxgrLKV18NYIlGyKbXJ7Fe4gLrwDrMw0WuqmpXA
	dE8i/ckDoMAUQXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C78D13690;
	Sun, 11 May 2025 14:13:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z6lqBZiwIGixbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 May 2025 14:13:44 +0000
Date: Sun, 11 May 2025 16:13:43 +0200
Message-ID: <87r00vxmjs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.h1@wp.pl,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: question on sound/isa/msnd/msnd_midi.c
In-Reply-To: <aByXJKi2j7B4b0bH@gallifrey>
References: <aByXJKi2j7B4b0bH@gallifrey>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[wp.pl];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,wp.pl,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Thu, 08 May 2025 13:36:04 +0200,
Dr. David Alan Gilbert wrote:
> 
> Hi,
>    I noticed that nothing calls snd_msndmidi_new in
> sound/isa/msnd/msnd_midi.c and was about to delete it, but I'm not
> too sure - I think it's actually a bug where it should be called.
> 
>   This code was added in 2009 by
> commit f6c638350275 ("ALSA: Turtle Beach Multisound Classic/Pinnacle driver")
> (Pretty new for an ISA card!)
> 
> Looking at msnd_midi.c the only function in there that anything
> calls is snd_msndmidi_input_read() called by msnd_pinnacle.c but that
> is guarded by a check:
> 
>   146    if (chip->msndmidi_mpu)
>   147          snd_msndmidi_input_read(chip->msndmidi_mpu);   
> 
> but I don't think anything sets that msndmidi_mpu, since the only
> thing that could is snd_msndmidi_new() which isn't called.
> 
> I see that the original poster didn't test the external midi:
>    https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWPYLPLJQEK64UU3YFCAMVXGDY42QKF2/
> so I guess this has always been missing.
> 
> I don't have the hardware to test.
> 
> Thoughts?

Well, it's a very old code on an old interface, and if it's not used
(even because of a typo or an overlook), then it's basically no chance
to be used in future.  Let's rip off.


thanks,

Takashi
