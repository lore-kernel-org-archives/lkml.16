Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B062E3711
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751790427; cv=none; b=GBIH3OWwUQ39D00Fd8B1QfFdMo4qjfw71yEgwNiZe9WuMN9gJ4LUuGeTvpnq9zmUjQdH7AaH94nlIA0NTvveLIjddpPvGn7iv5vapT2CcmR5KcGUXFh1xt8BTV8tfiJ+5DqD6llP3/dwyPTj0C+UrDqibt3mCLLF3VA4fhfEnIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751790427; c=relaxed/simple;
	bh=QOwAkOTBRt9Q2/ACUWkA30X4Wu4Lu+MJqwpy8flwpLw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UR7uF1ju4guLqRKSYhIpFHLmBwJQYLDEc5pAPlcyYnI7w5vsL2BZ9w63Upi0ZctAdAbH5WwfcjLHag3voUfvbskLN/nNZQz4AsFroVHtSG+OI03a5DN3HHmMLDVzoq3hd2feK3YpOuANayFK0tl2hC/Gz1dBQxT9oUaWwjKqaCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r6XmR775; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KRWCuUKT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r6XmR775; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KRWCuUKT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r6XmR775";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KRWCuUKT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r6XmR775";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KRWCuUKT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 276D821186;
	Sun,  6 Jul 2025 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751790424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U7XGF81Zy4BLhWeguUuOhJ8CxpB2vCSub4eTuJSp/Sk=;
	b=r6XmR775rVgipa7JVstwwPRhlN0MFURSzpeSNNE4RcV/F+GIS4nDThKOzILDuSvQXHOEmX
	VH0gw1/AoNu8VAI58C7SpkCZf/fH8b1T0T3WYhYUWtt0c/HuC3wQS4Scczs4+1Y+4DyWAE
	Cl6T3wc7sS1SMeD8V3v112plUsW9BQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751790424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U7XGF81Zy4BLhWeguUuOhJ8CxpB2vCSub4eTuJSp/Sk=;
	b=KRWCuUKTTO0LUjG3bl/2jIZncl6mG34/FjcH0GkSXTluOReaFPaBbI9aoD3eM9rhFvqhpN
	Khr+NXvkKxQmDUBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r6XmR775;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KRWCuUKT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751790424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U7XGF81Zy4BLhWeguUuOhJ8CxpB2vCSub4eTuJSp/Sk=;
	b=r6XmR775rVgipa7JVstwwPRhlN0MFURSzpeSNNE4RcV/F+GIS4nDThKOzILDuSvQXHOEmX
	VH0gw1/AoNu8VAI58C7SpkCZf/fH8b1T0T3WYhYUWtt0c/HuC3wQS4Scczs4+1Y+4DyWAE
	Cl6T3wc7sS1SMeD8V3v112plUsW9BQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751790424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U7XGF81Zy4BLhWeguUuOhJ8CxpB2vCSub4eTuJSp/Sk=;
	b=KRWCuUKTTO0LUjG3bl/2jIZncl6mG34/FjcH0GkSXTluOReaFPaBbI9aoD3eM9rhFvqhpN
	Khr+NXvkKxQmDUBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B27EB13A29;
	Sun,  6 Jul 2025 08:27:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K95zKlczamiCXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 06 Jul 2025 08:27:03 +0000
Date: Sun, 06 Jul 2025 10:27:03 +0200
Message-ID: <87v7o5n2qw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Kevin Lu <kevin-lu@ti.com>,	Baojun Xu
 <baojun.xu@ti.com>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,	Dan Carpenter
 <dan.carpenter@linaro.org>,	Chen Ni <nichen@iscas.ac.cn>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 69/80] ALSA: hda: Remove redundant pm_runtime_mark_last_busy() calls
In-Reply-To: <87plegnp69.wl-tiwai@suse.de>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
	<20250704075455.3222438-1-sakari.ailus@linux.intel.com>
	<87tt3snpo1.wl-tiwai@suse.de>
	<df66418f-29a9-4dc8-95eb-a4d81d5f0d2a@sirena.org.uk>
	<87plegnp69.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 276D821186
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Fri, 04 Jul 2025 13:58:06 +0200,
Takashi Iwai wrote:
> 
> On Fri, 04 Jul 2025 13:52:50 +0200,
> Mark Brown wrote:
> > 
> > On Fri, Jul 04, 2025 at 01:47:26PM +0200, Takashi Iwai wrote:
> > > Sakari Ailus wrote:
> > 
> > > > pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> > > > pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> > > > to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> > > > pm_runtime_mark_last_busy().
> > 
> > > Acked-by: Takashi Iwai <tiwai@suse.de>
> > 
> > The suggestion in the cover letter was that we should apply these to our
> > trees after pulling a tag from Rafael's tree.
> 
> Ah thanks, that'd be even better, as we may have a big code
> restructuring of HD-audio for 6.17, and this would be certainly
> conflicting.

So now merged this to for-next branch.


thanks,

Takashi
