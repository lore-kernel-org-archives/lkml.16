Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890741E5B7A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749711170; cv=none; b=Wf71eZfefpZGCiwghuyChXDnc5uNZS3zmn/x9LnP+fMQ5CB044aEVc/ZzgzLCl9wUHqOaMSKfZr3SPJWXMV4yiwk0158nDAHmTNbZq6jV+/Swr0KVNFBSD8F6jTfK4qjN8t+MZMD/ghBxEc9NIu3Upm23igoWUTZKxll4I/x2uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749711170; c=relaxed/simple;
	bh=NHtGhXG0yRIPdQyrvbTSVQ6eQX3MJJcgJy07UzpQwa8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HWVjoXzDEe5N7Tne3Ybw4YsIIjqjTl5K7I+cE15Nkk28HzZbYr6QKaiG1wNiyFhmKsip/sWP9SINjPF3VEskZH/AsOeKzx+ogXKLiPUxtwmPKuHqcmAZo3iad03gWfWVU4grp2MCKHrhucNQc9W4zRiFHOqj2LYJibzmwcWme88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R08jiEVZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nDfGp5kE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R08jiEVZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nDfGp5kE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R08jiEVZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nDfGp5kE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R08jiEVZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nDfGp5kE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 67D4D21923;
	Thu, 12 Jun 2025 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749711165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgAPjVY/XzqOZpXE9Hs3PERy9wrT1RBjEOvmaGEcsaQ=;
	b=R08jiEVZgNqzZb5UCuZK5+cZTy4jmBMhO9r8PrLWek67Uwp0Vm+QmMrgkM5NWQD5U29Ybi
	SqKys5UIXistzS+MXPYj3Sy5HMkY0HGWatde9+hCCZ/x5/bMSnUFVBBPKOcCzdFMm2ZJSb
	VwRCf4fV5gsPFZ0ROGoQyoi8gYah1pE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749711165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgAPjVY/XzqOZpXE9Hs3PERy9wrT1RBjEOvmaGEcsaQ=;
	b=nDfGp5kEz//bzmNa8BWaOpxmmORew7J1/+206MGFRYLh4FjvmDJQXA1wvw4X0fEKVROhfs
	jE2lKOUoNw2zRSDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=R08jiEVZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nDfGp5kE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749711165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgAPjVY/XzqOZpXE9Hs3PERy9wrT1RBjEOvmaGEcsaQ=;
	b=R08jiEVZgNqzZb5UCuZK5+cZTy4jmBMhO9r8PrLWek67Uwp0Vm+QmMrgkM5NWQD5U29Ybi
	SqKys5UIXistzS+MXPYj3Sy5HMkY0HGWatde9+hCCZ/x5/bMSnUFVBBPKOcCzdFMm2ZJSb
	VwRCf4fV5gsPFZ0ROGoQyoi8gYah1pE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749711165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgAPjVY/XzqOZpXE9Hs3PERy9wrT1RBjEOvmaGEcsaQ=;
	b=nDfGp5kEz//bzmNa8BWaOpxmmORew7J1/+206MGFRYLh4FjvmDJQXA1wvw4X0fEKVROhfs
	jE2lKOUoNw2zRSDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15CC6139E2;
	Thu, 12 Jun 2025 06:52:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id a6TsAz15SmgUEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Jun 2025 06:52:45 +0000
Date: Thu, 12 Jun 2025 08:52:44 +0200
Message-ID: <87ikl1v4cj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	cristian.ciocaltea@collabora.com,
	franta-linux@frantovo.cz,
	lina+kernel@asahilina.net,
	livvy@base.nu,
	sstistrup@gmail.com,
	s@srd.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Convert comma to semicolon
In-Reply-To: <20250612060228.1518028-1-nichen@iscas.ac.cn>
References: <20250612060228.1518028-1-nichen@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 67D4D21923
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,collabora.com,frantovo.cz,asahilina.net,base.nu,gmail.com,srd.tw,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[kernel];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Spam-Score: -2.01
X-Spam-Level: 

On Thu, 12 Jun 2025 08:02:28 +0200,
Chen Ni wrote:
> 
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Thanks, applied now.

At the next time, though, it'd be appreciated if you can put the
proper Fixes tag.


Takashi
