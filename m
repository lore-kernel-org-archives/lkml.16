Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D353130E824
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406566; cv=none; b=lop3c+zv78UQOEvtZqnB/2ZJlLvlUv/4TBbME3iHv8hCfkHaClVu7PXFtAEJjEPZ9b8cbz/+FyZYuw2mC+Kq7i6XsIIXGif43WifS7RVPhpqqdscWdOQLXWsLtATGjf0eUMuw0bzlUpBT0coomXzODRHoKlObIse53wpmmp+7vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406566; c=relaxed/simple;
	bh=2WZG8C7fEPTVbWiFa390P0pvJ1bfNM8X1R0mT18KTCA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PcePvHAYz1a1Ve0+1aO4vEyjlnUs7+zgc3h1ZJeBlOE5Pr0AGAKlEv7xovaMEHNC92OIVyw2xCNB6uRn0aCATkAw0FdZNV+T2CHDJ16D/3+qx4dkDPUCvIt2eFzNVDHZU8V4iWqdaGTbhnYH8D9jQOBred2row/p9TqwLBGAmCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xSQ3BENt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2aimzrqE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J2vGJ/wp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S9mNe68W; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xSQ3BENt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2aimzrqE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J2vGJ/wp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S9mNe68W"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D5E33211F4;
	Fri, 20 Jun 2025 08:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBdfHxgDJgOqigYeEcGRcZAqNtzox+8jCwZpAsLzJwI=;
	b=xSQ3BENt0Ey4p9oXPf0aelaBSBPr8+LPQqrGMLhP1AVzamyhjuYVucUZTNzDJgqlce/K2G
	97Jcc2atr+yGHI3e/Auixrzkm2wrhLQ4/YwsblB1HbngO/qsRuB6SnX1Th4y7zAuQ9rDpF
	Uqg/s175w8fSbn/WQM2ZTxkEV3P9P4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBdfHxgDJgOqigYeEcGRcZAqNtzox+8jCwZpAsLzJwI=;
	b=2aimzrqEVwTK2LNFM5vo/pNUEkftGIX5KjW+76JjYfvZB6SUOtNQtLjNlNDPe3EG606Kgl
	w2mH3V8TwvVuCHCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="J2vGJ/wp";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=S9mNe68W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBdfHxgDJgOqigYeEcGRcZAqNtzox+8jCwZpAsLzJwI=;
	b=J2vGJ/wpVUD8Ta/tzNw2e9U/MXAuddlSr+2kYlC5eOfOULs544qSJNE4PRyC7TbGQ37/p7
	ZRHDoDXnvIlZ0YAtML6MU3Gas2ufK/tD148/qLUrz9QbKTJecnUZXU6gNe5da9L5Wbvqr2
	cIPR0vTZdT6orXIqGbdIGz75xfcse1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBdfHxgDJgOqigYeEcGRcZAqNtzox+8jCwZpAsLzJwI=;
	b=S9mNe68WrNAyNiu/zjtEUn2GQHJ+vl9DqdbvRSAnyJX2/+dBVZ+6SPCG7khxKgHvCVp8+4
	ngyw5qXXPaC1viCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 954D713736;
	Fri, 20 Jun 2025 08:02:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mUsII5cVVWgJWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 08:02:31 +0000
Date: Fri, 20 Jun 2025 10:02:31 +0200
Message-ID: <87tt4ax2lk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdicheng <wangdich9700@163.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Fixup ft alc257 rename alc3328
In-Reply-To: <20250619071745.149299-1-wangdich9700@163.com>
References: <20250619071745.149299-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ASN_FAIL(0.00)[7.9.0.0.4.6.0.0.0.5.1.0.0.1.0.0.4.0.1.0.1.8.2.b.0.4.e.d.7.0.a.2.asn6.rspamd.com:query timed out];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RSPAMD_URIBL_FAIL(0.00)[kylinos.cn:server fail];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D5E33211F4
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -5.51

On Thu, 19 Jun 2025 09:17:45 +0200,
wangdicheng wrote:
> 
> Audio ALC3328 recognized as ALC257, updated PCI ID0x10EC12F0 to rename it to 3328
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied now.  Thanks.


Takashi
