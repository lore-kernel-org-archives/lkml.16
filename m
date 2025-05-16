Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E181921ADC6
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382246; cv=none; b=dHNUGTfno8bMml3887qiJ4oZm2x7MxZEx/JhV51bnRUqcnWfyHESQ0MI7L4BR7zPNL7wwxTjbJAIODliF2qjTh82gZlEOSbuCpUf7ggUiObvoq2CgnUE6uIP/LSvEk0U4gjLex/aZs0J4GiiAx7tZDNa88nZ3Cem3kUhY4ZBly4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382246; c=relaxed/simple;
	bh=h+ZLQF886DPWyAx8bIzvZvBejNwbMd5cBA0T6CiVgk0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bX23dloLqpBvpEBwaEavTO9ISMrn/MZ3+asbadCxWB109g5RMrtnG7mbrKSqxkHX9CejpQt7Fs5YzzuOXyap8YdMsHk8Ea5IkqT7E+Do/MoOlACvtH+c3KmyLivsPHAM5Toinv9lAb+hsRWmacgf9STB/sI7oshHG6cM8EXX6L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D5CPXVP8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=63yRS3Yh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H6+3TOjM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jWUGYwdf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D5CPXVP8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="63yRS3Yh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H6+3TOjM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jWUGYwdf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D9A7D216E7;
	Fri, 16 May 2025 07:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747382242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K3gkvYB0XTRh8Gd5Dje2X8qgVwuSi/OTcBFjYgDROJQ=;
	b=D5CPXVP8VrNG3Zw/fVU6jlhs8uKBszNyZ98hR/zuB5/f6z1f7Eq4TgbiQvdj/bc4PotY76
	IlBQF21HSonL6sD92KPcygelPyS90jWduUUsaXC8ZfaiQhJum5R6hH1kacvdwz+Lly8b7m
	31QvkKsZ5qShQDJhCZXrwXX9UyyiZ4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K3gkvYB0XTRh8Gd5Dje2X8qgVwuSi/OTcBFjYgDROJQ=;
	b=63yRS3YhQSA7+/zyBCoI1pDizh5dpArAbQi68MfBhkmswal8KSE7u4QdbiEd31As5HT8GC
	E6gHbRjPfusMCHCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=H6+3TOjM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jWUGYwdf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747382241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K3gkvYB0XTRh8Gd5Dje2X8qgVwuSi/OTcBFjYgDROJQ=;
	b=H6+3TOjMTssJdLOM70SW+4PTkuqcOiV4C/plwFCASjtP5ygZx9ZmNbfgUjw3R+LC/dHYG0
	jLgHlf4g+4zpAhirSpQ9oUvkk24VDVYz6nFCctafR3Gp6CHykJml5CMhcjnG9vz/57/k8F
	/dFTxJcMFPHOpeXo+lYS4KTL65HMikc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382241;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K3gkvYB0XTRh8Gd5Dje2X8qgVwuSi/OTcBFjYgDROJQ=;
	b=jWUGYwdfwCWz6YPF+gc4av3E0qf9WHvEVOdO8Y7asEY/g3G0sr+J5bwZKilvq0lDiby7rx
	RNEG+AyNuU5FRqAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C37313977;
	Fri, 16 May 2025 07:57:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id //PUJOHvJmgYTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 May 2025 07:57:21 +0000
Date: Fri, 16 May 2025 09:57:21 +0200
Message-ID: <87y0uxvvha.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: g@b4.vu,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Use USB API functions rather than constants
In-Reply-To: <20250516070416.12458-1-nichen@iscas.ac.cn>
References: <20250516070416.12458-1-nichen@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D9A7D216E7
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action

On Fri, 16 May 2025 09:04:16 +0200,
Chen Ni wrote:
> 
> Use the function usb_endpoint_num() rather than constants.
> 
> The Coccinelle semantic patch is as follows:
> 
> @@ struct usb_endpoint_descriptor *epd; @@
> 
> - (epd->bEndpointAddress & \(USB_ENDPOINT_NUMBER_MASK\|0x0f\))
> + usb_endpoint_num(epd)
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Thanks, applied.


Takashi
