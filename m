Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4228324886F
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750182; cv=none; b=kPxQIzj+9CsxAdR/TtxsJiTSG/S3oh2afcY3jVxSUbLXLj3/kr2gUEjrbF3oxOTNNAt35kymmeLGW5d7LplGUY6DNclCpMPTYcav3iZ40+RucIIRr2JW4nLzt38e6u8rZ5aYwtLFKJtJFMJwKQUmHrG1rbazHR41ZwgFviGinI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750182; c=relaxed/simple;
	bh=8kqzLa3EHHzPS+d4UJRWgcv5VXMY2qV/uaTIkdLuOlE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fZs59C+JvRIsGg+nWL2LpuTDI10rt3omNJkExT4xuyVf+oX2R9xW0Tj1zx6+THiTvIfcd/F4FuyujJ8Bp8LbJgsI2alTiCVhlXhzwQ0zWd+EBP0I+Jaaw/J58p03uMYoAAf1/B8za52EP6/ZNt1dneigiAuh+ZHzLjXPxh/FjZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WjhIhgS8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PHewgn42; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WjhIhgS8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PHewgn42; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WjhIhgS8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PHewgn42";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WjhIhgS8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PHewgn42"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 557D52244B;
	Tue, 20 May 2025 14:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747750179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cxJ0VeUDI0dil5pU/WVy+JNPWwgVFCpmbw8ZiwQkHEk=;
	b=WjhIhgS8CCFEaiktFGBtl1+Zuez+hAElcuQggrLFsvQDSX9GseRGP1msX46G8cxHwe1yqZ
	xfYVUZQnoa3zTRzzzHB/UzjaXF5PKIs3eCpGb4rKNbOCNfcE87Uk9XRO6/agfVHzBiblWJ
	FtGcBVJlePlaOco14cXSyw9C56OMsLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747750179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cxJ0VeUDI0dil5pU/WVy+JNPWwgVFCpmbw8ZiwQkHEk=;
	b=PHewgn42qo1sU1KA3+MShFCjIRXfbErEVYOflzXBeLuo+5hTwOax4KWPSR3zY/R3TDXqvg
	ZYJzgji1pOiUeHBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WjhIhgS8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PHewgn42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747750179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cxJ0VeUDI0dil5pU/WVy+JNPWwgVFCpmbw8ZiwQkHEk=;
	b=WjhIhgS8CCFEaiktFGBtl1+Zuez+hAElcuQggrLFsvQDSX9GseRGP1msX46G8cxHwe1yqZ
	xfYVUZQnoa3zTRzzzHB/UzjaXF5PKIs3eCpGb4rKNbOCNfcE87Uk9XRO6/agfVHzBiblWJ
	FtGcBVJlePlaOco14cXSyw9C56OMsLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747750179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cxJ0VeUDI0dil5pU/WVy+JNPWwgVFCpmbw8ZiwQkHEk=;
	b=PHewgn42qo1sU1KA3+MShFCjIRXfbErEVYOflzXBeLuo+5hTwOax4KWPSR3zY/R3TDXqvg
	ZYJzgji1pOiUeHBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37E8413A3E;
	Tue, 20 May 2025 14:09:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +A7QDCONLGj/HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 May 2025 14:09:39 +0000
Date: Tue, 20 May 2025 16:09:34 +0200
Message-ID: <878qmrqspt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1] ALSA: hda/realtek: Add support for HP Agusta using CS35L41 HDA
In-Reply-To: <20250520124757.12597-1-sbinding@opensource.cirrus.com>
References: <20250520124757.12597-1-sbinding@opensource.cirrus.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 557D52244B
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 20 May 2025 14:47:43 +0200,
Stefan Binding wrote:
> 
> Add support for HP Agusta.
> 
> Laptops use 2 CS35L41 Amps with HDA, using Internal boost, with I2C
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Applied now.  Thanks.


Takashi
