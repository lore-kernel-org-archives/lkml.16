Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7511F2C158E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749901103; cv=none; b=o1ngUOJEKAiU77iJ0NLxZwaQIQOQzSyn1VWcx41sPV4KWg/oeMKFn6Apg+Sp6dvXDQV7NHE+QJOZk/oW7BVfQ9A6y670aZwcmvrWyqGUlNECx0NboortRuSgk60heDT8PAVGzMkUvS+xzQebmZRP5VxeJuaJiTyCwCU8mbLLCnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749901103; c=relaxed/simple;
	bh=x/Aa6PrSDM8cOma4szcWO4omMxjzyXrKN5b+GYb3pxM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azBm+6kUj6U9mGhizPr4j7XWOOzfTqpP3irQOCMfPuwHqC7ObfRIBAr40ddWAUvJ2LQ2Jio+ITZzGE3apgGBdjpJUExU925POh/YInWlCap9mOHgJhjCRG0DTW3xtZShuoxYXn1A9VmFD2oVOUP/4vPmcvP4oPpan6GKYBoxWl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F1KjQGvz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GePBkVqF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GB8PUis+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7x3Wa1Ro; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F1KjQGvz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GePBkVqF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GB8PUis+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7x3Wa1Ro"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 28424219A0;
	Sat, 14 Jun 2025 11:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749901098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h14esWdWQ5P2NEIReJZEb5wLNB54zIBc6ajyfNRAzlM=;
	b=F1KjQGvzfvYDYe8oMjB3BBDW4MzNa3YIKoSxi5Lj+BGNhJsV860ibqc3P8xgbOmrrApo8F
	L2uTVGkBbzew805fFbmQmiSmZFsN1SPKOGiWyIYTET1mk+HUISoj5hpk/8Rc6FHAaVtl/A
	hl9UAZWmtz+s0zngYvBoACGNF+DuPZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749901098;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h14esWdWQ5P2NEIReJZEb5wLNB54zIBc6ajyfNRAzlM=;
	b=GePBkVqFSY2Cb1gSesXnPSmFWUgtKySBBF43mL5FqVoKAHrpA9SqI9Xi/m+MKZCttWiomq
	kTy16hZBEf8Z2MCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GB8PUis+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7x3Wa1Ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749901097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h14esWdWQ5P2NEIReJZEb5wLNB54zIBc6ajyfNRAzlM=;
	b=GB8PUis+RVyD8q+eLTRO+TuaIonYZFpn2xF1bxnw77KGezNH912g0XaJuHv1NkLtGcdpkX
	S2ugvnCRAImcQ0PS5VmCME/Ie3E2kOi41p1bV1+AeeZJf06ScklcYCLOevQDEAbH9F5Qsw
	SdETJNlNQz2+7lXEKpZJgG/whekhOf8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749901097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h14esWdWQ5P2NEIReJZEb5wLNB54zIBc6ajyfNRAzlM=;
	b=7x3Wa1RoHBxYdVzAkbjmwm0M9lCKL+ULefqet/nW8G9PcIELCTidL0z8o/c5IS/sUOM3Dc
	ts1XNanH6wiFhDAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E99F513A17;
	Sat, 14 Jun 2025 11:38:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wbuXNyhfTWhhUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 14 Jun 2025 11:38:16 +0000
Date: Sat, 14 Jun 2025 13:38:16 +0200
Message-ID: <87bjqqr1sn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	nefelim4ag@gmail.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Asus GA605K
In-Reply-To: <20250613145251.397500-1-simont@opensource.cirrus.com>
References: <20250613145251.397500-1-simont@opensource.cirrus.com>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,vger.kernel.org,opensource.cirrus.com,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 28424219A0
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Fri, 13 Jun 2025 16:52:51 +0200,
Simon Trimmer wrote:
> 
> The GA605K has similar audio hardware to the GA403U so apply the
> same quirk.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> Tested-by: Timofey Titovets <nefelim4ag@gmail.com>
> Link: https://github.com/alsa-project/alsa-ucm-conf/issues/578

Applied now.  Thanks.


Takashi
