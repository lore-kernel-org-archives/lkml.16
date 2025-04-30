Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D8D1E32CF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991614; cv=none; b=Y1dBrqP5wCuL6EJOTLRIgE6FsupGMTjdnAcCE7KgKPBPhRMBBXLQe5nM2lLBc+xDICbCQh7umYmwNQIr19eBCtMabsjg8qIg2JUF1tMM4RVobYK6/PkvsIQUWpycdqc744fK/KBg6PhzsXcZbkwOOBalf7Knn8PO135sKSuNpsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991614; c=relaxed/simple;
	bh=Rks/z5pvNnkW8jw8F3BNTA6GvFnmGZsFIEqNGjSPL1U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HqyEQ0zdRDOMvVV/MWnIMhH4etnbElqio+yP0gT/KPD6estelhIR+mcUZwwWkaJP5m5blS68m2hBsrSaHqN/LD7opyALzzzBLMdGG4VWwwp8f9aF0rskigRKwlMOlcrqkG/zLkGHg5/p4+GL3/jQ/71BXlfGAzcyTeGE2QVcpeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sHY7rW9l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8F1rlxHr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sHY7rW9l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8F1rlxHr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sHY7rW9l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8F1rlxHr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sHY7rW9l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8F1rlxHr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B934A1F8D4;
	Wed, 30 Apr 2025 05:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745991610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ef3vhgzQ6S2bq1sA344x3fCjxztqPPdJA26s88tKsTg=;
	b=sHY7rW9lxKzGzq/NDXramO1baa5wue2s0VVrhX6aVEtW+iMNOtbx0CtikAc5x/bXprqutQ
	umRUb2fsuFQbKacCa0eq/8E91UhV04h1+cMz1zOe1Jd1Qaw2wmDak9AaDGcFN7B/L/ZGU3
	NLMIadbI2Ad2qpF2yzyOjOGG3KXp9V8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745991610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ef3vhgzQ6S2bq1sA344x3fCjxztqPPdJA26s88tKsTg=;
	b=8F1rlxHraT/r0RgHk8Xas4c+XcCIzs6UgDA95smczixVhUt03QxP1ICVzYAuw4FyNa1AbC
	ZQcpRQshQbqDeiCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745991610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ef3vhgzQ6S2bq1sA344x3fCjxztqPPdJA26s88tKsTg=;
	b=sHY7rW9lxKzGzq/NDXramO1baa5wue2s0VVrhX6aVEtW+iMNOtbx0CtikAc5x/bXprqutQ
	umRUb2fsuFQbKacCa0eq/8E91UhV04h1+cMz1zOe1Jd1Qaw2wmDak9AaDGcFN7B/L/ZGU3
	NLMIadbI2Ad2qpF2yzyOjOGG3KXp9V8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745991610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ef3vhgzQ6S2bq1sA344x3fCjxztqPPdJA26s88tKsTg=;
	b=8F1rlxHraT/r0RgHk8Xas4c+XcCIzs6UgDA95smczixVhUt03QxP1ICVzYAuw4FyNa1AbC
	ZQcpRQshQbqDeiCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F5081384C;
	Wed, 30 Apr 2025 05:40:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IC2kGbq3EWjXXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Apr 2025 05:40:10 +0000
Date: Wed, 30 Apr 2025 07:40:10 +0200
Message-ID: <877c32dx6t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13564923607@139.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>,
	<Baojun.Xu@fpt.com>,
	<robinchen@ti.com>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and leverage SND_SOC_TAS2781_FMWLIB
In-Reply-To: <20250429111055.567-1-shenghao-ding@ti.com>
References: <20250429111055.567-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 29 Apr 2025 13:10:54 +0200,
Shenghao Ding wrote:
> 
> Most codes in tas2781_spi_fwlib.c are same as tas2781-fmwlib.c, mainly for
> firmware parsing, only differece is the register reading, bit update and
> book switching in i2c and spi. The main purpose of this patch is for code
> cleaup and arrange the shared part for i2c and spi.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> Acked-by: Mark Brown <broonie@kernel.org>

Applied now to for-next branch.


thanks,

Takashi
