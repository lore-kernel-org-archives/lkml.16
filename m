Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9F2226D13
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406678; cv=none; b=K0OOTriTDqJQjOpdNMJmJJUeE6NC4V8iZhXf1h/kXbWUXnIDk8okjCtw5be/lp/M684/V9EMXzTf5NXgURQE7wUejgU4y3qcjHf/WuL1ILbVdfNHrOwlQkaoI0VKvCEjNRxNJgxRyGjzKQqSN8wpjUTyPv6TR7gkL/FQoJXiXog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406678; c=relaxed/simple;
	bh=1rhy81d+RuAtc7ZYN9DIIZpIf9I9UYH9nTgf9vhsOaY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sE+jCWEuLJZn+VsRavbapJUJtSk4xGYjmu8UeCGGzB+cDp3ZXi0ktuRaCsAI1K0sQRx6+Enzs/hn1/pEXl0yFIB45BWFdrYmFVFXXepQ+HxEFwpQGhXVg+IL5Bns909eveD1hEEZYeZiBoOZtK/rR/aiG3pAn+RTR1xBZe4CEsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w1mXir5u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=upjJ6gwW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w1mXir5u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=upjJ6gwW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w1mXir5u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="upjJ6gwW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w1mXir5u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="upjJ6gwW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 61A381F38D;
	Fri, 20 Jun 2025 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n+cXAFgm8fewQNpOgQTL7i1df/IP0OqOMaJYMBANFNs=;
	b=w1mXir5uqcynEeYR/+Ma1w3zxjlrvD4vh6tf2zBe6YOZjaK0vRroFFfHhRhgGzM0YDxwcn
	CLV8fB2Fe0sPgqVSaX2jOS1NV6/1X5cVQHTztvM7vzu7utjnN0kmZ6ksMcynTLZe3v/wCc
	W59kbkSwQM5I33QkwSS6wudIl8HhWoc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n+cXAFgm8fewQNpOgQTL7i1df/IP0OqOMaJYMBANFNs=;
	b=upjJ6gwWFtwJLk5D43Dp1kwKokvilDtgu8SCeICLW9GTuaIvNfmauIQeQerpsMGdfIpWMU
	LvibrpLIh8+dJTBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w1mXir5u;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=upjJ6gwW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n+cXAFgm8fewQNpOgQTL7i1df/IP0OqOMaJYMBANFNs=;
	b=w1mXir5uqcynEeYR/+Ma1w3zxjlrvD4vh6tf2zBe6YOZjaK0vRroFFfHhRhgGzM0YDxwcn
	CLV8fB2Fe0sPgqVSaX2jOS1NV6/1X5cVQHTztvM7vzu7utjnN0kmZ6ksMcynTLZe3v/wCc
	W59kbkSwQM5I33QkwSS6wudIl8HhWoc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n+cXAFgm8fewQNpOgQTL7i1df/IP0OqOMaJYMBANFNs=;
	b=upjJ6gwWFtwJLk5D43Dp1kwKokvilDtgu8SCeICLW9GTuaIvNfmauIQeQerpsMGdfIpWMU
	LvibrpLIh8+dJTBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2602A13736;
	Fri, 20 Jun 2025 08:04:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T7zPBxIWVWiKWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 08:04:34 +0000
Date: Fri, 20 Jun 2025 10:04:33 +0200
Message-ID: <87sejux2i6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: emu10k1: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250619174057.175676-2-thorsten.blum@linux.dev>
References: <20250619174057.175676-2-thorsten.blum@linux.dev>
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
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,linux.dev:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 61A381F38D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -5.51

On Thu, 19 Jun 2025 19:40:48 +0200,
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
