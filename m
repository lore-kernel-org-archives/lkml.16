Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43022BFC80
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629518; cv=none; b=sqW1wByi+c25ezSXDHeF8Xu5aBqbEEcbqYMdWWCLCx1LMRQkgYTJTZLVZrDiSbthUR833+N+3ZMZlBMUpGsNNgs3qIVLWHH0WD1kNSpvMbcq4kGSPpZVIKla8NkLMUDW43UiDjIQR25pq/ooVEK5o6T2HgFxT5OCtx1tRdkHXNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629518; c=relaxed/simple;
	bh=WHtk3sag/jmUNWuOCiIhUds/ncp5s9Ef7qsxvCBXj0c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUnWlVEv7bhtMiuevt6bxQet80n/7v73eXGSv//zyU06UorZiWV1VwnIeC6rD1vZNBgHTCjiGgPd49mcImJvsAz2jdb36uWXCFtnKjEkPFwp1jlSASABtk44aNMW9joKgBP+EbAcb/7nqQzG+BvVB48xOiv17zIeTIPnuyNOkEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M5Pm4HhN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=elpCad+T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M5Pm4HhN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=elpCad+T; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M5Pm4HhN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="elpCad+T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M5Pm4HhN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="elpCad+T"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5E14D21193;
	Fri,  4 Jul 2025 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751629514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kxTd+L1PywZxAAcgvHW1FZ54CTZk37zes5hyIjxPw0E=;
	b=M5Pm4HhNIDCb8KFuRGr2KgM1ri1uCbbzNbUK+qvZJj1xdtJQIktAh9t4jPS6j9mHheGt8s
	7sNIzsbNPxqkNpSu4HMATHsTg5N0MyDsHPnn5JWVAsxfP+t0Cvxed0DB25VFR6cxnKN/ws
	awy+msOzDUHbPmghOCNWbIPVJ/ULFho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751629514;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kxTd+L1PywZxAAcgvHW1FZ54CTZk37zes5hyIjxPw0E=;
	b=elpCad+TikYpLXGqcIlAbcrqpKwMc/2EJYjZI8bb1EWk9yj4KCCx4NVKYRaubxVC9tyNmo
	evxqhp9IjJ3zaeAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751629514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kxTd+L1PywZxAAcgvHW1FZ54CTZk37zes5hyIjxPw0E=;
	b=M5Pm4HhNIDCb8KFuRGr2KgM1ri1uCbbzNbUK+qvZJj1xdtJQIktAh9t4jPS6j9mHheGt8s
	7sNIzsbNPxqkNpSu4HMATHsTg5N0MyDsHPnn5JWVAsxfP+t0Cvxed0DB25VFR6cxnKN/ws
	awy+msOzDUHbPmghOCNWbIPVJ/ULFho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751629514;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kxTd+L1PywZxAAcgvHW1FZ54CTZk37zes5hyIjxPw0E=;
	b=elpCad+TikYpLXGqcIlAbcrqpKwMc/2EJYjZI8bb1EWk9yj4KCCx4NVKYRaubxVC9tyNmo
	evxqhp9IjJ3zaeAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20A3613757;
	Fri,  4 Jul 2025 11:45:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GJucBsq+Z2gCSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Jul 2025 11:45:14 +0000
Date: Fri, 04 Jul 2025 13:45:13 +0200
Message-ID: <87v7o8nprq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 75/80] ALSA: intel_hdmi: Remove redundant pm_runtime_mark_last_busy() calls
In-Reply-To: <20250704075500.3222950-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
	<20250704075500.3222950-1-sakari.ailus@linux.intel.com>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Fri, 04 Jul 2025 09:55:00 +0200,
Sakari Ailus wrote:
> 
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  sound/x86/intel_hdmi_audio.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
> index fe5cb4139088..cc54539c6030 100644
> --- a/sound/x86/intel_hdmi_audio.c
> +++ b/sound/x86/intel_hdmi_audio.c
> @@ -1102,7 +1102,6 @@ static int had_pcm_open(struct snd_pcm_substream *substream)
>  
>  	return retval;
>   error:
> -	pm_runtime_mark_last_busy(intelhaddata->dev);
>  	pm_runtime_put_autosuspend(intelhaddata->dev);
>  	return retval;
>  }
> @@ -1127,7 +1126,6 @@ static int had_pcm_close(struct snd_pcm_substream *substream)
>  	}
>  	spin_unlock_irq(&intelhaddata->had_spinlock);
>  
> -	pm_runtime_mark_last_busy(intelhaddata->dev);
>  	pm_runtime_put_autosuspend(intelhaddata->dev);
>  	return 0;
>  }
> @@ -1589,7 +1587,6 @@ static void had_audio_wq(struct work_struct *work)
>  	}
>  
>  	mutex_unlock(&ctx->mutex);
> -	pm_runtime_mark_last_busy(ctx->dev);
>  	pm_runtime_put_autosuspend(ctx->dev);
>  }
>  
> -- 
> 2.39.5
> 
