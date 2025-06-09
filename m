Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDA11B0437
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749456194; cv=none; b=aT4HsDoX88jTDJCRoJDAis3FwTMnRVVQ/Hv+FQUmpDvGAjlOlkY7FpWAHEWKd59OzXTfTZXaBWFaIQBoGP4FeWDRkFd9LfbDozVYoqFsEJvz3rOPHMkbgs6j0Yr4Nsfv5//B8cJpocfT/PvmiljtJ83ybRJzhmzUNXNnOPfT8kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749456194; c=relaxed/simple;
	bh=mX17QL4QUTu63mi0Cssjt40Ey/57JYRkCRqhHy1s4LQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M73wwnJKjNy6gBHYOEdmNJbT11+D1IEN5iFdKNoOoKE9yrzldQkNoaDakPXCCTtZGGlF4SZjNl4DO70lBeCZGa1W4rw4ctXQqbEOw9gSqQkH4QJc834nXbuE7YEBCgnsuZrf3Z8CEYbC2kK3aUEtkZ77OSat71qA1SlhSOgztNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f+V2pfvL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n76N8TkR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f+V2pfvL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n76N8TkR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f+V2pfvL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n76N8TkR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f+V2pfvL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n76N8TkR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 44B341F38D;
	Mon,  9 Jun 2025 08:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749456191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9DdwT1nUkCgvauzt339vY5CJQuFL0vEmw46oFVTviRc=;
	b=f+V2pfvLrpPk4VNAr0V35xib/WYqbzKlFnnyhxXaxvvWtJsjdXDgf996q4BRHERyKl+v8w
	yT+xR2fmAjzPht3a0wt7PalrCR3Jvb8IDMbsQ5sueuVa/pqqIjJuKJ5jgayK02TldrxLMW
	e8aDMCwMnvZs26zKBZlocVjKpO/pWAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749456191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9DdwT1nUkCgvauzt339vY5CJQuFL0vEmw46oFVTviRc=;
	b=n76N8TkRHuG+wZTbJTaxGBCCXx0AODuNLx9vBOCElV06z5HsZzWR7dmco1JHk+3s9TXTZ7
	G7ZDmorVC5ZJK6BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f+V2pfvL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=n76N8TkR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749456191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9DdwT1nUkCgvauzt339vY5CJQuFL0vEmw46oFVTviRc=;
	b=f+V2pfvLrpPk4VNAr0V35xib/WYqbzKlFnnyhxXaxvvWtJsjdXDgf996q4BRHERyKl+v8w
	yT+xR2fmAjzPht3a0wt7PalrCR3Jvb8IDMbsQ5sueuVa/pqqIjJuKJ5jgayK02TldrxLMW
	e8aDMCwMnvZs26zKBZlocVjKpO/pWAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749456191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9DdwT1nUkCgvauzt339vY5CJQuFL0vEmw46oFVTviRc=;
	b=n76N8TkRHuG+wZTbJTaxGBCCXx0AODuNLx9vBOCElV06z5HsZzWR7dmco1JHk+3s9TXTZ7
	G7ZDmorVC5ZJK6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D9D313A1D;
	Mon,  9 Jun 2025 08:03:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A1AGAj+VRmiiAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Jun 2025 08:03:11 +0000
Date: Mon, 09 Jun 2025 10:03:10 +0200
Message-ID: <871prt8hq9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "feng.liu" <feng.liu@senarytech.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] correct boot value
In-Reply-To: <20250609065331.495109-1-feng.liu@senarytech.com>
References: <20250609065331.495109-1-feng.liu@senarytech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 44B341F38D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Mon, 09 Jun 2025 08:53:30 +0200,
feng.liu wrote:
> 
>   Read the Boost Level configured for input pins in the BIOS 
> init verbs, and restore these settings during audio recording. 
> This addresses issues of low recording volume or excessive 
> background noise caused by incorrect boost configurations.
>   Compare with the last commit:
>   1.Correct the function definition; cxt_get_default_capture_gain_boost 
> does not require a return value.
>   2.Check array indices to prevent operations causing memory out-of-bounds
> access.
> 
> Signed-off-by: feng.liu <feng.liu@senarytech.com>

