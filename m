Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219702367DF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406806; cv=none; b=b5LU51242XBQVGoeZA5QjsOIiGPaYBgnjXLpv4wGWJOfC0HrrQXKmdvaVEqBjFrYgfwTMh1v5s7cOD8MJapeSumCe7eeUMXrGJzxCkeERobUCzv1nz50xwk2pPntWbx31dO+8eYZ5aItlxQ+ph93//1ZUkKqEL9IwWPnSLFhxk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406806; c=relaxed/simple;
	bh=4t9se+4GUix+8DnOgFg98/XTY58guVYeePGBKqOYJXQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rPMS8Cx4qwcQjhcQH9dWVxHT8OpCWYvOiKxmP+vuv1ogE4gWGsKmVjrsW/1aqBXs17n0UQ+tRsgj3YbGuL5dVFGzkN605CM+h3WjRV0xItUbS5pinTkTtdl6YZRVWIdFdtfhorGb3V3yXG21R7iQSJygS1v5kyOzR76afTPkgGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aNplW2s6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rDHQbiQz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aNplW2s6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rDHQbiQz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aNplW2s6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rDHQbiQz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aNplW2s6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rDHQbiQz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4E9681F390;
	Fri, 20 Jun 2025 08:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I2vl7c5sv3NqD4IdivEfc/qb7/IiFjcb96vcadE1Y50=;
	b=aNplW2s69+BV0ebHWqAThFwN+WOsrOuRUQcE0Tfd2jUVYjCVxw+0yX3ffR8COQnG4+5B9Z
	WY78UjRjp6e51t55uoeV2x4PCETqM3ZXoaout/tWFJH1mvwqCrAL5xulIv45QRpjH32c/b
	vyyCnpxCyOi8l9gLBY+q1v14/usCf8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406803;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I2vl7c5sv3NqD4IdivEfc/qb7/IiFjcb96vcadE1Y50=;
	b=rDHQbiQzMDpcv4s+xEaZjnjJYnhEpI+fN7CQNeOTlO3HcmYQobbmP+ccppt8tO2s2nBfNB
	oyJc++kMmb8b6/AA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aNplW2s6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rDHQbiQz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I2vl7c5sv3NqD4IdivEfc/qb7/IiFjcb96vcadE1Y50=;
	b=aNplW2s69+BV0ebHWqAThFwN+WOsrOuRUQcE0Tfd2jUVYjCVxw+0yX3ffR8COQnG4+5B9Z
	WY78UjRjp6e51t55uoeV2x4PCETqM3ZXoaout/tWFJH1mvwqCrAL5xulIv45QRpjH32c/b
	vyyCnpxCyOi8l9gLBY+q1v14/usCf8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406803;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I2vl7c5sv3NqD4IdivEfc/qb7/IiFjcb96vcadE1Y50=;
	b=rDHQbiQzMDpcv4s+xEaZjnjJYnhEpI+fN7CQNeOTlO3HcmYQobbmP+ccppt8tO2s2nBfNB
	oyJc++kMmb8b6/AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB38913736;
	Fri, 20 Jun 2025 08:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2c41OJIWVWgsWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 08:06:42 +0000
Date: Fri, 20 Jun 2025 10:06:42 +0200
Message-ID: <87qzzex2el.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: aloop: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250618223844.1458-2-thorsten.blum@linux.dev>
References: <20250618223844.1458-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4E9681F390
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,linutronix.de,kernel.org,renesas.com,gmail.com,suse.de,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -2.01
X-Spam-Level: 

On Thu, 19 Jun 2025 00:38:43 +0200,
Thorsten Blum wrote:
> 
> strcpy() is deprecated; use strscpy() instead.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.  Thanks.


Takashi
