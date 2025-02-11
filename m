Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6D117C91;
	Tue, 11 Feb 2025 15:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287409; cv=none; b=pWUYsm6GSkTx8MkEgch2xbj2IiZ0CQrAXeNAn+3feTnGvPsyXa3ij0Kjj2lriV1ns9P6eB/CP+WM3k4E+P/q6Hao9k7dDo/1fnNQjCz/znbDT2ur+m7yWUgAja+aM+mDq8bhZ3NHJOB7NVlJcZTob5xVir/+LliDZvMry3ERBwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287409; c=relaxed/simple;
	bh=NgpUDOiCxXAJ2l7vt4WXoN5ydHJPgEl4QGCn20eVJY0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQSkUARBFOcwuqKclq9MLLVWrQpZTjK2JbrpbIuB5HBLy5TYPdXZNydrxIxTb2NF8Jr68BAThZ1CMhCQNfCxvrYBCTiw+6sx/xQQng4zFnTD7LoMZOMHzRh8vqDh3tomDjBak1xMTG+trB4W+VDngY+yGIjY9Am58ZiL9Ulctec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h2M4LnBM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JgMoY1h2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h2M4LnBM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JgMoY1h2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h2M4LnBM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JgMoY1h2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h2M4LnBM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JgMoY1h2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B682E38647;
	Tue, 11 Feb 2025 13:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739280982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bJFHm8hCwagSOL93ZsECYQlQo6J/qSGbw0QplzkBits=;
	b=h2M4LnBMfaIC/dfrWu+HfEkmnC7TPPcZR6X89c9+V3Y3c4XkoATlVpr90zqae/kFFkU4UP
	zeuF7XLHq8Jbocxtm55R2BmKs5gCxDxvuYYi+wJpbgGiTTU6BkHc94a2Mk27TFxfZLXtmN
	hikVtzS33VslWuVY4ywEZJZqR8SGZdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739280982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bJFHm8hCwagSOL93ZsECYQlQo6J/qSGbw0QplzkBits=;
	b=JgMoY1h28QcT6/0MLU5XSgl1LJv/krTPaYcyHcUtA8BWKh8dLRR8kfMgDZnRl4Ycp3z/F0
	e/N8zBHWOmSZtECw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=h2M4LnBM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JgMoY1h2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739280982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bJFHm8hCwagSOL93ZsECYQlQo6J/qSGbw0QplzkBits=;
	b=h2M4LnBMfaIC/dfrWu+HfEkmnC7TPPcZR6X89c9+V3Y3c4XkoATlVpr90zqae/kFFkU4UP
	zeuF7XLHq8Jbocxtm55R2BmKs5gCxDxvuYYi+wJpbgGiTTU6BkHc94a2Mk27TFxfZLXtmN
	hikVtzS33VslWuVY4ywEZJZqR8SGZdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739280982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bJFHm8hCwagSOL93ZsECYQlQo6J/qSGbw0QplzkBits=;
	b=JgMoY1h28QcT6/0MLU5XSgl1LJv/krTPaYcyHcUtA8BWKh8dLRR8kfMgDZnRl4Ycp3z/F0
	e/N8zBHWOmSZtECw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 382B113715;
	Tue, 11 Feb 2025 13:36:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0PGDDFZSq2eqOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 11 Feb 2025 13:36:22 +0000
Date: Tue, 11 Feb 2025 14:36:21 +0100
Message-ID: <87ed048uy2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <tiwai@suse.de>,
	<robh+dt@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<yung-chuan.liao@linux.intel.com>,
	<broonie@kernel.org>,
	<antheas.dk@gmail.com>,
	<stuart.a.hayhurst@gmail.com>,
	<dan.carpenter@linaro.org>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Update tas2781 hda SPI driver
In-Reply-To: <20250211083941.5574-1-baojun.xu@ti.com>
References: <20250211083941.5574-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: B682E38647
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,linux.intel.com,gmail.com,perex.cz,ti.com,139.com,vger.kernel.org,intel.com,linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 11 Feb 2025 09:39:41 +0100,
Baojun Xu wrote:
> 
> Because firmware issue of platform, found spi device is not stable,
> so add status check before firmware download, and remove some
> operations which is not must in current stage.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Applied now with Fixes tag.


Takashi
