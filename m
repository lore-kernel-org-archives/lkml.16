Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA966274B3E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612713; cv=none; b=ZXLm7ZL7uo2+4HDiooDHJd0P+OqJp59klCK69c408+5k2FZlADCtMr+AKLfifQ5QgUwn1hUGjbWyQOWSobE2yXVwKDxbkjIyev2kD6ojO9ATBJJ8HpR1HwwYoNmy6yXwvLy4EeN4rTBCL+XfqfG/lkIZft5mdt7DY9SN5Ev4uDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612713; c=relaxed/simple;
	bh=YPVR7o7qred1MngT1nwf0an9ZdNH8l4rjSE6O+Jdy10=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mKpj8ziqvoFw1fF6RmnCPOvCS84IvdBBUT1cSiLuSbXwhNwaLJX2+jIgZ4AJ7nGnWvDKXky2V8pD7//cgUJkfnOQwKLSPRBwfI989cHmtWlrxntB4naJ/Eg1Bo9myNPzlsOHjAXVuqDEpR2i3TFoiKhCNvu+J0F6DgMZKC8fyt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NFiGep+h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xvx+6pPD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dLK9EkbD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=um97H1k7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NFiGep+h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xvx+6pPD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dLK9EkbD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="um97H1k7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8616C1F454;
	Fri,  4 Jul 2025 07:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751612703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iNhdM9xkRWMjDPBL22GDH5LnDVCwNFoYo/1y+b6wHPY=;
	b=NFiGep+hIh/M6ZU3CGmFQI+EFgHrJ76BmBROYrHttAGDr1DXD2yvJh3TBhXQHPvSMszo8Z
	HAFcDYnSfwoeB10XTqcblo9p2TmO0RHO20qtrSui2yrhaq3/ottJqHAb5AZRJh25CeRPZt
	KBIhkHpt6IDC1u6xl9pv4X/FWuobVgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751612703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iNhdM9xkRWMjDPBL22GDH5LnDVCwNFoYo/1y+b6wHPY=;
	b=Xvx+6pPDWVtChqktUi4SgIAOqOMGDnTbYOlq9oVu1OmNJt9M989xEpv4yWLSR+0H8xVgjD
	eDy44hN7yk8FGWCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dLK9EkbD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=um97H1k7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751612702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iNhdM9xkRWMjDPBL22GDH5LnDVCwNFoYo/1y+b6wHPY=;
	b=dLK9EkbDvMZgfKj+6bTmkSDXlOwiDBD8Q+dsHVkizkFRvxoGLVFV8MXxvT10Bxey1xBnNv
	wRXWeOXYYUMQROxVXYG9slUFIK7YyuVUzFQbAkGUWGMS8ri3z09wQCdvdnuVLyTRv0gwF4
	CLd7PWINdSe2RUmVvq6jtKcedqH24/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751612702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iNhdM9xkRWMjDPBL22GDH5LnDVCwNFoYo/1y+b6wHPY=;
	b=um97H1k7IqIWm9orVevX7DfDbUnxf/fX9oKRytZZs7Oi2RjFcEUXhObf14h1LuoZH4HI8U
	JwYBD7FNju1TPrAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4876413757;
	Fri,  4 Jul 2025 07:05:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bzR0EB59Z2gSdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Jul 2025 07:05:02 +0000
Date: Fri, 04 Jul 2025 09:05:01 +0200
Message-ID: <87frfcphb6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: mtpav: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250703134255.3948-2-thorsten.blum@linux.dev>
References: <20250703134255.3948-2-thorsten.blum@linux.dev>
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
X-Rspamd-Queue-Id: 8616C1F454
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Thu, 03 Jul 2025 15:42:52 +0200,
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
