Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A9B25DD12
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749537183; cv=none; b=SE/TYAgXvHOUmr6z/sADieVKa6nXnAoaVmjMNeh5GArsLwdp/0jpAPCjZM+Vs6B3mM0MwI0NKUBKZORffxzaAW0ikdnhwvQUYOMsa7knJFlQJ3VQe1/nmoYGKmrgxIXMiq3oFmOYKlKkfPpoFiQKyutqQ+wV+ntSR3tI2XzAlYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749537183; c=relaxed/simple;
	bh=xWUNeZn/fUujpDjZn21+OrXlpDN5AyGFQixd+sVnGv0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iPHlcARfqEHerHSgJAelcE2yq+s2pemvr8hP6YkOIfWSMi/ea4kywekP6Aw/iKOsUvNniA6R2nnvjoGIEb/q5LqLePtV8nHzUeCgZTr5vIjyCjF/eZk3IWrtI/dF45d9LhkN2hog0oUBj4mOmylUx1+yzJrDpXxMRS7/nm5LlLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mh6MbGHg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jiOe0Mty; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mh6MbGHg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jiOe0Mty; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mh6MbGHg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jiOe0Mty";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mh6MbGHg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jiOe0Mty"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B96FA211AD;
	Tue, 10 Jun 2025 06:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749537179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwosfureBc1HkgXyB2mqgHkCAAAYd0di1JVE7J4yI/U=;
	b=mh6MbGHgyQcwWjOG/nbJJeUi+njE/9i+9bdH96Cu68UR4EFyzujQ6V4bDNpHJhpuv7RLxC
	40yjRjM1dOhZt4pJ2dgO767TDaRn1/TIuMD/RX1NboY6Sh5BRdkg5mH6m5Vx2Zagq9bZCE
	zWxTErM3B2ZgsEI83hZybM0XkQ3iDW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749537179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwosfureBc1HkgXyB2mqgHkCAAAYd0di1JVE7J4yI/U=;
	b=jiOe0Mtyt083fHhOEhPTt8JD207pMzxVd+zfhtYFUboUl1pBBIXH/dJ2VDDajxAkzgH3Jd
	9js9AsEj6zhqNuBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749537179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwosfureBc1HkgXyB2mqgHkCAAAYd0di1JVE7J4yI/U=;
	b=mh6MbGHgyQcwWjOG/nbJJeUi+njE/9i+9bdH96Cu68UR4EFyzujQ6V4bDNpHJhpuv7RLxC
	40yjRjM1dOhZt4pJ2dgO767TDaRn1/TIuMD/RX1NboY6Sh5BRdkg5mH6m5Vx2Zagq9bZCE
	zWxTErM3B2ZgsEI83hZybM0XkQ3iDW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749537179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwosfureBc1HkgXyB2mqgHkCAAAYd0di1JVE7J4yI/U=;
	b=jiOe0Mtyt083fHhOEhPTt8JD207pMzxVd+zfhtYFUboUl1pBBIXH/dJ2VDDajxAkzgH3Jd
	9js9AsEj6zhqNuBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90EBE139E2;
	Tue, 10 Jun 2025 06:32:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e9QoIpvRR2iycQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Jun 2025 06:32:59 +0000
Date: Tue, 10 Jun 2025 08:32:59 +0200
Message-ID: <8734c814ys.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix built-in mic on ASUS VivoBook X513EA
In-Reply-To: <20250610035607.690771-1-chris.chiu@canonical.com>
References: <20250610035607.690771-1-chris.chiu@canonical.com>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Tue, 10 Jun 2025 05:56:07 +0200,
Chris Chiu wrote:
> 
> The built-in mic of ASUS VivoBook X513EA is broken recently by the
> fix of the pin sort. The fixup ALC256_FIXUP_ASUS_MIC_NO_PRESENCE
> is working for addressing the regression, too.
> 
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>

Applied now.  Thanks.


Takashi
