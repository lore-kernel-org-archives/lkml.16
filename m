Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F2436B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165152; cv=none; b=AHQpl+pJD/g12rHhdp1SCtTI9Zv7OQd/oaAJbE3U4dlUYTP2hRPPzaqXg5oLYRNc3bE7DQS/TPQh8WZrzlQEIdnCaAvvNos3WaAvJGG7mD6g647D0yl4K1bEvXzrRrAcsr3VbdIheTTRdYsrFIcktuglAGF/w+7Rta4nEKtasRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165152; c=relaxed/simple;
	bh=0H5it2xIKnE5BTRJ7GYMNekXuQoGpGDaCDpjF0vYegY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u1yK/SJJfy+eGWu8qfDlU9GYWRz/QyEVtsZp9Iy931RmD4xVRFNQe/YC76FkQHZV8yGsTeHYPvFnv9155j7yl+QJftZl1fqPxKftgp4uI9mRtQJa+g48AmyQAGcNrAwf97VSO4wSAhNESgn2il5H/Vaxk++QVppMBn/UT3VkcUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KFrRD143; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YBu+Lp3x; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KFrRD143; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YBu+Lp3x; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KFrRD143";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YBu+Lp3x";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KFrRD143";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YBu+Lp3x"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4E688211D3;
	Fri, 28 Mar 2025 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743165149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KlEQLPwbcSypN8cs0uxLeuy5r1kRFmvFuvn20PzGOKo=;
	b=KFrRD1434v+nCItpBpaRCJRwUYX9QY/pYvVqyWx58RgRb5GvJ4zM0XuLtCaAIfPUDLncRO
	C9nytR3wKbE6cm2s9/m7i8p3jf5gmCkzdfZQAuHZjQ0TNylQZGa9Myx8G/rVYM1WOMXGtg
	c5C3D01qeqGMXOhWBzhxKBaPRiBXh6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743165149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KlEQLPwbcSypN8cs0uxLeuy5r1kRFmvFuvn20PzGOKo=;
	b=YBu+Lp3xH+/3bzrySju9eV+IuR2XbnxZcogmtBgiqR3Jk3BNqwPWHTHKrLupgyWXAW5+j2
	ngjft/UmaLjtvCDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KFrRD143;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YBu+Lp3x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743165149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KlEQLPwbcSypN8cs0uxLeuy5r1kRFmvFuvn20PzGOKo=;
	b=KFrRD1434v+nCItpBpaRCJRwUYX9QY/pYvVqyWx58RgRb5GvJ4zM0XuLtCaAIfPUDLncRO
	C9nytR3wKbE6cm2s9/m7i8p3jf5gmCkzdfZQAuHZjQ0TNylQZGa9Myx8G/rVYM1WOMXGtg
	c5C3D01qeqGMXOhWBzhxKBaPRiBXh6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743165149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KlEQLPwbcSypN8cs0uxLeuy5r1kRFmvFuvn20PzGOKo=;
	b=YBu+Lp3xH+/3bzrySju9eV+IuR2XbnxZcogmtBgiqR3Jk3BNqwPWHTHKrLupgyWXAW5+j2
	ngjft/UmaLjtvCDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 013A013927;
	Fri, 28 Mar 2025 12:32:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ui6YOtyW5mcwUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Mar 2025 12:32:28 +0000
Date: Fri, 28 Mar 2025 13:32:28 +0100
Message-ID: <87jz89e3oj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13564923607@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>,
	<Baojun.Xu@fpt.com>,
	<robinchen@ti.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Upgrade calibratd-data writing code to support Alpha and Beta dsp firmware
In-Reply-To: <20250328074326.796-1-shenghao-ding@ti.com>
References: <20250328074326.796-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 4E688211D3
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,ti.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Fri, 28 Mar 2025 08:43:26 +0100,
Shenghao Ding wrote:
> 
> Since 2025, the firmware for tas2781 has been added more audio acoustic
> features, such as non-linear compensation, advanced battery guard,
> rattle-noise suppression, etc. The version was divided into two different
> series. Both series have a slight change on the calibrated data storage
> addresses, which becames flexible instead of fixed. In order to support
> new firwmares in time, the code have some related upgrades.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> v2:
>  - revise the subject and description.
> v1:
>  - Add updating calibration addresses code into tas2781_apply_calib in
>    case of Alpha and Beta firmware.

This looks *much* better.  Applied now.


thanks,

Takashi
