Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B0927726
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285398; cv=none; b=qV2AVT/Jrd11+40QRxnYpoE0JAHPgz0H/4aeHjPPNYcjEnShbpzK0tbTS/QV26PXR6/pFh9xJ/2TphjXi5rBUKGIFbc4w0or3vot2JEOKEbvENz+tVwkyOt8YmnFyrPgIIB/TbTib5yQ+Aqq0/4lDK/vJADdggQeBW2SGAstO4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285398; c=relaxed/simple;
	bh=J3wsYlprhYN6GTp36QWD/H/Zg82KI7gHFU+7n2Hv8iA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pas9PjXYoiLW4DO+eLDoa4h6DqvtoeYC2MEOiiHcY7fWxup7FAURLoLVPzOurBw13P399nH8SgiuMXs5W7U19ZToMT+hxSx0dnc38M4UBbE62McX0BXg87h9IdUWXdefXyZqFnZJZh8RjIm50ZjRRtvM9VBKnrsVANy0ipH3hUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EGrcSMip; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6/fLGakv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E+m6e1u2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AbnY+XFz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EGrcSMip";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6/fLGakv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E+m6e1u2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AbnY+XFz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4E4521F444;
	Mon, 30 Jun 2025 12:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751285395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qKuBBtfKfSI5K2kyHv4A8DiKQIqGQtCpfkELpzDZ53M=;
	b=EGrcSMipX4jQx4CZtvb5ikdJrNzzqVYfoWMV0wfcvdDl6xN/J7gXa45zA7rsb3FYasoFmR
	+O4HQAzLiOiVMeTwi2l25owR1ObHaW/svwzDUN7ZfItdVc+EHUxu694CiePLY6DJOH0XZI
	GM3oEqPnximwQhNQxzgjgQgTfpAgnwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751285395;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qKuBBtfKfSI5K2kyHv4A8DiKQIqGQtCpfkELpzDZ53M=;
	b=6/fLGakvxZ4NeSdnm97IFYm++6nFGMJFioTBd8OSN8s4wIU9xBeIZwoXTFwprpTjDmINlo
	s3qh8/oXB3uKwzCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=E+m6e1u2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AbnY+XFz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751285394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qKuBBtfKfSI5K2kyHv4A8DiKQIqGQtCpfkELpzDZ53M=;
	b=E+m6e1u213L/wbq59mHx2nU4fKOTM0FcgHQ0meYw3P4/+MB30g/zJC/eTbaSIuOPe7APE9
	+5EsKg/flIQ45JWytHGRmMZAxjSA2wvOXJ9rSk4at0HdH/lModUAyscmX+RBWYgsDCQd9e
	1Z2BGZKu2TkRcIMzc1SqtH8kCeA+dYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751285394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qKuBBtfKfSI5K2kyHv4A8DiKQIqGQtCpfkELpzDZ53M=;
	b=AbnY+XFzSW/ZcSThBcH04olslsQHFIGpbtBx7WH/fv73JlsvMNH4sk3VXPhZdwzb/NBdzc
	45+EpiH1CBw7YzBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 063E513983;
	Mon, 30 Jun 2025 12:09:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 385TAJJ+YmgVRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Jun 2025 12:09:54 +0000
Date: Mon, 30 Jun 2025 14:09:53 +0200
Message-ID: <87qzz1e8ha.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Nam Cao <namcao@linutronix.de>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: dummy: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250630110945.2225-2-thorsten.blum@linux.dev>
References: <20250630110945.2225-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4E4521F444
X-Rspamd-Action: no action
X-Spam-Flag: NO
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 30 Jun 2025 13:09:44 +0200,
Thorsten Blum wrote:
> 
> strcpy() is deprecated; use strscpy() instead.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.   Thanks.


Takashi
