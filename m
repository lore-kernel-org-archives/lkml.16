Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06261234970
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570845; cv=none; b=RajxxKX8MQinPhlsVy8OEpS7YOCvQKkjgwKwlD01Ggw948PhWhZV+xtbPHhAZXwLmGsHMkttnOMSex+SHMp5E+dsytsPIet5+sWjP3cVSV4jrd6pPBFcy0HrIxnWXE24+Pw8xf1ztBc71+UbWM4FA+1WvCY+g+PrW22XoehzPlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570845; c=relaxed/simple;
	bh=7zpIauZi2y3KxkbRsPtn6tj1vuZMF5W3CDAg7x6Tm9s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lBBWGXQ+au9aL3p2Eo8zSIPphQO694Dr03eZZkgguDKH6oSUwlimuAO61evKD5tZiTYzJC49BhTDb/mb+Zu0aciCoKKiGgWo33r6SoWcRpY+YToAsh3ZCgJo6THsP0OkitL+8ocVLMdFAB0+IUFYCl1Z6cbW2PCQnKKeSdLnkDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T6Pgjj24; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IJFfJnOq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aNtiIjZJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HjCpOOrA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T6Pgjj24";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IJFfJnOq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aNtiIjZJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HjCpOOrA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B6D81F79E;
	Tue, 10 Jun 2025 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749570842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xWCeRdGzABEyBlWgT5L7nsAwVMuulDsRU+gqM3E7azU=;
	b=T6Pgjj246hguhskRv/qQtVPiK61EUoDuolumiP0OC2Icu89NWYVdeMQardrIGeo8b0N+IR
	ic75yyiCFcxKySOVWWDwnOaL8PBbq0lwwWwZN+CLOtvGU1W1dbgINF7K3USNuryXWJ3DaL
	LuD/JE2gPbgcYLz1gaY/yC4UeRJ9UKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749570842;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xWCeRdGzABEyBlWgT5L7nsAwVMuulDsRU+gqM3E7azU=;
	b=IJFfJnOqTUYBl0FwRKlNtvAHAfhbczZDqSy18JWRZY5QHd8CS8h5NQDYU6mrz81rvkP6Nv
	z8ssh7MCxKS2OXBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aNtiIjZJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HjCpOOrA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749570841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xWCeRdGzABEyBlWgT5L7nsAwVMuulDsRU+gqM3E7azU=;
	b=aNtiIjZJpo6OR1AzSwYcTUsr5vDY9iLna/B2gg4varX4NdX+pNEhF7PFTONa5yUuR3XCPJ
	HE9CfJoxw+mqm1DEFTRxyravj5HuEmpQj+rjKwBE/zGWJ0BM0Bsm8MwuD01OHHPr2ivolq
	sYdDK8bO9kkfpyihvNrtycEP8A9+jSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749570841;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xWCeRdGzABEyBlWgT5L7nsAwVMuulDsRU+gqM3E7azU=;
	b=HjCpOOrAYQG6H7+yX5orb1pgf5WWnPNTHQe07a+5rVB0hvTpFOXwXGhcdoXFc13YKFyv1q
	hM8V7p8lTdor0iAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 026DC13964;
	Tue, 10 Jun 2025 15:54:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8ROXOhhVSGh8WAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Jun 2025 15:54:00 +0000
Date: Tue, 10 Jun 2025 17:54:00 +0200
Message-ID: <87cybby4mf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,	Takashi
 Iwai <tiwai@suse.de>,	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: mips/sgio2audio: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250610121835.2908-2-thorsten.blum@linux.dev>
References: <20250610121835.2908-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3B6D81F79E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Tue, 10 Jun 2025 14:18:33 +0200,
Thorsten Blum wrote:
> 
> strcpy() is deprecated; use strscpy() instead.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now to for-next branch.  Thanks.


Takashi
