Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AB71EB19F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126704; cv=none; b=YDbzNVe0gJplBEsrxBMxF3TC5yRt4TealD0kCDHW7h41RmGm/HizzWNstVwoc9B/m+mYcVO6E8FPCLDfV5roh6jJ8m3UMPG3QLTLItTKaw6xbGuKhlVhTcQ4YB1wRmhXePWF2jHxSKn2uA5qN6krtBr3d8QyTLnsRPSdrg9eyL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126704; c=relaxed/simple;
	bh=40aExmCVoPlZcfquIuAAxUWGYOANgfEV47GdQlqA1l0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQmJvH8nDtfJMM6r630Up5w0NVFGzKwZKzS728JABLYxzAaFJuV2DFDyCkxnjQa6SE3pMB+zK241+MY4AnMXkLtnqLDIBoNGv6eaydpCXbD+5siIafDdN7vOqREAdMHX2cFsLjvmImtiN2pxbuNs3WDbZnAEWdo0+zNeRzgcjSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j7dUpJNj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TI+aXlHt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EqvTWQKE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mxZmVP9W; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j7dUpJNj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TI+aXlHt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EqvTWQKE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mxZmVP9W"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 955161F6E6;
	Tue, 13 May 2025 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747126701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NpijyGXFfcCdjO/FFCryvn+8HicQuHCxXRyTV5HSkaU=;
	b=j7dUpJNjTtkCBLvMsd3myW8AllhbcrxCeU4Nh/w0h0xsyQjk+d5jogmnWqzM+XEDN/Akz8
	GZ70BRgkPg7P7PFcf7d2DqfjZhht3A+x2swRy5Vr/YtGK0Ub+UHhBquM4zxoR1WPKz1jM6
	8D6DrbcBU3oUYSMAFw0PDRlQXEF7bSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747126701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NpijyGXFfcCdjO/FFCryvn+8HicQuHCxXRyTV5HSkaU=;
	b=TI+aXlHt5WTGCn9tDoCFD/BBdBMCsP1/x5NXhf3bPQMOfzwcbi85Jd88PXMwWLhigNKNGz
	eMlvCEiX+3CYMKCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EqvTWQKE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mxZmVP9W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747126700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NpijyGXFfcCdjO/FFCryvn+8HicQuHCxXRyTV5HSkaU=;
	b=EqvTWQKE0YrR1toaY7pCSrczFZzWOQFVCrY2dO+GEWl7b+iEFC7190De40Bm9+qVF/Fc6n
	0UJ/jTwMaiV8PHf1ZN4KQ3Qt8vP1ECqBoUIj4D6OQXCr88YjxX9HR7TB0xucZHHj4d6xuh
	9HDSO67rwqxp6B8q1Aur9Ov4YhVSUt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747126700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NpijyGXFfcCdjO/FFCryvn+8HicQuHCxXRyTV5HSkaU=;
	b=mxZmVP9WhsiJQmKtJ5LWkM19ATasfeGfmmE2BTdDt+ENzox8l8+f1Pfaa9j/GD0DfkN7KY
	TpkPiCKEpOB9KUAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7AAE1137E8;
	Tue, 13 May 2025 08:58:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N2RtHawJI2jEfAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 May 2025 08:58:20 +0000
Date: Tue, 13 May 2025 10:58:16 +0200
Message-ID: <875xi4ubtj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: sb: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250512105754.35595-2-thorsten.blum@linux.dev>
References: <20250512105754.35595-2-thorsten.blum@linux.dev>
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
X-Rspamd-Queue-Id: 955161F6E6
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Mon, 12 May 2025 12:57:41 +0200,
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
