Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB50257D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165490; cv=none; b=mBGZKadLUzCoBJI3hw8qksPiXuSxsnk1JD0GgN7L3y0a2oxF76UkQstWhO7CYO/vYjzsnlyVBeA3GiUXhzYRpQar6l4E8DNJdXXUUqDrLoJRAGAP83DfK1TJsvG414O2W/vlrbzkItluy39Q0O7vhbUbGfr9Ox+Nmjjr54IKeug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165490; c=relaxed/simple;
	bh=rzKDM5pN0/uNaX2d6e8xD2n/xrQJ/cDOCfDuf/LFKNY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Augyzza7ePyQQ2UNyWZYz4UfSUdRJWfOso9hixAJUITimMWXxaLUmvVtFNPNn/RlmF+GYMN3e0uQOBNRVFUm9IRjUHjuMBTgz4rJbXu8JPmjLIplPM3f6TEbciEhkmDmYF4qA4+tQUuDC4wyGIJdEBz01xUN1tG9fOr98DSEz+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tIPQRARw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YWX9EwKH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tIPQRARw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YWX9EwKH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tIPQRARw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YWX9EwKH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tIPQRARw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YWX9EwKH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7245321197;
	Fri, 28 Mar 2025 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743165487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OoMyNws+BXkUgAT18PzFb2YxYgBLPtfi2/V+K9Rautc=;
	b=tIPQRARwQ1KZMdVd+OoZ96ydtHslEHzK5ueT3CjR+g8jUlmIcl4oeqe5/F23/9EpwhUUEo
	ISpyyofkZdkGG0E6MPuDrmlLFK7qJ0nihACtZavlMlRLSLSykgE8rKwK9A7j/6qkRxlGfJ
	iem4ilYEEGNc/4NOLRmVGRQmYTky8M4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743165487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OoMyNws+BXkUgAT18PzFb2YxYgBLPtfi2/V+K9Rautc=;
	b=YWX9EwKHcv3LT1MOIlIiFo0bALa/kLyU4pKXAOjjjJanaVcvUygasZiDPRmjnS29HMgihP
	tt3NMrKURLhnysBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743165487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OoMyNws+BXkUgAT18PzFb2YxYgBLPtfi2/V+K9Rautc=;
	b=tIPQRARwQ1KZMdVd+OoZ96ydtHslEHzK5ueT3CjR+g8jUlmIcl4oeqe5/F23/9EpwhUUEo
	ISpyyofkZdkGG0E6MPuDrmlLFK7qJ0nihACtZavlMlRLSLSykgE8rKwK9A7j/6qkRxlGfJ
	iem4ilYEEGNc/4NOLRmVGRQmYTky8M4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743165487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OoMyNws+BXkUgAT18PzFb2YxYgBLPtfi2/V+K9Rautc=;
	b=YWX9EwKHcv3LT1MOIlIiFo0bALa/kLyU4pKXAOjjjJanaVcvUygasZiDPRmjnS29HMgihP
	tt3NMrKURLhnysBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4079113927;
	Fri, 28 Mar 2025 12:38:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LMtFDi+Y5mfxUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Mar 2025 12:38:07 +0000
Date: Fri, 28 Mar 2025 13:38:06 +0100
Message-ID: <87frixe3f5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sharan Kumar Muthu Saravanan <sharweshraajan@gmail.com>
Cc: tiwai@suse.com,
	inux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: ALSA: hda/realtek: Enable Mute LED on HP OMEN Laptop xd000xx
In-Reply-To: <CAGo=CcJaF3bt511abOtgQ0OXjoDmw8bota3dkVQw5fe0SfHLpw@mail.gmail.com>
References: <CAGo=CcJaF3bt511abOtgQ0OXjoDmw8bota3dkVQw5fe0SfHLpw@mail.gmail.com>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Thu, 27 Mar 2025 18:46:34 +0100,
Sharan Kumar Muthu Saravanan wrote:
> 
> This HP Laptop uses ALC245 codec, and this codec was already used but
> on your previous patches which i referred said that led off coef can
> be set to 0

It's not clear which previous patches and which you referred to.
Could you elaborate, e.g. give the commit ID and the subject?  If any,
we need Fixes tag pointing to it.

> Signed-off-by: M SHARAN KUMAR <sharweshraajan@gmail.com>

Please align with your From tag for avoiding confusion.

> ---
>  sound/pci/hda/patch_realtek.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index a84857a3c2bf..8c2375476952 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -4739,6 +4739,21 @@ static void
> alc245_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
>                 snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
>         }
>  }
> +static void alc245_fixup_hp_mute_led_v1_coefbit(struct hda_codec *codec,
> +                                           const struct hda_fixup *fix,
> +                                               int action)

Please put a blank line, as I already pointed in the previous reply.


> +{
> +       struct alc_spec *spec = codec->spec;
> +
> +       if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +               spec->mute_led_polarity = 0;
> +               spec->mute_led_coef.idx = 0x0b;
> +               spec->mute_led_coef.mask = 3 << 2;
> +               spec->mute_led_coef.on = 1 << 3;
> +               spec->mute_led_coef.off = 0;
> +               snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
> +       }
> +}
> 
>  /* turn on/off mic-mute LED per capture hook by coef bit */
>  static int coef_micmute_led_set(struct led_classdev *led_cdev,
> @@ -7883,6 +7898,7 @@ enum {
>         ALC245_FIXUP_TAS2781_SPI_2,
>         ALC287_FIXUP_YOGA7_14ARB7_I2C,
>         ALC245_FIXUP_HP_MUTE_LED_COEFBIT,
> +       ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT,
>         ALC245_FIXUP_HP_X360_MUTE_LEDS,
>         ALC287_FIXUP_THINKPAD_I2S_SPK,
>         ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD,
> @@ -10126,6 +10142,10 @@ static const struct hda_fixup alc269_fixups[] = {
>                 .chained = true,
>                 .chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
>         },
> +       [ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT] = {
> +               .type = HDA_FIXUP_FUNC,
> +               .v.func = alc245_fixup_hp_mute_led_v1_coefbit,
> +       },
>         [ALC245_FIXUP_HP_MUTE_LED_COEFBIT] = {
>                 .type = HDA_FIXUP_FUNC,
>                 .v.func = alc245_fixup_hp_mute_led_coefbit,
> @@ -10569,6 +10589,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>         SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx",
> ALC287_FIXUP_HP_GPIO_LED),
>         SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx",
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>         SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)",
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
> +       SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx (MB 8BCD)",
> ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),

The table is sorted in PCI SSID order.  Please put at the right
position.


thanks,

Takashi
