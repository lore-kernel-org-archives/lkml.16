Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B7248880
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753546; cv=none; b=M08DJQgVMOHEl3vRevqddtISQTOD3FuotHcXXBkhKA291HMS/iEs9FfUQanJ4lYE9fWQSfEhDXQsPSTopIkI3I50CVuA+LLRPEqHX+TZhxBGsIy+JATiZIhfVPVOzXs8fhkRdw1uPXAezgfNkSZXQU5svdU9e6d1j420Ens3MEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753546; c=relaxed/simple;
	bh=WsCmZE6j5dqNhNx+p5lMZwXY0aoDrCXifeYdN+YsGmM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oIO9v9hoNCHIhpbw/ahi3as5gma4v7fWaCVHX+jXibgPVE+RRyIhy/zf6wizBLh6G6IpEUb/Wu5beSxjCbj8NkZaVBjRu9lZWS1TWm+uo+JczebERgqQ5pyxxNvoMjjjtFbQW/3oyW6VyKAG3vHFRaS1cyNDXEwYEZ+J3wdEMhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IrMF+meO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=juGlLOTK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IrMF+meO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=juGlLOTK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IrMF+meO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="juGlLOTK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IrMF+meO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="juGlLOTK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 56CE62116B;
	Tue, 24 Jun 2025 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750753543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=giWYgG7/fs8FdfQPHWkc+hiQdHnal0Cy9gldgNUZ2F0=;
	b=IrMF+meOyoOZxiu8KDU3LmpReeFoUkOlD3mrlO5ionzxFJwd6Ub2Mt5Y8Yblc8QWs9sp/o
	UpnsY9U6hAjAOguiPwaK2tYh4kRcFjyiZnq5P/PgH7n9iiPsD2WLSWIP2PkVhXHC1gWEl8
	pJFakYQL4yn05xwoPnk0D/sqk9BWJng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750753543;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=giWYgG7/fs8FdfQPHWkc+hiQdHnal0Cy9gldgNUZ2F0=;
	b=juGlLOTKIDsde3uxOf9T3e9Zbh6wU/IyEG+13pmaE9UYEQd7FsZ9rA24WPrfGaj+s21AUA
	2T+LjvuNF1PH4UCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750753543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=giWYgG7/fs8FdfQPHWkc+hiQdHnal0Cy9gldgNUZ2F0=;
	b=IrMF+meOyoOZxiu8KDU3LmpReeFoUkOlD3mrlO5ionzxFJwd6Ub2Mt5Y8Yblc8QWs9sp/o
	UpnsY9U6hAjAOguiPwaK2tYh4kRcFjyiZnq5P/PgH7n9iiPsD2WLSWIP2PkVhXHC1gWEl8
	pJFakYQL4yn05xwoPnk0D/sqk9BWJng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750753543;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=giWYgG7/fs8FdfQPHWkc+hiQdHnal0Cy9gldgNUZ2F0=;
	b=juGlLOTKIDsde3uxOf9T3e9Zbh6wU/IyEG+13pmaE9UYEQd7FsZ9rA24WPrfGaj+s21AUA
	2T+LjvuNF1PH4UCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2781F13A24;
	Tue, 24 Jun 2025 08:25:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1RhLCAdhWmgwCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Jun 2025 08:25:43 +0000
Date: Tue, 24 Jun 2025 10:25:42 +0200
Message-ID: <87qzz9lf5l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	quic_wcheng@quicinc.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: qcom: fix NULL pointer dereference in qmi_stop_session
In-Reply-To: <9da1a13ffee0924e4813ef5b20625a89680ce88d.1750745062.git.xiaopei01@kylinos.cn>
References: <9da1a13ffee0924e4813ef5b20625a89680ce88d.1750745062.git.xiaopei01@kylinos.cn>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 

On Tue, 24 Jun 2025 08:06:06 +0200,
Pei Xiao wrote:
> 
> The find_substream() call may return NULL, but the original error path
> dereferenced 'subs' unconditionally in dev_err(&subs->dev->dev, ...),
> causing a NULL pointer dereference when subs is NULL.
> 
> Fix by replacing dev_err with pr_err which doesn't require device context.
> This safely handles NULL subs while preserving the critical debugging
> information (pcm_card_num, pcm_dev_num, direction).
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  sound/usb/qcom/qc_audio_offload.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> index 5bc27c82e0af..556fd9cb4fa6 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -759,8 +759,7 @@ static void qmi_stop_session(void)
>  			subs = find_substream(pcm_card_num, info->pcm_dev_num,
>  					      info->direction);
>  			if (!subs || !chip || atomic_read(&chip->shutdown)) {
> -				dev_err(&subs->dev->dev,
> -					"no sub for c#%u dev#%u dir%u\n",
> +				pr_err("no sub for c#%u dev#%u dir%u\n",
>  					info->pcm_card_num,
>  					info->pcm_dev_num,
>  					info->direction);

if we replace with pr_err(), it should show a bit more relevant
information; otherwise user can't know who spews this error for what
reason.

Alternatively, we may replace the device pointer with another existing
device, e.g. uadev[idx].udev->dev, too.


thanks,

Takashi
