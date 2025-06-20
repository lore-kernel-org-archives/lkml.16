Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2C41E1E0C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407098; cv=none; b=OI76qhXz787EqbGzOw7pw9X+ny+1vFsp/u9vlFkVwlleDfvYWjBkLEB6iyP0vQQCcf0++7dxSvAxVuv23LpTb7zJySXWndpaxMnLeSunyUAohA5AJ8MM24jzM+BTsyuSiBFWaORolaXejePw4FeEQRyGXoS9NvWAMSl4Oaltry8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407098; c=relaxed/simple;
	bh=BsSK3r17DCUgEJanEK2OoEwjbPxiUmA1cdxGgdOPxGo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfYXSecCTTT6zvq0nI4MTX6okYKOZsef5i3nuLtpZWFP/A30Ply3pr3GwYznsYgF/3qEDN8afq+WLxbeEkrfA1GtUl0EN8MzfgdEMLpGMUXGYEOKuQDYbLYwmxZX5B27FKd//hJYl6KYP0XpSE24XfS46kAT4MjJPPrAuiGBa78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qcm0/p3e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zg3San8r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qcm0/p3e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zg3San8r; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qcm0/p3e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zg3San8r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qcm0/p3e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zg3San8r"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9ACB5211A3;
	Fri, 20 Jun 2025 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750407095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O0q3odf9efWrsH1GopCc0ZpQ4IRXZKOd9DhQecrXLcI=;
	b=Qcm0/p3eguC195Ey23EtJyngSfqWcLfW3E8pQUBVhnaYY+3Yw7KeJe+cR8loL8P5sECWFr
	UbW/aAuedM0dF9aMEDVsQZUqIbalpKi/RRdPZppQmX3MY+r50RBRe3NSLvA2RwkpjO8E7q
	bkKa1ugrirClnhu8ubzjgXhVz1vNG60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750407095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O0q3odf9efWrsH1GopCc0ZpQ4IRXZKOd9DhQecrXLcI=;
	b=Zg3San8rpWCGaTDhWqrwXWLKxoKzjBBSpzFnLdpiVTiZBpVXmpWtfNQ/bPiDs719fsiusE
	HH5m0j/8L+at53AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750407095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O0q3odf9efWrsH1GopCc0ZpQ4IRXZKOd9DhQecrXLcI=;
	b=Qcm0/p3eguC195Ey23EtJyngSfqWcLfW3E8pQUBVhnaYY+3Yw7KeJe+cR8loL8P5sECWFr
	UbW/aAuedM0dF9aMEDVsQZUqIbalpKi/RRdPZppQmX3MY+r50RBRe3NSLvA2RwkpjO8E7q
	bkKa1ugrirClnhu8ubzjgXhVz1vNG60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750407095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O0q3odf9efWrsH1GopCc0ZpQ4IRXZKOd9DhQecrXLcI=;
	b=Zg3San8rpWCGaTDhWqrwXWLKxoKzjBBSpzFnLdpiVTiZBpVXmpWtfNQ/bPiDs719fsiusE
	HH5m0j/8L+at53AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61B8613A9C;
	Fri, 20 Jun 2025 08:11:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lQ1pFrcXVWhsXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 08:11:35 +0000
Date: Fri, 20 Jun 2025 10:11:34 +0200
Message-ID: <87o6uix26h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	perex@perex.cz,
	tiwai@suse.com,
	phasta@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [External] : Re: [BUG] ALSA: intel8x: Why incorrect codec index used setting ICH_DI2L SDIN
In-Reply-To: <668f9127-25e2-418e-beb6-79ff96706914@oracle.com>
References: <20250618191929.2382821-1-alok.a.tiwari@oracle.com>
	<aFQvEYdQfiJn-29o@smile.fi.intel.com>
	<668f9127-25e2-418e-beb6-79ff96706914@oracle.com>
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
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Thu, 19 Jun 2025 21:26:53 +0200,
ALOK TIWARI wrote:
> 
> 
> 
> On 6/19/2025 9:08 PM, Andy Shevchenko wrote:
> > On Wed, Jun 18, 2025 at 12:19:21PM -0700, Alok Tiwari wrote:
> >> Correct the index to use codec[i] to match the loop iteration, not codec[1].
> >> 
> >> Is this a mistake or intentional?
> > 
> > You marked it as a BUG in the Subject, can you elaborate more, please?
> > 
> 
> I should have mark this as a query.
> Why is the value 1 hardcoded here in the codec?
> 
> tmp |= chip->ac97_sdin[pcm->r[0].codec[1]->num] << ICH_DI2L_SHIFT;
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/sound/pci/intel8x0.c#n2252

I believe this is a long-standing bug, but practically seen, it never
hits on real devices, because there have been little devices with
multiple AC97 codecs on Intel ICH, and they have at most only two
codecs, AFAIK.

That said, I'd happily take the fix patch when you submit a properly
formatted one.  It'll likely change the behavior of existing devices,
but it's always good to fix something.


thanks,

Takashi
