Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029311714B4
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897890; cv=none; b=s6U+pXegoivVmx21BVUSGqx03A74CBRbJ28PZKlRabXGeo6uNHcHzKgoIqITY3sxq5YVLGxlCbmj95EEgrHDBM2gkHUYkHmXhFZFb/sYL3Q7IxOqoqDBQ9i94xk7J2atecGrWmfcFsNRztKtnEw4+PgTYaeE7xa5jr9FvaWTkUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897890; c=relaxed/simple;
	bh=IxVcX9HAZDAVXLWQOfYITQ7JI6BdE+h8bpaoqjA7gg8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jgMkpnrC5UWtFF6pueeu9oXGzd/Tr82FI5RMuCBwL905yaH4etPgvR3vKFPYZXw/UgJs7NSUDyRf4JxuvIgpUvtTqrVfsqBuVQ4nUFHiSSo49AFtNayjrrHkyQe5FJrjabTeSDH3UxG5zRO+E5LBOLbz/U1OAT9yzNpUElLu2VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xSnonLeg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UZjJFHgq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=koxIp/ic; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ku5C2E9w; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xSnonLeg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UZjJFHgq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="koxIp/ic";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ku5C2E9w"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E7F4D22475;
	Thu, 22 May 2025 07:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747897887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qf0+/c0ivuvI5IZj8NYoK+iuFx23I/xdZAXK+xWly14=;
	b=xSnonLegHQfJA2BiOniv6NIBTGOjvKT+PREc4bwtuVt4hyKl74bMEeKiy/t+46rjwmhZ77
	lcZRyDqwMFMI0SKmJ+iHBBMF2GrgR/0VSF2o71eX1A5NCYKMdcRriKZEiJv4lGbSs7FJnz
	dEWCEmWE1VF8+ABcJUYX1/8n6c8UwRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747897887;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qf0+/c0ivuvI5IZj8NYoK+iuFx23I/xdZAXK+xWly14=;
	b=UZjJFHgqVVZMevkcCh4PuOeo/VmhnD7K8BkXq2txLL5YOdTKr07zFZn+J7toK9Ddp3qsk8
	0IDu95R9O9RNoQBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="koxIp/ic";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ku5C2E9w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747897886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qf0+/c0ivuvI5IZj8NYoK+iuFx23I/xdZAXK+xWly14=;
	b=koxIp/icmX3WpaD7nDbVNuIyWQCbow/JExCec2UQ6QOSgxwjKDMKZgrVGtB/fIVvipKmhn
	gcACNv25f33Kf+VgTP1n3vUHvU7jJa52kTkjv4tDiioN/VhQ3gHZfXIBASQGNOAR7+WDBK
	ou4LraumyCdvixGztN1Xo+tiHRaZmt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747897886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qf0+/c0ivuvI5IZj8NYoK+iuFx23I/xdZAXK+xWly14=;
	b=ku5C2E9wpUhRxWAJUxlCNwFh+RtGn4nvZRsnB91/LAbhB8v9EK4YBq213dxl1NfdFpeV9L
	zxzMfTaRLMMno2Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B860913433;
	Thu, 22 May 2025 07:11:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FF0uLB7OLmgOCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 May 2025 07:11:26 +0000
Date: Thu, 22 May 2025 09:11:26 +0200
Message-ID: <87tt5d86ht.wl-tiwai@suse.de>
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
	<jesse-ji@ti.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib.
In-Reply-To: <20250522014347.1163-1-shenghao-ding@ti.com>
References: <20250522014347.1163-1-shenghao-ding@ti.com>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: E7F4D22475
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 22 May 2025 03:43:47 +0200,
Shenghao Ding wrote:
> 
> Calibration data getting function for SPI and I2C HDA drivers are almost
> same, which read the calibration data from UEFI. To put them into
> tas2781_hda lib for code cleanup is more reasonable than to still keep
> them in the codec driver. For tas2781 codec driver, there're two different
> sources for calibrated data, one is from bin file, generated in factory
> test, requested and read in codec driver side; the other is from user
> space during device bootup.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

Applied now.  Thanks.


Takashi
