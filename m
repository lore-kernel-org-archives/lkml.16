Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB89279DA1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691453; cv=none; b=j2ylUYRynA4qdgiycwLBv8ojgxy7J0HE7nb27J1XZT2WRXs3tBcZ5bGx1CjrN78WOQp4WQds4KBXpkLapyTsvQ5ogHV40QDfoNi6UrDgYC9lAbVHwIdPNEJehYz0NC0AL1m+QHVSj+i2z+2p92jyyZkasr9dZgHcJKIdcbAl/ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691453; c=relaxed/simple;
	bh=f8gqrRJGIR9sasGNNBd29C97D1dXquMt68qhOrxg/SQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNkJMRZNSNNHF57BoPZuNPErWW5Ipg6MpIUt6PoehGn9KurGpA0N3GhXumumSioQ5cW4+kJkC1S1s9spwC+/wo+EdEPJIV2bSDmw+aqHwBaygVtvsrbOJAx0LGD/5DjSi2u22tppCcB2HoRlbsLxvWfymPZMxGg9pOLVAoNYxuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d4zm7sVi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XL24f+D+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d4zm7sVi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XL24f+D+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d4zm7sVi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XL24f+D+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d4zm7sVi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XL24f+D+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 350821F388;
	Mon, 23 Jun 2025 15:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750691450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=srwnavYMkAT7XquGJcQO2o1xU8X5tXZZcOaw+TQa8kw=;
	b=d4zm7sViORq2tvuKP/vnqpG26TtyZMYWjQXPzy2cs03TWKZjwrDkCg19i9ReRuXRK14Dql
	qbxrPikfFpzVGUlqEc4vy+524uIoolf/yuNKPstjNd4hAjHVGtbbL4uH8udjj2gJ2MkTnw
	5OXokiYwsyB72bbsar3G5xwDP6wfcjM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750691450;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=srwnavYMkAT7XquGJcQO2o1xU8X5tXZZcOaw+TQa8kw=;
	b=XL24f+D+5HUC8iAc8h2iH1triQtuJ0FKMMZV2a7rzI1YlEBHvKX3sgK1au5OUoOm2PR/fo
	lXH2VBlsVBzZbjCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750691450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=srwnavYMkAT7XquGJcQO2o1xU8X5tXZZcOaw+TQa8kw=;
	b=d4zm7sViORq2tvuKP/vnqpG26TtyZMYWjQXPzy2cs03TWKZjwrDkCg19i9ReRuXRK14Dql
	qbxrPikfFpzVGUlqEc4vy+524uIoolf/yuNKPstjNd4hAjHVGtbbL4uH8udjj2gJ2MkTnw
	5OXokiYwsyB72bbsar3G5xwDP6wfcjM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750691450;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=srwnavYMkAT7XquGJcQO2o1xU8X5tXZZcOaw+TQa8kw=;
	b=XL24f+D+5HUC8iAc8h2iH1triQtuJ0FKMMZV2a7rzI1YlEBHvKX3sgK1au5OUoOm2PR/fo
	lXH2VBlsVBzZbjCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EAA7B13A27;
	Mon, 23 Jun 2025 15:10:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zrkROHluWWi+dAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Jun 2025 15:10:49 +0000
Date: Mon, 23 Jun 2025 17:10:49 +0200
Message-ID: <87a55ymr2e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: mixer_oss: Remove deprecated strcpy() function calls
In-Reply-To: <20250623113855.37031-2-thorsten.blum@linux.dev>
References: <20250623113855.37031-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[wanadoo.fr];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,zeniv.linux.org.uk,wanadoo.fr,suse.de,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Mon, 23 Jun 2025 13:38:54 +0200,
Thorsten Blum wrote:
> 
> Remove the deprecated strcpy() function calls and assign the strings
> directly to a 'char *' instead.
> 
> Use 'if/else if' instead of two separate if statements.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v2:
> - Assign the strings directly as suggested by Al and Takashi
> - Use if/else if instead of if/if
> - Link to v1: https://lore.kernel.org/lkml/20250618223631.1244-2-thorsten.blum@linux.dev/

Applied now.  Thanks.


Takashi
