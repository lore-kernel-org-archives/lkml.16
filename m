Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5097328151A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455399; cv=none; b=QSTdPj96wB062uyF9EXxonEMbHyrrZBQX9mF+R4K66VhfqOpBAxnb63X/MZVSvNMAvYkEyo9zvorKLbeuSvr391WG/mVj1GzXz3O4LRorxwo0pxLYDH4wYds9FVvebTf10M2mrVogJVZQgwM41B0Ee3o8+/ifH8Sqz7DtrbJfp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455399; c=relaxed/simple;
	bh=HvhG7yiOcjpO6wvYrmMyEIsHG8DqbETxfYcaf0zkpq8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m6iGUioZjYiNdjVVZcHjmlTdY93vGKx7gQsADUHNEPyLW9H+rshqSxR7zMuRKDKKTZ5NjGgDkM1hD7rCTpoUs2G1FnXqbqMaC8CF/n9104LpxELh6ShVSZOeBXFyZ6GDmL2ltclj8vzcu00tXZPl372sRkYJMrksXjPePr/OORg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X720tbe1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gPDeU0+1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X720tbe1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gPDeU0+1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X720tbe1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gPDeU0+1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X720tbe1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gPDeU0+1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6FF3721190;
	Mon,  9 Jun 2025 07:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749455396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cT7iA3GnXogBl77oXFs+VurAdE9FUw0HbTu26mu+cuk=;
	b=X720tbe1rPoc542pYk7k/CjhfnuU+5AkyOSR6Uuig3m5g7pfa0BmXJ/VCaFeYREBJb+wV8
	FqoT72ohLlVirhljMkzi+tPM+R59M0P0BJ6BspIW42UH8mfEU3EA0euwK43Pmbpibk4400
	IcmH4tCpnhpdhxJrYrFRY+OPNkU08kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749455396;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cT7iA3GnXogBl77oXFs+VurAdE9FUw0HbTu26mu+cuk=;
	b=gPDeU0+13cmAyWFRZNtOomyo4jf0SkUhFhfr5k9nC8MRWTyGwXW1y6iqRyU9Ej4ssDb7ly
	HCriSMGrH//tF0BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=X720tbe1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gPDeU0+1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749455396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cT7iA3GnXogBl77oXFs+VurAdE9FUw0HbTu26mu+cuk=;
	b=X720tbe1rPoc542pYk7k/CjhfnuU+5AkyOSR6Uuig3m5g7pfa0BmXJ/VCaFeYREBJb+wV8
	FqoT72ohLlVirhljMkzi+tPM+R59M0P0BJ6BspIW42UH8mfEU3EA0euwK43Pmbpibk4400
	IcmH4tCpnhpdhxJrYrFRY+OPNkU08kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749455396;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cT7iA3GnXogBl77oXFs+VurAdE9FUw0HbTu26mu+cuk=;
	b=gPDeU0+13cmAyWFRZNtOomyo4jf0SkUhFhfr5k9nC8MRWTyGwXW1y6iqRyU9Ej4ssDb7ly
	HCriSMGrH//tF0BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40D9013A1D;
	Mon,  9 Jun 2025 07:49:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BcmeDiSSRmjRfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Jun 2025 07:49:56 +0000
Date: Mon, 09 Jun 2025 09:49:55 +0200
Message-ID: <87a56h8icc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	kernel@collabora.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] ALSA: usb-audio: Support jack detection on Sony DualSense PS5
In-Reply-To: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
References: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,collabora.com:email,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6FF3721190
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Mon, 26 May 2025 16:07:39 +0200,
Cristian Ciocaltea wrote:
> 
> The Sony DualSense PS5 controller has an internal mono speaker, but it
> also provides a 3.5mm jack socket for headphone output and headset
> microphone input.
> 
> Since this is a UAC1 device, it doesn't advertise any jack detection
> capability.  However, the controller is able to report HP & MIC insert
> events via HID, i.e. through a dedicated input device managed by the
> hid-playstation driver [1].
> 
> This patch series implements a quirk to create the jack controls for
> headphone and headset mic, respectively, and registers an input handler
> for each of them in order to intercept the related hotplug events.
> 
> It's worth noting there is no hard dependency on the HID patch set [1],
> as the usb-audio driver will simply bind the jack controls to the input
> devices when they become available - this is managed internally by the
> input handler framework.
> 
> Unrelated to the above, the series also provides fixes to a bunch of
> general coding style issues as reported by checkpatch.
> 
> [1] https://lore.kernel.org/all/20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com/
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (9):
>       ALSA: usb-audio: Fix code alignment in mixer_quirks
>       ALSA: usb-audio: Fix whitespace & blank line issues in mixer_quirks
>       ALSA: usb-audio: Avoid precedence issues in mixer_quirks macros
>       ALSA: usb-audio: Fix block comments in mixer_quirks
>       ALSA: usb-audio: Drop unnecessary parentheses in mixer_quirks
>       ALSA: usb-audio: Avoid multiple assignments in mixer_quirks
>       ALSA: usb-audio: Simplify NULL comparison in mixer_quirks
>       ALSA: usb-audio: Remove unneeded wmb() in mixer_quirks
>       ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5

Now merged to for-next branch.


thanks,

Takashi
