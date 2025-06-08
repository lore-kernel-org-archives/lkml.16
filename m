Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1021F872D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749374967; cv=none; b=btLHsz1OytQoyhmhaOvzLodWQZF3oo8VZ0vXJzes5I92i2BLTyFAQweFX3D9sy2A/M6ISWdG1Va8s3uqEgjuCwRwku44cJoFqlUIe39+QsCawLASqD0H2pimIpXBdAXBd+uCkUEl3cZDZFYg647aTHErySDQpeFbr9N6wD63wn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749374967; c=relaxed/simple;
	bh=OffBpAIXRWfvepR34kuRrpweLfuH2ywLE7wtRA8e7v8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MfEZe+LC8EAyv4RwMRwghksZ/DEtQ8WdteyetNvkCspw17BdMoLkaOMTEghHQ2nKbAwW/a08JFfMlf/Vs1s5kgecpy5sGE3BbKZV6jpB5xWes42lVdRmlNs8Cv3FHLpIH/kdX5HbuQBbFunC0kbfnBNw/4YrlgdIwcUuvm+IOgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E6p20/aL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7XqceUJH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v9K/RxIO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D9F9xBjk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E6p20/aL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7XqceUJH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v9K/RxIO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D9F9xBjk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B34DD21172;
	Sun,  8 Jun 2025 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749374956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mRKrC5CoI2qpKhIypUg5jdMTEVyo7fGBuDeZ+DLjf54=;
	b=E6p20/aLr38crvdpYviVHULCVuCYMcIBq+fsORBfxMkPf9+sIAZ+BhOT7XUJGHKHhhmw+l
	jEJU2AEQVqMpKKxCPhFwMTMDzjfB8P275r8c9SfpbmTQ8MKAA5QsfdJh/rrSkzqRtXEYgc
	/VfLQTnMjkiYVcQ8QPScqHZphdwax7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749374956;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mRKrC5CoI2qpKhIypUg5jdMTEVyo7fGBuDeZ+DLjf54=;
	b=7XqceUJHV2p0La2QU0LaEfL5vHC2a5XCwOfiLNoBs3DlZvj+CcE2lzkbDh6duJcRzWHqFT
	V2fdUewEFXZAFECQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749374955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mRKrC5CoI2qpKhIypUg5jdMTEVyo7fGBuDeZ+DLjf54=;
	b=v9K/RxIOX0bohZ6HLOSh9mZtjHuOVTnapSoQQAE8kVjDkR8gFMZdv6C+DtTEeAAqgw7tQY
	8JsM2HFPeqPFRLkM6iALvHzM8zelCLyKxxOwPkyWnMb2Cm1JgqFrgGC6dYy+1tjYq244ux
	4BqJuTgP7XxuZNVfF7DB2JgU5c+AjSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749374955;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mRKrC5CoI2qpKhIypUg5jdMTEVyo7fGBuDeZ+DLjf54=;
	b=D9F9xBjknFc6PpT42xQw3e0w4M2TCaVyZrQloy3jt6Dxlyu13Uqw51XdXQuwgT7C9jtC+5
	Ka0hIgV64yqq4JBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89CE113A78;
	Sun,  8 Jun 2025 09:29:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tow1IOtXRWi3LQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Jun 2025 09:29:15 +0000
Date: Sun, 08 Jun 2025 11:29:15 +0200
Message-ID: <87qzzu8tuc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: SunOfLife1 <sunoflife1.git@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek - Enable mute LED on HP Pavilion Laptop 15-eg100
In-Reply-To: <20250606192650.10948-1-sunoflife1.git@gmail.com>
References: <87sekixkqg.wl-tiwai@suse.de>
	<20250606192650.10948-1-sunoflife1.git@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.79 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.965];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.79

On Fri, 06 Jun 2025 21:24:59 +0200,
SunOfLife1 wrote:
> 
> Of course, thank you for notifying me. Is this better?
> 
> Signed-off-by: Yasmin Fitzgerald <sunoflife1.git@gmail.com>

Improved, but the patch description is missing now...
Please restore your original patch description and resubmit with the
proper sign-off.


thanks,

Takashi
