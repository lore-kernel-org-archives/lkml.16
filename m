Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D3CFBF0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751890394; cv=none; b=QyuLnqcgFrcO52XBnY/NzgKcGB266A3kMJ68NvuMmR1Pobr1AJTmWjHbIaSlNdGbUpbfLfMRh3Ae8UTy9zEgtCe+K59Kx5eC3jXK38IpgIp17uCejvwCBPWcb8ZdstOzfXnCKrkwlvPjzaH4t0955fdhg2hT0BHXK8TTmkcEJuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751890394; c=relaxed/simple;
	bh=EEtFPftDdya78fGhWRXqObrSHj26breUX5tp4zPFS0M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UhX5SxW241qNSAicf7Os6zkoBReyfjIe2CP29a0SabvnBDmg/kTq9iBB0b8vnSlTUafWH6BBezAnO9WF5R+BZLE2Chz7Bllz5xBTOrgWKz75ngPREdZwWi+U2OxvgaO+JY1E1/LOfLfFSYzvrKkkGfJh2yx6GmQoxqWsfQotFNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qY8Na0yh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MeenbD46; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qY8Na0yh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MeenbD46; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qY8Na0yh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MeenbD46";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qY8Na0yh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MeenbD46"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7E4992116D;
	Mon,  7 Jul 2025 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751890390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hpcT1qLuxwqxwWuLVauiWjf+S8BeY2MPti+d1R7eXMA=;
	b=qY8Na0yhMNX0R9fJ56E+QSRNdWWnqEbu3TLmSEC9pb9HO92Z7AO0u4RnahzgzTKuPqrTpQ
	P/V9SQSasJt4aIzUGUO/cUjyhp9G8vZWeXp7q/S4dsH2lXHPKMe1qhpv7MaguJYipi9mPc
	EZ7IzOD9xYo2+a8EypQ7REWgV7m28Gg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751890390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hpcT1qLuxwqxwWuLVauiWjf+S8BeY2MPti+d1R7eXMA=;
	b=MeenbD46GaAzupErnY9uR9/438/ClZ9MPtGYHrvenei2NW0s9tRD7O5pgUvqvKS8o6ug7U
	vo4Gu6gnexyMgmCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qY8Na0yh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MeenbD46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751890390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hpcT1qLuxwqxwWuLVauiWjf+S8BeY2MPti+d1R7eXMA=;
	b=qY8Na0yhMNX0R9fJ56E+QSRNdWWnqEbu3TLmSEC9pb9HO92Z7AO0u4RnahzgzTKuPqrTpQ
	P/V9SQSasJt4aIzUGUO/cUjyhp9G8vZWeXp7q/S4dsH2lXHPKMe1qhpv7MaguJYipi9mPc
	EZ7IzOD9xYo2+a8EypQ7REWgV7m28Gg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751890390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hpcT1qLuxwqxwWuLVauiWjf+S8BeY2MPti+d1R7eXMA=;
	b=MeenbD46GaAzupErnY9uR9/438/ClZ9MPtGYHrvenei2NW0s9tRD7O5pgUvqvKS8o6ug7U
	vo4Gu6gnexyMgmCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3011E13A5E;
	Mon,  7 Jul 2025 12:13:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5IieCta5a2iWAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 07 Jul 2025 12:13:10 +0000
Date: Mon, 07 Jul 2025 14:13:09 +0200
Message-ID: <87ms9gdwru.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	chris.chiu@canonical.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable headset Mic on Positivo K116J
In-Reply-To: <20250707114537.8291-1-edson.drosdeck@gmail.com>
References: <20250707114537.8291-1-edson.drosdeck@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7E4992116D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -2.01

On Mon, 07 Jul 2025 13:45:37 +0200,
Edson Juliano Drosdeck wrote:
> 
> Positivo K116J is equipped with ALC269VC, and needs a fix to make
> the headset mic to work.
> Also must to limits the internal microphone boost.
> 
> Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>

Applied now.  Thanks.


Takashi
