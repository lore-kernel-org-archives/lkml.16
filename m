Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0C519938D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413529; cv=none; b=si6mboSt4VCEKCh0s5bRdIP4xdFIuJrb4zDhV4VhuxrTTDbELwizii9CjSxo28WB/KZGNF4WQuM0SPHoYwxTUM7+b3gCcDtHDXEE+kKxTUa35cB9Oui0EPKez9N4f57Oj527a94S+KWkrnCQIXhhp1u9Zf8Ux6vdPw2NJmf8ByQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413529; c=relaxed/simple;
	bh=NSlEX9T4BVfKB62PAhMWD4/RnQEMD6rZwifLw7qooHU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pPKb4dkPgCm7BBvo03h564rAFhY+g7po0HwJEoOqeygRfuE9KvJEpLfIAPeckgdIWv3FgxvoDqI8GVod6Ilt70tRPNueHG8hrLXCOiwiEv52tUBuMGYK/Yd5DAq+AjvI37XVUSBMu0w+Gl7pmvgiQM6P2gCQ61UCRFL9fjc1ZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gG4HUQ6X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YbHHiFZ6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=puYLkIQ6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J+spiZ1S; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gG4HUQ6X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YbHHiFZ6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="puYLkIQ6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J+spiZ1S"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D35941F38D;
	Mon, 31 Mar 2025 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743413526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ffSjceT3CZ/KLIlLh4JmTbyT28397G+oT49jzaCS+uc=;
	b=gG4HUQ6Xi32D21bzdBBfZym9DS1DVoLvf2y5rUwmxyD9HucAhtpJ/FJIJiHS0QVr6bWhgt
	+fnWthZ6MKN1/RBkudgbD8tSb+WkCRoykBwq+07R3DfGVVArKeDkkR4gu5YWBrX05FF9vm
	bQjhI1T46o8MRbn9pCl3+2/U7wpvS6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743413526;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ffSjceT3CZ/KLIlLh4JmTbyT28397G+oT49jzaCS+uc=;
	b=YbHHiFZ6NlJHH0hfny1kDvrWPiOxANcn3pBY81jSMspi4Bn9ziVZ+AgwT3joKd6r0OZphl
	fERk0n5neuXJbnDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=puYLkIQ6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=J+spiZ1S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743413525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ffSjceT3CZ/KLIlLh4JmTbyT28397G+oT49jzaCS+uc=;
	b=puYLkIQ6ExoSFr+dsqzvmQVOZUs3tvmE1n8sWW+9eO4XFj2PNEde67tSKIfjhELgEAQRma
	wbIPVe/ntqvU3XcDzhy0eaXkAF7Nlzwrh3dJuS789n5N1cCjgN4Xuy1Ojlx3fB8amjM3kK
	mi2qom6XRjbM/5W6NyM+WqjPFGUBxC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743413525;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ffSjceT3CZ/KLIlLh4JmTbyT28397G+oT49jzaCS+uc=;
	b=J+spiZ1Sg3T9dF2hyE6ZhXiq06lV3cgF9bPf4gW5/i6XcQWiBwP9KjC5IUQ306O2d5eGey
	oRZ1auxru45EfCAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CE3113A1F;
	Mon, 31 Mar 2025 09:32:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ocLoJBVh6megUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 31 Mar 2025 09:32:05 +0000
Date: Mon, 31 Mar 2025 11:32:05 +0200
Message-ID: <877c454kbu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ALSA/hda: intel-sdw-acpi: Remove (explicitly) unused header
In-Reply-To: <20250331070758.3986134-1-andriy.shevchenko@linux.intel.com>
References: <20250331070758.3986134-1-andriy.shevchenko@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: D35941F38D
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,intel.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 31 Mar 2025 09:07:58 +0200,
Andy Shevchenko wrote:
> 
> The fwnode.h is not supposed to be used by the drivers as it
> has the definitions for the core parts for different device
> property provider implementations. Drop it.
> 
> Note, that fwnode API for drivers is provided in property.h
> which is included here.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied now.  Thanks.


Takashi
