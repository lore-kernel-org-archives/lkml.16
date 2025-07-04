Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19749246798
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629651; cv=none; b=pWUBONwa2nMHHK4u/T9gtqbR5D9YEfsbVowNRVCcLsAefXzcKOSB1mZ/NkMYDJkhwUtEav75lWJO5TXM4rkbOx++QrXBuJXliqhGLVe0i0eY5aSw1+ObBfBq1iOBL5K2tWpnCu+sk/DX+xJfkpowdvI13P6KyTs95MigGnvoiuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629651; c=relaxed/simple;
	bh=zoK1TdT39Ljo33zyqf4Rz7NJoVT/85jaY7L6FE459us=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2eswv9vVsjsR/h792RB8lVlJlKMBY6JzuEjtzL8iVsVIcTCk9D5Chpjh0F8GfVfBWtIxztRyVqNItU+40CwaZ08kfAAbO+qHsGhc9yHFZ8EhqkCeg1rNC8H1YEz1uNCurDhuM7lFT8aEL+ikOKBOdHNjHIymSDF/cFgVLhyOlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vq3vlWxa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gHcWgHgo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iE4ogoWz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2twvJFtr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vq3vlWxa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gHcWgHgo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iE4ogoWz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2twvJFtr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EC7671F458;
	Fri,  4 Jul 2025 11:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751629647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PQTIJ1BrgDJJKjaE0itmBbDiBuoEgDEvOpoolUTnLsw=;
	b=vq3vlWxazc63jFIG77E08DUvrzhOjrCy/wDOOfDU0UKToQnpP7H707LgJkow9eY54Y+KG4
	tcgIFQztcsM4dSf3wsh9PD3umgtpqu+bQPzfcpo+xbmMy6uw0pLRgZ3ULqRsWXevwyWCoB
	gyQFsCWboNmBMI5MUSmSNJZP7UYN7JM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751629647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PQTIJ1BrgDJJKjaE0itmBbDiBuoEgDEvOpoolUTnLsw=;
	b=gHcWgHgo9BJYdm3uQX6KgDXtUHVcDMbPTRfPotA06Ab3TUPTkCVHJx+gx3wVJmcEOhdgnL
	z3+oE99sPkpOt5AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iE4ogoWz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2twvJFtr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751629646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PQTIJ1BrgDJJKjaE0itmBbDiBuoEgDEvOpoolUTnLsw=;
	b=iE4ogoWzGUJAWkqW2dFMxKSb7DNGk5/q5tOct1vvsXolrtl2gqUIORqCRaGdMH8G45uht4
	o1E3B6rxmLqI8cU6bEhJN42cQAafOB1i56VPv8z71jbZN7vEOxMBSthIUhGODkUscwgXRY
	BI4PDu1NkMzetghU49ok90Rg/AKCfaI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751629646;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PQTIJ1BrgDJJKjaE0itmBbDiBuoEgDEvOpoolUTnLsw=;
	b=2twvJFtrQGUbgf+6XxDmnwKkeVgMZSTCpbPmIzafUFU0CTDcqNDKHLhNl1cDZ0OLdjlCXX
	Kv9AHBIbDkbokMAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6484713757;
	Fri,  4 Jul 2025 11:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uSJnF06/Z2iTSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Jul 2025 11:47:26 +0000
Date: Fri, 04 Jul 2025 13:47:26 +0200
Message-ID: <87tt3snpo1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	David
 Rhodes <david.rhodes@cirrus.com>,	Richard Fitzgerald
 <rf@opensource.cirrus.com>,	Shenghao Ding <shenghao-ding@ti.com>,	Kevin Lu
 <kevin-lu@ti.com>,	Baojun Xu <baojun.xu@ti.com>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,	Mark Brown
 <broonie@kernel.org>,	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,	Chen Ni <nichen@iscas.ac.cn>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 69/80] ALSA: hda: Remove redundant pm_runtime_mark_last_busy() calls
In-Reply-To: <20250704075455.3222438-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
	<20250704075455.3222438-1-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: EC7671F458
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Score: -5.51

