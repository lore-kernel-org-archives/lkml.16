Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FF0191499
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751790769; cv=none; b=NrWiZ2vqpt3OuBeUAvLiJngNPsqXKgw59SmhVubokzl0HH6GkblsvY757FWQO1ZLGop4191BId7I08xMYbXYoJZXxVFuU/gDOuQYfoN5Chcnv+74SS3LgSDmzb15aCqbx8GQwRRaoVWoD4kLeEeEzi5Tc/CUlIXxHq7yTmj9acM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751790769; c=relaxed/simple;
	bh=VpbUf6O5SNTZuNfM6oLLsUo5l5NIjkYdE9EoWhqYBKc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=unoQfXa5NTN5XhU5lvcPcG/0O7ey4LNSputSI8W3tcxqdPA9a+4ALWwc23OSj2tEpPQ89ekKLWp5ojriwhuEDRXYyGAbiepgIss5N7va321N6kvY8ZJ2IqAaiut13Ty3oTnSfEVuurJsZ7lqNHBEp6EuAWmjx3gqNUAjSR7lrkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tFsVxnRw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MpAkRBmb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tFsVxnRw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MpAkRBmb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tFsVxnRw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MpAkRBmb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tFsVxnRw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MpAkRBmb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 197421F38A;
	Sun,  6 Jul 2025 08:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751789290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BzKPvjoDEpfOl3bBUxy7yxLXT2uY2JY1YGIcua8HXQ=;
	b=tFsVxnRwXHEmfrRpKnw5mUDt/LHcSGW9D54vR8IbBWZDmk/ctHOUq9cT2RbyCOtqnuaOz+
	ZifdGLoFrCCwzm6nI7EWylzLClnjowThNwO21fCM/X7YnTyeSPFYkWm0hLRfHAUhgYxfX3
	6yxSAaNiisBU8wKW1xIyOT86V4s1qUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751789290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BzKPvjoDEpfOl3bBUxy7yxLXT2uY2JY1YGIcua8HXQ=;
	b=MpAkRBmbN1KVqlvCvrcsWEtCXO4tNkg2CWYUQvgbA7Tsa7z/Zppm6RjJAzZpLt/LZjmiZn
	yxS2fm+SrMydrKBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tFsVxnRw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MpAkRBmb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751789290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BzKPvjoDEpfOl3bBUxy7yxLXT2uY2JY1YGIcua8HXQ=;
	b=tFsVxnRwXHEmfrRpKnw5mUDt/LHcSGW9D54vR8IbBWZDmk/ctHOUq9cT2RbyCOtqnuaOz+
	ZifdGLoFrCCwzm6nI7EWylzLClnjowThNwO21fCM/X7YnTyeSPFYkWm0hLRfHAUhgYxfX3
	6yxSAaNiisBU8wKW1xIyOT86V4s1qUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751789290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BzKPvjoDEpfOl3bBUxy7yxLXT2uY2JY1YGIcua8HXQ=;
	b=MpAkRBmbN1KVqlvCvrcsWEtCXO4tNkg2CWYUQvgbA7Tsa7z/Zppm6RjJAzZpLt/LZjmiZn
	yxS2fm+SrMydrKBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 989D813A29;
	Sun,  6 Jul 2025 08:08:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iehTI+kuamj/VwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 06 Jul 2025 08:08:09 +0000
Date: Sun, 06 Jul 2025 10:08:09 +0200
Message-ID: <8734b9oi6u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Fix calibration data parser issue
In-Reply-To: <20250705130908.26248-1-baojun.xu@ti.com>
References: <20250705130908.26248-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 197421F38A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.51

On Sat, 05 Jul 2025 15:09:08 +0200,
Baojun Xu wrote:
> 
> Calibration data was overwritten during parser, it cause issue.

It'd be helpful if you can write a bit more clearly what's the issue
and what you've done here.


thanks,

Takashi

> Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  sound/pci/hda/tas2781_hda.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/pci/hda/tas2781_hda.c b/sound/pci/hda/tas2781_hda.c
> index 5f1d4b3e9688..34217ce9f28e 100644
> --- a/sound/pci/hda/tas2781_hda.c
> +++ b/sound/pci/hda/tas2781_hda.c
> @@ -44,7 +44,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
>  		TASDEVICE_REG(0, 0x13, 0x70),
>  		TASDEVICE_REG(0, 0x18, 0x7c),
>  	};
> -	unsigned int crc, oft;
> +	unsigned int crc, oft, node_num;
>  	unsigned char *buf;
>  	int i, j, k, l;
>  
> @@ -80,8 +80,9 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
>  			dev_err(p->dev, "%s: CRC error\n", __func__);
>  			return;
>  		}
> +		node_num = tmp_val[1];
>  
> -		for (j = 0, k = 0; j < tmp_val[1]; j++) {
> +		for (j = 0, k = 0; j < node_num; j++) {
>  			oft = j * 6 + 3;
>  			if (tmp_val[oft] == TASDEV_UEFI_CALI_REG_ADDR_FLG) {
>  				for (i = 0; i < TASDEV_CALIB_N; i++) {
> @@ -99,8 +100,9 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
>  				}
>  
>  				data[l] = k;
> +				oft++;
>  				for (i = 0; i < TASDEV_CALIB_N * 4; i++)
> -					data[l + i] = data[4 * oft + i];
> +					data[l + i + 1] = data[4 * oft + i];
>  				k++;
>  			}
>  		}
> -- 
> 2.43.0
> 
