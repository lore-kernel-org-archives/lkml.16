Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58E52737E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370568; cv=none; b=KESFJEfJlFwOVo14CqlHlWWvm7/+HKxOd6cTDmWg+hj59gdMIha3mhYDeDPZioxZ6nuUGkA9lJYEb35A9c1V2XWxtlvgwTmqAvS4Y/+xEHjhD7oMspvLwF60B0K2F38XGRfg05uKMj9ZvzSOUYCPnkC6pNdUM2v9etcz6i3674k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370568; c=relaxed/simple;
	bh=ja0w59d5w5KdxtJ81fA0AE9mSPTrzuiQNR6v4rAyjhQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gzcc8UXQAmo/BJPNBlZbkMqnDjMcc3rmt0KX/WWZN16bGf5NIFFLoBidAtqpHpwlL9UuW/DLXEh8v1UMCYr8Skr55FVIFbTOUcotsPCDOJuclzEeDaLGuDewIBqN19m00SA2JJuGapcsqsCGRJYKULMl51n2aVWVC7CCrFvmNzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gUAnZeBS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gGTvwIdG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gUAnZeBS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gGTvwIdG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gUAnZeBS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gGTvwIdG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gUAnZeBS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gGTvwIdG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD38E1F393;
	Tue,  1 Jul 2025 11:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751370564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p8IIu6L6kvOVZcxKe/aD9fSmcasJAdkUr1mZG+3rs8E=;
	b=gUAnZeBSGoFcJoBIS9CaGAkBKe2tt37t5KMk4rN5iEjo2i7WLZKn9zn9+nS6cUxCii0Qje
	7qgvoke/IEqSc/Gazf7/iYtMbolOa/NCq38zoDkr6Tgj8vUnWpyEWKSDo69sw0AidJdBA5
	LPgW4rOYvV9aPQzDrKaj+kvJ12ubUcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751370564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p8IIu6L6kvOVZcxKe/aD9fSmcasJAdkUr1mZG+3rs8E=;
	b=gGTvwIdGVYRLD1TAJKfo6URGSum9vDKjHDRAkivHwijr+yae63OEFomKzvNrp53kHcwvc5
	5QweWo9yv9xXO0DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751370564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p8IIu6L6kvOVZcxKe/aD9fSmcasJAdkUr1mZG+3rs8E=;
	b=gUAnZeBSGoFcJoBIS9CaGAkBKe2tt37t5KMk4rN5iEjo2i7WLZKn9zn9+nS6cUxCii0Qje
	7qgvoke/IEqSc/Gazf7/iYtMbolOa/NCq38zoDkr6Tgj8vUnWpyEWKSDo69sw0AidJdBA5
	LPgW4rOYvV9aPQzDrKaj+kvJ12ubUcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751370564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p8IIu6L6kvOVZcxKe/aD9fSmcasJAdkUr1mZG+3rs8E=;
	b=gGTvwIdGVYRLD1TAJKfo6URGSum9vDKjHDRAkivHwijr+yae63OEFomKzvNrp53kHcwvc5
	5QweWo9yv9xXO0DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E9961364B;
	Tue,  1 Jul 2025 11:49:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r9ZjJUTLY2i1WwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Jul 2025 11:49:24 +0000
Date: Tue, 01 Jul 2025 13:49:24 +0200
Message-ID: <87sejg6shn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Takashi Iwai <tiwai@suse.de>,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@baylibre.com>,	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: mips/hal2: Refactor and improve hal2_compute_rate()
In-Reply-To: <64167092-D0B5-4E78-AC07-62733EEEAD65@linux.dev>
References: <20250630214554.182953-2-thorsten.blum@linux.dev>
	<87wm8sclf8.wl-tiwai@suse.de>
	<64167092-D0B5-4E78-AC07-62733EEEAD65@linux.dev>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Tue, 01 Jul 2025 12:18:44 +0200,
Thorsten Blum wrote:
> 
> On 1. Jul 2025, at 11:25, Takashi Iwai wrote:
> > IMHO, this doesn't look improving the code readability than the
> > original code.  And the generated code doesn't seem significantly
> > better, either.
> 
> I didn't look at the generated code, but I think the patch definitely
> improves the function (not necessarily its runtime, but its readability
> and maintainability).
> 
> I think the patch primarily improves maintainability by eliminating the
> magic number '4' that was scattered throughout the function. Now the
> scaling factor is assigned once to the semantically more meaningful
> variable 'codec->inc' and used consistently.
> 
> It also improves consistency by using 'codec->master' when calculating
> 'codec->mod' instead of repeating the constants '44100' and '48000'.
> 
> Additionally, it removes the unnecessary local variable 'mod' and the
> 'rate' update, making the function more concise (4 vs 12 lines).

The line length doesn't matter.  It's a small code.  And it's no
hot-path, and no common code used by many drivers, either.
That is, the only question is how better the code is readable.
And, often a simple if-block can be easier to follow the code flow --
that's your case, too.

In anyway, this is really really minor issue and we shouldn't waste
too much time just for this kind of optimization. 


thanks,

Takashi
