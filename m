Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A12F24BBEB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630889; cv=none; b=X7OAYun3kU8t9zvEQ6YVihbOxC6shcA89+bgQbV3vG8GWDj0rpNDQ7FBqLPx2TuwFdWRSPTiMqwawpeYhtpvToCxCmf125ABVfnRZ8gR9GKWJzCm0TvLjDevfWcH+MxwOuy6lnP8h1a3G2vq2eKYwZWMCRRw65AUvVspyBxglS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630889; c=relaxed/simple;
	bh=lV67Wb0tgm+8D7KZLj6WnPCaiQ+8fkRiwGP1ROOI3mc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q7FW+3dMuPJGUfi4eshDCyXrdUwh06TpbSFeDtKBOkKgamPXpV9F+Mjpe+s9usDabG821xXqy2iAYRvRASYoTXH8oogzjNQSzvgBHpNgNLgIOBEj/6yev9EtOEh+1A4aA9+edPeKG1J5xi5CETOZZPzPPyEXo+uT3L3oJ6Wr2aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2JB+RKwr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SXVYaWYt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2JB+RKwr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SXVYaWYt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2JB+RKwr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SXVYaWYt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2JB+RKwr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SXVYaWYt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8F06521189;
	Fri,  4 Jul 2025 12:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751630885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IVSx25nFajqrv+87tKLTvNw6Y4TmY+NCIQTveS/6z1g=;
	b=2JB+RKwra1iWJx2Le/+tzMlj3pYTaRm0T0/7vnMcwdMjwwNR14IpVN+PICjm4fEDetQiyM
	nru8ie7El9H3XtAKe1a2Qq/FgBdSlxf6OWL3SfH/1tbj0Nvp6q3djmAQzpiCFj1lp0/RXw
	d3mr237wxM6ZXA6WZPo5cmOQ9hveBLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751630885;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IVSx25nFajqrv+87tKLTvNw6Y4TmY+NCIQTveS/6z1g=;
	b=SXVYaWYtK6vwCbnResp0QELuW7UrfNF5GWtYjCrLusJeatcpx0ujtdlHgdsrOBspjez29I
	zeCFFtSDMZ99lZCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2JB+RKwr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SXVYaWYt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751630885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IVSx25nFajqrv+87tKLTvNw6Y4TmY+NCIQTveS/6z1g=;
	b=2JB+RKwra1iWJx2Le/+tzMlj3pYTaRm0T0/7vnMcwdMjwwNR14IpVN+PICjm4fEDetQiyM
	nru8ie7El9H3XtAKe1a2Qq/FgBdSlxf6OWL3SfH/1tbj0Nvp6q3djmAQzpiCFj1lp0/RXw
	d3mr237wxM6ZXA6WZPo5cmOQ9hveBLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751630885;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IVSx25nFajqrv+87tKLTvNw6Y4TmY+NCIQTveS/6z1g=;
	b=SXVYaWYtK6vwCbnResp0QELuW7UrfNF5GWtYjCrLusJeatcpx0ujtdlHgdsrOBspjez29I
	zeCFFtSDMZ99lZCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6309113A71;
	Fri,  4 Jul 2025 12:08:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8M7ZFiXEZ2jXTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Jul 2025 12:08:05 +0000
Date: Fri, 04 Jul 2025 14:08:05 +0200
Message-ID: <87ldp4nopm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Seiji Nishikawa <snishika@redhat.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for ASUS NUC14LNK with CS35L41
In-Reply-To: <20250704030301.1495639-1-snishika@redhat.com>
References: <20250704023930.1492232-1-snishika@redhat.com>
	<20250704030301.1495639-1-snishika@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 8F06521189
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Fri, 04 Jul 2025 05:02:32 +0200,
Seiji Nishikawa wrote:
> 
> Add support for ASUS NUC14LNK system which uses Realtek ALC245 codec
> and CS35L41 amplifier over SPI. Without this quirk, the amp probe fails
> with -EINVAL and no sound is initialized.
> 
> Signed-off-by: Seiji Nishikawa <snishika@redhat.com>
> 
> v2: fixed unintentional formatting issue in subject line and commit message

The proper fix has been already queued in for-next branch (i.e. for
6.17 kernel), commit commit 84fc8896f0d9d1c075e0e08a416faedbd73907fa


thanks,

Takashi

> 
> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 5d6d01ecfee2..7ce54db56354 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -11084,6 +11084,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1043, 0x8398, "ASUS P1005", ALC269_FIXUP_STEREO_DMIC),
>  	SND_PCI_QUIRK(0x1043, 0x83ce, "ASUS P1005", ALC269_FIXUP_STEREO_DMIC),
>  	SND_PCI_QUIRK(0x1043, 0x8516, "ASUS X101CH", ALC269_FIXUP_ASUS_X101),
> +	SND_PCI_QUIRK(0x1043, 0x88f4, "ASUS NUC14LNK", ALC245_FIXUP_CS35L41_SPI_2),
>  	SND_PCI_QUIRK(0x104d, 0x9073, "Sony VAIO", ALC275_FIXUP_SONY_VAIO_GPIO2),
>  	SND_PCI_QUIRK(0x104d, 0x907b, "Sony VAIO", ALC275_FIXUP_SONY_HWEQ),
>  	SND_PCI_QUIRK(0x104d, 0x9084, "Sony VAIO", ALC275_FIXUP_SONY_HWEQ),
> -- 
> 2.50.0
> 
