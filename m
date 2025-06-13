Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CA64C62
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749818238; cv=none; b=qnXWVf5rsBJglyH37RMWMBFHUiRcbG1P8bL80JKyuB2Jt3JTi/CxPOQygBE9UyZtqesJ5ya26qt4P2V7VufLJOHE/1NL6+kCuVOoyY5fPpOjYyDfx6x3AzcYVz/2dNRbgEzEKZkCBlvRYs+yZaltFLWaAOqPkzM+qwky9zRehpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749818238; c=relaxed/simple;
	bh=7tjZv5pxW18/1G+UdP7WLEwIjMIuR7ZIMwePZ7a02XQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sEHOYt7e9NdD9yAECO5CSK0VLC2gJFBeekZKloAo8ADcQiji2dX+x/GaDLpSPi2zDtrl66TX+qe+d35Q5IwWlcahMqRWIjaX5SniJxqlKSZvqQVidk/GAp44nhDVBMqCh9DBZle/ZuUQS3dvpCOE2hFgIGRRzJUSqs/Cmp0oqts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kCCrcdFT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zQujh0/5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kCCrcdFT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zQujh0/5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kCCrcdFT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zQujh0/5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kCCrcdFT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zQujh0/5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7C8E21A23;
	Fri, 13 Jun 2025 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749818234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ons9VlAWyS5iGbbTVkDBgSxgXbxKUV7OAg/2/YmOuTQ=;
	b=kCCrcdFTYqrZUYuBN/pBMasKboKwHTZiQZUKz5OXDm1VT0q6deaATpqQrUBT3MOetNInd5
	vN71hH58Klp8dYim2DqSqd0agTlZdrYbULxkGkz4/Duk25WycMr0l8PDAHhXr8zMTMAPg8
	7EsXZDZD+noCrm5n1gGR8XP5Bggz8tA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749818234;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ons9VlAWyS5iGbbTVkDBgSxgXbxKUV7OAg/2/YmOuTQ=;
	b=zQujh0/5m0F7qHNo6Y8TZIlFlZMoGQHLZqqAgCngNWCM5wyBLTzvSFxe87w9JxORxkjU0p
	nKm4FFKyJCrcwpAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749818234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ons9VlAWyS5iGbbTVkDBgSxgXbxKUV7OAg/2/YmOuTQ=;
	b=kCCrcdFTYqrZUYuBN/pBMasKboKwHTZiQZUKz5OXDm1VT0q6deaATpqQrUBT3MOetNInd5
	vN71hH58Klp8dYim2DqSqd0agTlZdrYbULxkGkz4/Duk25WycMr0l8PDAHhXr8zMTMAPg8
	7EsXZDZD+noCrm5n1gGR8XP5Bggz8tA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749818234;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ons9VlAWyS5iGbbTVkDBgSxgXbxKUV7OAg/2/YmOuTQ=;
	b=zQujh0/5m0F7qHNo6Y8TZIlFlZMoGQHLZqqAgCngNWCM5wyBLTzvSFxe87w9JxORxkjU0p
	nKm4FFKyJCrcwpAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DC6913782;
	Fri, 13 Jun 2025 12:37:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oI1fGXobTGj9cgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 12:37:14 +0000
Date: Fri, 13 Jun 2025 14:37:14 +0200
Message-ID: <87wm9frf5x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 3/3] ALSA: pcm: Convert snd_pcm_sync_ptr() to user_access_begin/user_access_end()
In-Reply-To: <2df61bbf-76f6-4932-a347-7820350a156e@csgroup.eu>
References: <7baa34d4046c7750799b11830d38a46f8b581765.1749724478.git.christophe.leroy@csgroup.eu>
	<79b86a0618328ba1d0cb5cf4011fd73ac6900e8f.1749724478.git.christophe.leroy@csgroup.eu>
	<878qlwrnv1.wl-tiwai@suse.de>
	<2df61bbf-76f6-4932-a347-7820350a156e@csgroup.eu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Fri, 13 Jun 2025 13:03:04 +0200,
Christophe Leroy wrote:
> 
> 
> 
> Le 13/06/2025 à 11:29, Takashi Iwai a écrit :
> > On Thu, 12 Jun 2025 12:51:05 +0200,
> > Christophe Leroy wrote:
> >> 
> >> Now that snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user()
> >> are converted to user_access_begin/user_access_end(),
> >> snd_pcm_sync_ptr_get_user() is more efficient than a raw get_user()
> >> followed by a copy_from_user(). And because copy_{to/from}_user() are
> >> generic functions focussed on transfer of big data blocks to/from user,
> >> snd_pcm_sync_ptr_put_user() is also more efficient for small amont of
> >> data.
> >> 
> >> So use snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() in
> >> snd_pcm_sync_ptr() too.
> >> 
> >> In order to have snd_pcm_mmap_status32 similar to snd_pcm_mmap_status,
> >> replace to tsamp_{sec/nsec} and audio_tstamp_{sec/nsec} by equivalent
> >> struct __snd_timespec.
> >> 
> >> snd_pcm_ioctl_sync_ptr_buggy() is left as it is because the conversion
> >> wouldn't be straigh-forward do to the workaround it provides.
> >> 
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > 
> > Through a quick glance, all patches look almost fine, but one favor to
> > ask: this patch contains the convert from s32/s32 pair to struct
> > __snd_timespec.  It should be factored out to a prerequisite patch
> > instead of burying in a big change.
> 
> Shall I understand you prefer this series over the more simple "ALSA:
> pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32} to
> user_access_begin/user_access_end()" patch ?

Err, no, sorry for ambiguity.
I wanted to move the replacement of tstamp_sec/nsec with struct
__snd_timespec as a small preliminary patch from patch#3.
That is,
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3103,11 +3103,9 @@ struct snd_pcm_mmap_status32 {
 	snd_pcm_state_t state;
 	s32 pad1;
 	u32 hw_ptr;
-	s32 tstamp_sec;
-	s32 tstamp_nsec;
+	struct __snd_timespec tstamp;
 	snd_pcm_state_t suspended_state;
-	s32 audio_tstamp_sec;
-	s32 audio_tstamp_nsec;
+	struct __snd_timespec audio_tstamp;
 } __packed;
etc.  By factoring this out, it becomes clear that the timespec
compatibility is fully cared.

__snd_timespec may be defined in different ways on user-space, but in
the kernel code, it's a single definition of s32/s32 pair.  This needs
to be emphasized.


thanks,

Takashi
