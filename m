Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D7E226CF8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535708; cv=none; b=pVDp+hJy3eglXZhJpQC3FwKGLWA/Yxt7/1CkIzK/GvOENhi1omV2m42zyYJIBbrMR3jURl5eFBt5Ls69xqg49rdzCG4GfKz3fOLwC/vNITrLrobYGr05uWj/7ecAQ9ii7vyZCAU8a/1UMAj3AJTpS1FPYNs+hQ+LQPBV2scfv1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535708; c=relaxed/simple;
	bh=Tc2He9V2+ZoVsyDk3MmEaYuE00B50p9kj605W0HSn8Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fu7szoNqRVw4chMTLdCeJK4morrOyTAnI95a+qpcpNprFbRxp0QdUX811p9F86boj17g45stKo56EzaXI+fNNqcscVaX+5yth5rVt1RG5if8cHcExbAR+G1qe5Smat8ZDeY36IbcSYCCH+9uvQxRITDbOfVzl7M0CpiIBS/jP4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LdIdNOok; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u0rqKlmL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LdIdNOok; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u0rqKlmL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LdIdNOok";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u0rqKlmL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LdIdNOok";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u0rqKlmL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47A0921186;
	Thu,  3 Jul 2025 09:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751535705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ct7clN4OxfFrYElHSUpU60EmEGUOutONp382V/+9FTE=;
	b=LdIdNOokx4dTZWcu1BTdWSjZ6JD2CcreM/v1VrQLAu9nBQq5wSkJz7NCeB6kXhGbpWo1IG
	c3vUBDy8PNAibHF+ECkNXKNV+lZVhmfl0X0QHV0K3u2YDbOrarzxOpOsvUzfzMrLEkBeTq
	ll1kyf+hz8RtyazD7C5kuaccd5fjv1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751535705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ct7clN4OxfFrYElHSUpU60EmEGUOutONp382V/+9FTE=;
	b=u0rqKlmLjvEQIKu0KjVmwam2DswknUub1nVgqSpZJEZijzd38XrlYLa8CqNZSXVNNfYzQM
	riMuMwUWtJRifmDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751535705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ct7clN4OxfFrYElHSUpU60EmEGUOutONp382V/+9FTE=;
	b=LdIdNOokx4dTZWcu1BTdWSjZ6JD2CcreM/v1VrQLAu9nBQq5wSkJz7NCeB6kXhGbpWo1IG
	c3vUBDy8PNAibHF+ECkNXKNV+lZVhmfl0X0QHV0K3u2YDbOrarzxOpOsvUzfzMrLEkBeTq
	ll1kyf+hz8RtyazD7C5kuaccd5fjv1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751535705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ct7clN4OxfFrYElHSUpU60EmEGUOutONp382V/+9FTE=;
	b=u0rqKlmLjvEQIKu0KjVmwam2DswknUub1nVgqSpZJEZijzd38XrlYLa8CqNZSXVNNfYzQM
	riMuMwUWtJRifmDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23FD813721;
	Thu,  3 Jul 2025 09:41:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9a8hCFlQZmjPBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Jul 2025 09:41:45 +0000
Date: Thu, 03 Jul 2025 11:41:44 +0200
Message-ID: <875xg9obl3.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add bus name in device name check
In-Reply-To: <20250703000608.20815-1-baojun.xu@ti.com>
References: <20250703000608.20815-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Thu, 03 Jul 2025 02:06:08 +0200,
Baojun Xu wrote:
> 
> Device name start from bus name, as we use strstarts()
> to do compare, need add it for TXNW2781 device.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Could you give the proper Fixes tag if it's a fix of the previous
changes?


thanks,

Takashi


> ---
>  sound/pci/hda/tas2781_hda_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> index b9cdbca95..530c2266a 100644
> --- a/sound/pci/hda/tas2781_hda_i2c.c
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -588,7 +588,7 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
>  		hda_priv->save_calibration = tas2781_save_calibration;
>  		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
>  	} else if (strstarts(dev_name(&clt->dev),
> -			     "TXNW2781:00-tas2781-hda.0")) {
> +			     "i2c-TXNW2781:00-tas2781-hda.0")) {
>  		device_name = "TXNW2781";
>  		hda_priv->save_calibration = tas2781_save_calibration;
>  		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
> -- 
> 2.43.0
> 
