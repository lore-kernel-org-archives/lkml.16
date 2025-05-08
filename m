Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E23A945
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697935; cv=none; b=ExHNHCsGGI4JTFZTtY4oKNjOuxELQh7VzQoOrgDVHJ7djLgvDeSjGnXce798GTOC+MT1qWOsXpaALMiIDs7TQyApV959WOYK76Jy6CFEd7aI+Ml8+5VNsy5gYii3Pxzq0PbTZ9ZCAEDDc/2zMku56VYSwf7EqMF3oVQFiRL+E7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697935; c=relaxed/simple;
	bh=ldJGcwHxUQbFSFn7ER9icWj0fdUAIU+3z7ihgF/grG0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E0IehnWgtP6+S/WrSfo6jzXhr71xKN/qT7KaavDuFJ/LjckUP7W325YD5X9kmy5WPW8n7o62ourC0rUoL7Lx2sYIWlSRYWv/wq7oVeq1GDYiyMJPlK0ZOxLRX+58641CzzhhzWV6Cn6ygqz2smoUc4lYoATXJpYyCgON931wkN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O87ZtX2c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=okbpSeg+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O87ZtX2c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=okbpSeg+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O87ZtX2c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="okbpSeg+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O87ZtX2c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="okbpSeg+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A080D1F385;
	Thu,  8 May 2025 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746697931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGI0t+JOL24BbL8mdiNkqGXOqII4M7WbHgTz5T4ucgQ=;
	b=O87ZtX2cXv0oOsNvO5bDNol3QhT/foJAuerBWQr6//t70qB+yGWrHtY0DRlGq4Jmuv2zSt
	ovh92y+o5DVPWWzVGEWGZpyO5Th7lxEcuk4LYfdMlgELCShQ4Tal/mbVsUckoTJs5As322
	8FjKW//vCXgJ5jyKF4f+PmQVZIHwvZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746697931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGI0t+JOL24BbL8mdiNkqGXOqII4M7WbHgTz5T4ucgQ=;
	b=okbpSeg+Avv9Ej3//v18q+suk5E16/6NIqBjP9IHe/nCe7yZTY8Z/JJHthjFtxmhfNhOqo
	U/xE10rOqQg7MuAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746697931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGI0t+JOL24BbL8mdiNkqGXOqII4M7WbHgTz5T4ucgQ=;
	b=O87ZtX2cXv0oOsNvO5bDNol3QhT/foJAuerBWQr6//t70qB+yGWrHtY0DRlGq4Jmuv2zSt
	ovh92y+o5DVPWWzVGEWGZpyO5Th7lxEcuk4LYfdMlgELCShQ4Tal/mbVsUckoTJs5As322
	8FjKW//vCXgJ5jyKF4f+PmQVZIHwvZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746697931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGI0t+JOL24BbL8mdiNkqGXOqII4M7WbHgTz5T4ucgQ=;
	b=okbpSeg+Avv9Ej3//v18q+suk5E16/6NIqBjP9IHe/nCe7yZTY8Z/JJHthjFtxmhfNhOqo
	U/xE10rOqQg7MuAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C54813A30;
	Thu,  8 May 2025 09:52:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G5ZKFct+HGiBdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 May 2025 09:52:11 +0000
Date: Thu, 08 May 2025 11:52:11 +0200
Message-ID: <87cycjv390.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Create an independent lib to save the shared parts for both SPI and I2C driver
In-Reply-To: <20250507045813.151-1-shenghao-ding@ti.com>
References: <20250507045813.151-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]

On Wed, 07 May 2025 06:58:13 +0200,
Shenghao Ding wrote:
> 
> Some common parts, such as struct tas2781_hda{...} and some audio
> kcontrols are moved into an independent lib for code cleanup.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

Applied now.  Thanks.


Takashi
