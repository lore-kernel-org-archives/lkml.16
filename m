Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E01E4A9;
	Mon, 10 Feb 2025 08:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177175; cv=none; b=uNSPBC4kFjolFs9Znr9q3/yyrDqwd55WF4TE6h4VWCaUhQ6Hg2+DAB5WY6oK27akYsLjXrMEjdRSJI+2aJMb/hLYc10Q6tQWjOZXhTlaX2RNgFu8v0FX7YDvjbce217eosSWif97OLUJRQX0giwgpm8b+/TVMLmb3/KerCyJWrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177175; c=relaxed/simple;
	bh=OsxMLLL2e2nkzcp3cDzzrbdfM0BoGFove7FXH5xh0kk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EdYA+LxzhktHiKjGsFH7rCOxC3crCNObdKxj3uBfWj6/kqO9yu9x3J9UZd2x/Ra8y1larnxOeg41v5CPmVjziHlhTNP6v94PzNYkgjuN7WYS3l4afTsQLCkHcykI6WVp5b70Ja/0eaanpifdETwcMAI3PkErd6D5jWuJsG5W2Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uw6Q2oI0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3D0aO8wV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uw6Q2oI0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3D0aO8wV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uw6Q2oI0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3D0aO8wV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uw6Q2oI0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3D0aO8wV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4CAAF1F37E;
	Mon, 10 Feb 2025 08:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739177172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAPVEaffpGCm08tYC2XioZUvJ5qz4xbHnYO8+6yPhvE=;
	b=Uw6Q2oI03xPOuZCtAxDcVyRjZouzqz6t74LVvxd41Ut9WQIqHLHg+lcMA3GQV2zRUkVl1G
	zS0zKULHvDmnlhEhcc+J1d5in7xqYIS6ZPX7W4WG7CG87z4edh/JDaGWx/2eClRcfjPL35
	MMiZJDXV4Dqk8zIkQ4ZZ6kVRqv/JL6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739177172;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAPVEaffpGCm08tYC2XioZUvJ5qz4xbHnYO8+6yPhvE=;
	b=3D0aO8wVyoTbcZguVTWoxSpHzlqVUmZpynSkK+mGQ81yn7kEuO2AC7PsVHeHjVUrmRKpZk
	yejS/EsX7CBNXgAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739177172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAPVEaffpGCm08tYC2XioZUvJ5qz4xbHnYO8+6yPhvE=;
	b=Uw6Q2oI03xPOuZCtAxDcVyRjZouzqz6t74LVvxd41Ut9WQIqHLHg+lcMA3GQV2zRUkVl1G
	zS0zKULHvDmnlhEhcc+J1d5in7xqYIS6ZPX7W4WG7CG87z4edh/JDaGWx/2eClRcfjPL35
	MMiZJDXV4Dqk8zIkQ4ZZ6kVRqv/JL6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739177172;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAPVEaffpGCm08tYC2XioZUvJ5qz4xbHnYO8+6yPhvE=;
	b=3D0aO8wVyoTbcZguVTWoxSpHzlqVUmZpynSkK+mGQ81yn7kEuO2AC7PsVHeHjVUrmRKpZk
	yejS/EsX7CBNXgAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01EE913707;
	Mon, 10 Feb 2025 08:46:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wP/IOtO8qWdJKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Feb 2025 08:46:11 +0000
Date: Mon, 10 Feb 2025 09:46:11 +0100
Message-ID: <87frkmuqzw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	WangYuli <wangyuli@uniontech.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Fix Optimus when GPU has no sound
In-Reply-To: <20250208214602.39607-1-maxtram95@gmail.com>
References: <20250208214602.39607-1-maxtram95@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,linux.intel.com,linux.dev,gmail.com,uniontech.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 08 Feb 2025 22:46:00 +0100,
Maxim Mikityanskiy wrote:
> 
> See the commit descriptions.
> 
> As agreed in the previous discussion [1], this series adds the
> non-functional NVIDIA HDA controller on Lenovo IdeaPad Z570 to the
> denylist, and includes the runtime PM workaround from v1, which now
> prints a warning to dmesg asking the user to add the device to the
> denylist if it's affected and not already there.
> 
> [1]: https://lore.kernel.org/linux-sound/877catiffo.wl-tiwai@suse.de/
> 
> Maxim Mikityanskiy (2):
>   ALSA: hda: intel: Fix Optimus when GPU has no sound
>   ALSA: hda: intel: Add Lenovo IdeaPad Z570 to probe denylist

Applied both patches to for-next branch now.


thanks,

Takashi
