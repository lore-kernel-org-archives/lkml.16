Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8390A1EB9FF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750832947; cv=none; b=QXY1kVUIgvdrnIT2wuSiUlAM1zBUwi3Sf8MGHZniB/grfNxI2dF9nhO4OiTDwOexJE5I308E3xdgcfnKezIjtUMy33LDe5X9u8acrOmmq12nNDoOT4tZvpzrTEFJXeyJEqycq46MDU2hHYFzPXLG/Xr/2sujkVu2Gwh/3IJsT4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750832947; c=relaxed/simple;
	bh=NTCFzgExvT2a+HpenCrYgP1T+OswiH7bf1XmnaYAn90=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gLRrDG84UmXsWXKTe5cN5efQplZOX+lg/0VqOSc91sAbLfji/Pz8kxV7uH7599j9grIg7607VRs5RM2lDEEHHRc2upJUBARE+oLbqH9oxGIiW6FNiJHiRMAnG504toTTYIX8+GxS2eiHV6ghm9elN9yjRkjkJyAPi8UeVIQqPG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G5Ct1Jcs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6GZw2XYS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G5Ct1Jcs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6GZw2XYS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G5Ct1Jcs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6GZw2XYS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G5Ct1Jcs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6GZw2XYS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 96AA721162;
	Wed, 25 Jun 2025 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750832942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oV1b6m4mszPRKS1N3cHAQ1HOwDM4X4IQX1ss6KCeB0=;
	b=G5Ct1JcsLC6TMAO5IYfbmVIltLcarJUm8AmgP1sGjW572ycLLc6/iR1UHo3/WlBsIRo1DW
	WM2CUcLtq8i2T96fqhEkQkzlFTF/2xUyC/clxWYNbkGAREBEQ9zI90vhaOf5Ytit974aNp
	bo/EdRIpOQvs2DqkXnDOMOMp+Zn4uqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750832942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oV1b6m4mszPRKS1N3cHAQ1HOwDM4X4IQX1ss6KCeB0=;
	b=6GZw2XYSQvyUqryooNOTzOC/+1AfICCoxDrEsF9eXtr5MtAaGXW1bvINe/ZjnctnU1OoDu
	n8UqTuFCpaTOEABw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G5Ct1Jcs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6GZw2XYS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750832942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oV1b6m4mszPRKS1N3cHAQ1HOwDM4X4IQX1ss6KCeB0=;
	b=G5Ct1JcsLC6TMAO5IYfbmVIltLcarJUm8AmgP1sGjW572ycLLc6/iR1UHo3/WlBsIRo1DW
	WM2CUcLtq8i2T96fqhEkQkzlFTF/2xUyC/clxWYNbkGAREBEQ9zI90vhaOf5Ytit974aNp
	bo/EdRIpOQvs2DqkXnDOMOMp+Zn4uqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750832942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oV1b6m4mszPRKS1N3cHAQ1HOwDM4X4IQX1ss6KCeB0=;
	b=6GZw2XYSQvyUqryooNOTzOC/+1AfICCoxDrEsF9eXtr5MtAaGXW1bvINe/ZjnctnU1OoDu
	n8UqTuFCpaTOEABw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59C5213301;
	Wed, 25 Jun 2025 06:29:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KVRMFC6XW2gseAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Jun 2025 06:29:02 +0000
Date: Wed, 25 Jun 2025 08:29:01 +0200
Message-ID: <87ldpgjpw2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	quic_wcheng@quicinc.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: qcom: fix NULL pointer dereference in qmi_stop_session
In-Reply-To: <86ac2939273ac853535049e60391c09d7688714e.1750755508.git.xiaopei01@kylinos.cn>
References: <86ac2939273ac853535049e60391c09d7688714e.1750755508.git.xiaopei01@kylinos.cn>
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 96AA721162
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Tue, 24 Jun 2025 11:00:47 +0200,
Pei Xiao wrote:
> 
> The find_substream() call may return NULL, but the error path
> dereferenced 'subs' unconditionally via dev_err(&subs->dev->dev, ...),
> causing a NULL pointer dereference when subs is NULL.
> 
> Fix by switching to &uadev[idx].udev->dev which is always valid
> in this context.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Applied now.  Thanks.


Takashi
