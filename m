Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15541289E23
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285308; cv=none; b=kuZBj8g9ptasnYFNO4T+djCBQh0WLyXz6PwN5c5DFueSRDCbxGawBzUMDJMSeAtdEbaCZwpUMIq6JhrL0RvCvBM9gEFS9IpmcAQuF9kGURbcKpb6eGwfdiSw7Ngy5Tuu6PRFz4wrZcLkFOsyBFO7jhR8fN7/MdZgnXmGM1Rw//g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285308; c=relaxed/simple;
	bh=3J5gyFZaz/l3ozvcsvI+3GszGetA6/EH3VstYU421qo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tvd55BTD+Lr93nL0WkwYfvWlPxtbUjo9ZH3f5Aih1QbXSK1IW8eYO7SU/hii0yieXedvXpkHAVFqhafegcqUruypBPYntHVpKM4cbmWx+xIXMo3zY87Ov/P4BLVGSyl5NaW5HTVyMu84t30la+cjFtYHg7AxzkTWnarat2urwt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I7Mh83O+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3vDBxzUh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I7Mh83O+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3vDBxzUh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I7Mh83O+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3vDBxzUh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I7Mh83O+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3vDBxzUh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47CA32115E;
	Mon, 30 Jun 2025 12:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751285305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=myTZrjI0AmBW0MJzEVm8sQBM/99xc6Odhj1Tn/Ig2E4=;
	b=I7Mh83O+aoPScesgUo1o795ipoIQzaJCe7WB3Qj7+X8Qs5xtor57UX+1/j2rbgH5ur4QSl
	hxsmQ9uOjm391v3m2dkJLneHlcWZL7ML4kxXXZBOCXldy90oZsu079mv+pHYln8jXCmdpG
	PF7TPHMiM6u0YouFUWNXL8jjxQSa6uA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751285305;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=myTZrjI0AmBW0MJzEVm8sQBM/99xc6Odhj1Tn/Ig2E4=;
	b=3vDBxzUhsjGj/mPwj2Z8b0XPHC7hH275HtfKzjx9Dn35BD19trBLeFfmVM9zaZ1LbgsZ8y
	ri3aJPgrwVd3JgBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=I7Mh83O+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3vDBxzUh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751285305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=myTZrjI0AmBW0MJzEVm8sQBM/99xc6Odhj1Tn/Ig2E4=;
	b=I7Mh83O+aoPScesgUo1o795ipoIQzaJCe7WB3Qj7+X8Qs5xtor57UX+1/j2rbgH5ur4QSl
	hxsmQ9uOjm391v3m2dkJLneHlcWZL7ML4kxXXZBOCXldy90oZsu079mv+pHYln8jXCmdpG
	PF7TPHMiM6u0YouFUWNXL8jjxQSa6uA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751285305;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=myTZrjI0AmBW0MJzEVm8sQBM/99xc6Odhj1Tn/Ig2E4=;
	b=3vDBxzUhsjGj/mPwj2Z8b0XPHC7hH275HtfKzjx9Dn35BD19trBLeFfmVM9zaZ1LbgsZ8y
	ri3aJPgrwVd3JgBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F51613983;
	Mon, 30 Jun 2025 12:08:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HadpADl+YmiURAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Jun 2025 12:08:25 +0000
Date: Mon, 30 Jun 2025 14:08:24 +0200
Message-ID: <87sejhe8jr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hrtimer: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250630105723.1703-2-thorsten.blum@linux.dev>
References: <20250630105723.1703-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 47CA32115E
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,linux.dev:email]
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 30 Jun 2025 12:57:22 +0200,
Thorsten Blum wrote:
> 
> strcpy() is deprecated; use strscpy() instead.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.  Thanks.


Takashi
