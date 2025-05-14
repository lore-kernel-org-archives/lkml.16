Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEA71F0E39
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213268; cv=none; b=ZuYZoagV7oS9KOnsLWlIg9zgB7uUaTDqvOwhrCWdhIJ0RzstENKtdpfj2ztYdN9cixD63G6tL1WI5ZDlfSKgnyR1wyJpGjJ7GadiEgQBofkpd/dwHJPyj9S9GFcmhMqAl07ClT17RQFgP4/j+bicqGNRFv1UfVaugoHzRYKAeM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213268; c=relaxed/simple;
	bh=5a/J82l/FsiN7RwRrItQJe+UKaOXPCVz+oSwduvCnmI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yyipb1Y4MbA65lGO5GtUXpQuk9Rbh1+fjD8YFBL6cSXfGaCZWXF6xoXfv0M99P9RgzNqT9EDJg4wvRjv5Pr24UWQaBUK1CVOa94IiCaXZr2rqQNYSWJ64bAX1SljHoiL1U0A6arKuXRKqyRYZ5+Bka7znGtvkwOPtPCcN1qM2PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KbdnmrDw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=coFnRWTC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FUvi4NTm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=W3xUxzfl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KbdnmrDw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="coFnRWTC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FUvi4NTm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W3xUxzfl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A1BC92121A;
	Wed, 14 May 2025 09:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747213264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Ydd3GOehVcWqg3d8LEwWSKjgXx1aOvAwrjBNsikyGM=;
	b=KbdnmrDwoQChK/qgAmW0vdEm459URhGaZy2vsifhHi0JPdnPD6mdwcrjkapos2M6K8Gnra
	isVSkz14MS2WPneP+rmCv+GH2fah39bGOkrTyFt4Et3HH7UZBmGLJABh69/RItOROMnQMo
	dUsv4n3I1oqfIw/pGRecXkbv82hSQHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747213264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Ydd3GOehVcWqg3d8LEwWSKjgXx1aOvAwrjBNsikyGM=;
	b=coFnRWTCtt/YDMscaUmRzlTYt005gdectI1qhZ3QRb4AHoczUNg04epHwCYcakZZ7/oivF
	XSB71yL9/m1eM1Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FUvi4NTm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=W3xUxzfl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747213263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Ydd3GOehVcWqg3d8LEwWSKjgXx1aOvAwrjBNsikyGM=;
	b=FUvi4NTm0VF/zYDpQ7qvQ0jOrvCAIKi208+AIGaTIXLlTVItliGInG4gbSSfHDggKScCdO
	ErwSUa7n9mINcg+/IXwVz+aMD9onYpORVus6ex7CmN1LgXniacgH6KzHepY1hoKwvIK/B7
	Lj3gfDpbmMLlQP2ppfYB91uuEFi5pfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747213263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Ydd3GOehVcWqg3d8LEwWSKjgXx1aOvAwrjBNsikyGM=;
	b=W3xUxzflyWxwxUiXY8VqwDcQUJx6NxdTj3CQ7poP7bEKW8JWMYZvP0ZBkQ2vnybv58oTzo
	oIFTkhUXwfVZEODg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5BA37137E8;
	Wed, 14 May 2025 09:01:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Xx8xFc9bJGjrHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 May 2025 09:01:03 +0000
Date: Wed, 14 May 2025 11:01:02 +0200
Message-ID: <8734d7va5t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ALSA: qc_audio_offload: address space cleanups
In-Reply-To: <20250513123442.159936-1-arnd@kernel.org>
References: <20250513123442.159936-1-arnd@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A1BC92121A
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action

On Tue, 13 May 2025 14:34:39 +0200,
Arnd Bergmann wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I ran into a build time warning and spent some time trying to
> gently rewrite the new driver to avoid the warning and make it
> behave more like other drivers.
> 
> I'm still a bit confused about what the driver actually does
> and why a buffer has to be mapped into a two devices, but I hope
> that either my patches clear this up enough, or if they are wrong
> are helpful to have someone else sort it out properly.
> 
> The patches are currently queued for v6.16 in Greg's usb-next
> tree, so my fixes look correct, I hope he can apply them there
> before the merge window.
> 
> Arnd Bergmann (3):
>   ALSA: qc_audio_offload: rename dma/iova/va/cpu/phys variables
>   ALSA: qc_audio_offload: avoid leaking xfer_buf allocation
>   ALSA: qc_audio_offload: try to reduce address space confusion

JFYI, the qcom offload stuff is currently only on Greg's USB tree, not
on Mark's or my sound git tree.


Takashi

> 
>  sound/usb/qcom/qc_audio_offload.c  | 158 ++++++++++++++++-------------
>  sound/usb/qcom/usb_audio_qmi_v01.c |   4 +-
>  sound/usb/qcom/usb_audio_qmi_v01.h |   4 +-
>  3 files changed, 89 insertions(+), 77 deletions(-)
> 
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Wesley Cheng <quic_wcheng@quicinc.com>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: linux-sound@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> 
> -- 
> 2.39.5
> 
> 
