Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638D8226D1D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876153; cv=none; b=IM5LsDHlOMzjJhUvS/jqqdBMC96EcAAQruNTGCvslyjOGyXJ8AnZ/Pm/wC7tPxJl0mJeDATwP5WxqtkqYei/27xhGF30/92/1Oa+CsX/XE6hX5i9p/MrWI8Muq3E/yE8NNCwUAy+Ha9Y9MwCrY6kqAnwMW/fzxK+Ezrkgsh2Zao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876153; c=relaxed/simple;
	bh=mmsuWg92E1oRARJsckfmaN9kCc+sTcUE7a4qFv2JjcY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbCpOepN/kIgpVgCCd/7FqKSfeAA/yMOKSPAN19xs8MguWwEPngREX70GQVycst/gwCenDQgs4L3ZKXNTrc3PCO8wuHo5LBDw5DP7i8jqcMeGwjrX7p04UuDVpiVOgpW5tDamWpHyseOa8f5SfkVIW6clky3i65NPVvy3honodc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jeWyvWNp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=apFAX9Vi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jeWyvWNp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=apFAX9Vi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jeWyvWNp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="apFAX9Vi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jeWyvWNp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="apFAX9Vi"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 92E781F7BD;
	Mon,  2 Jun 2025 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748876149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aGgH2NC4M/mYCe/ce1FmqHa6Dl8VRr5A1u9oMQuPP5Q=;
	b=jeWyvWNpHb1y6AAXrn5cbsuxUSq0HkLL8QEwl3BGs1pjzQFzShw3UA5Tkw+4eV2odPj6kp
	sWI5PJnh6Shj1Yi2aU2hwTbW6AiFPg1euTy6tnHnabk5fe6gc8dFbV1VIe8LkHwR4Xd4rD
	QnkGtEYbEk1MIY2EkGrZfs0YAd1RdKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748876149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aGgH2NC4M/mYCe/ce1FmqHa6Dl8VRr5A1u9oMQuPP5Q=;
	b=apFAX9ViT3BTWfUZu24e6mWYkx8J8Z1xccr16w4qFiYzRhZqzgO2Qqo7fm0JHLP/T0hanf
	99X2TL4uEtAajGDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748876149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aGgH2NC4M/mYCe/ce1FmqHa6Dl8VRr5A1u9oMQuPP5Q=;
	b=jeWyvWNpHb1y6AAXrn5cbsuxUSq0HkLL8QEwl3BGs1pjzQFzShw3UA5Tkw+4eV2odPj6kp
	sWI5PJnh6Shj1Yi2aU2hwTbW6AiFPg1euTy6tnHnabk5fe6gc8dFbV1VIe8LkHwR4Xd4rD
	QnkGtEYbEk1MIY2EkGrZfs0YAd1RdKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748876149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aGgH2NC4M/mYCe/ce1FmqHa6Dl8VRr5A1u9oMQuPP5Q=;
	b=apFAX9ViT3BTWfUZu24e6mWYkx8J8Z1xccr16w4qFiYzRhZqzgO2Qqo7fm0JHLP/T0hanf
	99X2TL4uEtAajGDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59A65136C7;
	Mon,  2 Jun 2025 14:55:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h77BE3W7PWhnYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Jun 2025 14:55:49 +0000
Date: Mon, 02 Jun 2025 16:55:48 +0200
Message-ID: <87jz5uxkej.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	kernel@collabora.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] ALSA: usb-audio: Support jack detection on Sony DualSense PS5
In-Reply-To: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
References: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,collabora.com:email,suse.de:mid]
X-Spam-Level: 

On Mon, 26 May 2025 16:07:39 +0200,
Cristian Ciocaltea wrote:
> 
> The Sony DualSense PS5 controller has an internal mono speaker, but it
> also provides a 3.5mm jack socket for headphone output and headset
> microphone input.
> 
> Since this is a UAC1 device, it doesn't advertise any jack detection
> capability.  However, the controller is able to report HP & MIC insert
> events via HID, i.e. through a dedicated input device managed by the
> hid-playstation driver [1].
> 
> This patch series implements a quirk to create the jack controls for
> headphone and headset mic, respectively, and registers an input handler
> for each of them in order to intercept the related hotplug events.
> 
> It's worth noting there is no hard dependency on the HID patch set [1],
> as the usb-audio driver will simply bind the jack controls to the input
> devices when they become available - this is managed internally by the
> input handler framework.
> 
> Unrelated to the above, the series also provides fixes to a bunch of
> general coding style issues as reported by checkpatch.
> 
> [1] https://lore.kernel.org/all/20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com/
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Thanks for patches.  Through a quick glance, the code change looks OK,
but since it's with significant amount of changes, so I'll postpone
after 6.16 merge window (once after I'm back from traveling).


Takashi
