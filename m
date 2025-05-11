Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF16286A1
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 14:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746972890; cv=none; b=tlNtp21R5N5f7lCiJmIq0ZrXSUeinTMdh8e/dlIkUzS4LHCKa7vScUMHebqjJHA8SY6CpMMMDs5WzqKw1lAP8y7/DtdgSIVGw3ORPbx7HoxMHhFEh2MTfmWIhSyJW062vVqS9ED9sPsyp/KfTrYfc0WuD7Hm6Kv06is+/LQ7m70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746972890; c=relaxed/simple;
	bh=40jNP656X7e02APWX3NbLHlFmIwLJ/BFBmXyNt2FOfs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NUFtiSvEZ7gqfsVV6EBsL3DxFDY1ZxJa3IHzUNF1kvTZPHYrLwgtRKqN0xweXt3fsCFC85SVK24iXD3G9Vp8zFOo6HlG+j+uElaL+bjNk1a/f/+c32hIYH0/8luZ4XscSa8d9uC7t4rMvxxjNDvIA+YsTK7+VYGVKDA+aE/YKiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A7lJ4dIM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+6H0+xaN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A7lJ4dIM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+6H0+xaN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A7lJ4dIM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+6H0+xaN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A7lJ4dIM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+6H0+xaN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A9B0621170;
	Sun, 11 May 2025 14:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746972886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qL8PtxHW0oelGLaG3XXPzhbioxOK+s7Sx44/0BX0D/c=;
	b=A7lJ4dIM2/qybLoU3iCZJctyyKwUZdYcsAWxe5fPtJgqJQA0vdrlMtZjHjRxJ0JGS5sdFJ
	zUoTeZ1PSrbUZ/OtZKvKIXn8O+AySoza0MRywjFBFR4HBKrYjlIjopE5Eopo4fc/qid0R0
	V8QrjfChdrpbt7+BExCcb7xco/4CoeE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746972886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qL8PtxHW0oelGLaG3XXPzhbioxOK+s7Sx44/0BX0D/c=;
	b=+6H0+xaNJE4Ojzr6YgkfRF5goNUjuIaKNFZE5o63fRrBCiFpSDsHfDbbF3UZ5ZF9paIc9E
	nX2473XRTirePXBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746972886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qL8PtxHW0oelGLaG3XXPzhbioxOK+s7Sx44/0BX0D/c=;
	b=A7lJ4dIM2/qybLoU3iCZJctyyKwUZdYcsAWxe5fPtJgqJQA0vdrlMtZjHjRxJ0JGS5sdFJ
	zUoTeZ1PSrbUZ/OtZKvKIXn8O+AySoza0MRywjFBFR4HBKrYjlIjopE5Eopo4fc/qid0R0
	V8QrjfChdrpbt7+BExCcb7xco/4CoeE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746972886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qL8PtxHW0oelGLaG3XXPzhbioxOK+s7Sx44/0BX0D/c=;
	b=+6H0+xaNJE4Ojzr6YgkfRF5goNUjuIaKNFZE5o63fRrBCiFpSDsHfDbbF3UZ5ZF9paIc9E
	nX2473XRTirePXBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59CB413690;
	Sun, 11 May 2025 14:14:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vFKNFNawIGjqbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 May 2025 14:14:46 +0000
Date: Sun, 11 May 2025 16:14:45 +0200
Message-ID: <87plgfxmi2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	broonie@kernel.org,
	liam.r.girdwood@intel.com,
	ranjani.sridharan@linux.intel.com
Subject: Re: [PATCH] ALSA/hda: intel-sdw-acpi: Correct sdw_intel_acpi_scan() function parameter
In-Reply-To: <20250508181207.22113-1-peter.ujfalusi@linux.intel.com>
References: <20250508181207.22113-1-peter.ujfalusi@linux.intel.com>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Thu, 08 May 2025 20:12:07 +0200,
Peter Ujfalusi wrote:
> 
> The acpi_handle should be just a handle and not a pointer in
> sdw_intel_acpi_scan() parameter list.
> It is called with 'acpi_handle handle' as parameter and it is passing it to
> acpi_walk_namespace, which also expects acpi_handle and not  acpi_handle*
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Thanks, applied now.


Takashi
