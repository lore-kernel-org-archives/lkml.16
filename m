Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E457A1DF27D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127157; cv=none; b=K1fdy6GVf6Fm3u2tffWsxG8b1NYehnwoPLyUqE6Nb3gSd4/LmXinZB0LXC7keu5bct1YYE4adckT0xzy6vEihVoyYxEb6du/9ZxCNEJn4Q0cp9CMqwifTZcgPHhMONeWsj+8t3tFoP1MzaX0ceBtuMKNoPctxUS6RMo7rzCZ/hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127157; c=relaxed/simple;
	bh=WZkibP4wkY2K1VC1gg6ut9Sm4jUW0R5ijpWiQ8P0XHI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uBSKOgghw17NakSuOqvr08oVBOzgMZsTzLAs7FPECvpkyqMYUPsQOl9erMfTeAJ1dnPdagdiY9MKL+62r/XLX4/hmMPM3KjCkumbwJHvNLbO4SdqXuNY76KMdzo6Lrwgh/RQffjzYzEzcyHtd1AdFN/A5cAT+3VGMX+luyU8yeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gb4UDWu5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kBetGmQB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nBCSw3E+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B3TI5dvQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gb4UDWu5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kBetGmQB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nBCSw3E+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B3TI5dvQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CA8E41F749;
	Tue, 13 May 2025 09:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747127154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xrxk4u8PDg7ZA0bd6jJfxJtoDG/Rxrff/Qlo9Ip/rr4=;
	b=Gb4UDWu5JtRdbW8vBTA+1zHOoPkDZhjLCiAIjAZRh03L8oZp4qQSoIT/Xf9vXZAS0+oEP5
	5CnY5N6yUFaWAgoyub1kMH89qahX9IHh7GeF7p/fuIaVl+PES5Z7Z7Qciw5jwRJlKfZ4vl
	svmEKo1uzV19wNgofEdbFuuLKlInArQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747127154;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xrxk4u8PDg7ZA0bd6jJfxJtoDG/Rxrff/Qlo9Ip/rr4=;
	b=kBetGmQBfcJGBImyNOnAqBZFg1Hfzm3j9xyRSofBpZI1nD8N2NM/Ad/yi12HnC7+Z4gLSA
	1kPmvxW6NVFp5mDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nBCSw3E+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=B3TI5dvQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747127152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xrxk4u8PDg7ZA0bd6jJfxJtoDG/Rxrff/Qlo9Ip/rr4=;
	b=nBCSw3E+JJ0Ff9r0l57FUHVBGcap/zdh76U29DGfVVQGs4/JNdS3A4tFhbQJWsR6B0bnp0
	InN0qGTvH8bBsiaPBVcGdI11q2jnZaFTz+vDbWabi7qPXSDs9vxAEvC8WjXVc8Z+Zy131o
	R5ABTmSfUbQ79TExTLOecUWW1LoLikY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747127152;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xrxk4u8PDg7ZA0bd6jJfxJtoDG/Rxrff/Qlo9Ip/rr4=;
	b=B3TI5dvQYecHSh1nstNoPdTgSNbn8JMr9lTecbo/oshcuGKn4IEkmIAAS6CZ0H6H2e2lwy
	Cblj6pF2UAAbqOAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A96921365D;
	Tue, 13 May 2025 09:05:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4xHWKHALI2hYAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 May 2025 09:05:52 +0000
Date: Tue, 13 May 2025 11:05:52 +0200
Message-ID: <87zffgswwf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13564923607@139.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>,
	<Baojun.Xu@fpt.com>,
	<jesse-ji@ti.com>,
	kernel test robot
	<lkp@intel.com>
Subject: Re: [PATCH v4] ALSA: hda/tas2781: Fix the ld issue reported by kernel test robot
In-Reply-To: <20250513085947.1121-1-shenghao-ding@ti.com>
References: <20250513085947.1121-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CA8E41F749
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com,intel.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,urldefense.com:url,ti.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Rspamd-Action: no action

On Tue, 13 May 2025 10:59:47 +0200,
Shenghao Ding wrote:
> 
> After commit 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c
> and leverage SND_SOC_TAS2781_FMWLIB")created a separated lib for i2c,
> However, tasdevice_remove() used for not only for I2C but for SPI being
> still in that lib caused ld issue.
> All errors (new ones prefixed by >>):
> >> ld.lld: error: undefined symbol: tasdevice_remove
>    >>> referenced by tas2781_hda.c:33 (sound/pci/hda/tas2781_hda.c:33)
>    >>>               vmlinux.o:(tas2781_hda_remove)
> To fix this issue, the implementation of tasdevice_remove was moved from
> tas2781-comlib-i2c.c to tas2781-comlib.c.
> 
> Fixes: 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and leverage SND_SOC_TAS2781_FMWLIB")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505111855.FP2fScKA-lkp@intel.com/__;!!G3vK!U-wdsvrOG1iezggZ55RYi8ikBxMaJD
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

Applied now.  Thanks.


Takashi
