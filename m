Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D153025FA28
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105895; cv=none; b=Sm+k4v8cePEyO/gRCdP0s9FCMKRFc+sCx2u1yofsYjAUT7IZPaoZCqwzp99QAQr4ruRJd0XRRQuHjIKiFOK1piZ5kzGNWz4IN6wB4GDK89DMhaHK8StzpvTTyzEwHY0pAfm+AXP7dKdsaGtOeXDsHa7cL0+jXwzWFGLt4MqSb7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105895; c=relaxed/simple;
	bh=2rmDqBVNnJow/Izch2RKqEREyckuweIDxTIuLkdoYTU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PeiNXS/grPPVGvVL3itsc88srz6DPH2A8OS/d9JdhTsawiBAoQktzRPLzJLlZrxJIBbc9xxnRgUPD98mo/Xh6JHjcWAZyCHSL67r6+8kbMlpQV0m/MO8cjk1OG4ZOTpN0haaL8s5qwdnYADfqoG7dBFjHWUAABxqM+K3j0GYdrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GWAl6PnR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8VmJ4aMc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DjGqfLmF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5eKetpmQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GWAl6PnR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8VmJ4aMc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DjGqfLmF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5eKetpmQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E6F561F38D;
	Tue,  8 Apr 2025 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744105892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=plKxmgLrHG7bYDg0n35vnbolULMBfb11CTmaF6tUImQ=;
	b=GWAl6PnRxEl1TBt8vJuqr53VvYctpbp3mT1532NXHVlMtcWzgFdWHwLHDqBROa+i1x9FpX
	16V+x5b5wZ8Cx5AgyZEQvBBp/r54cS6BxyWcgAWShnAj5nPszAPJovrc4YUZ9e977pdhV0
	x1xJDpmKMhOAN1sf6E2Omhmj6IsuUEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744105892;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=plKxmgLrHG7bYDg0n35vnbolULMBfb11CTmaF6tUImQ=;
	b=8VmJ4aMcCWd09rWg4aXIx7WlCvc4dWh5Id4eACbrw6jN0oVfeV0L+lQOQJuMvVvu1a7w+q
	xBbfo2f50SW3DZAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DjGqfLmF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5eKetpmQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744105891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=plKxmgLrHG7bYDg0n35vnbolULMBfb11CTmaF6tUImQ=;
	b=DjGqfLmF7eMwAetIg6NnLyqBQWNcSj5lkvXhJ47IZtT5LXWtyLqX4p5pP2njWu3s8ZB53Q
	pw4rSu/zlTQZGfH1LfytrNzOYuCfv6syVPJ60Ino9f5UY6H+BySFOs9GOitbf5HGNIrUaQ
	U3x5ftyKepPlU29aaPMKOuAVCilBOcc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744105891;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=plKxmgLrHG7bYDg0n35vnbolULMBfb11CTmaF6tUImQ=;
	b=5eKetpmQLiJYJjBMAhE040256fxz+pc2pwa86qzC+UiPLFWFvdDjcYj94LK5wji8xsna7R
	TjseWkD3LnX+1IAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D200713A1E;
	Tue,  8 Apr 2025 09:51:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lU2/MqPx9GezawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Apr 2025 09:51:31 +0000
Date: Tue, 08 Apr 2025 11:51:31 +0200
Message-ID: <87a58rasm4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: cs46xx: Remove commented out code
In-Reply-To: <20250408083015.796638-2-thorsten.blum@linux.dev>
References: <20250408083015.796638-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: E6F561F38D
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 08 Apr 2025 10:30:12 +0200,
Thorsten Blum wrote:
> 
> The code has been commented out ever since commit 1da177e4c3f4
> ("Linux-2.6.12-rc2"), remove it.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.  Thanks.


Takashi
