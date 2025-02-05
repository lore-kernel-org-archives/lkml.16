Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142AC21516B;
	Wed,  5 Feb 2025 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738756999; cv=none; b=WxaqYnob1xET7vQYa3u2vvzoxA1fP4PwMjV2QKEElf0WcxeOIl1p6LNGhbVCd0GjTqM6oDE+shAG5e0PTMPKcfF8OeFEaEbnJlzWLZ3c6FWPJythIwKNKKRAwLdv0C/+0BbvpLEwMsfvUGQwXjkMCpQ0ewVsGK9p18pXQWn0lCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738756999; c=relaxed/simple;
	bh=QmkDwHrI/c+t2IlAP+8VfGH8V3h5MLbVA8cKyHBDeis=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o5E51Fj2CNWRB1M2w14AAVrBaXOFAR/gCCioj0o/Pb35aHn6GqbLBzJ79Db1HtbFF6n0AI0+vFMBlFCq6Gx4UMZKvwqVI5NiWozKsLEjFLwhs15WOyqOWjDwScJL7wvMowuy12Ui/3JIAkhLhGkkQH0VDKpA8sPiRjENIEyS8Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GqouyR3E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1IX4r1A5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GqouyR3E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1IX4r1A5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GqouyR3E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1IX4r1A5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GqouyR3E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1IX4r1A5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2DE4D211F7;
	Wed,  5 Feb 2025 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738756996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w6Xf0428skrBezRsfRPGS9o4iSQH1jKIk1Qxl6JafTg=;
	b=GqouyR3EyLqgVzAF/UA6+XtRD9lJJgTb9BSE3FQ3yNnYeHqOSA5t0nTV17THpNiOQHCtRX
	G0I7ANmACUia6nbwRdplJBlIT8bdXLEy0vYog89revV/qzO+dw2Dfc9OFMc4+72wZFIDYD
	+Td9vBy+AWozqsT0K42CmXp9PtsRfjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738756996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w6Xf0428skrBezRsfRPGS9o4iSQH1jKIk1Qxl6JafTg=;
	b=1IX4r1A5mCrft3DFYSb3lej+M/BLsvrzxm0tp3Hk+higoRrmqSYHYXGuhyIiM9RnGttb6y
	B1H1rwpseBSq8QDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GqouyR3E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1IX4r1A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738756996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w6Xf0428skrBezRsfRPGS9o4iSQH1jKIk1Qxl6JafTg=;
	b=GqouyR3EyLqgVzAF/UA6+XtRD9lJJgTb9BSE3FQ3yNnYeHqOSA5t0nTV17THpNiOQHCtRX
	G0I7ANmACUia6nbwRdplJBlIT8bdXLEy0vYog89revV/qzO+dw2Dfc9OFMc4+72wZFIDYD
	+Td9vBy+AWozqsT0K42CmXp9PtsRfjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738756996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w6Xf0428skrBezRsfRPGS9o4iSQH1jKIk1Qxl6JafTg=;
	b=1IX4r1A5mCrft3DFYSb3lej+M/BLsvrzxm0tp3Hk+higoRrmqSYHYXGuhyIiM9RnGttb6y
	B1H1rwpseBSq8QDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0332713694;
	Wed,  5 Feb 2025 12:03:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7D0jO4NTo2dZXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Feb 2025 12:03:15 +0000
Date: Wed, 05 Feb 2025 13:03:15 +0100
Message-ID: <87msf0zji4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux@treblig.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: lola: Remove unused lola_(save|restore)_mixer
In-Reply-To: <20250122022059.456068-1-linux@treblig.org>
References: <20250122022059.456068-1-linux@treblig.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 2DE4D211F7
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 22 Jan 2025 03:20:59 +0100,
linux@treblig.org wrote:
> 
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> lola_restore_mixer() and lola_save_mixer() were added in 2011 by
> commit d43f3010b8fa ("ALSA: Add the driver for Digigram Lola
> PCI-e boards")
> but have remain unused.
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied to for-next branch now.  Thanks.


Takashi
