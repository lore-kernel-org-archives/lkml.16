Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F5021885A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875670; cv=none; b=RQisAEYqDbQUf1a7mCSHA1o5ldJR+OqgH0d1xGayWwcc6bhK3NSX/dEKByEkmdizyttRw6jkyGrm8aS78mhUCSFMWVAuUcRIpz6EcqgP/jhpMOq9fDnoLUaI5VDKQ0+CfSTRj2Cn/00qeRRByhrOnee07H0oJqNRtiDjhz+37aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875670; c=relaxed/simple;
	bh=Wj6YL7lFPgWchDxVtC2mSZmKreUprD0S0huqwE7ccNs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H1EQ3Y4I923TqT6+r2m68GxpIFjIe99UbSj0JdEEShTbNxRCvsBkHmofFQE1iA6CDFaLLZf7MjzmOYngeb1whHi9zjarJdyBQ3jxipocYokPbufPJpGZhKgPgWAdKpkYpD9M4WmXOwU0+5LCiCEIYtqao6//vWBLWIHTTyx3vzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TK5OBG0s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oaZptSvc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1tQT6AZa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gbycWsQ9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TK5OBG0s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oaZptSvc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1tQT6AZa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gbycWsQ9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF23D2128B;
	Mon,  2 Jun 2025 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aqEsf6q70H30o4xbnY9EWsifgP82PL0AbdPvEThMh6A=;
	b=TK5OBG0s22EdxueBDi/6kqgpSdZiFJAnU1Z7L2/q54W+FTm7wuDVsQURDV1HE9LbrYEa/W
	CSKIF0IPROpEEgCSAMK7NP9IRzFl7A6LCDgJ1ihOaCbcprRaZNsUYGDBJl7EAa2NjtlD0p
	Vgt4Zr1CSUX1l9LTKgJrHPbZYsxTsKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aqEsf6q70H30o4xbnY9EWsifgP82PL0AbdPvEThMh6A=;
	b=oaZptSvcCT+8qlflnWurF0KrVBBO08ePnTub9wIVH/Niek82JPPfRfybZe4XjvlrGdEt/Z
	QlBbnf+8tNb7PMAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1tQT6AZa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gbycWsQ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aqEsf6q70H30o4xbnY9EWsifgP82PL0AbdPvEThMh6A=;
	b=1tQT6AZar8wUkyV5mzET33diW1T71TnReYuKI3rIcJ5T60BuFssH23qwEGRJ7UieW0VOo9
	kCAshZYhgQtZvZr2yqoQumPRtSx6mTm0r5ObxkmiQeBdVeZLlk+S5zZkR0PV9GUJyMcl2w
	dFGHhVSP3nl3EPuQieoLhmx3OclFZE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aqEsf6q70H30o4xbnY9EWsifgP82PL0AbdPvEThMh6A=;
	b=gbycWsQ9Zbk2OlSbgu6n0TP7YfPfs5lDTtvJ+A/ymm4kxBCSSpHEJCOFNy22pdRLPlKn7v
	rILDamCS162GAiBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0F3D13AE0;
	Mon,  2 Jun 2025 14:47:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VEAXMZG5PWgLXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Jun 2025 14:47:45 +0000
Date: Mon, 02 Jun 2025 16:47:45 +0200
Message-ID: <87tt4yxkry.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
	"perex@perex.cz"
	<perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda: Add new pci id for AMD GPU display HD audio controller
In-Reply-To: <BL1PR12MB51449240DD771DB4C8005890F766A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250529053838.2350071-1-Vijendar.Mukunda@amd.com>
	<BL1PR12MB51449240DD771DB4C8005890F766A@BL1PR12MB5144.namprd12.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CF23D2128B
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.de:dkim,suse.de:mid,suse.com:email,alsa-project.org:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 29 May 2025 22:26:07 +0200,
Deucher, Alexander wrote:
> 
> [Public]
> 
> > -----Original Message-----
> > From: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> > Sent: Thursday, May 29, 2025 1:38 AM
> > To: perex@perex.cz; tiwai@suse.com
> > Cc: alsa-devel@alsa-project.org; Dommati, Sunil-kumar <Sunil-
> > kumar.Dommati@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; linux-sound@vger.kernel.org; linux-
> > kernel@vger.kernel.org; Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> > Subject: [PATCH] ALSA: hda: Add new pci id for AMD GPU display HD audio
> > controller
> >
> > Add new pci id for AMD GPU display HD audio controller(device id- 0xab40).
> >
> > Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> 
> Is there a way we can just add a default entry for all ATI HDMI HDA
> endpoints?  It would avoid then need to add an entry every time we
> release a new endpoint DID.

We have already catch-all entries for ATI and AMD vendors, but those
are setup without AZX_DRIVER_ATIHDMI_NS, that is, for older chip
models.


Takashi
