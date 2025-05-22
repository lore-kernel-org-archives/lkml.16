Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE5C2F85B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919817; cv=none; b=E1UHuvkIf11LRs8MkTOyAVmFbLsVGoxGOp2zyIoyP2fmTOJzN0rfsurj1B69ORUnjrfDL3xm2QgR2cTsneeNISddMPf7nwQlt5AcFg88D/GO66j1NrG5ZRMDm2CxBIHgKRDCgqkBiI0WfnRQmsIYHLcIPQHa9ZBLS+JSNd/xGLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919817; c=relaxed/simple;
	bh=tcc4n387UsvLPQusjBltHNLaXRJtBPQIACDLMGtq97o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d33RWYchuIG/lSW8myEqX99k0j4zT6PerCpv2+Gij7zrG68qleyLVPPhbh/iM0Nd2heZzGeEcLiIJYcLrpjnwdodaL9BZp8BzcRxWjFS5TyHI0dtMZkVI7Bh/Rpm6JEDiu2L/QE0uaEPnzy7V2QkCwtGtgHgMPlJTk1WcR1r74M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MXr1ipGH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aw5+wuRn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MXr1ipGH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aw5+wuRn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXr1ipGH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aw5+wuRn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXr1ipGH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aw5+wuRn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 902051F766;
	Thu, 22 May 2025 13:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747919812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nwGR3WBG0Y3P3ClNI6DJYTqQ4ZoDuJNCVhvLlaFe27E=;
	b=MXr1ipGHQ9dSvix6ZvK1Ygj52Ihz8Y/qqkRQ2rWJz3QdMcD89CUnnd0ekpVgOk4cVTbHHU
	8LuN+AgkjmC04FXe55RZJeRhk6FkfxDtRe6kTQ10XPdd9RKFn1Q3/jIClVpoFTPFXkSVdi
	lsM4RNYxYA6oxJqOn4GwakrE6AUO860=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747919812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nwGR3WBG0Y3P3ClNI6DJYTqQ4ZoDuJNCVhvLlaFe27E=;
	b=aw5+wuRn7eOj+bqx5UDMxKSYaR7u+D2RiBXvEQPt+d51JhhMhmqBXRcqmp6M02nFRr9Fkk
	FDScakePI8jevpDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MXr1ipGH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aw5+wuRn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747919812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nwGR3WBG0Y3P3ClNI6DJYTqQ4ZoDuJNCVhvLlaFe27E=;
	b=MXr1ipGHQ9dSvix6ZvK1Ygj52Ihz8Y/qqkRQ2rWJz3QdMcD89CUnnd0ekpVgOk4cVTbHHU
	8LuN+AgkjmC04FXe55RZJeRhk6FkfxDtRe6kTQ10XPdd9RKFn1Q3/jIClVpoFTPFXkSVdi
	lsM4RNYxYA6oxJqOn4GwakrE6AUO860=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747919812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nwGR3WBG0Y3P3ClNI6DJYTqQ4ZoDuJNCVhvLlaFe27E=;
	b=aw5+wuRn7eOj+bqx5UDMxKSYaR7u+D2RiBXvEQPt+d51JhhMhmqBXRcqmp6M02nFRr9Fkk
	FDScakePI8jevpDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6891713433;
	Thu, 22 May 2025 13:16:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UQ+7GMQjL2iSfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 May 2025 13:16:52 +0000
Date: Thu, 22 May 2025 15:16:51 +0200
Message-ID: <87frgw9458.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: core: fix up bus match const issues.
In-Reply-To: <2025052204-hyphen-thermal-3e72@gregkh>
References: <2025052204-hyphen-thermal-3e72@gregkh>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 902051F766
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.51 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,suse.de:mid,suse.de:dkim,suse.com:email];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.de:mid,suse.de:dkim,linuxfoundation.org:email,perex.cz:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

On Thu, 22 May 2025 12:08:05 +0200,
Greg Kroah-Hartman wrote:
> 
> In commit d69d80484598 ("driver core: have match() callback in struct
> bus_type take a const *"), the match bus callback was changed to have
> the driver be a const pointer.  Unfortunately that const attribute was
> thrown away when container_of() is called, which is not correct and was
> not caught by the compiler due to how container_of() is implemented.
> Fix this up by correctly preserving the const attribute of the driver
> passed to the bus match function which requires the hdac_driver match
> function to also take a const pointer for the driver structure.
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Fixes: d69d80484598 ("driver core: have match() callback in struct bus_type take a const *")
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied now.  Thanks.


Takashi
