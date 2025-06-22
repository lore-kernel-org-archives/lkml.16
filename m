Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C279BEC2
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750584524; cv=none; b=r6S8J8eZNEmgCnhOnAeg9iCypYeV5RpXhV0J+4u2cgOLvI/xBrMu44AW6+KwQpgewiVOMSfH44T3d2o3ZApxQ2ZZVkRGFeF/+26cfWedklVlo7QueM0vvYH3cb2/EMXblpwhyTFzZtRcQjg/XXe9jCOoJxC4hdgJzw8vPQUZ7KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750584524; c=relaxed/simple;
	bh=m5tdLX8MP8KqyUukpkA2v3/LhhjGngpUXcVEJX00FGA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MMu74xhuVyR5OZkgY88glvIdKMkg3lGNY4XlldckeoSDl/fjDdHcJclsauMSZO5W2CS6tPGvw8zpnLF26bLQRI7tR+vGulb6zpn9jybLbciDNSHCzXG7UdFqU/CKVabOyPxq98VCVCLUgzlzKGwfuD4eByFtDmkfkHntGahLXv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q2cjAiiE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3q64V5v9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NiF56efS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6XmbjLk2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q2cjAiiE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3q64V5v9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NiF56efS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6XmbjLk2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ED7271F388;
	Sun, 22 Jun 2025 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750584514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i/Ie+y3IkUSeC7FgTgFt9X2MTkxDWOO8g39XCg2t8WI=;
	b=q2cjAiiEheLyNu7X8WjSx/KIVUEdBEQyiHSfaql0yBEjAPa60BTcv2CylL+8rWJebIHHbQ
	30PF7keXmKIo2aMblyk4qr38ZpbOcqKPd6wZOPeyt1QrfYtkvr4zgKxfhTUpWsXtIWRj0N
	mOyQdvfYrKAfoZM3Agsu4nlH+7GhOus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750584514;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i/Ie+y3IkUSeC7FgTgFt9X2MTkxDWOO8g39XCg2t8WI=;
	b=3q64V5v9xtVJeGGZzi549rZIKwz9tbxmADmTsJvTtP+dAQAJvGSb//wAjOsCSjfCL2zR6c
	rh2ZKTL0iwOfjdDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NiF56efS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6XmbjLk2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750584513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i/Ie+y3IkUSeC7FgTgFt9X2MTkxDWOO8g39XCg2t8WI=;
	b=NiF56efSTtOQObbMLzyyaP9wbev4bWns+pR1nvLAvKBXsMfkFOenpAfLMFI+Hdl0PnQ/mo
	BX5zKQMnreiPh45UeFmiBALEg35OcnLyUneajK4vM+wnxxIKWXlrjJUWOXvtkYlowbkFwX
	KS+qxOLofA0yafFf/O8UCJ/0JJJWXvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750584513;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i/Ie+y3IkUSeC7FgTgFt9X2MTkxDWOO8g39XCg2t8WI=;
	b=6XmbjLk2nsCXzl54twnhq5gNI8y7lJ9Cp3VlU1/nEw5WMe3z3s9H46z2PBcfd7WF1Fx075
	Wfg20zoeNn0stRDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA34A13A69;
	Sun, 22 Jun 2025 09:28:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e5bKK8HMV2igKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Jun 2025 09:28:33 +0000
Date: Sun, 22 Jun 2025 11:28:33 +0200
Message-ID: <87msa0w2f2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	phasta@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: intel8x0: Fix incorrect codec index usage in mixer for ICH4
In-Reply-To: <20250621185233.4081094-1-alok.a.tiwari@oracle.com>
References: <20250621185233.4081094-1-alok.a.tiwari@oracle.com>
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
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: ED7271F388
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Sat, 21 Jun 2025 20:52:24 +0200,
Alok Tiwari wrote:
> 
> code mistakenly used a hardcoded index (codec[1]) instead of
> iterating, over the codec array using the loop variable i.
> Use codec[i] instead of codec[1] to match the loop iteration.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Applied now.  Thanks.


Takashi
