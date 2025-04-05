Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C330176ADB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 19:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743880834; cv=none; b=W2gQKetC7AtvvycnCAM6qD7G4JUg6+u1aV7SsjMJJ4koxbN7vyZl6YFAeP3+GXQqfo/G/STkc9N+v4XNLIhOj8do861JtjT/7Sc72M8z0mbK1D5mUdVGBiegfFOy54HTDgrp/H1gpsxiVh7M1YbOiKu4z+BmTFDVeorcvZ9vhqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743880834; c=relaxed/simple;
	bh=1VabX7LsBGmRkG+kFWuVXWwq1bmuQSyOoYUp/N4pHxs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhNWN7bq0Mvq8sJnzUw9QQ+DE+Am05ssPg4Zo+x1GRUN5FMxW2FQ7B9PmHN8jxweZUwASiIunKThaNnYQsegEiZ14WXIfsShYUJgnSLLPvI8ecr6bhX/RbipWsNblpS5+BIzNhxzBTNOquBExy8woDpiv8zrlNpVj+WfzpoDopU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ii5n0/aP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K0Oht+O7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ii5n0/aP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K0Oht+O7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ii5n0/aP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K0Oht+O7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ii5n0/aP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K0Oht+O7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B97112116A;
	Sat,  5 Apr 2025 19:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743880824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZf7LN35KCA7AytbqMjk8Vxtv88CJE4moDuVdr96qgg=;
	b=Ii5n0/aPEzjNlcId28v/C+2p5N4AnVv+D+gTe7MvORE0HMSNnfsdsG0R8Kn7jy9j7KHecv
	JbndaBEm8pkqShAue+P2Xkqth2rK0wv7o3UNPt+NVEEfbS1DhuDZNvKWPcCAFuU+sTaUs0
	kCfxrJXaASo5zdLYWJSu6ao0NgKARk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743880824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZf7LN35KCA7AytbqMjk8Vxtv88CJE4moDuVdr96qgg=;
	b=K0Oht+O7wxaV4wPxrZulifkBrwMziFitfGz6SFDkYKSRcQADm94dq3lPQRJYVAaBLaPp+U
	Yi7b+zc5AcQfAlCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743880824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZf7LN35KCA7AytbqMjk8Vxtv88CJE4moDuVdr96qgg=;
	b=Ii5n0/aPEzjNlcId28v/C+2p5N4AnVv+D+gTe7MvORE0HMSNnfsdsG0R8Kn7jy9j7KHecv
	JbndaBEm8pkqShAue+P2Xkqth2rK0wv7o3UNPt+NVEEfbS1DhuDZNvKWPcCAFuU+sTaUs0
	kCfxrJXaASo5zdLYWJSu6ao0NgKARk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743880824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZf7LN35KCA7AytbqMjk8Vxtv88CJE4moDuVdr96qgg=;
	b=K0Oht+O7wxaV4wPxrZulifkBrwMziFitfGz6SFDkYKSRcQADm94dq3lPQRJYVAaBLaPp+U
	Yi7b+zc5AcQfAlCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DD371392A;
	Sat,  5 Apr 2025 19:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9KFlGXiC8WeiEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 05 Apr 2025 19:20:24 +0000
Date: Sat, 05 Apr 2025 21:20:23 +0200
Message-ID: <87zfgu1klk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: "C.D. MacEachern" <craig.daniel.maceachern@gmail.com>,
	1100928@bugs.debian.org,
	Takashi Iwai <tiwai@suse.de>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Bug#1100928: [regression 6.1.y] microphone no longer records (on VivoBook_ASUSLaptop TP401MARB_J401MA)
In-Reply-To: <Z_E9LbOiYN5dPpSb@eldamar.lan>
References: <CAJ8x=4ibzvVxxv7FzswtwTcYT73XaDOUr7gHWMcdxB+j8+zyyw@mail.gmail.com>
	<878qojypu6.wl-tiwai@suse.de>
	<CAJ8x=4gN1fH6chp4C3jX1OXq2-JhbP5yUzLbqvWrAJ-u=+VNhw@mail.gmail.com>
	<87mscw4dst.wl-tiwai@suse.de>
	<Z_AxsuGoaVK9P3L4@eldamar.lan>
	<174248253267.1718.4037292692790831697.reportbug@x>
	<CAJ8x=4gQQeh+yuUrBDT3P_ZkWRT+7pPujq-ZF6Fcao0V7kohFw@mail.gmail.com>
	<Z_DNcG7wp4iPh5NH@eldamar.lan>
	<CAJ8x=4hmi0Afneepe15Ef-kzVZO+uyw5Row+Cooob_QR=DpwQg@mail.gmail.com>
	<Z_E9LbOiYN5dPpSb@eldamar.lan>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bugs.debian.org,suse.de,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 05 Apr 2025 16:24:45 +0200,
Salvatore Bonaccorso wrote:
> 
> Control: tags -1 - moreinfo
> 
> On Sat, Apr 05, 2025 at 09:08:38AM -0400, C.D. MacEachern wrote:
> > Thanks, running it now, microphone levels working fine now! Testing
> > recording and playback, working perfectly.
> 
> Many thanks for testing the patch and confirming the fix.
> 
> Takashi, assume you will monitor that 8983dc1b66c0 ("ALSA:
> hda/realtek: Fix built-in mic on another ASUS VivoBook model") get
> backported to all the relevant stable series? TTBOM, it won't apply
> cleanly to 6.1.y so Greg or Sasha might not get it down to 6.1.y
> witout explicit backport request?

As it has Fixes tag, it'll be backported usually to stable branches,
yes.  If it's missing, just ping stable ML.


thanks,

Takashi
