Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420A145B25
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747114363; cv=none; b=uNdJrAT7j0u2k9S6XwIFK1jy9loB6JyslvOottDYR0cyCB6oykrSYNNFMNVzJXttLnbgP2SZqxKzHJzZqsupPKFvGuFVpx63Gr9JTqlF4yQA/oHkmZFjGyGOJaJOT+EpI5HJa6MDilAnYj3Z6rWI+0TN0AmmKI2rVlrbo5DLW8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747114363; c=relaxed/simple;
	bh=KOKvb6clCeEMBWeq7Qn71Iy+zIt1dvIP9b5IdjG3rOQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X88mZAyvov/NDA9I/1/iVf8Q8YvacIAncoAbzAle9rBzeutUvX/RTerPe9vmJb9UV3Ur/0oUR38Vg2QJiva+ujMHLwZrIZ74P9bcniUa7P2ta4VE/DzSXX+8bMd5cMzKHiHLKfbiqfj8EAjz3ofI7em8dLZefQO5LFidxvlRvMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vLZvAWFi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o+PNDXKh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nAsFSrIT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GLUEAO/k; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vLZvAWFi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o+PNDXKh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nAsFSrIT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GLUEAO/k"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFBDA1F387;
	Tue, 13 May 2025 05:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747114360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8+YP3MFOf50opCxkyeILE3xRd9jN2+HBaFhELp0y+Q=;
	b=vLZvAWFiva5d6lB0+FRfkuOCegCw/IQ6A2ZNamAuibWwvXpfwZQh/QS2RqHFHKjTg92hdA
	rZVZMEXkOmHG3xhnRoemF+kcj1vs4dHzL7+mLdRXeIiNXyebnsBzu3q6Hc5czMF4u/AJTz
	qk8OF7yqzDGRfUUfqnEOxuGes5td3ME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747114360;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8+YP3MFOf50opCxkyeILE3xRd9jN2+HBaFhELp0y+Q=;
	b=o+PNDXKhvsLhZg5+XaH30k9u08OsHDwghEGDIWObQuoq/0nO1buedlhIxgEXjZcGXvEwL6
	PD7LQ1Z+HbhqldAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747114359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8+YP3MFOf50opCxkyeILE3xRd9jN2+HBaFhELp0y+Q=;
	b=nAsFSrITww2ZP7QSea09h1JDy/B+VzVlswriGJubQ4uSgpyRSLIuZivu9TIXJVv8CMaWcm
	a/1b9ssNmcSE8jVyMifd21Rd8SVboQBfQobIsClYQLQI2YKXMlv4WAPS84L5/UuaRYUxFX
	PNmDsZrlIvaeY7egFWCl3jW6Y4fqiE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747114359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8+YP3MFOf50opCxkyeILE3xRd9jN2+HBaFhELp0y+Q=;
	b=GLUEAO/kaE0kHA3HFhsZ5l4Tj5mjJTdfaS1JFuRzrr+gO36ivICTajbOZwsOBMGnRZXZ2x
	DT8ohuI5akBuMABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 820771386D;
	Tue, 13 May 2025 05:32:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XBroHXfZImhhNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 May 2025 05:32:39 +0000
Date: Tue, 13 May 2025 07:32:38 +0200
Message-ID: <87h61pt6rt.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v3] ALSA: hda/tas2781: Fix the ld issue reported by kernel test robot
In-Reply-To: <20250512234833.772-1-shenghao-ding@ti.com>
References: <20250512234833.772-1-shenghao-ding@ti.com>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[urldefense.com:url,ti.com:email,intel.com:email,suse.de:mid]

On Tue, 13 May 2025 01:48:33 +0200,
Shenghao Ding wrote:
> 
> After commit 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c
> and leverage SND_SOC_TAS2781_FMWLIB")created a separated lib for i2c,
> However, tasdevice_remove() used for not only for I2C but for SPI being
> still in that lib caused ld issue.
> All errors (new ones prefixed by >>):
> >> ld.lld: error: undefined symbol: tasdevice_remove
>    >>> referenced by tas2781_hda.c:33 (sound/pci/hda/tas2781_hda.c:33)
>    >>>               vmlinux.o:(tas2781_hda_remove)
> To fix this issue, the implementation of tasdevice_remove was moved from
> tas2781-comlib-i2c.c to tas2781-comlib.c.
> 
> Fixes: 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and leverage SND_SOC_TAS2781_FMWLIB")
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> v3:
>  - Drop the report tag in the patch description.
> v2:
>  - put the Fixes tag to point out the commit that introduced the regression
>  - Add compiling error information reported by kernel test robot into patch
>    description.
> v1:
>  - | Reported-by: kernel test robot <lkp@intel.com>
>    | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505111855.FP2fScKA-lkp@intel.com/__;!!G3vK!U-wdsvrOG1iezggZ55RYi8ikBxMaJD

You dropped again those tags.  These should be put around your
Signed-off-by without quotes.  That is, something like:

Fixes: 9fa6a693ad8d ("....")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://....
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>


thanks,

Takashi
