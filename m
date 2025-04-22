Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D218CBE1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326843; cv=none; b=E56k32R31Is+YIGEjJjgCt3E1v5BTirANSaxER3E/eWtaHJMm2AdN4ZwX0wZzNaQhHCuYMN5Efq6ScU49kZE6p6GwxRa5F5ihflrxaGJK+rVnxx2o7SEydDB8Pp/zX5SCcGEOc8SQdEtS0hMWPFKSSECrC1zEAvKeG8KHLPjmjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326843; c=relaxed/simple;
	bh=v8rarTBnH88kBBOaIdRRR1GZuNP3zVXGE6MWo1DgdB4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RESJBfk3JkOewz6fjQgMe9HVWr5KcFA9/DOBHkBWD2Sfv5xTYxeb09frjS/j3bMYkJn4C8WtdeqOFRan5ljooQN+oOjsg1DeEMqPVm7G1oruyiVVeJXAD/aYtLzcCTesDXARDphdczI8fdhD3Uczi132XxLFCMD91h99LTTJF4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gzpoavgt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2kSGLEhG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gzpoavgt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2kSGLEhG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gzpoavgt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2kSGLEhG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gzpoavgt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2kSGLEhG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9EDF1211CD;
	Tue, 22 Apr 2025 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745326839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKOzh1Sy9EUyITBcFi/dPVZRj55vyyBaFV0Vlnor+Mk=;
	b=GzpoavgtGR6QDgBRDd5wmDNjveJ13cXS/P8KGmgIKeJnuV0snvWY5P8WLuu2h4eDLDD/xy
	Hb1YdOBkoe2NBtYHUoytUmM+vLT331DbSYVOl55ApDQSpKpGUCbBGLhw6AjpoL8tSNIVfa
	uTu/vt3KVjFhzcmnIO5F99Zxz+OhZXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745326839;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKOzh1Sy9EUyITBcFi/dPVZRj55vyyBaFV0Vlnor+Mk=;
	b=2kSGLEhGImQ/5H+XxgZfNbQtmzi3b18q9ZUeCT9eIU1AWCkDULA3dnK78uPXzs/vNyGTn/
	8SOK0J34mxd2E+Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745326839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKOzh1Sy9EUyITBcFi/dPVZRj55vyyBaFV0Vlnor+Mk=;
	b=GzpoavgtGR6QDgBRDd5wmDNjveJ13cXS/P8KGmgIKeJnuV0snvWY5P8WLuu2h4eDLDD/xy
	Hb1YdOBkoe2NBtYHUoytUmM+vLT331DbSYVOl55ApDQSpKpGUCbBGLhw6AjpoL8tSNIVfa
	uTu/vt3KVjFhzcmnIO5F99Zxz+OhZXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745326839;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKOzh1Sy9EUyITBcFi/dPVZRj55vyyBaFV0Vlnor+Mk=;
	b=2kSGLEhGImQ/5H+XxgZfNbQtmzi3b18q9ZUeCT9eIU1AWCkDULA3dnK78uPXzs/vNyGTn/
	8SOK0J34mxd2E+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7540B137CF;
	Tue, 22 Apr 2025 13:00:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CYNcG/eSB2gBLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 22 Apr 2025 13:00:39 +0000
Date: Tue, 22 Apr 2025 15:00:39 +0200
Message-ID: <87msc8s64o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Make snd_pcm_lib_malloc_pages() debug message say "allocate"
In-Reply-To: <20250421085244.377228-1-wenst@chromium.org>
References: <20250421085244.377228-1-wenst@chromium.org>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Mon, 21 Apr 2025 10:52:42 +0200,
Chen-Yu Tsai wrote:
> 
> snd_pcm_lib_malloc_pages() is commonly used for allocating buffers during
> the hw_params callback, whereas preallocating buffers goes through
> preallocate_pcm_pages().
> 
> Having the same terminology in the failure debug messages in both
> misleads developers.
> 
> Change the debug message in snd_pcm_lib_malloc_pages() to use the
> term "allocate" to match its intended use.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> I found this small discrepancy in the ALSA PCM memory management debug
> messages that made it a bit confusing for me to trace code.

Thanks, applied now to for-next branch.


Takashi
