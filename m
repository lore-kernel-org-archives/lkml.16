Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E6B221541
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212718; cv=none; b=aPDJWRxGdpoSkP5HOwzdgZ02IRn9nTFKQBzhhr9cw8thjzyDqlO5epwxWXy5QcURAxfzn1HALWq7XcA3zL6tuN5b2xhPK24AsvqMaPmECfCjX1pRk3Dun1WUd8IdwunJFEXrqsxrb0MC9q9KwMMYvCc0peRxtIMu7FKRyZKmvXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212718; c=relaxed/simple;
	bh=08NpCGD+M4D8EFyf6OcXAksA72+oaIdVsJmF4fVuSQU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4ZlydZd84nWjuL3DAeniuJPMwDGsaC5bLvv2vw4FtY6JWQTczMtC3iQzrPZ9cX9l/L/oKe8Nlc9EYFp2nnOiSm8cKu6RCQeya4LbOyCdJo0S+cUSbff9S2zpv8GjHAsk8uRNn48oYai+cysbOLFyqDpLmaz5q3mWwW3p8J5kbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h7D+ruxr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ovbwLlVQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h7D+ruxr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ovbwLlVQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h7D+ruxr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ovbwLlVQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h7D+ruxr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ovbwLlVQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 30AE91F391;
	Wed, 14 May 2025 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747212714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8TvbbYdamFPsDUbFCIqYLcc+lzT3rPBBeOg6bydKK8s=;
	b=h7D+ruxrm9AdEFMS2L6H/jZ6VyYtyYTpO+qYJooiH9sz6iiBFGNQpVDP6renJNmpKVShRT
	p8LZqiRQyrUdOMncd0DV5mE/03AmZW4zAyNguHCpE6+SBSsgQW5jY+nCoIxQwqudPQUO49
	uWJyv22jxjD+1L0Si6uT2OIOe+cHwV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747212714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8TvbbYdamFPsDUbFCIqYLcc+lzT3rPBBeOg6bydKK8s=;
	b=ovbwLlVQnBkCZnC1SDZaEp5kNpq6IDYUkZif2Q1UGARph4eV/lYN+0mpabov8BOa4HlGWd
	kx60wv9h5G4iyBAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=h7D+ruxr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ovbwLlVQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747212714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8TvbbYdamFPsDUbFCIqYLcc+lzT3rPBBeOg6bydKK8s=;
	b=h7D+ruxrm9AdEFMS2L6H/jZ6VyYtyYTpO+qYJooiH9sz6iiBFGNQpVDP6renJNmpKVShRT
	p8LZqiRQyrUdOMncd0DV5mE/03AmZW4zAyNguHCpE6+SBSsgQW5jY+nCoIxQwqudPQUO49
	uWJyv22jxjD+1L0Si6uT2OIOe+cHwV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747212714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8TvbbYdamFPsDUbFCIqYLcc+lzT3rPBBeOg6bydKK8s=;
	b=ovbwLlVQnBkCZnC1SDZaEp5kNpq6IDYUkZif2Q1UGARph4eV/lYN+0mpabov8BOa4HlGWd
	kx60wv9h5G4iyBAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 013FE137E8;
	Wed, 14 May 2025 08:51:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BRicOqlZJGj9HAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 May 2025 08:51:53 +0000
Date: Wed, 14 May 2025 10:51:53 +0200
Message-ID: <877c2jval2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Simon Trimmer <simont@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	tiwai@suse.de
Subject: Re: [PATCH 2/2] ALSA: hda: cs35l56: Log tuning unique identifiers during firmware load
In-Reply-To: <aCRUgeFcG4iubmSV@finisterre.sirena.org.uk>
References: <cover.1747142267.git.simont@opensource.cirrus.com>
	<2fcc0e6fc5b8669acb026bebe44a4995ac83b967.1747142267.git.simont@opensource.cirrus.com>
	<aCRUgeFcG4iubmSV@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 30AE91F391
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Wed, 14 May 2025 10:29:53 +0200,
Mark Brown wrote:
> 
> On Tue, May 13, 2025 at 01:39:24PM +0000, Simon Trimmer wrote:
> > The cs35l56 smart amplifier has some informational firmware controls
> > that are populated by a tuning bin file to unique values - logging these
> > during firmware load identifies the specific configuration being used on
> > that device instance.
> 
> Adding Takashi since this is an ALSA patch (and not deleting context for
> him), Takashi is this OK to go via ASoC?

Sure, it's a simple logging, feel free to pick it up.

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi


> As documented in submitting-patches.rst please send patches to the 
> maintainers for the code you would like to change.  The normal kernel
> workflow is that people apply patches from their inboxes, if they aren't
> copied they are likely to not see the patch at all and it is much more
> difficult to apply patches.
> 
> > 
> > Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> > ---
> >  sound/pci/hda/cs35l56_hda.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> > index b6fecf119261..aed7d7284231 100644
> > --- a/sound/pci/hda/cs35l56_hda.c
> > +++ b/sound/pci/hda/cs35l56_hda.c
> > @@ -676,6 +676,8 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
> >  	if (ret)
> >  		cs_dsp_stop(&cs35l56->cs_dsp);
> >  
> > +	cs35l56_log_tuning(&cs35l56->base, &cs35l56->cs_dsp);
> > +
> >  err_powered_up:
> >  	if (!cs35l56->base.fw_patched)
> >  		cs_dsp_power_down(&cs35l56->cs_dsp);
> > -- 
> > 2.43.0
> > 
> Verifying...
