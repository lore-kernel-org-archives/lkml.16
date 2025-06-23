Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3B32CCC1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691403; cv=none; b=owoMCAWnTynLWxTNYQiuUnBE9XfJJvyUfpfat1AJUbVHVkM8VqeytkwzPL9d/UeAsJn0uWOAmkOuHUOyIq2viXIQJfQKzfy/bUzGVagjl7CEUNMcFvF9NQNtyYRGc2hx3tx4ZCkiMpUZ6i40GYgbNJalMWx/NuyzFbStnetDdHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691403; c=relaxed/simple;
	bh=Sr6/aCQ9znPK0NL2GOwKpOyKYgNPew7jDLwEkifHL80=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zk/K4xx0NeUScx5vfaXD6tEbA6UWiS/byLGdrb0BKSIkzz7argXbLSG+k8SdG38X3zIFZmMFkqQrbMrOVaE3aoIIDiGKlDA7AS6LKbh8FJzGezTpZK8vBrh3KSFphiQ17Md7XhV2GniOeZBskq/tjUkrWxRElRxtHcqMz6UwLTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YoZeGuAy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F5+uKMA4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ieetEjru; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1OQJtbvH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YoZeGuAy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F5+uKMA4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ieetEjru";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1OQJtbvH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CF56B1F385;
	Mon, 23 Jun 2025 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750691400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T1dRgbIxqHurv3dSR//sEvbLJ0hF3p55nTvWWdq+TLc=;
	b=YoZeGuAyk7uC4VcturGkRVX8EjFKtVogsK5oUqeOXE12c4crHVvl7J3C9N7OQUQRrmV+eB
	U4jX7sYyNYzK5Fdkn4nJSng3U6zX6JawAgUe4/3ttRAP/Y+zQNKzgB7dFzuawp+Ip2xDos
	LBT68qZ0+Q46yK1C9gHOdJ9xOO1JW8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750691400;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T1dRgbIxqHurv3dSR//sEvbLJ0hF3p55nTvWWdq+TLc=;
	b=F5+uKMA4ZkDS/xgWcN4Ck9F7U4DSIg9Bl6MsQTtigqzpVROw63GShzWZwcdZoLJykFywEG
	AdtQ5f/TMFNfa8Bg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ieetEjru;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1OQJtbvH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750691399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T1dRgbIxqHurv3dSR//sEvbLJ0hF3p55nTvWWdq+TLc=;
	b=ieetEjrueTl3rs2HD48OvAXFhi5aSkspx/3GB9HRPerajQ6kUZJOpYXVskeTM+YD5jjNwc
	p4ee/HjqCRtd4T/1gU9sU1XBH7r233CxgZuyQLSBgaGXg/2ZV1avXWjQB8SwdU5f5hs/0D
	YUiN8xYGoTBwjbrZYjvFtJ/aN8jJ7zA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750691399;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T1dRgbIxqHurv3dSR//sEvbLJ0hF3p55nTvWWdq+TLc=;
	b=1OQJtbvHiLA4wMj6nKk4pHlQLBi9a2E++HaIKds90qT2s/3yVt6Turq92o8VT9ZGmuXLxP
	3XlysG7Sc/eDeiBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A4E1313A27;
	Mon, 23 Jun 2025 15:09:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id E2dMJkduWWh4dAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Jun 2025 15:09:59 +0000
Date: Mon, 23 Jun 2025 17:09:59 +0200
Message-ID: <87bjqemr3s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Youngjun Lee <yjjuny.lee@samsung.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix out-of-bounds read in snd_usb_get_audioformat_uac3()
In-Reply-To: <20250623-uac3-oob-fix-v1-1-527303eaf40a@samsung.com>
References: <CGME20250623110528epcas1p3900a802d75f41ab81d30a527808bc094@epcas1p3.samsung.com>
	<20250623-uac3-oob-fix-v1-1-527303eaf40a@samsung.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CF56B1F385
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 23 Jun 2025 13:05:25 +0200,
Youngjun Lee wrote:
> 
> In snd_usb_get_audioformat_uac3(), the length value returned from
> snd_usb_ctl_msg() is used directly for memory allocation without
> validation. This length is controlled by the USB device.
> 
> The allocated buffer is cast to a uac3_cluster_header_descriptor
> and its fields are accessed without verifying that the buffer
> is large enough. If the device returns a smaller than expected
> length, this leads to an out-of-bounds read.
> 
> Add a length check to ensure the buffer is large enough for
> uac3_cluster_header_descriptor.
> 
> Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>

Applied now.  Thanks.


Takashi
