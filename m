Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FBA2135D7
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747687099; cv=none; b=Ffml1Gag4BRo7NNnTAdcnDzPIE+OeMkMJXJwVbybfjDvcj/LcnGE1K7boelI4vb9EY551nuLXgD165EGk0Zad96ngOXeULCXUXhgWPtP8FFxkJajZ1Bddm6umXy88TLVZR9zbBQdimO7hmujJwUgHqpCZ3z034VPqmDyUgDNEDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747687099; c=relaxed/simple;
	bh=WnLUcmymGixTzqL+j3K1lA0RnLyFcEIn6jhQj2Payy4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qnauN8pw/hw9v4XzVbm9nL+2wfxSYK1Nv9xXAuZOf7ZTbtqt//XXsI3kAEXhMhdBLk+3kKFFNVQxdkcvmEeiW860VZsbQ0q8l5SUHfBK43nSS7hwVFN6JraymDKKat6JjJvBjVxJjmK0/jX0TGQ3lchUnIAryCCz+a7cbIsOSOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bRc+1E5K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+/SAWzaI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bRc+1E5K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+/SAWzaI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bRc+1E5K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+/SAWzaI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bRc+1E5K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+/SAWzaI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE131204D1;
	Mon, 19 May 2025 20:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747687095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1kqScQH/4kKffHalsGTZ69r5JatMjElCGgkdeLC5fHo=;
	b=bRc+1E5KhESYKlWP0azhBRSBwiHkcqRdl1rMcAh5DFT/pB60radjsTjpGupBf2h28AF836
	9rFyOr7oPOAPAD0O+GKCswwI36qv4lubTASVrb4I1dLkvrPX7aOWQNeX/+XqC9IICK3sBV
	G/eFlYyWbMD5DFQ/L7sBczJs3GTjgwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747687095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1kqScQH/4kKffHalsGTZ69r5JatMjElCGgkdeLC5fHo=;
	b=+/SAWzaIrxz4cI8BkfLgbyu2tn7kMQu7NOvFbx3jxWkujxbr1C+yXlj5YYKNUwr20WdokB
	yB+WmZD7CW6VZeDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bRc+1E5K;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="+/SAWzaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747687095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1kqScQH/4kKffHalsGTZ69r5JatMjElCGgkdeLC5fHo=;
	b=bRc+1E5KhESYKlWP0azhBRSBwiHkcqRdl1rMcAh5DFT/pB60radjsTjpGupBf2h28AF836
	9rFyOr7oPOAPAD0O+GKCswwI36qv4lubTASVrb4I1dLkvrPX7aOWQNeX/+XqC9IICK3sBV
	G/eFlYyWbMD5DFQ/L7sBczJs3GTjgwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747687095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1kqScQH/4kKffHalsGTZ69r5JatMjElCGgkdeLC5fHo=;
	b=+/SAWzaIrxz4cI8BkfLgbyu2tn7kMQu7NOvFbx3jxWkujxbr1C+yXlj5YYKNUwr20WdokB
	yB+WmZD7CW6VZeDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C18651372E;
	Mon, 19 May 2025 20:38:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RiKMLreWK2g6GgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 May 2025 20:38:15 +0000
Date: Mon, 19 May 2025 22:38:15 +0200
Message-ID: <87frh05oaw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Siddarth Gundu <siddarthsgml@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	u.kleine-koenig@baylibre.com,
	zhujun2@cmss.chinamobile.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: dbri: replace strcpy() with strscpy()
In-Reply-To: <20250519194833.106463-1-siddarthsgml@gmail.com>
References: <20250519194833.106463-1-siddarthsgml@gmail.com>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: DE131204D1
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 19 May 2025 21:48:33 +0200,
Siddarth Gundu wrote:
> 
> strcpy() is deprecated; use strscpy() instead.
> 
> Both the destination and source buffer are of fixed length
> so strscpy with 2-arguments is used.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>

Applied now.  Thanks.


Takashi
