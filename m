Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319D8264F87
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361935; cv=none; b=JzBslMvejMHaxEerUkVEhC1f5gVCPiMUjZSzATgxZh0BO/YdJJicKQrg4GwRBb8RuXw18kT6pME3uCMqoE47nSknZ/cZWE+rO170m9ZtU9gRsM6dbFWvw9h4WGJOXBo4mcNy5SAzn3eVIKYsbdQg51MtWhPcXPtP/6Kui7xfQ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361935; c=relaxed/simple;
	bh=ZeXz3hnou5gUJ75yQD8JJ/r5RYPaVcsjVrt5L/rQDqI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYOXLlDrnZyCqRdqqM4JrcDc7fnfSk5zRcc7AWGY9I+fyeAsLUELTfpELfE2HYZYElmbtyaVYoYUd3n84BRgXyMtBTTZrFTawQM2GqjahNOOCJ2pJlQGQBa4/2Y0txqwkvydFUmLCWmHViDsM86tPlprV2mxHRUSX0kJTIiBcKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EAsP1jgj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ONZulrbt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EAsP1jgj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ONZulrbt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EAsP1jgj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ONZulrbt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EAsP1jgj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ONZulrbt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4C3B41F393;
	Tue,  1 Jul 2025 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751361932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QjzDvJSUaHjKvTEfS3xyRuL6ex44DjNlXSXQL7mpsZI=;
	b=EAsP1jgjbANpw7/5E0jsGTVsLQXmBOhuloxwuQUgvxA4/9wGYIGBgKrV24938W2rOIX2Tl
	94MofYRR/es43A36Rhxqtc99xMdwoCri+HKz2lSjrIuk5FenDCMHO6ZbutSxBnPpPu/eta
	SnIYwyQYCf7wKibYXv82m8ysIn/h4+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751361932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QjzDvJSUaHjKvTEfS3xyRuL6ex44DjNlXSXQL7mpsZI=;
	b=ONZulrbtKQmM2QSxcsnIrSzMLSOe++pNHpXJJdxqJTBTG7gAJGHhetM/Z8zhEu66ZFBqJu
	YR4PQ4ylSFqc2NAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751361932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QjzDvJSUaHjKvTEfS3xyRuL6ex44DjNlXSXQL7mpsZI=;
	b=EAsP1jgjbANpw7/5E0jsGTVsLQXmBOhuloxwuQUgvxA4/9wGYIGBgKrV24938W2rOIX2Tl
	94MofYRR/es43A36Rhxqtc99xMdwoCri+HKz2lSjrIuk5FenDCMHO6ZbutSxBnPpPu/eta
	SnIYwyQYCf7wKibYXv82m8ysIn/h4+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751361932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QjzDvJSUaHjKvTEfS3xyRuL6ex44DjNlXSXQL7mpsZI=;
	b=ONZulrbtKQmM2QSxcsnIrSzMLSOe++pNHpXJJdxqJTBTG7gAJGHhetM/Z8zhEu66ZFBqJu
	YR4PQ4ylSFqc2NAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13B2C13890;
	Tue,  1 Jul 2025 09:25:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5x+PA4ypY2gKKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Jul 2025 09:25:32 +0000
Date: Tue, 01 Jul 2025 11:25:31 +0200
Message-ID: <87wm8sclf8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,	Takashi
 Iwai <tiwai@suse.de>,	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: mips/hal2: Refactor and improve hal2_compute_rate()
In-Reply-To: <20250630214554.182953-2-thorsten.blum@linux.dev>
References: <20250630214554.182953-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Mon, 30 Jun 2025 23:45:52 +0200,
Thorsten Blum wrote:
> 
> Assign 'codec->inc' first and then use it instead of the hardcoded
> value 4 repeatedly.
> 
> Replace the if/else statement with a ternary operator and calculate
> 'codec->mod' directly. Remove the unnecessary local variable 'mod'.
> 
> Return the computed rate directly instead of updating the local variable
> first.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  sound/mips/hal2.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/mips/hal2.c b/sound/mips/hal2.c
> index 991793e6bda9..dd74bab531b4 100644
> --- a/sound/mips/hal2.c
> +++ b/sound/mips/hal2.c
> @@ -313,21 +313,11 @@ static irqreturn_t hal2_interrupt(int irq, void *dev_id)
>  
>  static int hal2_compute_rate(struct hal2_codec *codec, unsigned int rate)
>  {
> -	unsigned short mod;
> -
> -	if (44100 % rate < 48000 % rate) {
> -		mod = 4 * 44100 / rate;
> -		codec->master = 44100;
> -	} else {
> -		mod = 4 * 48000 / rate;
> -		codec->master = 48000;
> -	}
> -
>  	codec->inc = 4;
> -	codec->mod = mod;
> -	rate = 4 * codec->master / mod;
> +	codec->master = (44100 % rate < 48000 % rate) ? 44100 : 48000;
> +	codec->mod = codec->inc * codec->master / rate;
>  
> -	return rate;
> +	return codec->inc * codec->master / codec->mod;

IMHO, this doesn't look improving the code readability than the
original code.  And the generated code doesn't seem significantly
better, either.


thanks,

Takashi
