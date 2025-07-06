Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C752E3711
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751790326; cv=none; b=qiHPsY94Y5fo7fyFdnxoFMr8pcJVqPF0T/OBFC8U7KvMln8xtjPCb1Orcmg/sYBhTdbgYmhj3/OhfxERfakHQXxjSRJodmSWCd5eNkvfjjeWdSnyv3GPr1XeZbmAHRIVyQRqG661VPmBDyyz+gAIYctW04oK9IiqNR3amqcBc10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751790326; c=relaxed/simple;
	bh=czui/hoe1XrTEL9F7AaWuQcj7tp71dTQxYV84pw8uNA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lEfx8fK2ll4sGwtKl11E1ttZdnJcUNYbnlxA4Sq/3TbcWl4Elcu6pHRX2yu/HY337cVI6LBHHZiXENnyK/y/kpwBbokGHys1VRoT3o7buWsNlIR9kWYcyXaRkFfKwy+sqSCf8DEY8fGWZl82uhYxQO4CV3yVLsPZo4mO427EFPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Agy6GyCn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qybYFfuW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Agy6GyCn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qybYFfuW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Agy6GyCn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qybYFfuW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Agy6GyCn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qybYFfuW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1B7E021180;
	Sun,  6 Jul 2025 08:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751790208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3mJFCrTMKspb9NN+oGxNyMlJlXwvlzYkGHm2UPqJjMs=;
	b=Agy6GyCnZnV3a0IFQoYG9n1YKLAk37N9UySbaDQiaS5nNU0Kn0c4pJtESZAkUUM3NaqlSS
	CO+zFRJD4OyS+EvbyIIpgrGYnf4YSP8DAsIXSl4QV6ngze2qHUOMoIIq6/JRPbkYoskc5y
	J4VUVTOUcSlFGpXuksSCTwb/tx+CTCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751790208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3mJFCrTMKspb9NN+oGxNyMlJlXwvlzYkGHm2UPqJjMs=;
	b=qybYFfuWD1hmyCI1i/Wi7k/oeUp02Moe9U3DxR2LUSkQhgAyG6sXgYFU8jUa98b+aB9r3n
	9wyxXxs20zVll/Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Agy6GyCn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qybYFfuW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751790208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3mJFCrTMKspb9NN+oGxNyMlJlXwvlzYkGHm2UPqJjMs=;
	b=Agy6GyCnZnV3a0IFQoYG9n1YKLAk37N9UySbaDQiaS5nNU0Kn0c4pJtESZAkUUM3NaqlSS
	CO+zFRJD4OyS+EvbyIIpgrGYnf4YSP8DAsIXSl4QV6ngze2qHUOMoIIq6/JRPbkYoskc5y
	J4VUVTOUcSlFGpXuksSCTwb/tx+CTCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751790208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3mJFCrTMKspb9NN+oGxNyMlJlXwvlzYkGHm2UPqJjMs=;
	b=qybYFfuWD1hmyCI1i/Wi7k/oeUp02Moe9U3DxR2LUSkQhgAyG6sXgYFU8jUa98b+aB9r3n
	9wyxXxs20zVll/Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8BF313A29;
	Sun,  6 Jul 2025 08:23:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xsiWK38yamitWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 06 Jul 2025 08:23:27 +0000
Date: Sun, 06 Jul 2025 10:23:27 +0200
Message-ID: <87y0t1n2ww.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: GalaxySnail <me@glxys.nl>
Cc: simont@opensource.cirrus.com,
	david.rhodes@cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: hda: add MODULE_FIRMWARE for cs35l41/cs35l56
In-Reply-To: <20250624101716.2365302-2-me@glxys.nl>
References: <002901dbe4ef$57d0cce0$077266a0$@opensource.cirrus.com>
	<20250624101716.2365302-2-me@glxys.nl>
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
X-Rspamd-Queue-Id: 1B7E021180
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Tue, 24 Jun 2025 12:17:17 +0200,
GalaxySnail wrote:
> 
> add firmware information in the .modinfo section, so that userspace
> tools can find out firmware required by cs35l41/cs35l56 kernel module
> 
> Signed-off-by: GalaxySnail <me@glxys.nl>
> ---
> Thanks for your review!
> 
> v2 -> v3: fixed typo
> v1 -> v2: fixed missing ';' in the previous patch

Applied now to for-next branch.  Thanks.


Takashi
