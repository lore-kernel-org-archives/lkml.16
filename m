Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF55D261595
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880595; cv=none; b=tCtcdEnsnkvgHP4WB0npnPWfAUlog2xK9mGWqmZKSxGGD7bgFvVRCCTRMPWIcZYcgXTx0HWYgF9t8WUbwc83/M0IPkIDIZaN8Q0aenf1xlpYbLnsfv3Jpx1h/2+49y7tqhS0SJvKNIxx81gKdo0mpw3jvGrzzJui4gLwgRe3UTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880595; c=relaxed/simple;
	bh=UsGNeftounXhkbUe+5yOIq3FSti9y3K1tTSifx6MZAc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y1qdgXcIxQnDaVkigCh4AjOOZdHvwM7Ap3NDc9FqKkfwpWrIFHRAcOJ8pIG+y2Dxz/4v2WHbhdm0PjCpWI9DQYugq7kBTRHBaMLA1PuqFoPI1msfWWsDrEicqVwo1j3S5ekYIQsme67gl+duJzGTXvuotoujfRdZuCdUPdSkDGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GjkOdYZm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ooT1C0WG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GjkOdYZm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ooT1C0WG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GjkOdYZm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ooT1C0WG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GjkOdYZm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ooT1C0WG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3A2AF21170;
	Mon,  7 Jul 2025 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751880592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DE+nzHmTe/W5DTzuY77SnXTWP102InHxz+4dQ7YSFPI=;
	b=GjkOdYZmoyOfqaX2oWHgliNhg+pIa0byAHBvTnZvU3zPST5zLI009OYyak39ydBYC14IqQ
	7j0uZ+bmbwOlJ7Bv7BSzl50njfgGpIrDYR1//7Pq5/u/ffiV0ngIvq73+8oHVmKjRUDkkj
	Fdllk7RYBYVIClRlVWGw5gR8SFirWFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751880592;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DE+nzHmTe/W5DTzuY77SnXTWP102InHxz+4dQ7YSFPI=;
	b=ooT1C0WGP7I4vBb79uWeDq4ZC2nDh2w9xS3GoyHvANIG6fNZjMUXThR9X8RjVXqDRUzpNQ
	+ckpPvZz+fSq9qCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751880592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DE+nzHmTe/W5DTzuY77SnXTWP102InHxz+4dQ7YSFPI=;
	b=GjkOdYZmoyOfqaX2oWHgliNhg+pIa0byAHBvTnZvU3zPST5zLI009OYyak39ydBYC14IqQ
	7j0uZ+bmbwOlJ7Bv7BSzl50njfgGpIrDYR1//7Pq5/u/ffiV0ngIvq73+8oHVmKjRUDkkj
	Fdllk7RYBYVIClRlVWGw5gR8SFirWFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751880592;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DE+nzHmTe/W5DTzuY77SnXTWP102InHxz+4dQ7YSFPI=;
	b=ooT1C0WGP7I4vBb79uWeDq4ZC2nDh2w9xS3GoyHvANIG6fNZjMUXThR9X8RjVXqDRUzpNQ
	+ckpPvZz+fSq9qCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE25913A5E;
	Mon,  7 Jul 2025 09:29:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YYeFNI+Ta2jPSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 07 Jul 2025 09:29:51 +0000
Date: Mon, 07 Jul 2025 11:29:51 +0200
Message-ID: <87cyacnyb4.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Fix calibration data parser issue
In-Reply-To: <20250707090513.1462-1-baojun.xu@ti.com>
References: <20250707090513.1462-1-baojun.xu@ti.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Mon, 07 Jul 2025 11:05:13 +0200,
Baojun Xu wrote:
> 
> We will copy calibration data from position behind to front.
> We has created a variable (tmp_val) point on top of calibration data
> buffer, and tmp_val[1] is max of node number in original calibration
> data structure, it will be overwritten after first data copy,
> so can't be used as max node number check in for loop.
> So we create a new variable to save max of node number (tmp_val[1]),
> used to check if max node number was reached in for loop.
> And a point need to be increased to point at calibration data in node.
> Data saved position also need to be increased one byte.
> 
> Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> 
> ---
> Change in v2:
>  - Add more description about this fix.

Applied now.  Thanks.


Takashi
