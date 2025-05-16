Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840B822A80F
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382383; cv=none; b=qmsSeEtzjqzUF2zHJWpp4sOpgqHNsp17npnZpWrInpJBgwzjhURaGd5vGlYzCCqNRViiROkod6O6TiJgWvuDV8Pq0a7HGn+s8Ouo4CLFOgITNN0K5I/WLJCHkWS9mTHSP+5m4MqpnlLwzS7g1cvBm9eQn0v0DaBSuimtq1rMa5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382383; c=relaxed/simple;
	bh=bG15u9BRCWJbYkGJnw1XOhICAMTgBNw2gRZ5gGrzXOA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mea+EdWAh72guAOjPvdLQR0g2QKlX+sFQY5IXYbR9Az47snCUo2i7rzDID6fToDcyCiyBULQPbulMKM4hw2cDcrgPu5zEwTxjZ37lWtSYgFwfOU2VmzQlBo96Ls12DXYgIASL/+BCK5WO/C6lz7qf2ECfTgfp0Msi0xBDTGnlo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ST2soG+y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6fYDaBSr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ST2soG+y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6fYDaBSr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ST2soG+y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6fYDaBSr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ST2soG+y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6fYDaBSr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 847AC219A5;
	Fri, 16 May 2025 07:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747382379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5yMCAxmL0l2HDzj1vakgiNTgAsGqwmkT7S3OL83AbmQ=;
	b=ST2soG+yHU1D5HHlsLp7NKTmxTYrS2wXPZ07G31GnyOUNTqRlcgBaiVQb59icJxjzn6f/l
	h0juFZR6pXvT8NS79wmhOnAuBRNLrpOranz5As0wXxbX971FUfsWANOLTaHZ7hMmYJRqTG
	stbmcgfojVOMYas3rLYvcu4kI3HuG1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5yMCAxmL0l2HDzj1vakgiNTgAsGqwmkT7S3OL83AbmQ=;
	b=6fYDaBSrS1OAdB+3ALL0QaVWCVLR9qzgUNwOMKh+GKA+uSUBZPhDMqRp4CEq/y0b72iuJX
	0O/fd2ejq8pujVCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ST2soG+y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6fYDaBSr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747382379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5yMCAxmL0l2HDzj1vakgiNTgAsGqwmkT7S3OL83AbmQ=;
	b=ST2soG+yHU1D5HHlsLp7NKTmxTYrS2wXPZ07G31GnyOUNTqRlcgBaiVQb59icJxjzn6f/l
	h0juFZR6pXvT8NS79wmhOnAuBRNLrpOranz5As0wXxbX971FUfsWANOLTaHZ7hMmYJRqTG
	stbmcgfojVOMYas3rLYvcu4kI3HuG1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5yMCAxmL0l2HDzj1vakgiNTgAsGqwmkT7S3OL83AbmQ=;
	b=6fYDaBSrS1OAdB+3ALL0QaVWCVLR9qzgUNwOMKh+GKA+uSUBZPhDMqRp4CEq/y0b72iuJX
	0O/fd2ejq8pujVCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52ADF13977;
	Fri, 16 May 2025 07:59:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CyLlEmvwJmjXTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 May 2025 07:59:39 +0000
Date: Fri, 16 May 2025 09:59:38 +0200
Message-ID: <87v7q1vvdh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 0/2] Add Support for three Acer laptops using CS35L41
In-Reply-To: <20250515162848.405055-1-sbinding@opensource.cirrus.com>
References: <20250515162848.405055-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 847AC219A5
X-Spam-Flag: NO
X-Spam-Score: -3.51
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action

On Thu, 15 May 2025 18:28:31 +0200,
Stefan Binding wrote:
> 
> Add support for three Acer laptops using CS35L41 HDA.
> These laptops use External boost with I2C.
> 
> Stefan Binding (2):
>   ALSA: hda/realtek: Add support for Acer Helios Laptops using CS35L41
>     HDA
>   ALSA: hda: cs35l41: Fix swapped l/r audio channels for Acer Helios
>     laptops

Applied both patches now to for-next branch.


thanks,

Takashi
