Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43BD2139B0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713404; cv=none; b=CfzBzRHl1aFKCGTCTQ8biZHEQxh1lZ1mqnFIO3gy4dZ5eAl2iG0J00NOmBLCs4bbgBvmDNxSuhLzOv7Oa7ClGqgV6uuREbPODa80t2Ow682gWjIpHwq8R39UearInSE8EXYEr93fEV9DWUDozsI0LJ0J6Dj6xFmkvS4FIe3tdaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713404; c=relaxed/simple;
	bh=kd+vd2hBCjJlWFs8nbd31uGpSQWqPWYqH2ilgcz+lXM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lpVoaCxXanD+obXgQr9ZsnzYfK5aSPjDQ3ICZJjMGqHmRiKgWWp/CzbRwcL0oBV5RJw2fgJfJllu87nrFXPmDld79yh46NrPf+0fNW8yq7SnWJ57lH1U0vJMbTXNa3JhLyoiIYqI8tvdLtDO4nWz88OEtFKkVF1sgbcupnqQDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UTgG5l9u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QXydL/u7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xf4NTLiO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+YsBOsQh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UTgG5l9u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QXydL/u7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xf4NTLiO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+YsBOsQh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E33261F391;
	Thu, 12 Jun 2025 07:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749713401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZkTEU3/q67RJKkZJGi7inSXpViDUneJqtH39mG+jjQE=;
	b=UTgG5l9u4Xs+HjGZRRIvx3FAY7tCYd8DomQht+ZOheiXZm3mREnbXqdOxhiJBR5jLi38pz
	p7Hgr+DxjsGJsCVuRU932GfSLCq5oOxwHg5OMSbZrO5WkiTJq5a22tXLEDFUmTKPSo/Bu8
	MJm5gAsvea8rq9OGXFh53IPvYrTffrA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749713401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZkTEU3/q67RJKkZJGi7inSXpViDUneJqtH39mG+jjQE=;
	b=QXydL/u7gH46qadC9LGHTnP40tbQ7LiYXs43h4NVfv1VcM1qfK6n6uwG2BHtSLUwFG3aMC
	oyt1Os7r4BY7osAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Xf4NTLiO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+YsBOsQh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749713400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZkTEU3/q67RJKkZJGi7inSXpViDUneJqtH39mG+jjQE=;
	b=Xf4NTLiO2I+4ZaTpKqp9XfiCy9F7MBBQuBl6VPZ85xSJFoMOMueL6ZqYnqWy6T1MEYWIHi
	dq04SyJIlzBJx+aGEnp+3eINbnzF5ZQ/XqK75q5LR3+gIMd383NhOuuvp0rIT1krAX8Ik/
	FQSAV7rJSpCrEtfncRyWlzkYf5l2q4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749713400;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZkTEU3/q67RJKkZJGi7inSXpViDUneJqtH39mG+jjQE=;
	b=+YsBOsQh8PDjtiXlSBw2rR6CBbqU6YwjjMkejsBoe+Us4QnrWpICL8hnPDRJFKogmP9Eg6
	N37VEB4jrC3nsmAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93A21132D8;
	Thu, 12 Jun 2025 07:30:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IdRkIviBSmiMGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Jun 2025 07:30:00 +0000
Date: Thu, 12 Jun 2025 09:30:00 +0200
Message-ID: <87ecvpv2mf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Chen Ni <nichen@iscas.ac.cn>,
	perex@perex.cz,
	tiwai@suse.com,
	franta-linux@frantovo.cz,
	lina+kernel@asahilina.net,
	livvy@base.nu,
	sstistrup@gmail.com,
	s@srd.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Convert comma to semicolon
In-Reply-To: <b8f6fb15-cc77-41c5-b362-70cfd6be6f37@collabora.com>
References: <20250612060228.1518028-1-nichen@iscas.ac.cn>
	<87ikl1v4cj.wl-tiwai@suse.de>
	<b8f6fb15-cc77-41c5-b362-70cfd6be6f37@collabora.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E33261F391
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[kernel];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,iscas.ac.cn,perex.cz,suse.com,frantovo.cz,asahilina.net,base.nu,gmail.com,srd.tw,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -2.01
X-Spam-Level: 

On Thu, 12 Jun 2025 09:22:36 +0200,
Cristian Ciocaltea wrote:
> 
> On 6/12/25 9:52 AM, Takashi Iwai wrote:
> > On Thu, 12 Jun 2025 08:02:28 +0200,
> > Chen Ni wrote:
> >>
> >> Replace comma between expressions with semicolons.
> >>
> >> Using a ',' in place of a ';' can have unintended side effects.
> >> Although that is not the case here, it is seems best to use ';'
> >> unless ',' is intended.
> >>
> >> Found by inspection.
> >> No functional change intended.
> >> Compile tested only.
> >>
> >> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> > 
> > Thanks, applied now.
> > 
> > At the next time, though, it'd be appreciated if you can put the
> > proper Fixes tag.
> 
> Considering this is not really a functional change, I think a 
> Fixes tag would trigger an unnecessary backport, wouldn't it?

If it were in the old released kernels, I wouldn't be bothered,
either.  But this is still in staging for the next, and having Fixes
tag will help to track if someone tries to backport patches.
Otherwise the code differs and may give conflicts in further
backports.


thanks,

Takashi
