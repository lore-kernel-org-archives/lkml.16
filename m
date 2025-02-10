Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D6D1BEF64
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176104; cv=none; b=mtOL7NVJkiY3pagZgMmzfsWU79vsJdptE3NCUaJx7H7b3naZYJY5KTvf7L8HxVQMBlN/3EIMVdR9xHzklxzdmMJTar8Ik6dx0ekudu/3b+tK+voxy/LD2NyiK6Mp8+hpoz/EwiF5vdO72NnUfYScyejQFsO7+/+eWFyiex363io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176104; c=relaxed/simple;
	bh=XWPoECHZNkMmKJwgqRQTP229rzGTR21vYibW47hqCRs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+OecFBTm6vkcmG12H6iUc+3iKJDIgn/NIVZr73XU2i1M8tuA7J3HgYgVsZs8NDxdOQHJQ9FcNfo1OiJJW8yOM2u4eHI+yL6MxujMRqEbh/EbULedfb37BrRhf1uWxrlFdphngB/9LKskHQuebBlemRxFdTnRvDGPrL2jr8vbLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dkZVwRgq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d8wmVDRJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qFsh+awb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OJVJighT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dkZVwRgq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d8wmVDRJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qFsh+awb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OJVJighT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 742E31F37E;
	Mon, 10 Feb 2025 08:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739176100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aVUFhejqSK7La5ZbOzSg5n1W3PVmGWAYm2nTSli2C6E=;
	b=dkZVwRgqPDBW3YXwUYxsjTFftnOXvvamX5/tsRwXgIJnQCVBZXkmwZRuTvutAHCkwPtjbt
	NL1E8HpLYJXKcBdqDuQcQ/0Bs1hr5OfxxmPNSpECH3pIjGGRQqEuG4yCJD1YBRcTti6C4J
	6L2wtl41KtCU6W97C8tJJExjdO5uFGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739176100;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aVUFhejqSK7La5ZbOzSg5n1W3PVmGWAYm2nTSli2C6E=;
	b=d8wmVDRJqicHnnKvRejmclpyeKdkwSfLqpb1M1ajDcBlrkYj8a/OFyr9fpqBi66hyS2rmc
	wHtVsu+0FAICz0BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739176097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aVUFhejqSK7La5ZbOzSg5n1W3PVmGWAYm2nTSli2C6E=;
	b=qFsh+awbHOHrZZAI7HwNhX97extjA8zXfIK4V70G99bi9cD3G0jrfkL9rHUi7RpSBsAdi0
	ADuRfpIq+IuEaK9b513kPxM9ZKoJ3lxEcyZGYuVePriOcqSiCDHJBo7IRRuQ8S48wFtgxo
	vZbL1+cKLDfQHa75H6tPb6dM5h66cww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739176097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aVUFhejqSK7La5ZbOzSg5n1W3PVmGWAYm2nTSli2C6E=;
	b=OJVJighTlX4kmKxLT/JHUSL5Licsp8JwGTclvV6nCx2yIHTJn1kKB5C5YwTVc2dQF8RLMJ
	MWbGFZdVILDguvCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3628C13707;
	Mon, 10 Feb 2025 08:28:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xxDeC6G4qWcrIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Feb 2025 08:28:17 +0000
Date: Mon, 10 Feb 2025 09:28:16 +0100
Message-ID: <87jz9yurtr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nam Cao <namcao@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 44/45] ASoC: fsl: imx-pcm-fiq: Switch to use hrtimer_setup()
In-Reply-To: <ed4be9ec380a688291e3fc9b24f8c38a3f07a143.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
	<ed4be9ec380a688291e3fc9b24f8c38a3f07a143.1738746904.git.namcao@linutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 05 Feb 2025 11:46:32 +0100,
Nam Cao wrote:
> 
> hrtimer_setup() takes the callback function pointer as argument and
> initializes the timer completely.
> 
> Replace hrtimer_init() and the open coded initialization of
> hrtimer::function with the new setup mechanism.
> 
> Patch was created by using Coccinelle.
> 
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: Takashi Iwai <tiwai@suse.com>

Adding Mark to Cc, as ASoC is managed by him primarily.


thanks,

Takashi

> ---
>  sound/soc/fsl/imx-pcm-fiq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
> index 3391430e4253..83de3ae33691 100644
> --- a/sound/soc/fsl/imx-pcm-fiq.c
> +++ b/sound/soc/fsl/imx-pcm-fiq.c
> @@ -185,8 +185,7 @@ static int snd_imx_open(struct snd_soc_component *component,
>  
>  	atomic_set(&iprtd->playing, 0);
>  	atomic_set(&iprtd->capturing, 0);
> -	hrtimer_init(&iprtd->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -	iprtd->hrt.function = snd_hrtimer_callback;
> +	hrtimer_setup(&iprtd->hrt, snd_hrtimer_callback, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  
>  	ret = snd_pcm_hw_constraint_integer(substream->runtime,
>  			SNDRV_PCM_HW_PARAM_PERIODS);
> -- 
> 2.39.5
> 
