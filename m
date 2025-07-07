Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F87A28BAA4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875054; cv=none; b=IZ+z5TbEnPgNVOcFwaq8yGPF+LpDV28mXAtG6ICK/XzmFapfQ/OSMCsQH/j8IdkqCpj3l4d88xFAr4jzIlFARpNzXsKWH58h13w6tk7nsRFao9BXsy/4AiFK73lpcLd8ZzvmexZxIUEyA1qiayAyn9xz067ML3kyrj7npvnODeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875054; c=relaxed/simple;
	bh=BNtXI6K5RCIrHiaNuAT0td9mVfirnsJeRHBVePeXdz8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tVZ5PemO2SWeN2nLS6u+SwBkXXfIf6Gc6zrGfF9+tGLBPnxFrFMPZ7Agb1qFqv6dWVpsmhM1HdXhlEyPUz7RtbvFafa2lns/x9ivy8cF1gwwSvtcWIwNgSB03X7wUSF6zV6pqMEyurgMdWgRx4RZFhbh5ozHLHSFsevOFiAuc+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2HPeg7MJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bqAZV+qS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2HPeg7MJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bqAZV+qS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2HPeg7MJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bqAZV+qS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2HPeg7MJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bqAZV+qS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 07A1D2116B;
	Mon,  7 Jul 2025 07:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751875051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hDEgDLZXsyHM38uVRVvbQQHy283T0o/grMgEY23Wm+k=;
	b=2HPeg7MJ1siLppGgXBRo4KX9fSch8taSpbtlSrvbPDuceowWZzvJQIsA7SpMwsoC6wBZ+c
	umdvgiV1hinRnlCS1fS+3/r6XOmNRtc7MlqfLW6fkAT83EDiLAqGRlpXeArY36CRtq3p4I
	uxEoCI/ES/93XafpKlLenZYr1EPDimo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751875051;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hDEgDLZXsyHM38uVRVvbQQHy283T0o/grMgEY23Wm+k=;
	b=bqAZV+qS2JIjx1JRmMlPuSRtT93HLgzThVwZ6Vdo42GyN8m4sLWWn7Mdbv47VHa+UAw+QC
	UqzAl4EM4mjZkeDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2HPeg7MJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bqAZV+qS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751875051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hDEgDLZXsyHM38uVRVvbQQHy283T0o/grMgEY23Wm+k=;
	b=2HPeg7MJ1siLppGgXBRo4KX9fSch8taSpbtlSrvbPDuceowWZzvJQIsA7SpMwsoC6wBZ+c
	umdvgiV1hinRnlCS1fS+3/r6XOmNRtc7MlqfLW6fkAT83EDiLAqGRlpXeArY36CRtq3p4I
	uxEoCI/ES/93XafpKlLenZYr1EPDimo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751875051;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hDEgDLZXsyHM38uVRVvbQQHy283T0o/grMgEY23Wm+k=;
	b=bqAZV+qS2JIjx1JRmMlPuSRtT93HLgzThVwZ6Vdo42GyN8m4sLWWn7Mdbv47VHa+UAw+QC
	UqzAl4EM4mjZkeDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7C2813757;
	Mon,  7 Jul 2025 07:57:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7mpzL+p9a2hMKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 07 Jul 2025 07:57:30 +0000
Date: Mon, 07 Jul 2025 09:57:30 +0200
Message-ID: <87jz4ko2l1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,	Takashi
 Iwai <tiwai@suse.de>,	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: mts64: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250706160906.416270-1-thorsten.blum@linux.dev>
References: <20250706160906.416270-1-thorsten.blum@linux.dev>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 07A1D2116B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Sun, 06 Jul 2025 18:09:03 +0200,
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
