Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7614A207A3A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730160; cv=none; b=RnJpBvmWQqVoUSsOxzUz2tf/CyYcTYFEfR8SWR2/LMneDcLoxeRIIKM1SMpKrB7XvGVw5HT7c4e8kVJAFpGu1B0gtIewYHO2jXdbo1YMDZSb1HSe/FAtF/OjIzG5HrlnsPjIN2VfofpKY3Ees7d+o7USG8z5498097gyPSTYzfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730160; c=relaxed/simple;
	bh=s451NwJTdK9pKu+ndL7Arl2MesG2pCDms37nQ7IyPMA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cGDOYkseV3g6D98xnN77wQxVro7vkMDGeDOJ0iXRpjQwAUtML1Ur831AJzNXQMv1oo+fBG3ZdFdxwKQKa+PSfebcSjbeiblUmVYJHnAIyaf7Ldr4dOhPz/K+7iJLFPicxzFMEtUuVcTxapNpoi64HQVDN0ruBHxLmyyzhS1PGrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cls2Kaxj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O7zQZ8p/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cls2Kaxj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O7zQZ8p/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cls2Kaxj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O7zQZ8p/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cls2Kaxj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O7zQZ8p/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7D5A71F395;
	Tue, 15 Apr 2025 15:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744730156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8rQFJzSR7WgZFd5/vD6kR7iiIa7sHuVwjXtD/YIn4Sg=;
	b=cls2KaxjXnU67suCAjpeG/NmTADtraNnlbMluUiJDMCsq8t1iOQhAxpFosXmfrmQqk9Cl4
	WGGiw7J2u9Qix2S1CcijMxmF1mIGtG2+uHoNUFFZFTkKGKq1tS45vnnZw097eqt7+pMQ6j
	pbuZ5JtABI/J/V5OIIxAKBkAft7q7Cw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744730156;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8rQFJzSR7WgZFd5/vD6kR7iiIa7sHuVwjXtD/YIn4Sg=;
	b=O7zQZ8p/no6lg9RtpMWtBkFkel7KvtrT+eB29HZUXJbTDFTt3qAUGu7XlnBEVPN9jvXqe2
	2mIqaYGoIDMb4hCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cls2Kaxj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="O7zQZ8p/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744730156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8rQFJzSR7WgZFd5/vD6kR7iiIa7sHuVwjXtD/YIn4Sg=;
	b=cls2KaxjXnU67suCAjpeG/NmTADtraNnlbMluUiJDMCsq8t1iOQhAxpFosXmfrmQqk9Cl4
	WGGiw7J2u9Qix2S1CcijMxmF1mIGtG2+uHoNUFFZFTkKGKq1tS45vnnZw097eqt7+pMQ6j
	pbuZ5JtABI/J/V5OIIxAKBkAft7q7Cw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744730156;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8rQFJzSR7WgZFd5/vD6kR7iiIa7sHuVwjXtD/YIn4Sg=;
	b=O7zQZ8p/no6lg9RtpMWtBkFkel7KvtrT+eB29HZUXJbTDFTt3qAUGu7XlnBEVPN9jvXqe2
	2mIqaYGoIDMb4hCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52D64137A5;
	Tue, 15 Apr 2025 15:15:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7omwEix4/mfESwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 15:15:56 +0000
Date: Tue, 15 Apr 2025 17:15:55 +0200
Message-ID: <87zfghxxp0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda/cirrus_scodec_test: Modernize creation of dummy devices
In-Reply-To: <20250415105414.471039-1-rf@opensource.cirrus.com>
References: <20250415105414.471039-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 7D5A71F395
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Tue, 15 Apr 2025 12:54:14 +0200,
Richard Fitzgerald wrote:
> 
> Replace the old direct use of platform_device APIs with newer KUnit APIs
> and the faux bus.
> 
> The dummy codec driver device doesn't need to be a platform device.
> It can be a faux bus device.
> 
> The dummy GPIO driver still must be a platform_device so that a
> software_node can be added to it before it probes. But use the new
> KUnit-managed APIs to create the platform_device and platform_driver.
> These will cleanup automatically when a test completes or fails.
> 
> Also use KUnit resource cleanup to destroy the faux bus driver and the GPIO
> software node instead of doing this "manually" in test exit() functions.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Thanks, applied now to for-next branch.


Takashi
