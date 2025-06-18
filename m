Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897ED35963
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234698; cv=none; b=BRcK42wgqHAEbFfUn7S655TrF5WO3YoxYNKq5uoGY96cfy/51GJkfykquEnmzaGT2/0cqiLF7jezZu5C5SWgPQLNNAuoVXvAAGVHtTXSqy0xsfjo7kiTTU1w+DY2g15DT3NkO9KMY8dhJjbT+jdZ/+ZD0C0qb5oYCUlIqUEHNLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234698; c=relaxed/simple;
	bh=wBTCEohqcCZDp6DCp8WEGgwcV3lIYN0T3Bf7JFzpw2g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Up/yLVG9DX1DnlWxS2jQCbQP+vN6k6KYant/EPrROjfhF0hBqajbnuYYFQLvlu6qle28ThzOLQi9790nEFO0QOGd2ItvhRFwOY81rkSonLHOnuS2oE1HLdcCMKMbcZuYQ6YMbLr+FqpV4a16w7Rhwc00mH8mybUopkyD2UtQ+jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lvNCcDuZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6l8aTBes; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lvNCcDuZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6l8aTBes; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lvNCcDuZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6l8aTBes";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lvNCcDuZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6l8aTBes"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7253A211A0;
	Wed, 18 Jun 2025 08:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750234693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+79qAmMyL5KTQBYuGU9+72mClK6xwDGJMdd6tFcpDc=;
	b=lvNCcDuZyPpwud7LLz49EqFjWEaMWFwBSzpqFmT5P8oawjW3d0Kgyf3omlGm2Bi7jrq48g
	WJKwf3HwnLZv+9VfzV9hL2J84jnbNpketG4kCl07+mTaZ1BygW6h2jCUbdnzkfnuNs7ArY
	oSDHxEhU5xJVUUzF2doCm1n7y1yy8Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750234693;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+79qAmMyL5KTQBYuGU9+72mClK6xwDGJMdd6tFcpDc=;
	b=6l8aTBesBb5QubYuxPC9jMdhzLDUPxO0IqYxXfWZrWgi8j/jWJl/Oxzdw2wv9iXY3kxhtl
	knZk+6cqH/IcQ5AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750234693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+79qAmMyL5KTQBYuGU9+72mClK6xwDGJMdd6tFcpDc=;
	b=lvNCcDuZyPpwud7LLz49EqFjWEaMWFwBSzpqFmT5P8oawjW3d0Kgyf3omlGm2Bi7jrq48g
	WJKwf3HwnLZv+9VfzV9hL2J84jnbNpketG4kCl07+mTaZ1BygW6h2jCUbdnzkfnuNs7ArY
	oSDHxEhU5xJVUUzF2doCm1n7y1yy8Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750234693;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+79qAmMyL5KTQBYuGU9+72mClK6xwDGJMdd6tFcpDc=;
	b=6l8aTBesBb5QubYuxPC9jMdhzLDUPxO0IqYxXfWZrWgi8j/jWJl/Oxzdw2wv9iXY3kxhtl
	knZk+6cqH/IcQ5AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CA7B13721;
	Wed, 18 Jun 2025 08:18:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CHuPCUV2UmiiBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Jun 2025 08:18:13 +0000
Date: Wed, 18 Jun 2025 10:18:12 +0200
Message-ID: <87bjqlzcmz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdicheng <wangdich9700@163.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH v2] ALSA: hda/conexant: Renaming the codec with device ID 0x1f86 and 0x1f87
In-Reply-To: <20250616074331.581309-1-wangdich9700@163.com>
References: <20250616074331.581309-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Mon, 16 Jun 2025 09:43:31 +0200,
wangdicheng wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Due to changes in the manufacturer's plan, all 0x14f11f86 will be named CX11880, and 0x14f11f87 will be named SN6140
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied now.  Thanks.


Takashi
