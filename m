Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6952BE7B5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630292; cv=none; b=km6J4tzLc2FEc8i85uIqz44qwVBp4FqJdJTNAnyhS2soPXRYqQ1qsjZgSY5nxdKLUr9y0F5On6pHxqEGZY8/jsBH6ZESrtGwi8OuIBGYiJQmcI8JgYYfAqNzncdt66LXHKPOnylx5T8F9bMiFG4gVoCSQk8NirkBC0q7ljD5yck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630292; c=relaxed/simple;
	bh=8w/fUjXy4jb7MDhiu3vIfhkSj71IkZQ/NbthWh72KhI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MC5EnZsbf6xLWxE3P5Yjq+vEOnqEJ/hYwePlTrt8g6tte3fsQQpOnkeYz3B+uh6Ru/elEYTzWDsS/8TBXWS1cZFFriK0LhHiQ445kPbU705kEUU5fsXFdDICXYdxreHDpqy9PjK5//giE7bWfjln4MQ20E8W/ox6r5rbHJ85m3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lR20qnYZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kVJ5XzLz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PGB2v0rR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TK7HUlLA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lR20qnYZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kVJ5XzLz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PGB2v0rR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TK7HUlLA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4CF432118A;
	Fri,  4 Jul 2025 11:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751630288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AuYBUgPcqMK1iR0jxsn51GBJ6CgxQ8tHH/dY+Y83TlE=;
	b=lR20qnYZ/hHrOZ2nvVb7yn/UnWsi9l7rLtVTTwr671Yx1Q9dj+4ugx0HVHwpSYak7xuu2+
	F4yAWA9AK3opGfhClUu0DllDU3McGIla3ph7aK8YCoiPef5GckwEJBhNGe7ztaAO+rwvoc
	nB0GkTSEGZLXDUiav6K54RobEv0KDsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751630288;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AuYBUgPcqMK1iR0jxsn51GBJ6CgxQ8tHH/dY+Y83TlE=;
	b=kVJ5XzLzLiQbS7fQfB+HWwMy7VnBIyH7L8RWrm44DzOr9pqLxv4EQwEc+UdqNpF9NEEJ5o
	ZgWeYBUQ7ChWaBBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751630287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AuYBUgPcqMK1iR0jxsn51GBJ6CgxQ8tHH/dY+Y83TlE=;
	b=PGB2v0rRr+CF21r3lZC7KVggoZ5YXNKSR9WoW8BMX/I7+223jNfslxP4WsWsmsIfFaFVKC
	vfygrAS1K+Fyclh9xzgqpKos63itDq7DhTDQFYcRomt0v7Jzp3U0cYK5UJhMQRIIW4O5lp
	domYBTkxTMKvn/e9yU6U764PQJp96Z4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751630287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AuYBUgPcqMK1iR0jxsn51GBJ6CgxQ8tHH/dY+Y83TlE=;
	b=TK7HUlLALJbxuI//ST5qI8D6NEqlFdpIdMjKAPuLN6icnUiLA7Zkjm/LfFSVYF/XhdA2ra
	N91UbTjMljIZvKBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFC8B13757;
	Fri,  4 Jul 2025 11:58:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZXVyMc7BZ2hvTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Jul 2025 11:58:06 +0000
Date: Fri, 04 Jul 2025 13:58:06 +0200
Message-ID: <87plegnp69.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,	Sakari Ailus
 <sakari.ailus@linux.intel.com>,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	David Rhodes <david.rhodes@cirrus.com>,	Richard
 Fitzgerald <rf@opensource.cirrus.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Kevin Lu <kevin-lu@ti.com>,	Baojun Xu
 <baojun.xu@ti.com>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,	Dan Carpenter
 <dan.carpenter@linaro.org>,	Chen Ni <nichen@iscas.ac.cn>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 69/80] ALSA: hda: Remove redundant pm_runtime_mark_last_busy() calls
In-Reply-To: <df66418f-29a9-4dc8-95eb-a4d81d5f0d2a@sirena.org.uk>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
	<20250704075455.3222438-1-sakari.ailus@linux.intel.com>
	<87tt3snpo1.wl-tiwai@suse.de>
	<df66418f-29a9-4dc8-95eb-a4d81d5f0d2a@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Fri, 04 Jul 2025 13:52:50 +0200,
Mark Brown wrote:
> 
> On Fri, Jul 04, 2025 at 01:47:26PM +0200, Takashi Iwai wrote:
> > Sakari Ailus wrote:
> 
> > > pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> > > pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> > > to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> > > pm_runtime_mark_last_busy().
> 
> > Acked-by: Takashi Iwai <tiwai@suse.de>
> 
> The suggestion in the cover letter was that we should apply these to our
> trees after pulling a tag from Rafael's tree.

Ah thanks, that'd be even better, as we may have a big code
restructuring of HD-audio for 6.17, and this would be certainly
conflicting.


Takashi
