Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB3A2288C3;
	Wed,  5 Feb 2025 12:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738757072; cv=none; b=eJw/HtuaT+h/j/GMazWwucC7X60yxq+i7F1K6e3Kg3gyJNkKIyrQ38DZHESCVV9mmI7Hl30vyrHq0XRPm9N3RPs3iE28Gkhvr0YPw7FwxFwNx4bHJzD2X5Zcwz6SYeXbzt/VNaR/Sr0n67Ot0FAdHL7SXoPXe4AH4ZZ3OVXlWec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738757072; c=relaxed/simple;
	bh=1bLMpGd1k5Q/ssZ0/EGjEf0ovZ+RXqBFpaIG9jDgyBE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gHoJS6DspgyiDpyEZCFyrNPLd+zf1pa4G4dwm40WmdBv7K62qCuvNKL93m8Pb2NDbp3KrMtVL5EryC6fmYZ7YO6f9dUXy5CEpZuv+fTqUBUmDJk5wRUwKNnmSVERL52T6HDSxp9P0lbUAA1WODj8rvY3gz6ZL36ubjFuaeEAsx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=npbu8lB3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QjEH4/6w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=npbu8lB3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QjEH4/6w; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="npbu8lB3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QjEH4/6w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="npbu8lB3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QjEH4/6w"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 852B81F78E;
	Wed,  5 Feb 2025 12:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738757068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ck/ClqD/WpkHGwyD2Ns9w4bSr3cl6t1I+nfRxOIVVZo=;
	b=npbu8lB3e7aWppUfnn2SFReK7fDyiLvYR5HncR8W7wGZNtMaNTO5lfoE/8ZYfrXjSV8ebq
	nosiWT3NeRDoYkXFivzCTVSmNamXqHD3MQCq4i5y+v9NLnJn1MJ4UFj71OfouwUbhOu0Bq
	SebcB9nDhLXmqU82SZNpts3Wh33QjcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738757068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ck/ClqD/WpkHGwyD2Ns9w4bSr3cl6t1I+nfRxOIVVZo=;
	b=QjEH4/6wZdFoNlay/6xjFQMYTKFo89p9CHj/iSiCOPA1qEuc8fNtb3OtHuJsRj+OfJuiRc
	hcwt2CmbfIeHI1AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=npbu8lB3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="QjEH4/6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738757068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ck/ClqD/WpkHGwyD2Ns9w4bSr3cl6t1I+nfRxOIVVZo=;
	b=npbu8lB3e7aWppUfnn2SFReK7fDyiLvYR5HncR8W7wGZNtMaNTO5lfoE/8ZYfrXjSV8ebq
	nosiWT3NeRDoYkXFivzCTVSmNamXqHD3MQCq4i5y+v9NLnJn1MJ4UFj71OfouwUbhOu0Bq
	SebcB9nDhLXmqU82SZNpts3Wh33QjcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738757068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ck/ClqD/WpkHGwyD2Ns9w4bSr3cl6t1I+nfRxOIVVZo=;
	b=QjEH4/6wZdFoNlay/6xjFQMYTKFo89p9CHj/iSiCOPA1qEuc8fNtb3OtHuJsRj+OfJuiRc
	hcwt2CmbfIeHI1AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FA8113694;
	Wed,  5 Feb 2025 12:04:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QJk+EsxTo2eqXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Feb 2025 12:04:28 +0000
Date: Wed, 05 Feb 2025 13:04:27 +0100
Message-ID: <87ldukzjg4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ASoC: hdmi-codec: add ELD information to procfs
In-Reply-To: <871pwp28sx.wl-tiwai@suse.de>
References: <20250124-alsa-hdmi-codec-eld-v1-0-bad045cfaeac@linaro.org>
	<871pwp28sx.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 852B81F78E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Sun, 26 Jan 2025 11:01:18 +0100,
Takashi Iwai wrote:
> 
> On Fri, 24 Jan 2025 22:14:29 +0100,
> Dmitry Baryshkov wrote:
> > 
> > Follow the HDA lead and add ELD-related information to procfs for the
> > ASoC / HDMI-codec cards.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Looks fine, but it's too late for 6.14.
> 
> If Mark doesn't mind, I'm going to take this series after 6.14 merge
> window is closed.

Both patches applied to for-next branch now.


thanks,

Takashi
