Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D08148838
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751188651; cv=none; b=HVrBdjvboQZQNRZkBEXIlkuT/2rG2Wt+T8H2fwTVMEps7o0xgbm2TbPgZt4FGNTwdqGH9uJFS1daBB9VmkjSNxhwAn7G4TJgSXUmaQNL+6X1JsItjcUhB2SIDx2dRKp4CTeXbahRajnxdr2ElVWhPzP7lJI69k7lyubMPj6lLcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751188651; c=relaxed/simple;
	bh=H39y6eiNUr9SIFzTuggli9zP9WqaRa8Po57M2Wt9E7A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hgqvnwAOO7PHq0DCzdfim6woN5krJKoKsbeR4tXRNXTWpwre8FeRQVvfmqWDnF+kMWYta3Uh6Vc8B2ZtG79Xttr5zpzz2capPJjv67i0gLB0ji3R6KQJhMuzMJGDDBbtFg5n1UPvwpoBIbJ+5k2Qnf3thbpU3Pw+yKMInmR7Qjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xid0a7gu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FnDIJaXZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xid0a7gu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FnDIJaXZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xid0a7gu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FnDIJaXZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xid0a7gu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FnDIJaXZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1E2351F388;
	Sun, 29 Jun 2025 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751188648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fxGRCoBDUVqEpVBQf6YKThvQ73kyAd3cE5zHM9WRLfQ=;
	b=Xid0a7guMs8W3B3jlDGzq26YgpOfl+HxGMGTyjUcN1sO8AT+Ru+FUV/t9EJZeuJPe7OquH
	Cq4UIGgG7/+s4d5yyBdaypaKLyBjcxyoUShqF45hd8BYd18yfQm/JiSQwe6RVBLgogapfU
	QmsXkp8T0Oxyale4SsRHZ3axC5pzi6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751188648;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fxGRCoBDUVqEpVBQf6YKThvQ73kyAd3cE5zHM9WRLfQ=;
	b=FnDIJaXZ9jV3nrGVGF4Kwf8kogHOVYE6JV7nR2OiGq3cZt/DBOayc6qn6MWiWJtKIGzkU5
	esv3EOJV+fNUOABA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751188648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fxGRCoBDUVqEpVBQf6YKThvQ73kyAd3cE5zHM9WRLfQ=;
	b=Xid0a7guMs8W3B3jlDGzq26YgpOfl+HxGMGTyjUcN1sO8AT+Ru+FUV/t9EJZeuJPe7OquH
	Cq4UIGgG7/+s4d5yyBdaypaKLyBjcxyoUShqF45hd8BYd18yfQm/JiSQwe6RVBLgogapfU
	QmsXkp8T0Oxyale4SsRHZ3axC5pzi6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751188648;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fxGRCoBDUVqEpVBQf6YKThvQ73kyAd3cE5zHM9WRLfQ=;
	b=FnDIJaXZ9jV3nrGVGF4Kwf8kogHOVYE6JV7nR2OiGq3cZt/DBOayc6qn6MWiWJtKIGzkU5
	esv3EOJV+fNUOABA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0EE31379A;
	Sun, 29 Jun 2025 09:17:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w2W6NacEYWitMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Jun 2025 09:17:27 +0000
Date: Sun, 29 Jun 2025 11:17:27 +0200
Message-ID: <87ikkegb4o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: edip@medip.dev
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek - Add mute LED support for HP Victus 15-fb2xxx
In-Reply-To: <20250627203415.56785-2-edip@medip.dev>
References: <20250627203415.56785-2-edip@medip.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[medip.dev:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Fri, 27 Jun 2025 22:34:16 +0200,
edip@medip.dev wrote:
> 
> From: Edip Hazuri <edip@medip.dev>
> 
> The mute led on this laptop is using ALC245 but requires a quirk to work
> This patch enables the existing quirk for the device.
> 
> Tested on my friend's Victus 15-fb2xxx Laptop. The LED behaviour works as intended.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Edip Hazuri <edip@medip.dev>

Applied now.  Thanks.


Takashi
