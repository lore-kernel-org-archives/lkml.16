Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EB7221F12
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875724; cv=none; b=dK4glKqxJCTooPS+pBc4/mmkr3da2wYhfoq0sTgOX1OwIhLXSiM2G+dYf4hz7M7KIpNvRE5zbKZw6Sz+GY7TiUKowCmDtBtJ83Zq87g2+wfn/7rGUvC6ME6k0ltzdJ4BhERjQLaw6RIfYsdgXzooq6I4VRMlwkVAssbDYFmzO4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875724; c=relaxed/simple;
	bh=onJ0o5cTZOKHuJYI9La7IVPc8Ls+WZHO9e8HACMboiM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OI88vmjSo7NmuboaLkwq2Mctprb4zwYnqSFdDL2eXNhla92YWuAgd6a7Ze1ASBrVXQYcFAo+44HLQJS/88AVcy3hm/1l+e1PDBQJ9nM1GjzP+jwWyoNU8dBGD/0iLhUQ8aOiUL+FJRKwO9mmjB75yzBCwF4YTBvdpM48Bi1vvPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vmkmZcA/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xSMU2fix; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vmkmZcA/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xSMU2fix; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vmkmZcA/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xSMU2fix";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vmkmZcA/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xSMU2fix"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B6DFF21169;
	Mon,  2 Jun 2025 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eDp4H0qXpdmFoZE2zvcHEaJS92YeFizKScCSZBNYtqg=;
	b=vmkmZcA/3gAac8mSUp+TAlyAeF51FHZpR+j14Blle2Z4y6XylpZrO7TTETWqHymwI7LYrv
	w5QtIE5rl9ouq38xotAWPauQkMc2SUE0ISSqox01YtTWuWdTKG15T6gX8rwnhaD4mbURDH
	E75dwTmAO657voLkWOvOM2SQ2niWtZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eDp4H0qXpdmFoZE2zvcHEaJS92YeFizKScCSZBNYtqg=;
	b=xSMU2fixib4xgffua/1HVorXGmIcQHVhcseKoeoR6yLFh6CHrZCD0rj0wXL+UZ9NdFaM4P
	Itk8YG+ZZrpAplCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eDp4H0qXpdmFoZE2zvcHEaJS92YeFizKScCSZBNYtqg=;
	b=vmkmZcA/3gAac8mSUp+TAlyAeF51FHZpR+j14Blle2Z4y6XylpZrO7TTETWqHymwI7LYrv
	w5QtIE5rl9ouq38xotAWPauQkMc2SUE0ISSqox01YtTWuWdTKG15T6gX8rwnhaD4mbURDH
	E75dwTmAO657voLkWOvOM2SQ2niWtZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eDp4H0qXpdmFoZE2zvcHEaJS92YeFizKScCSZBNYtqg=;
	b=xSMU2fixib4xgffua/1HVorXGmIcQHVhcseKoeoR6yLFh6CHrZCD0rj0wXL+UZ9NdFaM4P
	Itk8YG+ZZrpAplCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 780FD13AE0;
	Mon,  2 Jun 2025 14:48:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tbuyG8i5PWiWXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Jun 2025 14:48:40 +0000
Date: Mon, 02 Jun 2025 16:48:39 +0200
Message-ID: <87sekixkqg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: SunOfLife1 <sunoflife1.git@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek - Enable mute LED on HP Pavilion Laptop 15-eg100
In-Reply-To: <20250529055427.20683-1-sunoflife1.git@gmail.com>
References: <20250529055427.20683-1-sunoflife1.git@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Thu, 29 May 2025 07:54:26 +0200,
SunOfLife1 wrote:
> 
> The HP Pavilion Laptop 15-eg100 has Realtek HDA codec ALC287.
> It needs the ALC287_FIXUP_HP_GPIO_LED quirk to enable the mute LED.
> 
> Signed-off-by: SunOfLife1 <sunoflife1.git@gmail.com>

Could you give your Signed-off-by tag with a real name and resubmit?
It's a legal requirement for merging to the upstream.


thanks,

Takashi
