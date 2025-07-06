Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D8F10F1
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751790197; cv=none; b=RI/TAM4JrUW+O48YsKzsLUGWcVr+kl/lSfENHe5yq1hnTPd4T3pWCS5DB7fo39fRRl2kgRgTqlUtukhDdbyVAWb6YhRZhh73k4lWc43VR2jC0OgTMCjmNiAzTXzHxcDzbJw48MlBs2Z+qVdHhxwrD+WQCW8kLgsrYM+cj1GW+5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751790197; c=relaxed/simple;
	bh=yKHTUzkMRD/ZbcIS6Da8x1PhdCbAr9s1IP9CUSF7XL4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lIiA7Lxxzsu7ftceRJB5FHDXYWy/kDqUrF01WBBXsYBCvjY2G2HXJ1E1aq01lHZGbi/0OiTY/Z87cmk8FyLrPTVC0JnI7JmTarkifYLeSbLc1n+N7OWXBbDKtz6xanNghFE5/ryNgPIHLakS3aBJF6f8CtMOe3UZcg8MdrF2vr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wEanTL1T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YLI61KKj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wEanTL1T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YLI61KKj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wEanTL1T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YLI61KKj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wEanTL1T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YLI61KKj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4ADCE1F388;
	Sun,  6 Jul 2025 08:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751790129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r8S0lBmASZZL78tqk4ub0Y7rTMGUKgNcqPQuidlP1Pk=;
	b=wEanTL1TtydfJPW95pNjRNSzJ0B3ox/Sm9r4RREO89KhESP/r2oVGWl0BAVBGXNLQFffXo
	vbdcgvtrZyhnyoVJ+qsTPnoXA68xhqZJn5Wewtb5QCZwitKARYrzqXuNjDQl6dXBLuXnj1
	alZ+FVn//WvfXuV8qRCB0Rw6v6gt6PQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751790129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r8S0lBmASZZL78tqk4ub0Y7rTMGUKgNcqPQuidlP1Pk=;
	b=YLI61KKjtO4Q49pvSXAmOYMS6+ZJET+LSqBtUKSWxpLtG5g4CqLv2vX7JCjLrCLIWW/BUF
	mTwNYaymG0cLMxAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wEanTL1T;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YLI61KKj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751790129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r8S0lBmASZZL78tqk4ub0Y7rTMGUKgNcqPQuidlP1Pk=;
	b=wEanTL1TtydfJPW95pNjRNSzJ0B3ox/Sm9r4RREO89KhESP/r2oVGWl0BAVBGXNLQFffXo
	vbdcgvtrZyhnyoVJ+qsTPnoXA68xhqZJn5Wewtb5QCZwitKARYrzqXuNjDQl6dXBLuXnj1
	alZ+FVn//WvfXuV8qRCB0Rw6v6gt6PQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751790129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r8S0lBmASZZL78tqk4ub0Y7rTMGUKgNcqPQuidlP1Pk=;
	b=YLI61KKjtO4Q49pvSXAmOYMS6+ZJET+LSqBtUKSWxpLtG5g4CqLv2vX7JCjLrCLIWW/BUF
	mTwNYaymG0cLMxAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE70913A29;
	Sun,  6 Jul 2025 08:22:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VruUNDAyamhnWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 06 Jul 2025 08:22:08 +0000
Date: Sun, 06 Jul 2025 10:22:08 +0200
Message-ID: <87zfdhn2z3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add bus name in device name check
In-Reply-To: <20250705025333.24346-1-baojun.xu@ti.com>
References: <20250705025333.24346-1-baojun.xu@ti.com>
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
X-Rspamd-Queue-Id: 4ADCE1F388
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.51

On Sat, 05 Jul 2025 04:53:33 +0200,
Baojun Xu wrote:
> 
> Device name start from bus name, as we use strstarts()
> to do compare, need add it for TXNW2781 device.
> 
> Fixes: b2904df0a347 ("ALSA: hda/tas2781: Add compatible for hardware id TIAS2781 and TXNW2781")
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Applied now.  Thanks.


Takashi