On Fri, 04 Jul 2025 09:54:55 +0200,
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
>  sound/hda/hdac_device.c         | 1 -
>  sound/pci/hda/cs35l41_hda.c     | 4 ----
>  sound/pci/hda/cs35l56_hda.c     | 1 -
>  sound/pci/hda/tas2781_hda_i2c.c | 3 ---
>  sound/pci/hda/tas2781_hda_spi.c | 4 ----
>  5 files changed, 13 deletions(-)
> 
> diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
> index 0053831eed2d..a02dce5f6a88 100644
> --- a/sound/hda/hdac_device.c
> +++ b/sound/hda/hdac_device.c
> @@ -581,7 +581,6 @@ int snd_hdac_power_down(struct hdac_device *codec)
>  {
>  	struct device *dev = &codec->dev;
>  
> -	pm_runtime_mark_last_busy(dev);
>  	return pm_runtime_put_autosuspend(dev);
>  }
>  EXPORT_SYMBOL_GPL(snd_hdac_power_down);
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index c2cf3813872a..fc3f9ed3be13 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -836,7 +836,6 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
>  		 * Playback must be finished for all amps before we start runtime suspend.
>  		 * This ensures no amps are playing back when we start putting them to sleep.
>  		 */
> -		pm_runtime_mark_last_busy(dev);
>  		pm_runtime_put_autosuspend(dev);
>  		break;
>  	default:
> @@ -1284,7 +1283,6 @@ static void cs35l41_fw_load_work(struct work_struct *work)
>  	cs35l41->fw_request_ongoing = false;
>  	mutex_unlock(&cs35l41->fw_mutex);
>  
> -	pm_runtime_mark_last_busy(cs35l41->dev);
>  	pm_runtime_put_autosuspend(cs35l41->dev);
>  }
>  
> @@ -1515,7 +1513,6 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
>  		dev_warn(dev, "Unable to create device link\n");
>  	unlock_system_sleep(sleep_flags);
>  
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	dev_info(cs35l41->dev,
> @@ -2036,7 +2033,6 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
>  
>  	pm_runtime_set_autosuspend_delay(cs35l41->dev, 3000);
>  	pm_runtime_use_autosuspend(cs35l41->dev);
> -	pm_runtime_mark_last_busy(cs35l41->dev);
>  	pm_runtime_set_active(cs35l41->dev);
>  	pm_runtime_get_noresume(cs35l41->dev);
>  	pm_runtime_enable(cs35l41->dev);
> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index 3f2fd32f4ad9..0391bbffed7d 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -89,7 +89,6 @@ static void cs35l56_hda_pause(struct cs35l56_hda *cs35l56)
>  			  BIT(CS35L56_ASP_TX1_EN_SHIFT) | BIT(CS35L56_ASP_TX2_EN_SHIFT) |
>  			  BIT(CS35L56_ASP_TX3_EN_SHIFT) | BIT(CS35L56_ASP_TX4_EN_SHIFT));
>  
> -	pm_runtime_mark_last_busy(cs35l56->base.dev);
>  	pm_runtime_put_autosuspend(cs35l56->base.dev);
>  }
>  
> diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> index b9cdbca951e4..8a461acbc3b9 100644
> --- a/sound/pci/hda/tas2781_hda_i2c.c
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -157,7 +157,6 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
>  		tas_hda->priv->playback_started = false;
>  		mutex_unlock(&tas_hda->priv->codec_lock);
>  
> -		pm_runtime_mark_last_busy(dev);
>  		pm_runtime_put_autosuspend(dev);
>  		break;
>  	default:
> @@ -483,7 +482,6 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
>  out:
>  	mutex_unlock(&tas_hda->priv->codec_lock);
>  	release_firmware(fmw);
> -	pm_runtime_mark_last_busy(tas_hda->dev);
>  	pm_runtime_put_autosuspend(tas_hda->dev);
>  }
>  
> @@ -526,7 +524,6 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
>  	if (!ret)
>  		comp->playback_hook = tas2781_hda_playback_hook;
>  
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return ret;
> diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
> index 5c03e9d2283a..c4b9a3c1a7f0 100644
> --- a/sound/pci/hda/tas2781_hda_spi.c
> +++ b/sound/pci/hda/tas2781_hda_spi.c
> @@ -400,7 +400,6 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
>  		guard(mutex)(&tas_priv->codec_lock);
>  		if (tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK)
>  			tasdevice_tuning_switch(tas_priv, 1);
> -		pm_runtime_mark_last_busy(dev);
>  		pm_runtime_put_autosuspend(dev);
>  	}
>  }
> @@ -698,7 +697,6 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
>  	tas2781_save_calibration(tas_hda);
>  out:
>  	release_firmware(fmw);
> -	pm_runtime_mark_last_busy(tas_hda->priv->dev);
>  	pm_runtime_put_autosuspend(tas_hda->priv->dev);
>  }
>  
> @@ -731,7 +729,6 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
>  	if (!ret)
>  		comp->playback_hook = tas2781_hda_playback_hook;
>  
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return ret;
> @@ -816,7 +813,6 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
>  
>  	pm_runtime_set_autosuspend_delay(tas_priv->dev, 3000);
>  	pm_runtime_use_autosuspend(tas_priv->dev);
> -	pm_runtime_mark_last_busy(tas_priv->dev);
>  	pm_runtime_set_active(tas_priv->dev);
>  	pm_runtime_get_noresume(tas_priv->dev);
>  	pm_runtime_enable(tas_priv->dev);
> -- 
> 2.39.5
> 
