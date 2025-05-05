Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404001FBC8D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441597; cv=none; b=sh47jnuAzsJL7b6WBplJ9lj8S6rcL9puvTMWbf0gfLKtiwfyxR+N8eLDQmlx4irOJqmliGP/j4YDuNZGUz9LP9j0zDBfasOxS/AK73qrJ+dXj4I/S8UBjVaPhErzPkUbxt7pJbGqOw6GS/l3yxYuZnKwHZOtabnzfiyLIDyjvUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441597; c=relaxed/simple;
	bh=Ok0dInCMNvC7Na4B4ucFhiKhJYJnuXR7+HWYlpAKex8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KpuLggeXH0duGeiP0t9EH2KFq1rdhGPjsjfq40XYrJsyoZ1l33DLeFya74PzdRUv0NB1RIgzgu1D5A+YTQWKadADP4sOhnjKB8kaNkO6nEktcFSuyGBrjskaHBRG6aBMb7h2WhGsJaPcYW0TEtA3zP10PNfz4FOPSdeZ+rfa/x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ymtgsWUK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yrhG0toR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ymtgsWUK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yrhG0toR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ymtgsWUK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yrhG0toR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ymtgsWUK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yrhG0toR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D0741F78F;
	Mon,  5 May 2025 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746441593; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AWyiTQog1N6fpOEiLnxMiQLNZhNYtXyMZZIVHJnej1A=;
	b=ymtgsWUKJey5kWuc4EcfdDQYYScIlxaIFzvPBm/lXLQW6rhWr6bibzewTzcq/GpaSYS0eo
	kopycB3tUK9Kd2SJxDZICJswJy8Q8O2I1r6j5kyEam6Ecopm3uM8Kos3/x00fdvaZyK8VR
	NHUbuE2FKyHmrhSiFPHPBsDqwAflav0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746441593;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AWyiTQog1N6fpOEiLnxMiQLNZhNYtXyMZZIVHJnej1A=;
	b=yrhG0toRU8TlePIUl4pBAeC9SeAWFbxM78e3QCYA5PcS4zPtsPGimtH+f90mNoEIg6lkVr
	JJ/4XQXp5BnMG+Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746441593; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AWyiTQog1N6fpOEiLnxMiQLNZhNYtXyMZZIVHJnej1A=;
	b=ymtgsWUKJey5kWuc4EcfdDQYYScIlxaIFzvPBm/lXLQW6rhWr6bibzewTzcq/GpaSYS0eo
	kopycB3tUK9Kd2SJxDZICJswJy8Q8O2I1r6j5kyEam6Ecopm3uM8Kos3/x00fdvaZyK8VR
	NHUbuE2FKyHmrhSiFPHPBsDqwAflav0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746441593;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AWyiTQog1N6fpOEiLnxMiQLNZhNYtXyMZZIVHJnej1A=;
	b=yrhG0toRU8TlePIUl4pBAeC9SeAWFbxM78e3QCYA5PcS4zPtsPGimtH+f90mNoEIg6lkVr
	JJ/4XQXp5BnMG+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C08E1372E;
	Mon,  5 May 2025 10:39:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id i7UbBXmVGGgcAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 May 2025 10:39:53 +0000
Date: Mon, 05 May 2025 12:39:52 +0200
Message-ID: <87plgnqr2f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tas2781: select CONFIG_CRC8 for SND_HDA_SCODEC_TAS2781_I2C
In-Reply-To: <20250505052303.1812002-1-arnd@kernel.org>
References: <20250505052303.1812002-1-arnd@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,gmail.com,perex.cz,suse.com,ti.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 05 May 2025 07:21:21 +0200,
Arnd Bergmann wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The crc8 function is used by the common fmwlib module, so this has
> to be selected directly to avoid a link failure:
> 
> ERROR: modpost: "crc8" [sound/soc/codecs/snd-soc-tas2781-fmwlib.ko] undefined!
> 
> Fixes: 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and leverage SND_SOC_TAS2781_FMWLIB")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied now.  Thanks.


Takashi
