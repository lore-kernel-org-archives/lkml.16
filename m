Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9D92E3711
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751790389; cv=none; b=O6+JkDwCMu2zcRlMacvcLLauh7c4XsBbsubVqAtie0+aMVzJO7Y+v2KsE67O7rqmC6pU9KmhOIZw7x6hXK434getYkwLyHpy9/iqiCfiNqABZ6D+3on9wtf9AQIHuRXVJd57S3nwUvzNqmVud5RRtm+vo2m7L1QkCemmmQLm3xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751790389; c=relaxed/simple;
	bh=u0UEUF4tDGgMgQR2fAkZ22IT3Ff1iiOHFZIh0H0tnbg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dKkzhbSgWT12TFb74GtIaR1xPAUq8S8e6oBHJkbwh9iO0LAxiUne/0E4X3xGHcpOe+eIBMaCG7D/oGtuZd4B5Pdn9PzGqHoK4lRbC6SFLb0G2P/DgJrSzZDe+VkBzAQSzl+sb9gJ8+OZC74WCLHxxlKGyoI4YusDTWNTWonYVOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OC7goVGr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CokNgi8G; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OC7goVGr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CokNgi8G; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OC7goVGr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CokNgi8G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OC7goVGr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CokNgi8G"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0BC9921185;
	Sun,  6 Jul 2025 08:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751790386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IV+RVwQN6Xc0bmEOH+D66h7hdowC10Lp8qRN+tfAGIA=;
	b=OC7goVGriUct9PyG+OfcQ1Ze9HwLHWaDZKc+q7MmDN/2S5GbNRPCYO8VQt9PXt2eOYblCk
	Ov6THW0wro3JGjvW6reUG0sb3WkUrqhSm9DfsFi2CpjlrkbzrsscYjlMjb9SAl6p9qdpUM
	kJ5Q966YhVepuM8W42cwRZZ2lsuXpF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751790386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IV+RVwQN6Xc0bmEOH+D66h7hdowC10Lp8qRN+tfAGIA=;
	b=CokNgi8GsQnnmBqQJrQObcR0yCbtxjuX8L0ggcCoNX1q+JZBLEOQZDWx1AmIY1MpDWLcYp
	M524m8YdmrMaPRBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OC7goVGr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CokNgi8G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751790386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IV+RVwQN6Xc0bmEOH+D66h7hdowC10Lp8qRN+tfAGIA=;
	b=OC7goVGriUct9PyG+OfcQ1Ze9HwLHWaDZKc+q7MmDN/2S5GbNRPCYO8VQt9PXt2eOYblCk
	Ov6THW0wro3JGjvW6reUG0sb3WkUrqhSm9DfsFi2CpjlrkbzrsscYjlMjb9SAl6p9qdpUM
	kJ5Q966YhVepuM8W42cwRZZ2lsuXpF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751790386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IV+RVwQN6Xc0bmEOH+D66h7hdowC10Lp8qRN+tfAGIA=;
	b=CokNgi8GsQnnmBqQJrQObcR0yCbtxjuX8L0ggcCoNX1q+JZBLEOQZDWx1AmIY1MpDWLcYp
	M524m8YdmrMaPRBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFB5813A29;
	Sun,  6 Jul 2025 08:26:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QVRZLTEzamhQXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 06 Jul 2025 08:26:25 +0000
Date: Sun, 06 Jul 2025 10:26:25 +0200
Message-ID: <87wm8ln2ry.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 75/80] ALSA: intel_hdmi: Remove redundant pm_runtime_mark_last_busy() calls
In-Reply-To: <87v7o8nprq.wl-tiwai@suse.de>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
	<20250704075500.3222950-1-sakari.ailus@linux.intel.com>
	<87v7o8nprq.wl-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 0BC9921185
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Fri, 04 Jul 2025 13:45:13 +0200,
Takashi Iwai wrote:
> 
> On Fri, 04 Jul 2025 09:55:00 +0200,
> Sakari Ailus wrote:
> > 
> > pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> > pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> > to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> > pm_runtime_mark_last_busy().
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Acked-by: Takashi Iwai <tiwai@suse.de>

I merged now to for-next branch together with Rafael's preliminary
branch.


thanks,

Takashi