Hm, this fix doesn't look right, unfortunately.
Aren't those boost values controlled via mixer elements?  If so, they
are silently overridden.

If those controls are exposed to user-space but they shouldn't be
touched, we should rather drop exposing those and keep the original
values.

Last but not least, please adjust the subject line of your patch
mail.  It should have a proper prefix (e.g. "ALSA: hda/conexant: ...")
Also, when you respin the patch, please put a new version prefix, too
(e.g. "[PATCH v2]").  Also, the subject text should be a bit more
descriptive, too (but shouldn't be too long, either).

Moreover, the diffs from the previous submission can be put after the
line "---", so that it won't be taken at applying.


thanks,

Takashi

> ---
>  sound/pci/hda/patch_conexant.c | 49 ++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
> index 34874039ad4..95c76bb8e3c 100644
> --- a/sound/pci/hda/patch_conexant.c
> +++ b/sound/pci/hda/patch_conexant.c
> @@ -43,6 +43,8 @@ struct conexant_spec {
>  	unsigned int gpio_mute_led_mask;
>  	unsigned int gpio_mic_led_mask;
>  	bool is_cx8070_sn6140;
> +
> +	unsigned char init_imux_boost_val[HDA_MAX_NUM_INPUTS];
>  };
>  
>  
> @@ -1178,6 +1180,51 @@ static void add_cx5051_fake_mutes(struct hda_codec *codec)
>  	spec->gen.dac_min_mute = true;
>  }
>  
> +static void cxt_fixed_mic_boost(struct hda_codec *codec,
> +	unsigned char node_id,
> +	unsigned char mic_boost)
> +{
> +	unsigned char value = 0;
> +
> +	value = snd_hda_codec_read(codec, node_id, 0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
> +	if (value != mic_boost)
> +		snd_hda_codec_amp_stereo(codec, node_id, HDA_INPUT, 0, HDA_AMP_VOLMASK, mic_boost);
> +}
> +
> +static void cxt_cap_sync_hook(struct hda_codec *codec,
> +					 struct snd_kcontrol *kcontrol,
> +					 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct conexant_spec *spec = codec->spec;
> +	hda_nid_t mux_pin = spec->gen.imux_pins[spec->gen.cur_mux[0]];
> +
> +	if (spec->init_imux_boost_val[mux_pin])
> +		cxt_fixed_mic_boost(codec, mux_pin, spec->init_imux_boost_val[mux_pin]);
> +}
> +
> +static void cxt_get_default_capture_gain_boost(struct hda_codec *codec)
> +{
> +	struct conexant_spec *spec = codec->spec;
> +	int i;
> +	unsigned int boost;
> +
> +	spec->init_imux_boost_val[0] = 0;
> +	for (i = 0; i < HDA_MAX_NUM_INPUTS; i++) {
> +		if (spec->gen.imux_pins[i] == 0)
> +			continue;
> +
> +		if (spec->gen.imux_pins[i] < HDA_MAX_NUM_INPUTS) {
> +			boost = snd_hda_codec_read(codec, spec->gen.imux_pins[i],
> +				0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
> +			spec->init_imux_boost_val[spec->gen.imux_pins[i]] = boost;
> +			codec_info(codec, "%s, node_id = %x, mic_boost =%x", __func__,
> +				spec->gen.imux_pins[i], boost);
> +		}
> +	}
> +
> +	spec->gen.cap_sync_hook = cxt_cap_sync_hook;
> +}
> +
>  static int patch_conexant_auto(struct hda_codec *codec)
>  {
>  	struct conexant_spec *spec;
> @@ -1245,6 +1292,8 @@ static int patch_conexant_auto(struct hda_codec *codec)
>  	if (!spec->gen.vmaster_mute.hook && spec->dynamic_eapd)
>  		spec->gen.vmaster_mute.hook = cx_auto_vmaster_hook;
>  
> +	cxt_get_default_capture_gain_boost(codec);
> +
>  	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
>  
>  	err = snd_hda_parse_pin_defcfg(codec, &spec->gen.autocfg, NULL,
> -- 
> 2.45.2
> 
