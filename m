Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18644228CB7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406909; cv=none; b=PDDJ8wjxbNe6kb7yWYztVhxdVMYP6Tg/Q6RbGd68tGALm9gismtFEo275V4HwkJ668m/pqtHG7993trBuGLDhmF++s8dG4eAvcyHELHLbB5V2Eu6vENvKg47tu9BFUlj7RxZLV2bxGAuJCb4XZb9kJQzuDwf5P2SWwSjT7oWOG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406909; c=relaxed/simple;
	bh=NipG+R1HSqrOutF194LS2lOBry1ZSTPOGAOiG1WLH2I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uM/u8FBZcVSap7lqzk8KzVlTS2ur8knTLKhWxgC11BPwBXCGFnumWl3oy4nQ8EoDt5q+rds5Uxbd0P6VM1lXLhwZYWEzoVnDhdHFs4KuGAXbeONOzxdw4+NjhlhbLtRiNMG47VOmkjVgz1gLIPEANe/qxn+WSex+7JNZAArMY1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mENgvfgx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UA32LeFt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mENgvfgx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UA32LeFt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mENgvfgx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UA32LeFt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mENgvfgx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UA32LeFt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 276552120C;
	Fri, 20 Jun 2025 08:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kitalKWwj2PLPPIA5AYxJj4Huph94hkJpS/bc2LqCak=;
	b=mENgvfgxD722g7rJ7Jzb/R7XlPqR93jKSSeJVJnDaW9DNFCe1ouKDfVAhOLCqN9nhCLcfY
	gtAtiuuNBzP5FiM/Cn0W0ydba80mlFY++4BqwviNDH4KBgw1CHh3cXwN9I/IP63tw3Wt5d
	lI12ea8VVLX9k65oJQWn2NGfHHKmoO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kitalKWwj2PLPPIA5AYxJj4Huph94hkJpS/bc2LqCak=;
	b=UA32LeFtDrF1+oWjEniiLC4pSaR6V8rnHhhw/Nf9pc5FKhQegO6RR7ZF7n89qbUGP+BPPV
	JbieakaIg4SnRcCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mENgvfgx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UA32LeFt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kitalKWwj2PLPPIA5AYxJj4Huph94hkJpS/bc2LqCak=;
	b=mENgvfgxD722g7rJ7Jzb/R7XlPqR93jKSSeJVJnDaW9DNFCe1ouKDfVAhOLCqN9nhCLcfY
	gtAtiuuNBzP5FiM/Cn0W0ydba80mlFY++4BqwviNDH4KBgw1CHh3cXwN9I/IP63tw3Wt5d
	lI12ea8VVLX9k65oJQWn2NGfHHKmoO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kitalKWwj2PLPPIA5AYxJj4Huph94hkJpS/bc2LqCak=;
	b=UA32LeFtDrF1+oWjEniiLC4pSaR6V8rnHhhw/Nf9pc5FKhQegO6RR7ZF7n89qbUGP+BPPV
	JbieakaIg4SnRcCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D41A013A9C;
	Fri, 20 Jun 2025 08:08:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GBWKMvkWVWgcWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 08:08:25 +0000
Date: Fri, 20 Jun 2025 10:08:25 +0200
Message-ID: <87pleyx2bq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: mixer_oss: Replace deprecated strcpy() with strscpy()
In-Reply-To: <DA7484EA-83F7-496A-AB9F-2370BBBC0883@linux.dev>
References: <20250618223631.1244-2-thorsten.blum@linux.dev>
	<20250618224926.GS1880847@ZenIV>
	<DA7484EA-83F7-496A-AB9F-2370BBBC0883@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 276552120C
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[wanadoo.fr];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[zeniv.linux.org.uk,perex.cz,suse.com,wanadoo.fr,suse.de,vger.kernel.org];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 19 Jun 2025 14:50:04 +0200,
Thorsten Blum wrote:
> 
> On 19. Jun 2025, at 00:49, Al Viro wrote:
> > On Thu, Jun 19, 2025 at 12:36:29AM +0200, Thorsten Blum wrote:
> >> strcpy() is deprecated; use strscpy() instead.
> >> 
> >> No functional changes intended.
> > 
> > Have you actually read the damn thing?  Seriously, look at the uses
> > of 'str' downstream.  The only thing it is ever passed to is strcmp().
> > 
> > In other words, why do we need to copy it anywhere?  What's wrong with
> > having char *str instead of that array and replacing strcpy() with
> > plain and simple pointer assignment?
> 
> I read it, but didn't question whether copying was actually necessary.
> 
> However, it looks like 'ptr->name' can originate from userland (via proc
> file - see the function comment), which could make using 'char *str'
> directly unsafe, unless I'm missing something.
> 
> Something like this would skip one copy while keeping it safe:
> 
> char tmp_str[64];
> char *str;
> 
> strscpy(tmp_str, ptr->name);
> if (!strcmp(tmp_str, "Master"))
> 	str = "Mix";
> else if (!strcmp(tmp_str, "Master Mono"))
> 	str = "Mix Mono";
> else
> 	str = tmp_str;

Al is right, we should optimize it instead.  As it's been already a
string copied to a kernel, and the string is certainly NUL-terminated,
hence there is no need to worry about using the pointer.
It'd be something like:

--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -991,7 +991,7 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 	struct slot *pslot;
 	struct snd_kcontrol *kctl;
 	struct snd_mixer_oss_slot *rslot;
-	char str[64];	
+	const char *str;
 	
 	/* check if already assigned */
 	if (mixer->slots[ptr->oss_id].get_volume && ! replace_old)
@@ -1014,11 +1014,11 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 			
 		if (kctl->info(kctl, uinfo))
 			return 0;
-		strcpy(str, ptr->name);
+		str = ptr->name;
 		if (!strcmp(str, "Master"))
-			strcpy(str, "Mix");
-		if (!strcmp(str, "Master Mono"))
-			strcpy(str, "Mix Mono");
+			str = "Mix";
+		else if (!strcmp(str, "Master Mono"))
+			str = "Mix Mono";
 		slot.capture_item = 0;
 		if (!strcmp(uinfo->value.enumerated.name, str)) {
 			slot.present |= SNDRV_MIXER_OSS_PRESENT_CAPTURE;


thanks,

Takashi
