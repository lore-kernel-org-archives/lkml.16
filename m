Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F68026B77E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802720; cv=none; b=cHsKQgsQYgGt7AW8jIdAPmgZBrTTH+FL7HPVrCkke2K9jehfxjxls8x7Aua7E+vSQuRxgvQRd8AhRkIfIXmTv9GmZqK/XxumyLPNpqwlVVlIcLyFYyRVdWJjx6akWKxDd6xCt482gxZgkdvVe/87KoviJ8Hle8aAVGiTqfOvYGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802720; c=relaxed/simple;
	bh=cd1gpcpaehSCiuntUalvhcS4RFUKljD2NHaO+by7EFM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GhXOWzyCQy+QrB8HlkT5pkC1bsyfiR+4RcT6EaU/FcIBpjzg0WJDBmgjUeJ3d87TN6dt0RBX9MBxehK+UkSRjM6Pw/xv0yXebULMxLbA0zqE4wMEY40qL4VJF2V3wVCXo3jABaIhe4WNdsLXkblR65hIezC9VAzWAFA10aqkWNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f9OuD+eS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T9hp0W+2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KDdbe7kG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4kgYUPC1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f9OuD+eS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T9hp0W+2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KDdbe7kG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4kgYUPC1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F26D61F78E;
	Fri, 13 Jun 2025 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749802715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYngPVyg9qshCZ52yRAqDK8NOAU0EdgeYM1QBPDSvGI=;
	b=f9OuD+eS0qWOJwIgBRSd7f9w8gkuAivygEdXHg/0M8q78UUz57aOeAcYubT+hRfnF3MkSR
	vTgfm7SZcLaBqw/llN99+vocOx86xcqKVe90gj8aoCKXkArzLk/6dLp2wn76fWgiTXb4B8
	QeoA/E47uQP/3GUVDbk8whZoz68PBwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749802715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYngPVyg9qshCZ52yRAqDK8NOAU0EdgeYM1QBPDSvGI=;
	b=T9hp0W+2/Ojs0cLZig3umY/6kkhNj7l6kWeSQ9fTvru6O+e6UE0Ja/sLBg0wLOalHP9kdi
	sE8cV+33eUIbIvDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KDdbe7kG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4kgYUPC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749802714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYngPVyg9qshCZ52yRAqDK8NOAU0EdgeYM1QBPDSvGI=;
	b=KDdbe7kGKMhPMOximCvmn4oEw+geeg71MDW52G40vn8TNZG7Vu2GDvpSZSaRIFWsVNqzJN
	0zDg2FAmGCciVI8jLux+Q+i05COZ4LS7QAOzml/LG1eKRLz5jetHPlhlZ1stlHyDN03aQf
	KbTZAOPpoUS7wDqNDiGakPiVU+RgFvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749802714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYngPVyg9qshCZ52yRAqDK8NOAU0EdgeYM1QBPDSvGI=;
	b=4kgYUPC1BDb1jMXwztl2kzx+4j+lwwILOGUwflLIZgfnelgxQlBZnIyqKgXRL9X5dEcU9O
	ivpFSm6xSTCrkYDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B284913782;
	Fri, 13 Jun 2025 08:18:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QEg9KtreS2h6JwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 08:18:34 +0000
Date: Fri, 13 Jun 2025 10:18:34 +0200
Message-ID: <87o6usrr51.wl-tiwai@suse.de>
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
Subject: Re: [PATCH] ALSA: usb-audio: Rename ALSA kcontrol PCM and PCM1 for the KTMicro sound card
In-Reply-To: <20250613063636.239683-1-wangdich9700@163.com>
References: <20250613063636.239683-1-wangdich9700@163.com>
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
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: F26D61F78E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Fri, 13 Jun 2025 08:36:36 +0200,
wangdicheng wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> PCM1 not in Pulseaudio's control list;standardize control to "Speaker"and"Headphone"
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Thanks, applied now.


Takashi
