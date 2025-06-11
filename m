Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B745F2777F2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648476; cv=none; b=D1oxhQUBpk+95VKXDWoTis6lblpeMWmp5s//shVTIkNvjfU25zt9HcpwBq0sVx1z9S0C7dsLv2KqKeGSxp+HRL9byg4dveiHsi5DC1aqyAD5UARSiLbsBtutm0hw6zF675sWi3lpl3DsO1p1PXFqqZYgIddBWmYrvnH6nxaA9Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648476; c=relaxed/simple;
	bh=tGq8foj6iLd6N0PhN2dK7hADifmXGY22WlvOGUXNhCA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q3IuAMsWWtA84aPYLn7MEBXxSh15BzMKR9AK9HzXvFQSp/OBZGEpz1KkFa4UfKHObjwZVDO0pRe8QwBB/F2txO+voo11LlhetOldedDNpn81mps5MaHcZXlEFiZe2aE32m7PTeNhe9PHTPz6Ler6e1EC4yz7MrY+qzsN1CdH+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qFfjohfY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BhYvHKV2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aV12Ip1t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X/3BgWm+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qFfjohfY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BhYvHKV2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aV12Ip1t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X/3BgWm+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E443521203;
	Wed, 11 Jun 2025 13:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749648472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s57eOMf5J5irzCCAHv57SCw/pxWuxYXl4EYw+BA8W9Y=;
	b=qFfjohfY9IptDgYU8SnNUN5PUqLM0vK0dAZSXhqseEY8TuThjcBeragZ3MiHozoZgvg/A4
	mL4X7Mk802aCKtmr2lTfqMWjz7PLOqbcl6WWvvL5zZuxjlyLEXsa0vh6ktO87ab7bfJWPn
	Gjyq9viWTCc3zXtOIa3kYTZJcr5cNhs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749648472;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s57eOMf5J5irzCCAHv57SCw/pxWuxYXl4EYw+BA8W9Y=;
	b=BhYvHKV2g/48hkZ6R6MetcSFnoMCV2c95uplVp3DPHwdYtTDYbz//3zFrBIz+mp+4ovgA9
	Wsbmy29LgVyEN6CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aV12Ip1t;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="X/3BgWm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749648471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s57eOMf5J5irzCCAHv57SCw/pxWuxYXl4EYw+BA8W9Y=;
	b=aV12Ip1tW4c1Y+loEWEln9BKXIn7LsSTwbQKrXsGw8WLpTRhutG5q3Wydzt7H4Pg7HVJRZ
	pz8XrtY2a4Swg1QUeM1MDAQ1LBZpcAJxzXCMK8g4ZhgXICmp+URXVZEpVXbNi1tjR3/fg0
	MfyXMjtLgzsDedGAHS96daeFze6cWvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749648471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s57eOMf5J5irzCCAHv57SCw/pxWuxYXl4EYw+BA8W9Y=;
	b=X/3BgWm+T1jTje9uamRwxCmxhEynHUqAUOJ6EvbvY9rkeqXaKkOUO5QwUv1OrnxFicCNL7
	jZJMgGY3+cuGr1Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CAB32139CE;
	Wed, 11 Jun 2025 13:27:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pkn1MFeESWhrTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Jun 2025 13:27:51 +0000
Date: Wed, 11 Jun 2025 15:27:51 +0200
Message-ID: <87cybawgq0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lucy Thrun <lucy.thrun@digital-rabbithole.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/ca0132: use snprintf() for kernel hardenning
In-Reply-To: <aEl_0XoK4Q__MOVU@stanley.mountain>
References: <aEl_0XoK4Q__MOVU@stanley.mountain>
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E443521203
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Wed, 11 Jun 2025 15:08:33 +0200,
Dan Carpenter wrote:
> 
> In this sprintf():
> 
> 	sprintf(namestr, "%s %s Volume", name, dirstr[dir]);
> 
> Then "namestr" and "name" buffer are both SNDRV_CTL_ELEM_ID_NAME_MAXLEN
> (44) characters long.  We never actually use that full amount in real
> life so everything works fine, but static checkers complain that if name
> is 44 characters then when you combine that with the other strings it
> will lead to a buffer overflow.  Using snprintf() silences the warning
> and makes the code a little bit safer for the future.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the patch, but the very same fix was already submitted from
Lucy and merged in commit a409c60111e6.


Takashi
