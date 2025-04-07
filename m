Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032B922AE48
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010365; cv=none; b=hM6xwjlYoLiys/4Uu24ECq/uuXzEsohzxA8g3k0oyZTAGhSzAiedUnqfm+DeyfCxWvFQjNeQvEFS0G+59AfXokGRG10PRypSsBw0Lzphs7ItFY8IHcUbxhYLmNb12RaDWk39FtnfRPAIRDGSMsjN9ybe9jCRo237GrR0bBks/xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010365; c=relaxed/simple;
	bh=DAG0+NZr8Yq9DNdG3q9M9d2SScqSHuVnJUjlQKryvi8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IFLGWeIfqH8i1Zd1ZyGiZHRLgDcZEqyJS4A24Lzorgim5jKlkyOphhnHc8XBR3nSc0ECiaE8kxwt1jfzvoZGWL/Du/MX23pfmPQMdaXZbTEf3qYOZYmEQVsxz9tNct7Q3J60Ty3dDwYW5atUyN+H7A08NulE4GOKp6p6jQyzuXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1wdPj81I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RiEDjTto; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1wdPj81I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RiEDjTto; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1wdPj81I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RiEDjTto";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1wdPj81I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RiEDjTto"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 03ABC1F45F;
	Mon,  7 Apr 2025 07:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744010362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJPQPgPnYz3BTZuNrfG8zerDkfLejSqhADvVT9sjsis=;
	b=1wdPj81I3+ePY6WnhDS8Nj/IMMe/17S3PAKvfsPXH4/hNlOGdmk2YuDTdNv7eZ/O9+X1AP
	s2PifKigdvSJFzZkrds7Cm7gWHxZ8xciPSb2jp28tcLFU3Oetf5fa2NrC5SaYXAIrYfb9b
	bj+6fN48SlBaS6GLJ/0LNIfde50ISsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744010362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJPQPgPnYz3BTZuNrfG8zerDkfLejSqhADvVT9sjsis=;
	b=RiEDjTtoxW2Y4WT1iGplL/3X2jxOQEAMDOMrjvXIpfECDzPqso6Ng6N5UZvpDLbns8kP8T
	rTN/eev488fvulBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1wdPj81I;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RiEDjTto
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744010362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJPQPgPnYz3BTZuNrfG8zerDkfLejSqhADvVT9sjsis=;
	b=1wdPj81I3+ePY6WnhDS8Nj/IMMe/17S3PAKvfsPXH4/hNlOGdmk2YuDTdNv7eZ/O9+X1AP
	s2PifKigdvSJFzZkrds7Cm7gWHxZ8xciPSb2jp28tcLFU3Oetf5fa2NrC5SaYXAIrYfb9b
	bj+6fN48SlBaS6GLJ/0LNIfde50ISsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744010362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJPQPgPnYz3BTZuNrfG8zerDkfLejSqhADvVT9sjsis=;
	b=RiEDjTtoxW2Y4WT1iGplL/3X2jxOQEAMDOMrjvXIpfECDzPqso6Ng6N5UZvpDLbns8kP8T
	rTN/eev488fvulBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC76F13A4B;
	Mon,  7 Apr 2025 07:19:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZGC3KHl882d1FQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 07 Apr 2025 07:19:21 +0000
Date: Mon, 07 Apr 2025 09:19:21 +0200
Message-ID: <87frik1ls6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	dan.carpenter@linaro.org,
	baojun.xu@ti.com,
	broonie@kernel.org,
	ckeepax@opensource.cirrus.com,
	andriy.shevchenko@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tas2781: Remove unnecessary NULL check before release_firmware()
In-Reply-To: <20250407061939.2771803-1-nichen@iscas.ac.cn>
References: <20250407061939.2771803-1-nichen@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 03ABC1F45F
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Mon, 07 Apr 2025 08:19:39 +0200,
Chen Ni wrote:
> 
> release_firmware() checks for NULL pointers internally.
> Remove unneeded NULL check for fmw here.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Applied now.  Thanks.


Takashi
